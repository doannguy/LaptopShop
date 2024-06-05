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

Route::
        namespace('App\Http\Controllers\Admin')->middleware('auth')->group(function () {
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
        });


Route::get('/run-seeder-role-command', function () {
    \Illuminate\Support\Facades\Artisan::call('db:seed', [
        '--class' => 'RolesTableSeeder',
    ]);
    echo "Done";
});
include "auth.php";
