<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::namespace('App\Http\Controllers\Admin')->middleware(['auth', 'user.status'])->group(function () {
    Route::get('/', 'DashboardController@index')->name('dashboard');
    // Route::post('/product-datatable', 'DashboardController@productDatatable')->name('dashboard.product.datatable');

    Route::middleware('role:staff|admin')->group(function () {
        Route::prefix('category')->group(function () {
            Route::get('/', 'CategoryController@index')->name('category.index');
            Route::post('datatable', 'CategoryController@datatable')->name('category.datatable');
            Route::post('delete', 'CategoryController@delete')->name('category.delete');
            Route::post('store', 'CategoryController@store')->name('category.store');
            Route::post('update', 'CategoryController@update')->name('category.update');
        });

        Route::prefix('brand')->group(function () {
            Route::get('/', 'BrandController@index')->name('brand.index');
            Route::post('datatable', 'BrandController@datatable')->name('brand.datatable');
            Route::post('delete', 'BrandController@delete')->name('brand.delete');
            Route::post('store', 'BrandController@store')->name('brand.store');
            Route::post('update', 'BrandController@update')->name('brand.update');
        });

        Route::prefix('product-seri')->group(function () {
            Route::get('/', 'ProductSeriController@index')->name('product_seri.index');
            Route::post('datatable', 'ProductSeriController@datatable')->name('product_seri.datatable');
            Route::post('delete', 'ProductSeriController@delete')->name('product_seri.delete');
            Route::post('store', 'ProductSeriController@store')->name('product_seri.store');
            Route::post('update', 'ProductSeriController@update')->name('product_seri.update');
                    Route::post('get-by-category-id', 'ProductSeriController@getByCategoryId')->name('product_seri.get_by_category_id');
        });

        Route::prefix('attribute')->group(function () {
            Route::get('/', 'AttributeController@index')->name('attribute.index');
            Route::post('datatable', 'AttributeController@datatable')->name('attribute.datatable');
            Route::post('delete', 'AttributeController@delete')->name('attribute.delete');
            Route::post('store', 'AttributeController@store')->name('attribute.store');
            Route::post('update', 'AttributeController@update')->name('attribute.update');
        });

        Route::prefix('product')->group(function () {
            Route::get('/', 'ProductController@index')->name('product.index');
            Route::get('/create', 'ProductController@create')->name('product.create');
            Route::post('/store', 'ProductController@store')->name('product.store');
            Route::post('datatable', 'ProductController@datatable')->name('product.datatable');
            Route::post('delete', 'ProductController@delete')->name('product.delete');
        });
    });

    Route::prefix('user')->middleware('role:admin')->group(function () {
        Route::get('/', 'UserController@index')->name('user.index');
        Route::post('datatable', 'UserController@datatable')->name('user.datatable');
        Route::post('update', 'UserController@update')->name('user.update');
    });

    Route::prefix('order')->group(function () {
        Route::get('/', 'OrderController@index')->name('order.index');
        Route::post('datatable', 'OrderController@datatable')->name('order.datatable');
        Route::get('edit/{id}', 'OrderController@edit')->name('order.edit');
        Route::post('update', 'OrderController@update')->name('order.update');
    });
});


Route::get('/run-seeder-role-command', function () {
    \Illuminate\Support\Facades\Artisan::call('db:seed', [
        '--class' => 'RolesTableSeeder',
    ]);
    echo "Done";
});
// run storage link
Route::get('/storage-link', function () {
    \Illuminate\Support\Facades\Artisan::call('storage:link');
    echo "Done";
});
include "auth.php";
