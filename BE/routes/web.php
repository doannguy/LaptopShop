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

Route::get('/', function () {
    return view('welcome');
})->name('dashboard')->middleware('auth');

Route::namespace('App\Http\Controllers\Admin')->middleware('auth')->group(function () {
    Route::prefix('category')->group(function () {
        Route::get('/', 'CategoryController@index')->name('category.index');
        Route::post('datatable', 'CategoryController@datatable')->name('category.datatable');
        Route::post('delete', 'CategoryController@delete')->name('category.delete');
        Route::post('store', 'CategoryController@store')->name('category.store');
        Route::post('update', 'CategoryController@update')->name('category.update');
    });

    Route::prefix('product-seri')->group(function () {
        Route::get('/', 'ProductSeriController@index')->name('product_seri.index');
        Route::post('datatable', 'ProductSeriController@datatable')->name('product_seri.datatable');
        Route::post('delete', 'ProductSeriController@delete')->name('product_seri.delete');
        Route::post('store', 'ProductSeriController@store')->name('product_seri.store');
        Route::post('update', 'ProductSeriController@update')->name('product_seri.update');
    });
    Route::prefix('brand')->group(function () {
        Route::get('/', 'BrandController@index')->name('brand.index');
        Route::post('datatable', 'BrandController@datatable')->name('brand.datatable');
        Route::post('delete', 'BrandController@delete')->name('brand.delete');
        Route::post('store', 'BrandController@store')->name('brand.store');
        Route::post('update', 'BrandController@update')->name('brand.update');
    });
});

include "auth.php";
