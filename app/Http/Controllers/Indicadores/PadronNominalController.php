<?php

namespace App\Http\Controllers\Indicadores;

use Illuminate\Http\Request;
use DB;
use PDF;

use App\Http\Controllers\Controller;


class PadronNominalController extends Controller
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
    public function index($name)
    {
      if ($name == 'seguimiento') {
        return view('indicadores.anemia_seguimiento',['name' => $name]);
      } elseif ($name == 'deficiencia') {
        return view('indicadores.anemia_deficiencia',['name' => $name]);
      }

    }


    public function getIndicador($name)
    {
      $data = json_decode($_GET['data'], true);

      if ($name == 'countrows') {
        $result = DB::select('select count(*) as rows from padron_nominal');
        return $result;
      }

      if ($name == 'person') {
        $result = DB::select('select * from padron_nominal where dni = ? ', [$data]);
        return $result;
      }

    }

    public function reporte()
    {
      return view('reportes/cancer');
    }

}
