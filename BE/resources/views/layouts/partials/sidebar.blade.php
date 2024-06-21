<div id="kt_app_sidebar" class="app-sidebar flex-column" data-kt-drawer="true" data-kt-drawer-name="app-sidebar"
    data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="225px"
    data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_app_sidebar_mobile_toggle">

    <div class="app-sidebar-logo px-6" id="kt_app_sidebar_logo">
        <a href="{{ route('dashboard') }}">
            <img alt="Logo" src="assets/media/logos/default.svg" style="width: 100%;"
                class="app-sidebar-logo-default theme-light-show" />
            <img alt="Logo" src="assets/media/logos/default-dark.svg" style="width: 100%;"
                class="app-sidebar-logo-default theme-dark-show" />
            <img alt="Logo" src="assets/media/logos/default-small.svg" class="h-20px app-sidebar-logo-minimize" />
        </a>
        <div id="kt_app_sidebar_toggle"
            class="app-sidebar-toggle btn btn-icon btn-shadow btn-sm btn-color-muted btn-active-color-primary h-30px w-30px position-absolute top-50 start-100 translate-middle rotate"
            data-kt-toggle="true" data-kt-toggle-state="active" data-kt-toggle-target="body"
            data-kt-toggle-name="app-sidebar-minimize">
            <i class="ki-outline ki-black-left-line fs-3 rotate-180"></i>
        </div>
    </div>

    <div class="app-sidebar-menu flex-column-fluid overflow-hidden">
        <div id="kt_app_sidebar_menu_wrapper" class="app-sidebar-wrapper">
            <div id="kt_app_sidebar_menu_scroll" class="scroll-y mx-3 my-5" data-kt-scroll="true"
                data-kt-scroll-activate="true" data-kt-scroll-height="auto"
                data-kt-scroll-dependencies="#kt_app_sidebar_logo, #kt_app_sidebar_footer"
                data-kt-scroll-wrappers="#kt_app_sidebar_menu" data-kt-scroll-offset="5px"
                data-kt-scroll-save-state="true">
                <div class="menu menu-column menu-rounded menu-sub-indention fw-semibold fs-6" id="#kt_app_sidebar_menu"
                    data-kt-menu="true" data-kt-menu-expand="false">
                    <div class="menu-item">
                        <a class="menu-link @if (Route::currentRouteName() == 'dashboard') active @endif"
                            href="{{ route('dashboard') }}">
                            <span class="menu-icon">
                                <i class="ki-duotone ki-home fs-2">
                                    <span class="path1"></span>
                                    <span class="path2"></span>
                                    <span class="path3"></span>
                                </i>
                            </span>
                            <span class="menu-title">Thống kê</span>
                        </a>
                    </div>
                     <div class="menu-content"><span class="menu-heading fw-bold text-uppercase fs-7">Quản lý đơn hàng</span></div>
                     <div class="menu-item">
                        <a class="menu-link @if (request()->routeIs('order.*')) active @endif"
                            href="{{ route('order.index') }}">
                            <span class="menu-icon">
                                <i class="ki-duotone ki-purchase">
                                    <span class="path1"></span>
                                    <span class="path2"></span>
                                </i>
                            </span>
                            <span class="menu-title">Đơn hàng</span>
                        </a>
                    </div>
                    <div class="menu-content"><span class="menu-heading fw-bold text-uppercase fs-7">Quản lý sản phẩm</span></div>
                    <div class="menu-item">
                        <a class="menu-link @if (Route::currentRouteName() == 'product.index') active @endif"
                            href="{{ route('product.index') }}">
                            <span class="menu-icon">
                                <i class="ki-duotone ki-monitor-mobile fs-2">
                                    <span class="path1"></span>
                                    <span class="path2"></span>
                                    <span class="path3"></span>
                                </i>
                            </span>
                            <span class="menu-title">Sản phẩm</span>
                        </a>
                    </div>
                    <div class="menu-item">
                        <a class="menu-link @if (Route::currentRouteName() == 'category.index') active @endif"
                            href="{{ route('category.index') }}">
                            <span class="menu-icon">
                                <i class="ki-duotone ki-graph-2 fs-2">
                                    <span class="path1"></span>
                                    <span class="path2"></span>
                                    <span class="path3"></span>
                                </i>
                            </span>
                            <span class="menu-title">Danh mục</span>
                        </a>
                    </div>

                    <div class="menu-item">
                        <a class="menu-link @if (Route::currentRouteName() == 'product_seri.index') active @endif"
                            href="{{ route('product_seri.index') }}">
                            <span class="menu-icon">
                                <i class="ki-duotone ki-package fs-2">
                                    <span class="path1"></span>
                                    <span class="path2"></span>
                                    <span class="path3"></span>
                                </i>
                            </span>
                            <span class="menu-title">Dòng sản phẩm</span>
                        </a>
                    </div>

                    <div class="menu-item">
                        <a class="menu-link @if (request()->routeIs('brand.index')) active @endif"
                            href="{{ route('brand.index') }}">
                            <span class="menu-icon">
                                <i class="ki-duotone ki-abstract-26 fs-2">
                                    <span class="path1"></span>
                                    <span class="path2"></span>
                                    <span class="path3"></span>
                                </i>
                            </span>
                            <span class="menu-title">Thương hiệu</span>
                        </a>
                    </div>
                    <div class="menu-item">
                        <a class="menu-link @if (request()->routeIs('attribute.*')) active @endif"
                            href="{{ route('attribute.index') }}">
                            <span class="menu-icon">
                                <i class="ki-duotone ki-technology">
                                    <span class="path1"></span>
                                    <span class="path2"></span>
                                    <span class="path3"></span>
                                    <span class="path4"></span>
                                    <span class="path5"></span>
                                    <span class="path6"></span>
                                    <span class="path7"></span>
                                    <span class="path8"></span>
                                    <span class="path9"></span>
                                </i>
                            </span>
                            <span class="menu-title">Cấu hình sản phẩm</span>
                        </a>
                    </div>

                    @if (Auth::user()->hasRole('admin'))
                     <div class="menu-content"><span class="menu-heading fw-bold text-uppercase fs-7">Quản lý thành viên</span></div>
                        <div class="menu-item">
                            <a class="menu-link @if (request()->routeIs('user.*')) active @endif"
                                href="{{ route('user.index') }}">
                                <span class="menu-icon">
                                    <i class="ki-duotone ki-profile-user">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                        <span class="path3"></span>
                                        <span class="path4"></span>
                                    </i>
                                </span>
                                <span class="menu-title">Thành viên</span>
                            </a>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
    {{-- <div class="app-sidebar-footer flex-column-auto pt-2 pb-6 px-6" id="kt_app_sidebar_footer">
        <a href="https://preview.keenthemes.com/html/metronic/docs"
            class="btn btn-flex flex-center btn-custom btn-primary overflow-hidden text-nowrap px-0 h-40px w-100"
            data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss-="click"
            title="200+ in-house components and 3rd-party plugins">
            <span class="btn-label">Docs & Components</span>
            <i class="ki-outline ki-document btn-icon fs-2 m-0"></i>
        </a>
    </div> --}}
</div>
