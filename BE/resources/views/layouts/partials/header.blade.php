<div class="app-container container-fluid d-flex align-items-stretch justify-content-between"
    id="kt_app_header_container">
    <div class="d-flex align-items-center d-lg-none ms-n3 me-1 me-md-2" title="Show sidebar menu">
        <div class="btn btn-icon btn-active-color-primary w-35px h-35px" id="kt_app_sidebar_mobile_toggle">
            <i class="ki-outline ki-abstract-14 fs-2 fs-md-1"></i>
        </div>
    </div>
    <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0">
        <a href="index.html" class="d-lg-none">
            <img alt="Logo" src="assets/media/logos/default-small.svg" class="h-30px" />
        </a>
    </div>
    <div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1" id="kt_app_header_wrapper">
        <div class="app-header-menu app-header-mobile-drawer align-items-stretch" data-kt-drawer="true"
            data-kt-drawer-name="app-header-menu" data-kt-drawer-activate="{default: true, lg: false}"
            data-kt-drawer-overlay="true" data-kt-drawer-width="250px" data-kt-drawer-direction="end"
            data-kt-drawer-toggle="#kt_app_header_menu_toggle" data-kt-swapper="true"
            data-kt-swapper-mode="{default: 'append', lg: 'prepend'}"
            data-kt-swapper-parent="{default: '#kt_app_body', lg: '#kt_app_header_wrapper'}">
        </div>
        <div class="app-navbar flex-shrink-0">
            <div class="app-navbar-item align-items-stretch ms-1 ms-md-4">
            </div>
            <div class="app-navbar-item ms-1 ms-md-4">
                <a href="#"
                    class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px"
                    data-kt-menu-trigger="{default:'click', lg: 'hover'}" data-kt-menu-attach="parent"
                    data-kt-menu-placement="bottom-end">
                    <i class="ki-outline ki-night-day theme-light-show fs-1"></i>
                    <i class="ki-outline ki-moon theme-dark-show fs-1"></i>
                </a>
                <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-title-gray-700 menu-icon-gray-500 menu-active-bg menu-state-color fw-semibold py-4 fs-base w-150px"
                    data-kt-menu="true" data-kt-element="theme-mode-menu">
                    <div class="menu-item px-3 my-0">
                        <a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="light">
                            <span class="menu-icon" data-kt-element="icon">
                                <i class="ki-outline ki-night-day fs-2"></i>
                            </span>
                            <span class="menu-title">Sáng</span>
                        </a>
                    </div>
                    <div class="menu-item px-3 my-0">
                        <a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="dark">
                            <span class="menu-icon" data-kt-element="icon">
                                <i class="ki-outline ki-moon fs-2"></i>
                            </span>
                            <span class="menu-title">Tối</span>
                        </a>
                    </div>
                    {{-- <div class="menu-item px-3 my-0">
                        <a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="system">
                            <span class="menu-icon" data-kt-element="icon">
                                <i class="ki-outline ki-screen fs-2"></i>
                            </span>
                            <span class="menu-title">Theo hệ thống</span>
                        </a>
                    </div> --}}
                </div>
            </div>
            <div class="app-navbar-item ms-1 ms-md-4" id="kt_header_user_menu_toggle">
                <div class="cursor-pointer symbol symbol-35px" data-kt-menu-trigger="{default: 'click', lg: 'hover'}"
                    data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                    <img src="assets/media/avatars/300-3.jpg" class="rounded-3" alt="user" />
                </div>
                <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-color fw-semibold py-4 fs-6 w-275px"
                    data-kt-menu="true">
                    <div class="menu-item px-3">
                        <div class="menu-content d-flex align-items-center px-3">
                            <div class="symbol symbol-50px me-5">
                                <img alt="Logo" src="assets/media/avatars/300-3.jpg" />
                            </div>
                            <div class="d-flex flex-column">
                                <div class="fw-bold d-flex align-items-center fs-5">
                                    @if (Auth::check())
                                        {{ Auth::user()->name }}
                                    @endif
                                </div>
                                <a href="#" class="fw-semibold text-muted text-hover-primary fs-7">
                                    @if (Auth::check())
                                        {{ Auth::user()->email }}
                                    @endif
                                </a>
                            </div>
                        </div>
                    </div>
                    {{-- <div class="separator my-2"></div>
                    <div class="menu-item px-5">
                        <a href="{{ route('profile.editPassword') }}" class="menu-link px-5">Đổi mật khẩu</a>
                    </div> --}}
                    <div class="separator my-2"></div>
                    <div class="menu-item px-5">
                        @if (Auth::check())
                            <li>
                                <a class="menu-link px-5" href="{{ route('logout') }}"
                                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                    {{-- <i class='mdi mdi-logout me-2'></i> --}}
                                    <span class="align-middle">{{ __('Đăng xuất') }}</span>
                                </a>
                            </li>
                            <form method="POST" id="logout-form" action="{{ route('logout') }}">
                                @csrf
                            </form>
                        @endif
                    </div>
                </div>
            </div>
            <div class="app-navbar-item d-lg-none ms-2 me-n2" title="Show header menu">
                <div class="btn btn-flex btn-icon btn-active-color-primary w-30px h-30px"
                    id="kt_app_header_menu_toggle">
                    <i class="ki-outline ki-element-4 fs-1"></i>
                </div>
            </div>
        </div>
    </div>
</div>
