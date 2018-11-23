<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use PDF;
class AtencionRecienNacido extends Controller
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

     public function getDistrito()
     {
       $cod_prov = $_GET['cod_prov'];
       $distritos = DB::select('select * from distrito where cod_prov = ?',[$cod_prov]);

       return $distritos;
     }

     public function getMicroRed()
     {
       $cod_red = $_GET['cod_red'];
       $mred = DB::select('select * from mred where cod_red = ?',[$cod_red]);

       return $mred;
     }

     public function index()
     {
       $red = DB::select('select * from red');

       // $products = DB::select('exec dbo.new_saludNino ?,?',['2018-01-01','2018-01-01']);
       $provincias = DB::select('select provincia.cod_dpto, provincia.cod_prov, provincia.desc_prov from provincia');

       // $distritos = DB::select('select distrito.cod_prov, distrito.cod_dpto from distrito');

       // echo "<pre>";
       // var_dump($provincias[0]->desc_prov);
       // echo "</pre>";

       return view('atencionRecienNacido')->with('provincias', $provincias)->with('red', $red);
     }

     public function getRecienNacido()
     {
           // Only process POST reqeusts.
           if ($_SERVER["REQUEST_METHOD"] == "GET") {
               // Get the form fields and remove whitespace.

               $red = isset($_GET["txtRed"]) ? strip_tags(trim($_GET["txtRed"])) : '';
               $microred =  isset($_GET["txtMred"]) ? strip_tags(trim($_GET["txtMred"])) : '';
               $txtProvincia = isset($_GET["txtProvincia"]) ? strip_tags(trim($_GET["txtProvincia"])) : '';
               $txtDistrito = isset($_GET["txtDistrito"]) ? strip_tags(trim($_GET["txtDistrito"])) : '';
               $start_date = strip_tags(trim($_GET["startDate"]));
               $end_date = strip_tags(trim($_GET["endDate"]));

               $result = DB::select('exec dbo.atencionInmediataNacido ?,?,?,?,?,?',[$red, $microred, $txtProvincia, $txtDistrito, $start_date, $end_date]);
               // $this->exportarpdf($result);
               return $result;
           } else {
               // Not a POST request, set a 403 (forbidden) response code.
               http_response_code(403);
               echo "There was a problem with your submission, please try again.";
           }
     }

     public function exportarpdf()
     {
       $data = ["hi", "there"];
       $pdf = PDF::loadView('exportarRN', $data);
       return $pdf->download('exportarRN.pdf');
     }

}
