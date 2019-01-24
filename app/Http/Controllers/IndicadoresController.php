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
      /*
      $option = 'provincia';
      $group = '10';
      $month = '2019-01';

      $results = DB::select('exec dbo.SP_ADMIN_PROFILAXIS_ANTIPARASITARIA ?, ?, ?',[$option, $group, $month]);
      */

      $results = 'some';

      // foreach ($results as $result) {
      //   // echo "<pre>";
      //   // echo var_dump($result->desc_prov);
      //   // echo "</pre>";
      //
      //   if ($result->desc_prov == 'ABANCAY') {
      //     echo "- ".(int)$result->admin_profilaxis_antiparasitaria_1A_LAB1;
      //     $c += ;
      //   }
      //
      //   // echo "result: ".$c;
      // }
      //
      // // echo "<pre>";
      // // echo var_dump($data[0]->desc_prov);
      // // echo "<pre>";

      return view('indicadores.admin_profi_antiparasitaria',['results' => $results]);
    }


    public function getAntiparasitaria()
    {


      $data = json_decode($_GET['data'], true);

      $results = DB::select('exec dbo.SP_ADMIN_PROFILAXIS_ANTIPARASITARIA ?, ?, ?, ?, ?',[$data['query'], $data['establecimiento'], $data['group'], $data['startDate'], $data['endDate']]);

      $admin_pro_anti = array(
        "establecimiento" => $data['establecimiento'],
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
