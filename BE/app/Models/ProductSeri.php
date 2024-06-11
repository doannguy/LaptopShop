<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductSeri extends Model
{
    use HasFactory;

    protected $table = "product_series";

    protected $guarded = [];

    public const DELETE_TYPE = [
        'soft' => 0,
        'hard' => 1,
    ];

    public function products()
    {
        return $this->hasMany(Product::class, 'product_seri_id', 'id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
}
