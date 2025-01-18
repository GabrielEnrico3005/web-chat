<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'My Laravel App')</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Toastr -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <style>
        .navbar-nav .nav-link img {
            vertical-align: middle;
        }

        .navbar-nav .nav-link .badge {
            font-size: 0.75rem;
            transform: translate(-50%, -50%);
        }

        .nav-item.dropdown .dropdown-menu {
            left: 50%;
            transform: translateX(-50%);
            margin-left: 0 !important;
            margin-right: 0 !important;
        }

        .avatar-container {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: auto;
            background: #f0f0f0;
        }

        .avatar-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            /* Center crop */
            border-radius: 50%;
        }

        .avatar-placeholder {
            width: 100px;
            height: 100px;
            font-size: 24px;
            font-weight: bold;
            border-radius: 50%;
            background: #ddd;
        }
    </style>
    @stack('styles')
</head>

<body>
    @include('layouts.navbar')

    <div class="container mt-4" style="min-height: 80vh">
        @include('layouts.message')
        @yield('content')
    </div>
    @include('layouts.footer')
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Toastr JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        toastr.options = {
            "positionClass": "toast-bottom-right", // Menentukan posisi di bagian bawah dan kanan
            "timeOut": "5000", // Durasi toast tampil (5000 ms = 5 detik)
            "closeButton": true // Menambahkan tombol tutup pada toast
        };
        @if (session('success'))
            toastr.success("{{ session('success') }}");
        @endif
        @if (session('error'))
            toastr.error("{{ session('error') }}");
        @endif
        

        @if ($errors->any())
            let errors = @json($errors->all());
            errors.forEach(error => {
                toastr.error(error); // Menampilkan semua error dari form
            });
        @endif

        @if (session('toastr'))
            let toastrData = @json(session('toastr'));
            toastr[toastrData.type](toastrData.message);
        @endif
    </script>
    <script>
        $(document).ready(function() {
            $('.select2').select2();
        });
    </script>
    @stack('script')
</body>

</html>
