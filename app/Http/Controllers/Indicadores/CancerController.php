<?php

namespace App\Http\Controllers\Indicadores;

use Illuminate\Http\Request;
use DB;
use PDF;

use App\Http\Controllers\Controller;


class CancerController extends Controller
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

      $tab = 'ocular';

      return view('indicadores.estrategia_cancer',['tab' => $tab]);

    }


    public function getIndicador()
    {
      $data = json_decode($_GET['data'], true);

      $results = DB::select('exec dbo.SP_CANCER ?, ?, ?, ?, ?, ?, ?, ?, ?, ?', [$data['picked'], $data['red'], $data['mred'], $data['establecRed'], $data['provincia'], $data['distrito'], $data['establecProv'], $data['establecimiento'], $data['startDate'], $data['endDate']]);

      // $morb = array(
      //   "picked" => $data['picked'],
      //   "red" => $data['red'],
      //   "mred" => $data['mred'],
      //   "provincia" => $data['provincia'],
      //   "distrito" => $data['distrito'],
      //   "establecimiento" => (int)$data['establecimiento'],
      //   "startDate" => $data['startDate'],
      //   "endDate" => $data['endDate'],
      //
      //   "morb_0_11a_nino" => 0,
      //   "morb_12_17a_adolescente" => 0,
      //   "morb_18_29a_joven" => 0,
      //   "morb_30_59a_adulto" => 0,
      //   "morb_60a_a_mas_adulto_mayor" => 0,
      //   "morb_materna" => 0
      // );
      //
      // foreach ($results as $result) {
      //   $morb["morb_0_11a_nino"] += (int)$result->morb_0_11a_nino;
      //   $morb["morb_12_17a_adolescente"] += (int)$result->morb_12_17a_adolescente;
      //   $morb["morb_18_29a_joven"] += (int)$result->morb_18_29a_joven;
      //   $morb["morb_30_59a_adulto"] += (int)$result->morb_30_59a_adulto;
      //   $morb["morb_60a_a_mas_adulto_mayor"] += (int)$result->morb_60a_a_mas_adulto_mayor;
      //   $morb["morb_materna"] += (int)$result->morb_materna;
      // }

      return $results;
    }

    public function reporte()
    {
      return view('reportes/cancer');
    }

}
