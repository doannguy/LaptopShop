<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\User\UpdateUserRequest;
use App\Services\UserService;

class UserController extends Controller
{
    public function get()
    {
        $user = $this->userService()->getCurrentUser();
        return jsonResponse($user ? 0 : 2, ['user' => $user]);
    }

    public function update(UpdateUserRequest $request)
    {
        $data = $request->validated();
        $result = $this->userService()->updateCurrentUser($data);
        return jsonResponse($result ? 0 : 2);
    }

    public function userService()
    {
        return app(UserService::class);
    }
}
