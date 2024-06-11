<?php

use App\Http\Controllers\Api\AuthController;
use Illuminate\Http\Request;
use Illuminate\Routing\RouteUri;
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
});

Route::group(['namespace' => 'App\Http\Controllers\Api', 'middleware' => ['auth:sanctum', 'user.status']], function () {
    Route::post('logout', 'AuthController@logout');
    Route::post('change-password', 'AuthController@changePassword');

    Route::get('user/info', 'UserController@get');
    Route::post('user/info', 'UserController@update');
});
