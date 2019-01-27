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

// Route::get('/', function () {
//     return view('index');
// });

Auth::routes();
Route::get('/changepassword','Auth\ChangePasswordController@showChangePasswordForm');
Route::post('/changepassword','Auth\ChangePasswordController@changePassword')->name('changePassword');

Route::get('/', 'HomeController@index');

Route::get('/redes', 'HomeController@getRedes');
Route::get('/provincias', 'HomeController@getProvincias');
Route::get('/establecimientos', 'HomeController@getEstablecimientos');
Route::get('/getDistrito', 'HomeController@getDistrito');
Route::get('/getMicroRed', 'HomeController@getMicroRed');
Route::get('/getEstablecimiento', 'HomeController@getEstablecimiento');

/*

  INDICADORES (KPI) DIRESA 2019

*/

// Indicador: Atención Integral de Salud del Niño
Route::get('/atencion-integral-salud-nino', 'AtencionIntegralSaludNino\AtencionRecienNacido@index');
Route::get('/getAtencionRecienNacido', 'AtencionIntegralSaludNino\AtencionRecienNacido@getAtencionRecienNacido');
Route::get('/atencion-integral-salud-nino/reporte', 'AtencionIntegralSaludNino\AtencionRecienNacido@reporte');

Route::get('/atencionRecienNacido/exportarpdf', 'AtencionIntegralSaludNino\AtencionRecienNacido@exportarpdf');

// Indicador: Administración de Profilaxis Antiparasitaria
Route::get('indicadores/admin-profix-antiparasitaria', 'Indicadores\AdminProfilaxisAntiparasitariaController@index');
Route::get('indicadores/admin-profix-antiparasitaria/get', 'Indicadores\AdminProfilaxisAntiparasitariaController@getIndicador');

// Indicador: Morbilidad por Consulta Externa
Route::get('morbilidad', 'Indicadores\MorbilidadController@index');
Route::get('morbilidad/get', 'Indicadores\MorbilidadController@getIndicador');



// Indicador: Permanencia Personal
Route::get('indicadores/permanencia-personal', 'Indicadores\AdminProfilaxisAntiparasitariaController@personal');
