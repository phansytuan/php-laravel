<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ config('app.name', 'Swinburne') }} | Graduation Snapshot</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- Side Navigation -->
    <div class="side-nav">
        <div class="logo-container">
            <img src="{{ asset('asset/images/swinlogo.png') }}" alt="Swinburne logo">
        </div>
        <a href="{{ route('dashboard.unit.overview') }}">Study Progress</a>
        <a href="{{ route('dashboard.academic-planner') }}">Study Planner</a>     
        <a href="{{ route('dashboard.snapshot') }}" class="active">Graduation Snapshot</a>     
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="top-nav">
            <div>Swinburne Dashboard – Students Overview</div>
            <div>Hi, {{ $student->student_name }} <i class="fas fa-user-circle"></i></div>
        </div>

        <div class="major-header">
            <div>{{ $course->C_NAME }} – {{ $major->M_NAME }} ({{ $major->M_CODE }})</div>
            <div><strong>Credits Earned:</strong> {{ $totalCredits }} / 300</div>
        </div>

        <div class="container py-4">
            {{-- Graduation Status Card --}}
            <div class="card mb-4 
                @if($status === 'green') border-success 
                @elseif($status === 'orange') border-warning 
                @else border-danger 
                @endif">
                <div class="card-body">
                    <h5 class="card-title">
                        🎓 Graduation Feasibility Status:
                        <span class="fw-bold text-uppercase 
                            @if($status === 'green') text-success
                            @elseif($status === 'orange') text-warning
                            @else text-danger
                            @endif">
                            {{ ucfirst($status) }}
                        </span>
                    </h5>
                    <ul class="list-unstyled mt-3 mb-0">
                        <li><strong>Total Credits Required:</strong> {{ $total_credits_required }}</li>
                        <li><strong>Credits Earned:</strong> {{ $credits_earned }}</li>
                        <li><strong>Remaining Credits:</strong> {{ $remainingCredits }}</li>
                        <li><strong>Semesters Remaining:</strong> {{ $semestersLeft }}</li>
                        <li><strong>Required per Semester:</strong> {{ $neededPerSemester }}</li>
                        <li><strong>Baseline (Ideal):</strong> {{ $baseline }}</li>
                    </ul>
                </div>
            </div>

            {{-- Milestones Section --}}
            <div class="mb-4">
                <h5>📊 Progress Milestones</h5>
                <div class="d-flex gap-2 flex-wrap">
                    @foreach($milestones as $index => $m)
                        <span class="badge rounded-pill 
                            {{ $badges[$index] ? 'bg-primary' : 'bg-secondary' }}">
                            {{ $m * 100 }}%
                        </span>
                    @endforeach
                </div>
            </div>

            {{-- Credit Trend Line Chart --}}
            <div class="mb-5">
                <h5>📈 Credit Trend Over Time</h5>
                <canvas id="creditChart" height="100"></canvas>
                <p class="mt-2">
                    Trend: 
                    <strong class="{{ $trend === 'up' ? 'text-success' : 'text-danger' }}">
                        {{ $trend === 'up' ? 'Up ⬆️' : 'Down ⬇️' }}
                    </strong>
                    ({{ $trendDelta >= 0 ? '+' : '' }}{{ $trendDelta }} credits)
                </p>
            </div>
        </div>
    </div>

    <!-- Chart.js -->
    <script>
        const ctx = document.getElementById('creditChart').getContext('2d');
        const creditData = @json($history);
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: creditData.map((_, i) => 'Semester ' + (i + 1)),
                datasets: [{
                    label: 'Credits per Semester',
                    data: creditData,
                    borderColor: '#0d6efd',
                    backgroundColor: 'rgba(13, 110, 253, 0.2)',
                    tension: 0.3,
                    fill: true,
                    pointRadius: 4,
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 5
                        }
                    }
                }
            }
        });
    </script>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
