<nav class="navbar navbar-expand-lg navbar-light bg-light shadow ">
    <div class="container mt-2">
        <!-- Nama Website -->
        <a class="navbar-brand fw-bold" href="{{ url('/') }}">
            {{ config('app.name', 'Laravel') }}
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                @guest
                    <!-- Jika pengguna belum login -->
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('login') ? 'active text-warning' : '' }}"
                            href="{{ route('login') }}">
                            <i class="fas fa-sign-in-alt" style="font-size: 20px;"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('register') ? 'active text-warning' : '' }}"
                            href="{{ route('register') }}">
                            <i class="fas fa-user-plus" style="font-size: 20px;"></i>
                        </a>
                    </li>
                @else
                    <!-- Jika pengguna sudah login -->
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('home') ? 'active' : '' }}" href="{{ route('home') }}">
                            <i class="fas fa-home" style="font-size: 20px;"></i>
                        </a>
                    </li>

                    <!-- Notifikasi -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle position-relative" href="#" id="notifDropdown"
                            role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-bell" style="font-size: 20px;"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                @if (auth()->user()->notifications)
                                    {{ auth()->user()->unreadNotificationsCount() }}
                                @else
                                    0
                                @endif
                            </span>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="notifDropdown">
                            @if (auth()->user()->notifications)
                                @forelse(auth()->user()->notifications->take(5) as $notification)
                                    <li>
                                        <a class="dropdown-item"
                                            href="{{ $notification->url }}">
                                            <div class="">
                                                <p class="mb-0 mt-0 fw-bold"><small>{{ \Str::limit($notification->title,30) ?? __('No Title') }}</small></p>
                                            <small>{{ \Str::limit($notification->message,30) ?? __('New Notification') }}</small>
                                            </div>
                                        </a>
                                    </li>
                                @empty
                                    <li>
                                        <a class="dropdown-item text-muted">{{ __('No notifications') }}</a>
                                    </li>
                                @endforelse
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item text-warning"
                                        href="{{ route('notifications.index') }}">{{ __('Show All Notifications') }}</a>
                                </li>
                            @else
                                <li>
                                    <a class="dropdown-item text-muted">{{ __('No notifications') }}</a>
                                </li>
                            @endif
                        </ul>
                    </li>

                    <!-- Pesan -->
                    <li class="nav-item">
                        <a class="nav-link position-relative" href="{{ route('messages.list') }}">
                            <i class="fas fa-envelope" style="font-size: 20px;"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                @if (auth()->user()->notifications)
                                {{ auth()->user()->unreadMessages->count() }}
                                @else
                                0
                                @endif
                            </span>
                        </a>
                    </li>

                    <!-- Profile -->
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('profile') }}">
                            <i class="fas fa-user-circle" style="font-size: 24px;"></i>
                        </a>
                    </li>

                    <!-- Logout -->
                    <li class="nav-item">
                        <form id="logout-form" action="{{ route('logout') }}" method="POST">
                            @csrf
                            <a class="nav-link text-danger" href="#"
                                onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                <i class="fas fa-sign-out-alt" style="font-size: 20px;"></i>
                            </a>
                        </form>
                    </li>
                @endguest

                <!-- Pilihan Bahasa -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="languageDropdown" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-language" style="font-size: 20px;"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="languageDropdown">
                        <li>
                            <a class="dropdown-item" href="{{ route('change-language', 'en') }}">
                                <i class="fas fa-flag-usa" style="font-size: 20px;"></i> EN
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="{{ route('change-language', 'id') }}">
                                <i class="fas fa-flag" style="font-size: 20px;"></i> ID
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</nav>
