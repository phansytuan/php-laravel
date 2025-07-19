<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\StudentMajor;
use App\Models\Major;
use App\Models\Course;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Arr;

class DashboardController extends Controller
{
    public function index()
    {
        // Set student name manually (since no authentication is implemented)
        $studentName = config('student.name');

        // Find the student's major
        $student = StudentMajor::where('student_name', $studentName)->first();

        if (!$student) {
            return view('dashboard.students-overview')->with('error', 'Student not found.');
        }

        // Fetch all units linked to the student's major (avoiding duplicates)
        $units = DB::table('a_unit_major')
            ->join('a_course_unit', 'a_unit_major.u_code', '=', 'a_course_unit.U_CODE')
            ->leftJoin('a_student_unit_status', function ($join) use ($student) {
                $join->on('a_student_unit_status.unit_id', '=', 'a_course_unit.U_CODE')
                     ->where('a_student_unit_status.student_id', '=', $student->student_id);
            })
            ->where('a_unit_major.m_code', $student->m_code)
            ->whereRaw('
                (a_student_unit_status.enrollment_count IS NULL OR 
                a_student_unit_status.enrollment_count = (
                SELECT MAX(enrollment_count) 
                FROM a_student_unit_status 
                WHERE a_student_unit_status.unit_id = a_course_unit.U_CODE 
                AND a_student_unit_status.student_id = ?
                ))', [$student->student_id]
            )
            ->select(
                'a_course_unit.U_CODE', 
                'a_course_unit.U_NAME', 
                'a_unit_major.type', 
                'a_course_unit.CREDITS', 
                DB::raw("CASE WHEN a_course_unit.PREREQUISITE = 'No' THEN 'No' ELSE 'Yes' END as PREREQUISITE"), 
                DB::raw("COALESCE(a_student_unit_status.status, 'Not Enrolled') as status"), 
                DB::raw("COALESCE(a_student_unit_status.enrollment_count, 0) as enrollment_count")
            )
            ->distinct() // Ensure no duplicates
            ->get();
    
        // Fetch elective units from a_student_unit_status
        $electiveUnits = DB::table('a_student_unit_status')
            ->join('a_course_unit', 'a_student_unit_status.unit_id', '=', 'a_course_unit.U_CODE')
            ->where('a_student_unit_status.student_id', $student->student_id)
            ->whereRaw('
                (a_student_unit_status.enrollment_count IS NULL OR 
                a_student_unit_status.enrollment_count = (
                SELECT MAX(enrollment_count) 
                FROM a_student_unit_status 
                WHERE a_student_unit_status.unit_id = a_course_unit.U_CODE 
                AND a_student_unit_status.student_id = ?
                ))', [$student->student_id]
            )
            ->whereNotIn('a_student_unit_status.unit_id', function ($query) use ($student) {
                $query->select('u_code')->from('a_unit_major')->where('m_code', $student->m_code);;
            }) // Ensure it's not in core or major units
            ->select(
                'a_course_unit.U_CODE', 
                'a_course_unit.U_NAME', 
                DB::raw("'Elective' as type"), 
                'a_course_unit.CREDITS', 
                DB::raw("CASE WHEN a_course_unit.PREREQUISITE = 'No' THEN 'No' ELSE 'Yes' END as PREREQUISITE"), 
                'a_student_unit_status.status',
                'a_student_unit_status.enrollment_count'

            )
            ->distinct()
            ->get();

        // Separate units by type (Ensure types match your DB values: 'core', 'major')
        $coreUnits = $units->where('type', 'Core');
        $majorUnits = $units->where('type', 'Major');

        $allUnits = $units->merge($electiveUnits); // Combine major and elective units
        $totalCredits = $allUnits->where('status', 'Passed')->sum('CREDITS');

        $failedUnits = DB::table('a_student_unit_status')
        ->where('student_id', (int) $student->student_id) // Ensure it's an integer
        ->where('status', 'Failed')
        ->pluck('unit_id');

        $enrolledUnits = DB::table('a_student_unit_status')
            ->where('student_id', $student->student_id)
            ->pluck('unit_id'); // Get all enrolled units (including failed)
        $futureUnits = DB::table('a_unit_major')
            ->leftJoin('a_student_unit_status', function ($join) use ($student) {
                $join->on('a_unit_major.u_code', '=', 'a_student_unit_status.unit_id') // ✅ Matches u_code with unit_id
                     ->where('a_student_unit_status.student_id', '=', $student->student_id);
            })
            ->where('a_unit_major.m_code', $student->m_code) // Ensure only major units are selected
            ->whereNull('a_student_unit_status.unit_id') // Select only units NOT enrolled by the student
            ->pluck('a_unit_major.u_code'); // Get unit codes that haven't been taken
        
        $unitSchedules = DB::table('a_unit_semester')
            ->whereIn('u_code', array_merge($failedUnits->toArray(), $futureUnits->toArray())) // Include failed & unenrolled units
            ->whereRaw("
                STR_TO_DATE(
                    CONCAT(semester_year, '-',
                    LPAD(
                        CASE semester_month
                            WHEN 'Jan' THEN '01'
                            WHEN 'May' THEN '05'
                            WHEN 'Sep' THEN '09'
                        END, 2, '0'
                    ), '-01'
                ), '%Y-%m-%d') >= CURDATE()
            ")
            ->select('u_code', 'semester_month', 'semester_year')
            ->get()
            ->groupBy('u_code');
            // At the end of your index method

        return view('dashboard.students-overview', compact('coreUnits', 'electiveUnits', 'majorUnits', 'totalCredits', 'unitSchedules'));
    }

    public function dashboardFeasibility()
    {
        // Hard-coded semester index map for demo
        $semesterIndex = [
            '2023A' => 1,
            '2023B' => 2,
            '2023C' => 3,
            '2024A' => 4,
            '2024B' => 5,
            '2024C' => 6,
            '2025A' => 7,
            '2025B' => 8,
            '2025C' => 9,
        ];
        $currentSemester = '2024B'; // Example: current semester
        $targetGraduationSemester = '2025B'; // Example: target graduation

        // For demo, get the first student
        $student = DB::table('a_student_planner')->first();
        if (!$student) {
            abort(404, 'No student found');
        }

        $creditHistories = DB::table('a_student_credit_history')
            ->where('student_id', $student->id)
            ->orderBy('semester_code')
            ->get();

        $remainingCredits = $student->total_credits_required - $student->credits_earned;
        $semestersLeft = $semesterIndex[$targetGraduationSemester] - $semesterIndex[$currentSemester];
        $neededPerSemester = $semestersLeft > 0 ? ceil($remainingCredits / $semestersLeft) : $remainingCredits;
        $baseline = max($student->avg_credits_per_semester, 37.5);

        if ($neededPerSemester <= $baseline) {
            $status = 'green';
        } elseif ($neededPerSemester <= $baseline * 1.3) {
            $status = 'orange';
        } else {
            $status = 'red';
        }

        // Group credit histories by semester_code and pluck credits
        $history = collect($creditHistories)
            ->groupBy('semester_code')
            ->map(function ($items) {
                return $items->sum('credits');
            })
            ->values()
            ->toArray();

        $overallAvg = count($history) ? array_sum($history) / count($history) : 0;
        $last3 = array_slice($history, -3);
        $last3Avg = count($last3) ? array_sum($last3) / count($last3) : 0;
        $trend = $last3Avg >= $overallAvg ? 'up' : 'down';

        // Milestones
        $milestones = [0.25, 0.50, 0.75, 1.0];
        $badges = [];
        foreach ($milestones as $m) {
            $badges[] = ($student->credits_earned / $student->total_credits_required) >= $m;
        }

        return view('dashboard.snapshot', [
            'total_credits_required' => $student->total_credits_required,
            'credits_earned' => $student->credits_earned,
            'avg_credits_per_semester' => $student->avg_credits_per_semester,
            'remainingCredits' => $remainingCredits,
            'semestersLeft' => $semestersLeft,
            'neededPerSemester' => $neededPerSemester,
            'baseline' => $baseline,
            'status' => $status,
            'history' => $history,
            'trend' => $trend,
            'trendDelta' => round($last3Avg - $overallAvg, 1),
            'badges' => $badges,
            'milestones' => $milestones,
        ]);
    }

    public function unitOverview()
    {
        return $this->index();
    }

}
