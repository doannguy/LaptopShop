<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Product extends Model
{
    use HasFactory;
    protected $table = "products";

    protected $guarded = [];

    public const DELETE_TYPE = [
        'soft' => 0,
        'hard' => 1,
    ];

    public function category() {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
    /**
     * Get all of the ProductOptions for the Product
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function productOptions(): HasMany
    {
        return $this->hasMany(ProductOption::class, 'product_id', 'id');
    }
    /**
     * Get the thumbnailMedia associated with the Product
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function thumbnailMedia(): HasOne
    {
        return $this->hasOne(Media::class, 'id', 'thumbnail');
    }
    /**
     * Get the brand that owns the Product
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function brand(): BelongsTo
    {
        return $this->belongsTo(Brand::class, 'brand_id', 'id');
    }
    /**
     * Get the productSeri that owns the Product
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function productSeri(): BelongsTo
    {
        return $this->belongsTo(ProductSeri::class, 'product_seri_id', 'id');
    }
}
