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

    public function personal()
    {
        return view('indicadores.permanencia_personal');
    }

}
