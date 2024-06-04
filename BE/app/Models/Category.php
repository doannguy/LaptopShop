<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $table = "categories";

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
