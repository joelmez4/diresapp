<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/atencion', 'HomeController@atencionRecienNacido');
Route::get('/atencion/exportarpdf', 'HomeController@exportarpdf');

Route::get('/getDistrito', 'HomeController@getDistrito');

Route::get('/getRecienNacido', 'HomeController@getRecienNacido');
