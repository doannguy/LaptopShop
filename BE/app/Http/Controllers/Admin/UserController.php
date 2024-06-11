<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\User\UpdateUserRequest;
use App\Models\User;
use App\Services\RoleService;
use App\Services\UserService;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        $roles = $this->roleService()->getAll();
        $genders = [
            User::GENDER_MALE => 'Nam',
            User::GENDER_FEMALE => 'Nữ',
        ];
        $status = [
            User::STATUS_ACTIVE => 'Hoạt động',
            User::STATUS_INACTIVE => 'Khóa',
        ];

        return view('user.index.main', compact('roles', 'genders', 'status'));
    }

    public function datatable(Request $request)
    {
        return $this->userService()->filterDatatable($request->input());
    }

    public function update(UpdateUserRequest $request)
    {
        $data = $request->validated();
        $result = $this->userService()->update($data['id'], $data);
        return jsonResponse($result ? 0 : 1);
    }

    public function roleService()
    {
        return app(RoleService::class);
    }

    public function userService()
    {
        return app(UserService::class);
    }
}
