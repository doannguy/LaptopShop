<?php

use App\Models\Order;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('total_price');
            $table->text('note')->nullable();
            $table->string('user_name');
            $table->string('phone');
            $table->string('address');
            $table->tinyInteger('status')->default(Order::STATUS_WAITING);
            $table->text('message')->nullable();
            $table->unsignedSmallInteger('shipping_type');
            $table->unsignedBigInteger('shipping_fee');
            $table->unsignedSmallInteger('payment_method');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
