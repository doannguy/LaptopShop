<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class ProductOption extends Model
{

    public const STATUS = [
        'active' => 0,
        'outOfStock' => 1,
        'inactive' => 0,
    ];
    use HasFactory;
    protected $table = "product_options";

    protected $guarded = [];
    public $timestamps = false;
    public const DELETE_TYPE = [
        'soft' => 0,
        'hard' => 1,
    ];

    public function productMedia()
    {
        return $this->belongsToMany(Media::class, 'product_media', 'product_option_id', 'media_id');
    }
    /**
     * The attributeValues that belong to the ProductOption
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function attributeValues(): BelongsToMany
    {
        return $this->belongsToMany(AttributeValue::class, 'product_attribute_values', 'product_option_id', 'attribute_value_id');
    }
    public function product() {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

}
