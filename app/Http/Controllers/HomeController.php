<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use PDF;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('index');
    }

    public function getRedes()
    {
      $redes = DB::select('select cod_red, desc_red from red');
      return $redes;
    }

    public function getProvincias()
    {
      $provincias = DB::select('select provincia.cod_dpto, provincia.cod_prov, provincia.desc_prov from provincia');
      return $provincias;
    }

    public function getDistrito()
    {
      $cod_prov = $_GET['cod_prov'];
      $distritos = DB::select('select * from distrito where cod_prov = ?',[$cod_prov]);

      return $distritos;
    }

    public function getMicroRed()
    {
      $cod_red = $_GET['cod_red'];
      $mred = DB::select('select * from mred where cod_red = ?',[$cod_red]);

      return $mred;
    }

    public function getEstablecimiento()
    {

      $cod_red = $_GET['cod_red'];
      $cod_mic = $_GET['cod_mic'];

      $mred = DB::select('select desc_estab, cod_2000 from establec where cod_red = ? AND cod_mic = ?',[$cod_red, $cod_mic]);

      return $mred;

    }

    public function getEstablecimiento2()
    {

      $cod_prov = $_GET['cod_prov'];
      $cod_dist = $_GET['cod_dist'];

      $mred = DB::select('select desc_estab, cod_2000 from establec where cod_prov = ? AND cod_dist = ?',[$cod_prov, $cod_dist]);

      return $mred;

    }

    public function getEstablecimientos()
    {

      $establecimientos = DB::select('select desc_estab, cod_2000 from establec');

      return $establecimientos;

    }

}
