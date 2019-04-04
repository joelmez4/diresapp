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
        "data_morb_12_17a_adolescente" => [],
        "data_morb_18_29a_joven" => [],
        "data_morb_30_59a_adulto" => [],
        "data_morb_60a_a_mas_adulto_mayor" => [],
        "data_morb_materna" => []
      );

      $nino = [];
      $adolescente = [];
      $joven = [];
      $adulto = [];
      $adulto_mayor = [];
      $materna = [];
      // $count_same = array("name" => null, "count" => null);

      foreach ($results as $result) {
        $morb["morb_0_11a_nino"] += (int)$result->morb_0_11a_nino;

        if ( (int)$result->morb_0_11a_nino > 0) {
          //array_push($morb["data_morb_0_11a_nino"], $result);
          array_push($nino,$result->COD_GRU);
          // array_push($morb["data_morb_0_11a_nino"], array_unique(array_values($result->COD_GRU)));
        }

        if ( (int)$result->morb_12_17a_adolescente > 0) {
          array_push($adolescente,$result->COD_GRU);
        }

        if ( (int)$result->morb_18_29a_joven > 0) {
          array_push($joven,$result->COD_GRU);
        }

        if ( (int)$result->morb_30_59a_adulto > 0) {
          array_push($adulto,$result->COD_GRU);
        }

        if ( (int)$result->morb_60a_a_mas_adulto_mayor > 0) {
          array_push($adulto_mayor,$result->COD_GRU);
        }

        if ( (int)$result->morb_materna > 0) {
          array_push($materna,$result->COD_GRU);
        }

        $morb["morb_12_17a_adolescente"] += (int)$result->morb_12_17a_adolescente;
        $morb["morb_18_29a_joven"] += (int)$result->morb_18_29a_joven;
        $morb["morb_30_59a_adulto"] += (int)$result->morb_30_59a_adulto;
        $morb["morb_60a_a_mas_adulto_mayor"] += (int)$result->morb_60a_a_mas_adulto_mayor;
        $morb["morb_materna"] += (int)$result->morb_materna;

      }

      $nino2 = array_unique($nino);
      $adolescente2 = array_unique($adolescente);
      $joven2 = array_unique($joven);
      $adulto2 = array_unique($adulto);
      $adulto_mayor2 = array_unique($adulto_mayor);
      $materna2 = array_unique($materna);

      sort($nino2);
      sort($adolescente2);
      sort($joven2);
      sort($adulto2);
      sort($adulto_mayor2);
      sort($materna2);

      for ($i=0; $i < count($nino2); $i++) {
        $count = 0;
        $count_morb = 0;
        foreach ($results as $result) {
          if ( (int)$result->morb_0_11a_nino > 0) {
            if ($nino2[$i] == $result->COD_GRU) {
              $count +=1;
              $count_morb += (int)$result->morb_0_11a_nino;
              $morb["data_morb_0_11a_nino"][$i]["count"] = $count;
              $morb["data_morb_0_11a_nino"][$i]["morb_0_11a_nino"] = $count_morb;
              $morb["data_morb_0_11a_nino"][$i]["cod_gru"] = $result->COD_GRU;
              $morb["data_morb_0_11a_nino"][$i]["desc_gru"] = $result->DESC_GRU;
            }
          }
        }
      }

      for ($i=0; $i < count($adolescente2); $i++) {
        $count = 0;
        $count_morb = 0;
        foreach ($results as $result) {
          if ( (int)$result->morb_12_17a_adolescente > 0) {
            if ($adolescente2[$i] == $result->COD_GRU) {
              $count +=1;
              $count_morb += (int)$result->morb_12_17a_adolescente;
              $morb["data_morb_12_17a_adolescente"][$i]["count"] = $count;
              $morb["data_morb_12_17a_adolescente"][$i]["morb_12_17a_adolescente"] = $count_morb;
              $morb["data_morb_12_17a_adolescente"][$i]["cod_gru"] = $result->COD_GRU;
              $morb["data_morb_12_17a_adolescente"][$i]["desc_gru"] = $result->DESC_GRU;
            }
          }
        }
      }

      for ($i=0; $i < count($joven2); $i++) {
        $count = 0;
        $count_morb = 0;
        foreach ($results as $result) {
          if ( (int)$result->morb_18_29a_joven > 0) {
            if ($joven2[$i] == $result->COD_GRU) {
              $count +=1;
              $count_morb += (int)$result->morb_18_29a_joven;
              $morb["data_morb_18_29a_joven"][$i]["count"] = $count;
              $morb["data_morb_18_29a_joven"][$i]["morb_18_29a_joven"] = $count_morb;
              $morb["data_morb_18_29a_joven"][$i]["cod_gru"] = $result->COD_GRU;
              $morb["data_morb_18_29a_joven"][$i]["desc_gru"] = $result->DESC_GRU;
            }
          }
        }
      }

      for ($i=0; $i < count($adulto2); $i++) {
        $count = 0;
        $count_morb = 0;
        foreach ($results as $result) {
          if ( (int)$result->morb_30_59a_adulto > 0) {
            if ($adulto2[$i] == $result->COD_GRU) {
              $count +=1;
              $count_morb += (int)$result->morb_30_59a_adulto;
              $morb["data_morb_30_59a_adulto"][$i]["count"] = $count;
              $morb["data_morb_30_59a_adulto"][$i]["morb_30_59a_adulto"] = $count_morb;
              $morb["data_morb_30_59a_adulto"][$i]["cod_gru"] = $result->COD_GRU;
              $morb["data_morb_30_59a_adulto"][$i]["desc_gru"] = $result->DESC_GRU;
            }
          }
        }
      }

      for ($i=0; $i < count($adulto_mayor2); $i++) {
        $count = 0;
        $count_morb = 0;
        foreach ($results as $result) {
          if ( (int)$result->morb_60a_a_mas_adulto_mayor > 0) {
            if ($adulto_mayor2[$i] == $result->COD_GRU) {
              $count +=1;
              $count_morb += (int)$result->morb_60a_a_mas_adulto_mayor;
              $morb["data_morb_60a_a_mas_adulto_mayor"][$i]["count"] = $count;
              $morb["data_morb_60a_a_mas_adulto_mayor"][$i]["morb_60a_a_mas_adulto_mayor"] = $count_morb;
              $morb["data_morb_60a_a_mas_adulto_mayor"][$i]["cod_gru"] = $result->COD_GRU;
              $morb["data_morb_60a_a_mas_adulto_mayor"][$i]["desc_gru"] = $result->DESC_GRU;
            }
          }
        }
      }

      for ($i=0; $i < count($materna2); $i++) {
        $count = 0;
        $count_morb = 0;
        foreach ($results as $result) {
          if ( (int)$result->morb_materna > 0) {
            if ($materna2[$i] == $result->COD_GRU) {
              $count +=1;
              $count_morb += (int)$result->morb_materna;
              $morb["data_morb_materna"][$i]["count"] = $count;
              $morb["data_morb_materna"][$i]["morb_materna"] = $count_morb;
              $morb["data_morb_materna"][$i]["cod_gru"] = $result->COD_GRU;
              $morb["data_morb_materna"][$i]["desc_gru"] = $result->DESC_GRU;
            }
          }
        }
      }

      function build_sorter($key) {
          return function ($a, $b) use ($key) {
              return $b[$key] - $a[$key];
          };
      }

      usort($morb["data_morb_0_11a_nino"], build_sorter("morb_0_11a_nino"));
      usort($morb["data_morb_12_17a_adolescente"], build_sorter("morb_12_17a_adolescente"));
      usort($morb["data_morb_18_29a_joven"], build_sorter("morb_18_29a_joven"));
      usort($morb["data_morb_30_59a_adulto"], build_sorter("morb_30_59a_adulto"));
      usort($morb["data_morb_60a_a_mas_adulto_mayor"], build_sorter("morb_60a_a_mas_adulto_mayor"));
      usort($morb["data_morb_materna"], build_sorter("morb_materna"));

      // return array($morb, $nino2, $morb["data_morb_0_11a_nino"]);
      return $morb;
    }

    public function personal()
    {
        return view('indicadores.permanencia_personal');
    }

}
