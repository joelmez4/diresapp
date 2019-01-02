<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use PDF;
class IndicadoresController extends Controller
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

    public function antiparasitaria()
    {
      $red = '10';
      $data = DB::select('exec dbo.SP_ADMIN_PROFILAXIS_ANTIPARASITARIA ?',[$red]);

      return view('indicadores.admin_profi_antiparasitaria',['data' => $data]);
    }

    public function personal()
    {
        return view('indicadores.permanencia_personal');
    }

}
