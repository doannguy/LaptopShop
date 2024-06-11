<?php

namespace App\Services;

use Spatie\Permission\Models\Role;

class RoleService extends Service
{
    public function setModel()
    {
        return new Role();
    }
}
