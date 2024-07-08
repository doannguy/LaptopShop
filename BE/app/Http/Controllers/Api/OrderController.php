<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Order\StoreOrderRequest;
use App\Http\Requests\Api\Order\UpdateOrderRequest;
use App\Http\Requests\Api\Order\VnpayPaymentRequest;
use App\Services\OrderService;

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
        return jsonResponse($result != false ? 0 : 1, $result, $result != false ?'Đặt hàng thành công' : 'Đặt hàng thất bại');
    }
    function update(UpdateOrderRequest $request, $id)  {
        $result = $this->orderService()->userUpdate($request->input(), $id);
        return jsonResponse($result ? 0 : 1, $result, $result ?'Cập nhật đơn hàng thành công' : 'Cập nhật đơn hàng thất bại');
    }
    function delete($id) {
        $result = $this->orderService()->delete($id);
        return jsonResponse($result ? 0 : 1, $result, $result ? 'Xóa đơn hàng thành công' : 'Xóa đơn hàng thất bại');
    }
    function vnpayPayment(VnpayPaymentRequest $request) {

    $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    $vnp_Returnurl = route('order.vnpay_payment_complete', ['id' => $request->order_id]) . '?url_return=' . $request->url_return;
    $vnp_TmnCode = env('VNPAY_TMMCODE');//Mã website tại VNPAY
    $vnp_HashSecret = env('VNPAY_HASH_SECRET'); //Chuỗi bí mật

    $vnp_TxnRef = $request->order_id; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
    $vnp_OrderInfo = "Thanh toán đơn hàng tại Nguyễn Đoàn Laptop";
    $vnp_OrderType = 'billpayment';
    $vnp_Amount = $request->amount * 100;
    $vnp_Locale = 'vn';
    $vnp_BankCode = 'NCB';
    $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
    //Add Params of 2.0.1 Version
    // $vnp_ExpireDate = $_POST['txtexpire'];
    $inputData = array(
        "vnp_Version" => "2.1.0",
        "vnp_TmnCode" => $vnp_TmnCode,
        "vnp_Amount" => $vnp_Amount,
        "vnp_Command" => "pay",
        "vnp_CreateDate" => date('YmdHis'),
        "vnp_CurrCode" => "VND",
        "vnp_IpAddr" => $vnp_IpAddr,
        "vnp_Locale" => $vnp_Locale,
        "vnp_OrderInfo" => $vnp_OrderInfo,
        "vnp_OrderType" => $vnp_OrderType,
        "vnp_ReturnUrl" => $vnp_Returnurl,
        "vnp_TxnRef" => $vnp_TxnRef
        // "vnp_ExpireDate"=>$vnp_ExpireDate
    );
    if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
        $inputData['vnp_Bill_State'] = $vnp_Bill_State;
    }

    //var_dump($inputData);
    ksort($inputData);
    $query = "";
    $i = 0;
    $hashdata = "";
    foreach ($inputData as $key => $value) {
        if ($i == 1) {
            $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
        } else {
            $hashdata .= urlencode($key) . "=" . urlencode($value);
            $i = 1;
        }
        $query .= urlencode($key) . "=" . urlencode($value) . '&';
    }

    $vnp_Url = $vnp_Url . "?" . $query;
    if (isset($vnp_HashSecret)) {
        $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//
        $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
    }
    $returnData = array('code' => '00'
        , 'message' => 'success'
        , 'data' => $vnp_Url);
        echo json_encode($returnData);
        // vui lòng tham khảo thêm tại code demo
    }
}
