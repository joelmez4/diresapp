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



Route::get('/AtencionRecienNacido', 'AtencionRecienNacido@index');
Route::get('/getRecienNacido', 'AtencionRecienNacido@getRecienNacido');
Route::get('/atencionRecienNacido/exportarpdf', 'AtencionRecienNacido@exportarpdf');

Route::get('/getDistrito', 'AtencionRecienNacido@getDistrito');
Route::get('/getMicroRed', 'AtencionRecienNacido@getMicroRed');
