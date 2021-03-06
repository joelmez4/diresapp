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
      if ($name == 'gestantes') {
        return view('anemia.gestante',['name' => $name]);
      }

      if ($name == 'seguimiento') {
        return view('indicadores.anemia_seguimiento',['name' => $name]);
      } elseif ($name == 'deficiencia') {
        return view('indicadores.anemia_deficiencia',['name' => $name]);
      }

    }


    public function getIndicador($name)
    {
      $data = json_decode($_GET['data'], true);

      if ($name == 'datedb') {
        $result = DB::select('select top 1 fecha from anemia_nino order by fecha desc');
        return $result;
      }

      if ($name == 'datedb2') {
        $result = DB::select('select top 1 fecha from anemia_gestante order by fecha desc');
        return $result;
      }

      if ($name == 'gestantes') {
        $results = DB::select('exec dbo.SP_ANEMIA_GESTANTE ?, ?, ?, ?, ?, ?, ?, ?, ?, ?', [$data['picked'], $data['red'], $data['mred'], $data['establecRed'], $data['provincia'], $data['distrito'], $data['establecProv'], $data['establecimiento'], $data['startDate'], $data['endDate']]);

        $red = DB::select('select desc_red from red where cod_red = ?', [$data['red']]);
        $mred = DB::select('select desc_micro from mred where cod_mic = ? and cod_red = ?', [$data['mred'], $data['red']]);
        $establec_red = DB::select('select desc_estab from establec where cod_2000 = ? and cod_mic = ? and cod_red = ?', [$data['establecRed'], $data['mred'], $data['red']]);

        $prov = DB::select('select desc_prov from provincia where cod_prov = ?', [$data['provincia']]);
        $dist = DB::select('select desc_dist from distrito where cod_dist = ? and cod_prov = ?', [$data['distrito'], $data['provincia']]);
        $establec_prov = DB::select('select desc_estab from establec where cod_2000 = ? and cod_dist = ? and cod_prov = ?', [$data['establecProv'], $data['distrito'], $data['provincia']]);

        $anemia = array(
          "picked" => $data['picked'],
          "red_cod" => $data['red'],
          "mred_cod" => $data['mred'],
          "establec_red_cod" => $data['establecRed'],
          "provincia_cod" => $data['provincia'],
          "distrito_cod" => $data['distrito'],
          "establec_prov_cod" => $data['establecProv'],
          "establecimiento_cod" => (int)$data['establecimiento'],
          "start_date" => $data['startDate'],
          "end_date" => $data['endDate'],

          "red_desc" => isset($red[0]) ? $red[0]->desc_red : null,
          "mred_desc" => isset($mred[0]) ? $mred[0]->desc_micro : null,
          "establec_red_desc" => isset($establec_red[0]) ? $establec_red[0]->desc_estab : null,
          "prov_desc" => isset($prov[0]) ? $prov[0]->desc_prov : null,
          "dist_desc" => isset($dist[0]) ? $dist[0]->desc_dist : null,
          "establec_prov_desc" => isset($establec_prov[0]) ? $establec_prov[0]->desc_estab : null,

          "sum_leve" => 0,
          "sum_moderada" => 0,
          "sum_severa" => 0,
          "sum_normal" => 0,

          "data_leve" => array(),
          "data_moderada" => array(),
          "data_severa" => array(),
          "data_normal" => array(),

          "total_tamizados" => 0,
          "total_anemia" => 0,
          "prevalencia" => 0,
          "prevalencia_color" => null
        );

        //$anemia['red_desc'] = $results[0]->RED;

        foreach ($results as $result) {
          if ($result->Dx_Anemia === 'Anemia Leve') {
            $anemia['sum_leve'] += 1;
            array_push($anemia['data_leve'], $result->DNI);
          } elseif ($result->Dx_Anemia === 'Anemia Moderada') {
            $anemia['sum_moderada'] += 1;
            array_push($anemia['data_moderada'], $result->DNI);
          } elseif ($result->Dx_Anemia === 'Anemia Severa') {
            $anemia['sum_severa'] += 1;
            array_push($anemia['data_severa'], $result->DNI);
          } elseif ($result->Dx_Anemia === 'Normal') {
            $anemia['sum_normal'] += 1;
            array_push($anemia['data_normal'], $result->DNI);
          }
        }

        $anemia['total_tamizados'] = count($results);
        $anemia['total_anemia'] = $anemia['sum_leve'] + $anemia['sum_moderada'] + $anemia['sum_severa'];
        $anemia['prevalencia'] = $anemia['total_tamizados'] != 0  ? round( ($anemia['total_anemia'] / $anemia['total_tamizados'])*100, 1) : 0;

        //color prevalencia
        if ($anemia['prevalencia'] <= 4.9) {
  				$anemia['prevalencia_color'] = 'green';
  			} else if ($anemia['prevalencia'] >= 5.0 && $anemia['prevalencia'] <= 19.9) {
  				$anemia['prevalencia_color'] = 'yellow';
  			} else if ($anemia['prevalencia'] >= 20.0 && $anemia['prevalencia'] <= 39.9) {
  				$anemia['prevalencia_color'] = '#FF6600';
  			} else if ($anemia['prevalencia'] >= 40) {
  				$anemia['prevalencia_color'] = 'red';
  			}

        return $anemia;
      }

      if ($name == 'nino') {

        $results = DB::select('exec dbo.SP_ANEMIA_NINO ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?', [$data['picked'], $data['red'], $data['mred'], $data['establecRed'], $data['provincia'], $data['distrito'], $data['establecProv'], $data['establecimiento'], $data['edadNino'], $data['startDate'], $data['endDate']]);

        $red = DB::select('select desc_red from red where cod_red = ?', [$data['red']]);
        $mred = DB::select('select desc_micro from mred where cod_mic = ? and cod_red = ?', [$data['mred'], $data['red']]);
        $establec_red = DB::select('select desc_estab from establec where cod_2000 = ? and cod_mic = ? and cod_red = ?', [$data['establecRed'], $data['mred'], $data['red']]);

        $prov = DB::select('select desc_prov from provincia where cod_prov = ?', [$data['provincia']]);
        $dist = DB::select('select desc_dist from distrito where cod_dist = ? and cod_prov = ?', [$data['distrito'], $data['provincia']]);
        $establec_prov = DB::select('select desc_estab from establec where cod_2000 = ? and cod_dist = ? and cod_prov = ?', [$data['establecProv'], $data['distrito'], $data['provincia']]);

        $anemia = array(
          "picked" => $data['picked'],
          "red_cod" => $data['red'],
          "mred_cod" => $data['mred'],
          "establec_red_cod" => $data['establecRed'],
          "provincia_cod" => $data['provincia'],
          "distrito_cod" => $data['distrito'],
          "establec_prov_cod" => $data['establecProv'],
          "establecimiento_cod" => (int)$data['establecimiento'],
          "edad_nino" => $data['edadNino'],
          "start_date" => $data['startDate'],
          "end_date" => $data['endDate'],

          "red_desc" => isset($red[0]) ? $red[0]->desc_red : null,
          "mred_desc" => isset($mred[0]) ? $mred[0]->desc_micro : null,
          "establec_red_desc" => isset($establec_red[0]) ? $establec_red[0]->desc_estab : null,
          "prov_desc" => isset($prov[0]) ? $prov[0]->desc_prov : null,
          "dist_desc" => isset($dist[0]) ? $dist[0]->desc_dist : null,
          "establec_prov_desc" => isset($establec_prov[0]) ? $establec_prov[0]->desc_estab : null,

          "sum_anemia" => 0,
          "sum_leve" => 0,
          "sum_moderada" => 0,
          "sum_severa" => 0,
          "sum_normal" => 0,

          "data_anemia" => array(),
          "data_leve" => array(),
          "data_moderada" => array(),
          "data_severa" => array(),
          "data_normal" => array(),

          "total_tamizados" => 0,
          "total_anemia" => 0,
          "prevalencia" => 0,
          "prevalencia_color" => null
        );

        //$anemia['red_desc'] = $results[0]->RED;

        foreach ($results as $result) {
          if ($result->Dx_Anemia === 'Anemia') {
            $anemia['sum_anemia'] += 1;
            array_push($anemia['data_anemia'], $result->DNI);
          } elseif ($result->Dx_Anemia === 'Anemia Leve') {
            $anemia['sum_leve'] += 1;
            array_push($anemia['data_leve'], $result->DNI);
          } elseif ($result->Dx_Anemia === 'Anemia Moderada') {
            $anemia['sum_moderada'] += 1;
            array_push($anemia['data_moderada'], $result->DNI);
          } elseif ($result->Dx_Anemia === 'Anemia Severa') {
            $anemia['sum_severa'] += 1;
            array_push($anemia['data_severa'], $result->DNI);
          } elseif ($result->Dx_Anemia === 'Normal') {
            $anemia['sum_normal'] += 1;
            array_push($anemia['data_normal'], $result->DNI);
          }
        }

        $anemia['total_tamizados'] = count($results);
        $anemia['total_anemia'] = $anemia['sum_anemia'] + $anemia['sum_leve'] + $anemia['sum_moderada'] + $anemia['sum_severa'];
        $anemia['prevalencia'] = $anemia['total_tamizados'] != 0  ? round( ($anemia['total_anemia'] / $anemia['total_tamizados'])*100, 1) : 0;

        //color prevalencia
        if ($anemia['prevalencia'] <= 4.9) {
  				$anemia['prevalencia_color'] = 'green';
  			} else if ($anemia['prevalencia'] >= 5.0 && $anemia['prevalencia'] <= 19.9) {
  				$anemia['prevalencia_color'] = 'yellow';
  			} else if ($anemia['prevalencia'] >= 20.0 && $anemia['prevalencia'] <= 39.9) {
  				$anemia['prevalencia_color'] = '#FF6600';
  			} else if ($anemia['prevalencia'] >= 40) {
  				$anemia['prevalencia_color'] = 'red';
  			}

        return $anemia;

      } elseif ($name == 'seguimiento') {

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
