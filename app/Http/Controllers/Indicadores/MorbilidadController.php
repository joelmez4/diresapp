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

      $results = DB::select('exec dbo.SP_ADMIN_PROFILAXIS_ANTIPARASITARIA ?, ?, ?, ?, ?, ?, ?, ?',[$data['picked'], $data['red'], $data['mred'], $data['provincia'], $data['distrito'], (int)$data['establecimiento'], $data['startDate'], $data['endDate']]);

      $admin_pro_anti = array(
        "picked" => $data['picked'],
        "red" => $data['red'],
        "mred" => $data['mred'],
        "provincia" => $data['provincia'],
        "distrito" => $data['distrito'],
        "establecimiento" => (int)$data['establecimiento'],
        "startDate" => $data['startDate'],
        "endDate" => $data['endDate'],

        "admin_profilaxis_antiparasitaria_0_11a_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_0_11a_LAB2" => 0,

        "admin_profilaxis_antiparasitaria_1A_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_1A_LAB2" => 0,

        "admin_profilaxis_antiparasitaria_2A_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_2A_LAB2" => 0,

        "admin_profilaxis_antiparasitaria_3A_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_3A_LAB2" => 0,

        "admin_profilaxis_antiparasitaria_4A_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_4A_LAB2" => 0,

        "admin_profilaxis_antiparasitaria_5_11a_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_5_11a_LAB2" => 0,

        "admin_profilaxis_antiparasitaria_12_17a_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_12_17a_LAB2" => 0,

        "admin_profilaxis_antiparasitaria_18_29a_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_18_29a_LAB2" => 0,

        "admin_profilaxis_antiparasitaria_30_59a_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_30_59a_LAB2" => 0,

        "admin_profilaxis_antiparasitaria_60_a_mas_LAB1" => 0,
        "admin_profilaxis_antiparasitaria_60_a_mas_LAB2" => 0
      );

      foreach ($results as $result) {
        $admin_pro_anti["admin_profilaxis_antiparasitaria_0_11a_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_0_11a_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_0_11a_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_0_11a_LAB2;

        $admin_pro_anti["admin_profilaxis_antiparasitaria_1A_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_1A_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_1A_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_1A_LAB2;

        $admin_pro_anti["admin_profilaxis_antiparasitaria_2A_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_2A_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_2A_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_2A_LAB2;

        $admin_pro_anti["admin_profilaxis_antiparasitaria_3A_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_3A_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_3A_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_3A_LAB2;

        $admin_pro_anti["admin_profilaxis_antiparasitaria_4A_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_4A_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_4A_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_4A_LAB2;

        $admin_pro_anti["admin_profilaxis_antiparasitaria_5_11a_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_5_11a_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_5_11a_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_5_11a_LAB2;

        $admin_pro_anti["admin_profilaxis_antiparasitaria_12_17a_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_12_17a_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_12_17a_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_12_17a_LAB2;

        $admin_pro_anti["admin_profilaxis_antiparasitaria_18_29a_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_18_29a_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_18_29a_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_18_29a_LAB2;

        $admin_pro_anti["admin_profilaxis_antiparasitaria_30_59a_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_30_59a_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_30_59a_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_30_59a_LAB2;

        $admin_pro_anti["admin_profilaxis_antiparasitaria_60_a_mas_LAB1"] += (int)$result->admin_profilaxis_antiparasitaria_60_a_mas_LAB1;
        $admin_pro_anti["admin_profilaxis_antiparasitaria_60_a_mas_LAB2"] += (int)$result->admin_profilaxis_antiparasitaria_60_a_mas_LAB2;
      }

      return $admin_pro_anti;
    }

    public function personal()
    {
        return view('indicadores.permanencia_personal');
    }

}
