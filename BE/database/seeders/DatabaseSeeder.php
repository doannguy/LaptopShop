<?php

namespace Database\Seeders;

use App\Models\Attribute;
use App\Models\AttributeValue;
use App\Models\Brand;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\ProductAttributeValue;
use App\Models\ProductOption;
use App\Models\ProductSeri;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Faker\Factory as Faker;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            RolesTableSeeder::class
        ]);

        $faker = Faker::create();

        $user = \App\Models\User::create([
            'name' => 'admin',
            'email' => 'admin@admin.com',
            'password' => Hash::make('password'),
        ]);
        $user->assignRole('admin');

        foreach (range(1, 50) as $index) {
            $user = User::create([
                'name' => $faker->name,
                'email' => $faker->unique()->safeEmail,
                'password' => Hash::make('password'),
            ]);
            $user->assignRole('member');
        }

        foreach (range(1, 30) as $index) {
            Brand::create([
                'name' => $faker->name
            ]);
        }

        foreach (range(1, 30) as $index) {
            Category::create([
                'name' => $faker->name
            ]);
        }

        foreach (range(1, 30) as $index) {
            Attribute::create([
                'name' => $faker->name,
                'status' => $faker->numberBetween(0, 1)
            ]);
        }

        foreach (range(1, 30) as $index) {
            AttributeValue::create([
                'attribute_id' => Attribute::all()->random()->id,
                'value' => $faker->name
            ]);
        }

        foreach (range(1, 100) as $index) {
            ProductSeri::create([
                'name' => $faker->name,
                'category_id' => Category::all()->random()->id,
            ]);
        }

        foreach (range(1, 200) as $index) {
            Product::create([
                'name' => $faker->name,
                'slug' => $faker->unique()->slug(20),
                'short_description' => $faker->text,
                'description' => $faker->text,
                'brand_id' => Brand::all()->random()->id,
                'product_seri_id' => ProductSeri::all()->random()->id,
                'thumbnail' => $faker->numberBetween('1', '30'),
            ]);
        }

        foreach (range(1, 800) as $index) {
            ProductOption::create([
                'name' => $faker->name,
                'price' => $faker->numberBetween(1000000, 200000000),
                'current_price' => $faker->numberBetween(1000000, 200000000),
                'product_id' => Product::all()->random()->id,
                'amount' => $faker->numberBetween(1, 1000),
                'selled' => $faker->numberBetween(1, 1000),
                'status' => $faker->numberBetween(0, 1),
            ]);
        }

        foreach (range(1, 2000) as $index) {
            ProductAttributeValue::create([
                'product_option_id' => ProductOption::all()->random()->id,
                'attribute_value_id' => AttributeValue::all()->random()->id
            ]);
        }

        foreach (range(1, 300) as $index) {
            Cart::create([
                'user_id' => User::all()->random()->id,
                'product_option_id' => ProductOption::all()->random()->id,
                'quantity' => $faker->numberBetween(1, 99),
            ]);
        }

        for ($index = 1; $index <= 100; $index++) {
            $lastOrder = Order::orderBy('id', 'desc')->first();
            $lastOrderId = $lastOrder ? $lastOrder->id : 0;
            $orderId = str_pad($lastOrderId + 1, 6, '0', STR_PAD_LEFT);
            $orderCode = 'DH' . $orderId;

            Order::create([
                'code' => $orderCode,
                'user_id' => User::all()->random()->id,
                'total_price' => $faker->numberBetween(1000000, 20000000000),
                'note' => $faker->text,
                'user_name' => $faker->name,
                'phone' => $faker->phoneNumber,
                'address' => $faker->address,
                'status' => $faker->numberBetween(0, 2),
                'message' => $faker->text,
                'shipping_fee' => $faker->numberBetween(10000, 20000),
                'shipping_type' => $faker->numberBetween(0, 2),
                'payment_method' => $faker->numberBetween(0, 2),
            ]);
        }

        foreach (range(1, 300) as $index) {
            OrderDetail::create([
                'order_id' => Order::all()->random()->id,
                'product_option_id' => ProductOption::all()->random()->id,
                'quantity' => $faker->numberBetween(1, 99),
                'price' => $faker->numberBetween(1000000, 200000000),
            ]);
        }
    }
}
