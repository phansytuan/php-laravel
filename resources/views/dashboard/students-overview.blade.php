<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ config('app.name', 'Swinburne') }} | Study Progress</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <style>
    .card {
        border-radius: 1rem;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        transition: all 0.3s ease;
    }

    .card:hover {
        transform: scale(1.02);
        box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
    }

    .card-title {
        font-weight: 600;
        font-size: 1.1rem;
    }

    .card-text {
        font-size: 0.95rem;
        color: #333;
    }

    .card-text strong {
        font-weight: 600;
    }

    .status-passed {
        color: #2e7d32;
    }

    .status-enrolled {
        color: #1976d2;
    }

    .status-studying {
        color: #f9a825;
    }

    .status-failed {
        color: #c62828;
    }

    .status-not-enrolled {
        color: #757575;
    }

    .bg-status-Passed {
        background-color: rgb(185, 250, 190);
    }

    .bg-status-Enrolled {
        background-color: #e3f2fd;
    }

    .bg-status-Studying {
        background-color: #fffde7;
    }

    .bg-status-Failed {
        background-color: rgb(244, 191, 199);
    }

    .bg-status-Not\ Enrolled {
        background-color: #f5f5f5;
    }

    h3.section-title {
        font-size: 1.6rem;
        font-weight: 700;
        color: #c8102e;
        border-left: 6px solid #c8102e;
        padding-left: 15px;
        margin-top: 2rem;
        margin-bottom: 1rem;
        background-color: #fff3f3;
        padding: 0.5rem 1rem;
        border-radius: 0.375rem;
    }

    .search-filter {
        display: flex;
        justify-content: space-between;
        gap: 1rem;
        margin-bottom: 1.5rem;
    }

    .search-filter input,
    .search-filter select {
        padding: 0.5rem 1rem;
        border: 1px solid #ccc;
        border-radius: 0.375rem;
        flex: 1;
    }

    @media (min-width: 768px) {
        .col-md-3 {
            flex: 0 0 auto;
            width: 25%;
        }
    }
    </style>
</head>

<body>
    <!-- Side Navigation -->
    <div class="side-nav">
        <div class="logo-container">
            <img src="{{ asset('asset/images/swinlogo.png') }}" alt="Swinburne logo">
        </div>
        <a href="{{ route('dashboard.unit.overview') }}" class="active">Study Progress</a>
        <a href="{{ route('dashboard.academic-planner') }}">Study Planner</a>
        <a href="{{ route('dashboard.snapshot') }}" class="active">Graduation Snapshot</a>   
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="top-nav">
            <div>Swinburne Dashboard Students Overview</div>
            <div>Hi, {{ $student->student_name }} <i class="fas fa-user-circle"></i></div>
        </div>

        <div class="major-header">
<div>{{ $course->C_NAME }} - {{ $major->M_NAME }} ({{ $major->M_CODE }})</div>
            <div>Passed Credits: {{ $totalCredits }} / 300</div>
        </div>

        <div class="container py-4">
            <div class="search-filter">
                <input type="text" id="searchBox" placeholder="Search by unit code or name...">
                <select id="statusFilter">
                    <option value="">All Status</option>
                    <option value="Passed">Passed</option>
                    <option value="Studying">Studying</option>
                    <option value="Enrolled">Enrolled</option>
                    <option value="Failed">Failed</option>
                    <option value="Not Enrolled">Not Enrolled</option>
                </select>
            </div>

            {{-- Core Units --}}
            <h3 class="section-title">Core Units</h3>
            <div class="row g-4 mb-5 unit-container">
                @foreach($coreUnits as $unit)
                <div class="col-md-3 unit-card" data-code="{{ $unit->U_CODE }}" data-name="{{ $unit->U_NAME }}"
                    data-status="{{ $unit->status }}">
                    <div class="card h-100 bg-status-{{ str_replace(' ', '\\ ', $unit->status) }}">
                        <div class="card-body">
                            <h5 class="card-title">{{ $unit->U_CODE }} - {{ $unit->U_NAME }}</h5>
                            <p class="card-text">Credits: {{ $unit->CREDITS }}</p>
                            <p class="card-text">Prerequisite: {{ $unit->PREREQUISITE }}</p>
                            <p class="card-text">Status: <strong
                                    class="status-{{ strtolower(str_replace(' ', '-', $unit->status)) }}">{{ $unit->status }}</strong>
                            </p>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>

            {{-- Major Units --}}
            <h3 class="section-title">Major Units</h3>
            <div class="row g-4 mb-5 unit-container">
                @foreach($majorUnits as $unit)
                <div class="col-md-3 unit-card" data-code="{{ $unit->U_CODE }}" data-name="{{ $unit->U_NAME }}"
                    data-status="{{ $unit->status }}">
                    <div class="card h-100 bg-status-{{ str_replace(' ', '\\ ', $unit->status) }}">
                        <div class="card-body">
                            <h5 class="card-title">{{ $unit->U_CODE }} - {{ $unit->U_NAME }}</h5>
                            <p class="card-text">Credits: {{ $unit->CREDITS }}</p>
                            <p class="card-text">Prerequisite: {{ $unit->PREREQUISITE }}</p>
                            <p class="card-text">Status: <strong
                                    class="status-{{ strtolower(str_replace(' ', '-', $unit->status)) }}">{{ $unit->status }}</strong>
                            </p>
                        </div>
</div>
                </div>
                @endforeach
            </div>

            {{-- Elective Units --}}
            <h3 class="section-title">Elective Units</h3>
            <div class="row g-4 unit-container">
                @foreach($electiveUnits as $unit)
                <div class="col-md-3 unit-card" data-code="{{ $unit->U_CODE }}" data-name="{{ $unit->U_NAME }}"
                    data-status="{{ $unit->status }}">
                    <div class="card h-100 bg-status-{{ str_replace(' ', '\\ ', $unit->status) }}">
                        <div class="card-body">
                            <h5 class="card-title">{{ $unit->U_CODE }} - {{ $unit->U_NAME }}</h5>
                            <p class="card-text">Credits: {{ $unit->CREDITS }}</p>
                            <p class="card-text">Prerequisite: {{ $unit->PREREQUISITE }}</p>
                            <p class="card-text">Status: <strong
                                    class="status-{{ strtolower(str_replace(' ', '-', $unit->status)) }}">{{ $unit->status }}</strong>
                            </p>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    const searchBox = document.getElementById('searchBox');
    const statusFilter = document.getElementById('statusFilter');

    function filterUnits() {
        const keyword = searchBox.value.toLowerCase();
        const selectedStatus = statusFilter.value;

        document.querySelectorAll('.unit-card').forEach(card => {
            const code = card.dataset.code.toLowerCase();
            const name = card.dataset.name.toLowerCase();
            const status = card.dataset.status;

            const matchKeyword = code.includes(keyword) || name.includes(keyword);
            const matchStatus = selectedStatus === '' || status === selectedStatus;

            card.style.display = matchKeyword && matchStatus ? '' : 'none';
        });
    }

    searchBox.addEventListener('input', filterUnits);
    statusFilter.addEventListener('change', filterUnits);
    </script>
</body>

</html>