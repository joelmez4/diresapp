<?php

namespace App\Http\Controllers\Indicadores;

use Illuminate\Http\Request;
use DB;
use PDF;

use App\Http\Controllers\Controller;


class AnemiaController extends Controller
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

      $tab = 'anemia';

      return view('indicadores.anemia_seguimiento',['tab' => $tab]);

    }


    public function getIndicador()
    {
      $data = json_decode($_GET['data'], true);

      $results = DB::select('exec dbo.SP_ANEMIA_SEGUIMIENTO ?, ?, ?, ?, ?, ?, ?, ?, ?, ?', [$data['picked'], $data['red'], $data['mred'], $data['establecRed'], $data['provincia'], $data['distrito'], $data['establecProv'], $data['establecimiento'], $data['startDate'], $data['endDate']]);

      $anemia = array(
        "picked" => $data['picked'],
        "red" => $data['red'],
        "mred" => $data['mred'],
        "establecRed" => $data['establecRed'],
        "provincia" => $data['provincia'],
        "distrito" => $data['distrito'],
        "establecProv" => $data['establecProv'],
        "establecimiento" => (int)$data['establecimiento'],
        "startDate" => $data['startDate'],
        "endDate" => $data['endDate'],

        "lev" => 0,
        "mod" => 0,
        "sev" => 0,
        "null" => 0
      );

      foreach ($results as $result) {
        if ($result->N_Controles === 'LEV') {
          $anemia['lev'] += 1;
        } elseif ($result->N_Controles === 'MOD') {
          $anemia['mod'] += 1;
        } elseif ($result->N_Controles === 'SEV') {
          $anemia['sev'] += 1;
        } elseif ($result->N_Controles === NULL) {
          $anemia['null'] += 1;
        }
      }

      return $anemia;
    }

    public function reporte()
    {
      return view('reportes/cancer');
    }

}
