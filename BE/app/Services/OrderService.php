<?php

namespace App\Services;

use App\Models\Cart;
use App\Models\Order;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class OrderService extends Service
{
    public function setModel()
    {
        return new Order();
    }

    public function getByUserId() {
        $user = auth()->user();
        return $this->model->where('user_id', $user->id)->get()->map(function ($order) {
            return [
                'id' => $order->id,
                'code' => $order->code,
                'created_at' => $order->created_at->format('H:i d/m/Y '),
                'status' => Order::STATUS_LABEL[$order->status] ?? 'Đang chờ',
                'total_price' => $order->total_price,
            ];
        });
    }

    public function getDetail($id) {
        $order = $this->model->find($id);
        return [
            'id' => $order->id,
            'code' => $order->code,
            'created_at' => $order->created_at->format('H:i d/m/Y '),
            'status_label' => Order::STATUS_LABEL[$order->status] ?? 'Đang chờ',
            'status' => $order->status,
            'shipping_fee' => $order->shipping_fee,
            'shipping_type' => Order::SHIPPING_LABEL[$order->shipping_type] ?? 'Lỗi',
            'payment_method' => Order::PAYMENT_LABEL[$order->payment_method] ?? 'Lỗi',
            'note'  => $order->note,
            'message' => $order->message,
            'total_price' => $order->total_price,
            'phone' => $order->phone,
            'name' => $order->name,
            'user' => $order->user,
            'order_details' => $order->orderDetails->map(function ($orderDetail) {
                return [
                    'id' => $orderDetail->id,
                    'product_name' => $orderDetail->productOption->product->name.' ('.$orderDetail->productOption->name.')',
                    'quantity' => $orderDetail->quantity,
                    'price' => $orderDetail->price
                ];
            }),
            'address' => $order->address
        ];
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
    public function store($data) {
        DB::beginTransaction();
        try {
            $user = auth()->user();
            \Log::info($user->id);
            $orderData = [
                'code' => 'DH-U' . $user->id . "T" . time() . substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, 1),
                'user_id' => $user->id,
                'note' => $data['notes'] ?? '',
                'total_price' => $data['total_amount'],
                'address' => $data['address'],
                'status' => $this->model::STATUS_WAITING,
                'name' => $data['first_name'] . ' ' . $data['last_name'],
                'phone' => $data['phone'],
                'shipping_fee' => $data['shipping_fee'],
                'shipping_type' => $data['shipping_type'],
                'payment_method' => $data['payment_method'],
            ];
            $order = parent::store($orderData);
            $order_details = [];
            foreach ($data['order_details'] as $item) {
                $order_details[] = [
                    'product_option_id' => $item['product_option_id'],
                    'price' => $item['current_price'] ? $item['current_price'] : $item['price'],
                    'quantity' => $item['quantity'],
                    'order_id' => $order->id
                ];
            }
            $order->orderDetails()->createMany($order_details);
            // Xóa các cart cũ
            $cartIds = [];
            foreach ($data['order_details'] as $item) {
                $cartIds[] = $item['id'];
            }
            Cart::whereIn('id', $cartIds)->delete();
            DB::commit();
            return true;
        }catch (\Exception $e) {
            \Log::error($e->getMessage());
            DB::rollBack();
            return false;
        }

    }

    public function update($data, $id) {
        $order = $this->model->find($id);
        if($order->status != $this->model::STATUS_WAITING) {
            return false;
        }
        return parent::update( $id, $data);
    }
    function delete($id) {
        $order = $this->model->find($id);
        if($order->status != $this->model::STATUS_WAITING) {
            return false;
        }
        $order->orderDetails()->delete();
        return $order->delete();
    }

}
