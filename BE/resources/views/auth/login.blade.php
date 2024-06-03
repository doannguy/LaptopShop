@extends('layouts.auth')
@section('title')
    Đăng nhập tài khoản
@endsection
@section('content')
    <a href="{{ route('dashboard') }}" class="d-block d-lg-none mx-auto py-20">
        <img alt="Logo" src="{{ asset('assets/media/logos/default.svg') }}" class="theme-light-show h-25px" />
        <img alt="Logo" src="{{ asset('assets/media/logos/default-dark.svg') }}" class="theme-dark-show h-25px" />
    </a>
    <div class="d-flex flex-column flex-column-fluid flex-center w-lg-50 p-10">
        <div class="d-flex justify-content-between flex-column-fluid flex-column w-100 mw-450px">
            <div class="d-flex flex-stack py-2">
                <div class="me-2"></div>
                <div class="m-0">
                    <span class="text-gray-400 fw-bold fs-5 me-2" data-kt-translate="sign-in-head-desc">
                        Not a Member yet?
                    </span>
                    <a href="{{ route('register') }}" class="link-primary fw-bold fs-5"
                        data-kt-translate="sign-in-head-link">
                        Sign Up
                    </a>
                </div>
            </div>
            <div class="py-20">
                <form class="form w-100" id="kt_sign_in_form" method="POST" action="{{ route('login') }}">
                    @csrf
                    <div class="card-body">

                        <div class="text-start mb-10">
                            <h1 class="text-dark mb-3 fs-3x" data-kt-translate="sign-in-title">
                                Đăng nhập
                            </h1>
                            <div class="text-gray-400 fw-semibold fs-6" data-kt-translate="general-desc">
                                Đăng nhập vào hệ thống ngay
                            </div>
                        </div>
                        <div class="fv-row mb-8">
                            <input type="text" placeholder="Email" name="email" autocomplete="off"
                                data-kt-translate="sign-in-input-email"
                                class="form-control form-control-solid @error('email') is-invalid @enderror" />
                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="fv-row mb-7">
                            <input type="text" placeholder="Password" name="password" autocomplete="off"
                                data-kt-translate="sign-in-input-password"
                                class="form-control form-control-solid @error('password') is-invalid @enderror" />
                            @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-10">
                            <div></div>
                            <a href="reset-password.html" class="link-primary" data-kt-translate="sign-in-forgot-password">
                                Quên mật khẩu ?
                            </a>
                        </div>
                        <div class="d-flex flex-stack">
                            <button id="kt_sign_in_submit" class="btn btn-primary me-2 flex-shrink-0">
                                <span class="indicator-label" data-kt-translate="sign-in-submit">
                                    Đăng nhập
                                </span>
                                <span class="indicator-progress">
                                    <span data-kt-translate="general-progress">Please wait...</span>
                                    <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                                </span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="m-0"> </div>
        </div>
    </div>
@endsection
