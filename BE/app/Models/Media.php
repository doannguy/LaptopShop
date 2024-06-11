<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Media extends Model
{
    use HasFactory;
    protected $table = "media";

    protected $guarded = [];

    public const DELETE_TYPE = [
        'soft' => 0,
        'hard' => 1,
    ];

    public function thumbnaillProduct () {
        return $this->belongsTo(Product::class, 'thumbnail', 'id');
    }

}
