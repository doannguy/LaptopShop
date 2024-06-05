<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Auth\LoginRequest;
use App\Http\Requests\Api\Auth\RegisterRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

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
        $user->assignRole('user');
        return jsonResponse(1, $user, message: 'Register successfully');
    }

    public function login(LoginRequest $request)
    {


        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return jsonResponse(0,message:"Tài khoản hoặc mật khẩu không chính xác");
        }

        $token = $user->createToken('authToken')->plainTextToken;

        return jsonResponse(1,['token' => $token], "Đăng nhập thành công");
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return jsonResponse(1, message: "Đăng xuất thành công");
    }
}
