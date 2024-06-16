<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Order\StoreOrderRequest;
use App\Http\Requests\Api\Order\UpdateOrderRequest;
use App\Services\OrderService;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function orderService() {
        return app(OrderService::class);
    }

    public function getList() {
        $result = $this->orderService()->getByUserId();
        return jsonResponse(0, $result);
    }
    public function getDetail($id) {
        $result = $this->orderService()->getDetail($id);
        return jsonResponse(0, $result);
    }
    public function store(StoreOrderRequest $request) {
        $result = $this->orderService()->store($request->input());
        return jsonResponse($result ? 0 : 1, $result, $result ?'Đặt hàng thành công' : 'Đặt hàng thất bại');
    }
    function update(UpdateOrderRequest $request, $id)  {
        $result = $this->orderService()->update($request->input(), $id);
        return jsonResponse($result ? 0 : 1, $result, $result ?'Cập nhật đơn hàng thành công' : 'Cập nhật đơn hàng thất bại');
    }
    function delete($id) {
        $result = $this->orderService()->delete($id);
        return jsonResponse($result ? 0 : 1, $result, $result ? 'Xóa đơn hàng thành công' : 'Xóa đơn hàng thất bại');
    }
}
