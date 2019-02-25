<?php

namespace App\Http\Controllers\Indicadores;

use Illuminate\Http\Request;
use DB;
use PDF;

use App\Http\Controllers\Controller;


class DesnutricionCronicaController extends Controller
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
      if ($name == 'ninos') {
        return view('desnutricion-cronica.nino',['name' => $name]);
      }

      if ($name == 'gestantes') {
        return view('desnutricion-cronica.gestante',['name' => $name]);
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

      if ($name == 'ninos') {

        $results = DB::select('exec dbo.SP_DC_NINO ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?', [$data['picked'], $data['red'], $data['mred'], $data['establecRed'], $data['provincia'], $data['distrito'], $data['establecProv'], $data['establecimiento'], $data['edadNino'], $data['startDate'], $data['endDate']]);

        $red = DB::select('select desc_red from red where cod_red = ?', [$data['red']]);
        $mred = DB::select('select desc_micro from mred where cod_mic = ?', [$data['mred']]);
        $establec_red = DB::select('select desc_estab from establec where cod_2000 = ?', [$data['establecRed']]);

        $prov = DB::select('select desc_prov from provincia where cod_prov = ?', [$data['provincia']]);
        $dist = DB::select('select desc_dist from distrito where cod_dist = ?', [$data['distrito']]);
        $establec_prov = DB::select('select desc_estab from establec where cod_2000 = ?', [$data['establecProv']]);

        $dcronica = array(
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

          "sum_dcronico" => 0,
          "sum_excluido" => 0,
          "sum_normal" => 0,

          "data_dcronico" => array(),
          "data_excluido" => array(),
          "data_normal" => array(),

          "total_general" => 0,
          "dc" => 0,
          "dc_color" => null
        );

        //$dcronica['red_desc'] = $results[0]->RED;

        foreach ($results as $result) {
          if ($result->Dx_T_E === 'D.Cronico') {
            $dcronica['sum_dcronico'] += 1;
            array_push($dcronica['data_dcronico'], $result->DNI);
          } elseif ($result->Dx_T_E === 'Excluido') {
            $dcronica['sum_excluido'] += 1;
            array_push($dcronica['data_excluido'], $result->DNI);
          } elseif ($result->Dx_T_E === 'Normal') {
            $dcronica['sum_normal'] += 1;
            array_push($dcronica['data_normal'], $result->DNI);
          }
        }

        //$dcronica['total_tamizados'] = count($results);
        $dcronica['total_general'] = $dcronica['sum_dcronico'] + $dcronica['sum_excluido'] + $dcronica['sum_normal'];
        $dcronica['dc'] = $dcronica['total_general'] != 0  ? round( ($dcronica['sum_dcronico'] / $dcronica['total_general'])*100, 1) : 0;

        //color prevalencia
        if ($dcronica['dc'] < 20.0) {
          $dcronica['dc_color'] = 'green';
        } else if ($dcronica['dc'] >= 20.0 && $dcronica['dc'] <= 29.9) {
          $dcronica['dc_color'] = 'yellow';
        } else if ($dcronica['dc'] >= 30.0 && $dcronica['dc'] <= 39.9) {
          $dcronica['dc_color'] = '#FF6600';
        } else if ($dcronica['dc'] >= 40) {
          $dcronica['dc_color'] = 'red';
        }

        return $dcronica;

      }

      if ($name == 'gestantes') {
        $results = DB::select('exec dbo.SP_ANEMIA_GESTANTE ?, ?, ?, ?, ?, ?, ?, ?, ?, ?', [$data['picked'], $data['red'], $data['mred'], $data['establecRed'], $data['provincia'], $data['distrito'], $data['establecProv'], $data['establecimiento'], $data['startDate'], $data['endDate']]);

        $red = DB::select('select desc_red from red where cod_red = ?', [$data['red']]);
        $mred = DB::select('select desc_micro from mred where cod_mic = ?', [$data['mred']]);
        $establec_red = DB::select('select desc_estab from establec where cod_2000 = ?', [$data['establecRed']]);

        $prov = DB::select('select desc_prov from provincia where cod_prov = ?', [$data['provincia']]);
        $dist = DB::select('select desc_dist from distrito where cod_dist = ?', [$data['distrito']]);
        $establec_prov = DB::select('select desc_estab from establec where cod_2000 = ?', [$data['establecProv']]);

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

    }

    public function reporte()
    {
      return view('reportes/cancer');
    }

}
