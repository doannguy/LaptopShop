<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Order\UpdateOrderRequest;
use App\Services\OrderService;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        return view('order.index.main');
    }

    public function datatable(Request $request)
    {
        $result = $this->orderService()->filterDatatable($request->input());
        return response()->json($result);
    }

    public function edit(int $id)
    {
        $order = $this->orderService()->findById($id);
        return view('order.edit.main', compact('order'));
    }

    public function update(UpdateOrderRequest $request)
    {
        $data = $request->getData();
        $result = $this->orderService()->update($data['id'], $data);
        return JsonResponse($result ? 0 : 1);
    }

    public function orderService()
    {
        return app(OrderService::class);
    }
}
