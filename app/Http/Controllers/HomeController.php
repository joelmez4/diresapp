<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use PDF;
class HomeController extends Controller
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

    public function getDistrito()
    {
      $cod_prov = $_GET['cod_prov'];
      $distritos = DB::select('select * from distrito where cod_prov = ?',[$cod_prov]);

      return $distritos;
    }

    public function atencionRecienNacido()
    {
      // $products = DB::select('exec dbo.new_saludNino ?,?',['2018-01-01','2018-01-01']);
      $provincias = DB::select('select provincia.cod_dpto, provincia.cod_prov, provincia.desc_prov from provincia');

      // $distritos = DB::select('select distrito.cod_prov, distrito.cod_dpto from distrito');

      // echo "<pre>";
      // var_dump($provincias[0]->desc_prov);
      // echo "</pre>";

      return view('atencionRecienNacido')->with('provincias', $provincias);
    }

    public function exportarpdf()
    {
      $data = ["hi", "there"];
      $pdf = PDF::loadView('exportarRN', $data);
      return $pdf->download('exportarRN.pdf');
    }

    public function getRecienNacido()
    {
          // Only process POST reqeusts.
          if ($_SERVER["REQUEST_METHOD"] == "GET") {
              // Get the form fields and remove whitespace.
              $start_date = strip_tags(trim($_GET["startDate"]));
              $end_date = strip_tags(trim($_GET["endDate"]));

              $txtProvincia = strip_tags(trim($_GET["txtProvincia"]));
              $txtDistrito = strip_tags(trim($_GET["txtDistrito"]));

              $result = DB::select('exec dbo.new_saludNino ?,?,?,?',[$txtProvincia, $txtDistrito, $start_date, $end_date]);
              // $this->exportarpdf($result);
              return $result;
          } else {
              // Not a POST request, set a 403 (forbidden) response code.
              http_response_code(403);
              echo "There was a problem with your submission, please try again.";
          }
    }


}
