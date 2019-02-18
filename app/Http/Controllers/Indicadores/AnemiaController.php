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

      if ($name == 'seguimiento') {

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

      } elseif ($name == 'deficiencia') {

        $results = DB::select('exec dbo.SP_ANEMIA_DEFICIENCIA ?, ?, ?, ?, ?, ?, ?, ?, ?, ?', [$data['picked'], $data['red'], $data['mred'], $data['establecRed'], $data['provincia'], $data['distrito'], $data['establecProv'], $data['establecimiento'], $data['startDate'], $data['endDate']]);

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

          "anemia_por_deficiencia_de_hierro_menor_3a" => 0,
          "anemia_recuperado_menor_3a" => 0,
          "sin_anemia_menor_3A" => 0
        );

        foreach ($results as $result) {
          $anemia['anemia_por_deficiencia_de_hierro_menor_3a'] += (int)$result->anemia_por_deficiencia_de_hierro_menor_3a;
          $anemia['anemia_recuperado_menor_3a'] += (int)$result->anemia_recuperado_menor_3a;
          $anemia['sin_anemia_menor_3A'] += (int)$result->sin_anemia_menor_3A;
        }

        return $anemia;
      }
    }

    public function reporte()
    {
      return view('reportes/cancer');
    }

}
