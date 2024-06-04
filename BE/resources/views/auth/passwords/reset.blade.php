@extends('layouts.auth')

@section('content')
    <form class="form w-100" method="POST" action="{{ route('password.update') }}">
        @csrf
        <div class="card-body">
            <div class="text-start mb-10">
                <h1 class="text-dark mb-3 fs-3x">
                    Đặt lại mật khẩu
                </h1>
                <div class="text-gray-400 fw-semibold fs-6">
                    Vui lòng nhập đủ thông tin bên dưới để đặt lại mật khẩu của bạn.
                </div>
            </div>

            <input type="hidden" name="token" value="{{ $token }}">

            <div class="fv-row mb-8">
                <input type="text" placeholder="Email" name="email" value="{{ $email ?? old('email') }}" required
                    autocomplete="email" autofocus
                    class="form-control form-control-solid @error('email') is-invalid @enderror" />
                @error('email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>

            <div class="fv-row mb-8">
                <input type="password" id="password" placeholder="Mật khẩu mới" name="password" required
                    autocomplete="new-password"
                    class="form-control form-control-solid @error('password') is-invalid @enderror" />
                @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>

            <div class="fv-row mb-8">
                <input type="password" id="password-confirm" placeholder="Nhập lại mật khẩu" name="password_confirmation"
                    required autocomplete="new-password" class="form-control form-control-solid" />
            </div>

            <div class="d-flex flex-stack">
                <div class="m-0">
                    <button class="btn btn-primary me-2">
                        <span class="indicator-label">Xác nhận</span>
                        <span class="indicator-progress">Please wait...
                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                    </button>
                </div>
            </div>
        </div>
    </form>
@endsection
