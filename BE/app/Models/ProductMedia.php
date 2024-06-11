<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductMedia extends Model
{
    use HasFactory;

    protected $table = "product_media";
    public $timestamps = false;
    protected $guarded = [];
    public const DELETE_TYPE = [
        'soft' => 0,
        'hard' => 1,
    ];

}
