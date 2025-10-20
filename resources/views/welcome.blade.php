<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="RAFCART - Multipurpose eCommerce HTML Template">
    <meta name="author" content="Programming Kit">
    <title>RAFCART - Multipurpose eCommerce HTML Template</title>
    <link rel="shortcut icon" href="{{ asset('template/assets/images/favicon.png') }}" type="image/x-icon">

    <!-- all css -->
    <link rel="stylesheet" href="{{ asset('template/assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('template/assets/css/jquery-ui.css') }}">
    <link rel="stylesheet" href="{{ asset('template/assets/css/slick.css') }}">
    <link rel="stylesheet" href="{{ asset('template/assets/css/line-awesome.css') }}">
    <link rel="stylesheet" href="{{ asset('template/assets/css/nice-select.css') }}">
    <link rel="stylesheet" href="{{ asset('template/assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('template/assets/css/responsive.css') }}">
    <link rel="stylesheet" href="{{ asset('template/assets/css/welcome.css') }}">
</head>

<body>

    <!-- Preloader -->
    <div class="preloader">
        <img src="{{ asset('template/assets/images/preloader.gif') }}" alt="preloader">
    </div>

    <!-- top header -->
    @include('template.header')

    <!-- navbar -->
    @include('template.navbar')

    <!-- breadcrumbs -->
    <div class="container">
        <div class="breadcrumbs">
            <a href="#"><i class="las la-home"></i></a>
            <a href="#" class="active">Login</a>
        </div>
    </div>
    <!-- MAIN CONTENT -->
    @include('main')
    <!--  END CONTENT -->
    <!-- footer area -->
    @include('template.footer')

    <!-- copyright -->
    @include('template.copyright')

    <!-- all js -->
    <script src="{{ asset('template/assets/js/jquery-3.5.1.min.js') }}"></script>
    <script src="{{ asset('template/assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('template/assets/js/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('template/assets/js/slick.min.js') }}"></script>
    <script src="{{ asset('template/assets/js/jquery.nice-select.min.js') }}"></script>
    <script src="{{ asset('template/assets/js/app.js') }}"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const menuButton = document.getElementById('menu-button');
            const subCategories = document.getElementById('sub-categories-wrapper');

            menuButton.addEventListener('click', () => {
                const isPinned = subCategories.classList.toggle('pinned');

                // Cambiar el ícono y texto del botón
                const icon = menuButton.querySelector('i');
                const text = menuButton.querySelector('.icon_text');

                if (isPinned) {
                    icon.classList.remove('la-bars');
                    icon.classList.add('la-thumbtack');
                    text.textContent = 'Unpin menu';
                } else {
                    icon.classList.remove('la-thumbtack');
                    icon.classList.add('la-bars');
                    text.textContent = 'All categories';
                }
            });
        });
    </script>

</body>

</html>
