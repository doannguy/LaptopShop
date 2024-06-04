@extends('layouts.auth')

@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif

    <form class="form w-100" method="POST" action="{{ route('password.email') }}">
        @csrf
        <div class="card-body">
            <div class="text-start mb-10">
                <h1 class="text-dark mb-3 fs-3x">
                    Quên mật khẩu
                </h1>
                <div class="text-gray-400 fw-semibold fs-6">
                    Nhập email của bạn để thiết lập lại mật khẩu của bạn.
                </div>
            </div>

            <div class="fv-row mb-8">
                <input type="text" placeholder="Email" name="email" value="{{ old('email') }}" required
                    autocomplete="email" autofocus
                    class="form-control form-control-solid @error('email') is-invalid @enderror" />
                @error('email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>

            <div class="d-flex flex-stack">
                <div class="m-0">
                    <button class="btn btn-primary me-2">
                        <span class="indicator-label">Xác nhận</span>
                        <span class="indicator-progress">Please wait...
                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                    </button>
                    <a href="{{ route('login') }}" class="btn btn-lg btn-light-primary fw-bold">Quay lại</a>
                </div>
            </div>
        </div>
    </form>
@endsection
