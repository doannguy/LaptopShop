<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
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

    public function orderService()
    {
        return app(OrderService::class);
    }
}
