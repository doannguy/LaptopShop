<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

class UserService extends Service
{
    public function setModel()
    {
        return new User();
    }

    public function filterDatatable(array $data)
    {
        $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
        $pageLength = $data['length'] ?? 10;
        $skip = ($pageNumber - 1) * $pageLength;

        $query = $this->model->query();

        if (isset($data['search'])) {
            $search = $data['search'];
            $query->where('name', 'like', "%{$search}%")
                ->orWhere('email', 'like', "%{$search}%");
        }

        $recordsFiltered = $recordsTotal = $query->count();
        $brands = $query->skip($skip)
            ->with(['roles'])
            ->latest()
            ->take($pageLength)
            ->get();

        return [
            "draw" => $data['draw'] ?? 1,
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $recordsFiltered,
            'data' => $brands
        ];
    }

    public function getCurrentUser()
    {
        return Auth::user();
    }

    public function updateCurrentUser($data)
    {
        return $this->getCurrentUser()->update($data);
    }

    public function update($id, $data)
    {
        $user = $this->model->find($id);
        $user->update($data);

        $user->syncRoles([$data['role']]);
        return $user;
    }
}
