<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::group(['namespace' => 'App\Http\Controllers\Api'], function () {
    Route::post('register', 'AuthController@register');
    Route::post('login', 'AuthController@login');

    Route::get('category', 'CategoryController@getCategories');
    Route::get('brand', 'BrandController@getBrands');
    Route::get('product-list', 'ProductController@getProducts');
    Route::get('product-detail/{id}', 'ProductController@getProductDetail');

    Route::post('send-reset-link', 'AuthController@sendResetLinkEmail');
    Route::post('reset-password', 'AuthController@resetPassword');

    Route::get('reviews', 'ProductController@getReviews');
    Route::get('review/{id}', 'ProductController@getReviewByProduct');
});

Route::group(['namespace' => 'App\Http\Controllers\Api', 'middleware' => ['auth:sanctum', 'user.status']], function () {
    Route::post('logout', 'AuthController@logout');
    Route::post('change-password', 'AuthController@changePassword');

    Route::get('user/info', 'UserController@get');
    Route::post('user/info', 'UserController@update');

    Route::post('product-detail/review', 'ProductController@storeProductReview');
    // Route::post('product-detail/review/delete', 'ProductController@deleteReview');

    Route::get('cart', 'CartController@getMyCart');
    Route::post('cart/update', 'CartController@updateMyCart');

    Route::post('order/store', 'OrderController@store');
    Route::get('order', 'OrderController@getList');
    Route::get('order/detail/{id}', 'OrderController@getDetail');
    Route::post('order/update/{id}', 'OrderController@update');
    Route::get('order/delete/{id}', 'OrderController@delete');

});
