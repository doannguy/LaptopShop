<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;

    protected $table = "order_details";

    protected $guarded = ['id'];

    public $timestamps = false;

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }

    public function productOption()
    {
        return $this->belongsTo(ProductOption::class, 'product_option_id', 'id');
    }
}
