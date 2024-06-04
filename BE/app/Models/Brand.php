<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    use HasFactory;

    protected $table = "brands";

    protected $guarded = [];

    public const DELETE_TYPE = [
        'soft' => 0,
        'hard' => 1,
    ];

    public function products()
    {
        // return $this->hasMany(Product::class, 'category_id', 'id');
    }
}
