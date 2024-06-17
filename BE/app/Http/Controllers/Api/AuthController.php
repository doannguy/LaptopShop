<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Auth\ChangePasswordRequest;
use App\Http\Requests\Api\Auth\LoginRequest;
use App\Http\Requests\Api\Auth\RegisterRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Password;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $data = $request->validated();
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'gender' => $data['gender'],
            'password' => Hash::make($request->password),
        ]);
        $user->assignRole('member');
        return jsonResponse(0, $user, message: "Đăng ký thành công");
    }

    public function login(LoginRequest $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return jsonResponse(1, message: "Tài khoản hoặc mật khẩu không chính xác");
        }
        $user->tokens()->delete();
        $token = $user->createToken('authToken')->plainTextToken;

        return jsonResponse(0, ['token' => $token], "Đăng nhập thành công");
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return jsonResponse(1, message: "Đăng xuất thành công");
    }

    public function changePassword(ChangePasswordRequest $request)
    {
        $data = $request->validated();
        $user = Auth::user();
        if (!Hash::check($data['current_password'], $user->password)) {
            return jsonResponse(2, message: "Mật khẩu cũ không chính xác.");
        }
        $user->password = Hash::make($data['password']);
        if ($user->save()) {
            $user->tokens()->delete();
            return jsonResponse(0, message: "Thay đổi mật khẩu thành công.");
        } else {
            return jsonResponse(2, message: "Có lỗi xảy ra, vui lòng thử lại sau.");
        }
    }
    function sendResetLinkEmail(Request $request)
    {
        $data = $request->validate([
            'email' => 'required|email',
        ]);

        $user = User::where('email', $data['email'])->first();
        if (!$user) {
            return jsonResponse(1, message: "Không tìm thấy người dùng");
        }
        $status = Password::sendResetLink([
            'email' => $user->email,
        ]);
        \Log::info($status);

        if ($status == Password::RESET_LINK_SENT) {
            return jsonResponse(0, message: "Yêu cầu đã được gửi");
        }

    }
    function resetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6',
            'token' => 'required',
            "password_confirmation" => 'required|min:6',
        ]);
        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function (User $user, string $password) {
                $user->forceFill([
                    'password' => Hash::make($password)
                ])->setRememberToken(Str::random(60));

                $user->save();

                event(new PasswordReset($user));
            }
        );
        return jsonResponse($status === Password::PASSWORD_RESET ? 0 : 1, $status);
    }
}
