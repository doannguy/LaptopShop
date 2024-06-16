<?php

namespace App\Services;

use App\Models\Order;
use Illuminate\Support\Facades\Auth;

class OrderService extends Service
{
    public function setModel()
    {
        return new Order();
    }

    public function filterDatatable(array $data)
    {
        $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
        $pageLength = $data['length'] ?? 10;
        $skip = ($pageNumber - 1) * $pageLength;
        $orderBy = $data['columns'][$data['order'][0]['column']]['data'] ?? 'id';
        $orderDir = $data['order'][0]['dir'] ?? 'desc';

        $query = $this->model->query();

        if (isset($data['search'])) {
            $search = $data['search'];
            $query->where('code', 'like', "%{$search}%")
                ->orWhereHas('user', function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%");
                });
        }

        if (isset($data['user_id'])) {
            $query->whereHas('user', function ($q) use ($data) {
                $q->where('id', $data['user_id']);
            });
        }

        $query->orderBy($orderBy, $orderDir);
        $recordsFiltered = $recordsTotal = $query->count();
        $orders = $query->skip($skip)
            ->with(['user'])
            ->take($pageLength)
            ->get();

        return [
            "draw" => $data['draw'] ?? 1,
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $recordsFiltered,
            'data' => $orders
        ];
    }

    public function findById(int $id)
    {
        return $this->model
            ->where('id', $id)
            ->with(['orderDetails.productOption', 'user.orders'])
            ->first();
    }

    public function store($data)
    {
        $lastOrder = $this->model->orderBy('id', 'desc')->first();
        $lastOrderId = $lastOrder ? $lastOrder->id : 0;
        $orderId = str_pad($lastOrderId + 1, 6, '0', STR_PAD_LEFT);
        $orderCode = 'DH' . $orderId;

        $order = $this->model->create([
            'code' => $orderCode,
            'user_id' => Auth::user()->id,
        ]);

        return $order;
    }

    public function update($id, $data)
    {
        $order = $this->model->find($id);
        return $order->update($data);
    }
}
