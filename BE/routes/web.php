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
})->name('dashboard');

Route::namespace('App\Http\Controllers\Admin')->middleware('auth')->group(function () {
    Route::prefix('category')->group(function () {
        Route::get('/', 'CategoryController@index')->name('category.index');
        Route::post('datatable', 'CategoryController@datatable')->name('category.datatable');
        Route::post('delete', 'CategoryController@delete')->name('category.delete');
        Route::post('store', 'CategoryController@store')->name('category.store');
        Route::post('update', 'CategoryController@update')->name('category.update');
    });
});

include "auth.php";
