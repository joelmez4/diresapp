<?php

namespace App\Http\Controllers\Indicadores;

use Illuminate\Http\Request;
use DB;
use PDF;

use App\Http\Controllers\Controller;


class MorbilidadController extends Controller
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

      $tab = 'morbilidad';

      return view('indicadores.morbilidad',['tab' => $tab]);

    }


    public function getIndicador()
    {


      $data = json_decode($_GET['data'], true);

      $results = DB::select('exec dbo.SP_MORBILIDAD_CONSULTA_EXTERNA ?, ?, ?, ?, ?, ?, ?, ?',[$data['picked'], $data['red'], $data['mred'], $data['provincia'], $data['distrito'], (int)$data['establecimiento'], $data['startDate'], $data['endDate']]);
      //$grupos = DB::select('select COD_GRU, DESC_GRU from GRUPO');

      $morb = array(
        "picked" => $data['picked'],
        "red" => $data['red'],
        "mred" => $data['mred'],
        "provincia" => $data['provincia'],
        "distrito" => $data['distrito'],
        "establecimiento" => (int)$data['establecimiento'],
        "startDate" => $data['startDate'],
        "endDate" => $data['endDate'],

        "morb_0_11a_nino" => 0,
        "morb_12_17a_adolescente" => 0,
        "morb_18_29a_joven" => 0,
        "morb_30_59a_adulto" => 0,
        "morb_60a_a_mas_adulto_mayor" => 0,
        "morb_materna" => 0,
        "data_morb_0_11a_nino" => [],
        "data_unique" => []
      );

      $foo = [];
      // $count_same = array("name" => null, "count" => null);

      foreach ($results as $result) {
        $morb["morb_0_11a_nino"] += (int)$result->morb_0_11a_nino;

        if ( (int)$result->morb_0_11a_nino > 0) {
          array_push($morb["data_morb_0_11a_nino"], $result);
          array_push($foo,$result->COD_GRU);
          // array_push($morb["data_unique"], array_unique(array_values($result->COD_GRU)));
        }

        $morb["morb_12_17a_adolescente"] += (int)$result->morb_12_17a_adolescente;
        $morb["morb_18_29a_joven"] += (int)$result->morb_18_29a_joven;
        $morb["morb_30_59a_adulto"] += (int)$result->morb_30_59a_adulto;
        $morb["morb_60a_a_mas_adulto_mayor"] += (int)$result->morb_60a_a_mas_adulto_mayor;
        $morb["morb_materna"] += (int)$result->morb_materna;

      }
      $foo2 = array_unique($foo);

      sort($foo2);


      for ($i=0; $i < count($foo2); $i++) {
        $count = 0;
        $count_morb = 0;
        foreach ($results as $result) {
          if ( (int)$result->morb_0_11a_nino > 0) {
            if ($foo2[$i] == $result->COD_GRU) {
              $count +=1;
              $count_morb += (int)$result->morb_0_11a_nino;
              $morb["data_unique"][$i]["count"] = $count;
              $morb["data_unique"][$i]["morb_0_11a_nino"] = $count_morb;
              $morb["data_unique"][$i]["cod_gru"] = $result->COD_GRU;
              $morb["data_unique"][$i]["desc_gru"] = $result->DESC_GRU;
            }
          }
        }
      }

      function build_sorter($key) {
          return function ($a, $b) use ($key) {
              return $b[$key] - $a[$key];
          };
      }

      usort($morb["data_unique"], build_sorter("morb_0_11a_nino"));

      // return array($morb, $foo2, $morb["data_unique"]);
      return $morb;
    }

    public function personal()
    {
        return view('indicadores.permanencia_personal');
    }

}
