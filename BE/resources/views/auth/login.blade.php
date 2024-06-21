@extends('layouts.auth')
@section('title')
    Đăng nhập tài khoản
@endsection
@section('content')
    <form class="form w-100" id="kt_sign_in_form" method="POST" action="{{ route('login') }}">
        @csrf
        <div class="card-body">
            <div class="text-start mb-10">
                <h1 class="text-dark mb-3 fs-3x">
                    Đăng nhập
                </h1>
                <div class="text-gray-400 fw-semibold fs-6 mb-3">
                    Đăng nhập vào hệ thống ngay
                </div>

                @if ($errors->has('block'))
                    @section('script')
                        <script>
                            toastr.error("{{ $errors->first('block') }}");
                        </script>
                    @endsection
                @endif
            </div>
            <div class="fv-row mb-8">
                <input type="text" placeholder="Email" name="email" autocomplete="off"
                    class="form-control form-control-solid @error('email') is-invalid @enderror" />
                @error('email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
            <div class="fv-row mb-7">
                <input type="password" placeholder="Password" name="password" autocomplete="off"
                    class="form-control form-control-solid @error('password') is-invalid @enderror" />
                @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
            <div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-10">
                <div></div>
                <a href="{{ route('password.request') }}" class="link-primary">
                    Quên mật khẩu ?
                </a>
            </div>
            <div class="d-flex flex-stack">
                <button id="kt_sign_in_submit" class="btn btn-primary me-2 flex-shrink-0">
                    <span class="indicator-label">
                        Đăng nhập
                    </span>
                    <span class="indicator-progress">
                        <span>Vui lòng chờ...</span>
                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                    </span>
                </button>
            </div>

        </div>
    </form>
@endsection
