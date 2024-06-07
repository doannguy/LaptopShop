<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

class UserService
{
    public function getCurrentUser()
    {
        return Auth::user();
    }

    public function updateCurrentUser($data)
    {
        return $this->getCurrentUser()->update($data);
    }
}
