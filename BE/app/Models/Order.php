<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $table = "orders";

    protected $guarded = ['id'];

    public const STATUS_WAITING = 0;
    public const STATUS_SUCCESS = 1;
    public const STATUS_CANCEL = 2;

    public const STATUS_LABEL = [
        self::STATUS_WAITING => 'Đang chờ',
        self::STATUS_SUCCESS => 'Thành công',
        self::STATUS_CANCEL => 'Đã hủy',
    ];

    public const SHIPPING_LABEL = [
        0 => 'Giao hàng tiết kiệm (Miễn Phí)',
        1 => 'Giao hàng nhanh',
    ];

    public const PAYMENT_LABEL = [
        0 => 'Thanh toán qua thẻ ngân hàng',
        1 => 'Thanh toán khi nhận hàng',
    ];

    public static function getPaymentMethod($id)
    {
        return self::PAYMENT_LABEL[$id];
    }

    public static function getShippingType($id)
    {
        return self::SHIPPING_LABEL[$id];
    }

    public static function getStatus($id)
    {
        return self::STATUS_LABEL[$id];
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class, 'order_id', 'id');
    }
}
