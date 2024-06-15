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

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
