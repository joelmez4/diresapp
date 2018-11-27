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



Route::get('/AtencionIntegralSaludNino', 'AtencionIntegralSaludNino\AtencionRecienNacido@index');
Route::get('/getRecienNacido', 'AtencionIntegralSaludNino\AtencionRecienNacido@getRecienNacido');
Route::get('/atencionRecienNacido/exportarpdf', 'AtencionIntegralSaludNino\AtencionRecienNacido@exportarpdf');

Route::get('/redes', 'HomeController@getRedes');
Route::get('/provincias', 'HomeController@getProvincias');
Route::get('/getDistrito', 'HomeController@getDistrito');
Route::get('/getMicroRed', 'HomeController@getMicroRed');
