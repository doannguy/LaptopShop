<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductAttributeValue extends Model
{
    use HasFactory;
    protected $table = "product_attribute_values";

    public $timestamps = false;

    protected $guarded = [];

    public const DELETE_TYPE = [
        'soft' => 0,
        'hard' => 1,
    ];
    public function attributeValues() {
        return $this->belongsTo(AttributeValue::class, 'attribute_value_id', 'id');
    }
}
