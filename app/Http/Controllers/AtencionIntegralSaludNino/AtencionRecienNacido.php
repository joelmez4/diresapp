<?php

namespace App\Http\Controllers\AtencionIntegralSaludNino;

use Illuminate\Http\Request;
use DB;
use PDF;

use App\Http\Controllers\Controller;

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

     public function getAtencionRecienNacido()
     {
       $atencion_recien_nacido = array(
         "atencion_inmediata" => 0,
         "tamizaje_neonatal" => 0,
         "tamizaje_va" => 0,
         "contacto_piel_madre" => 0,
         "alojamiento_conjunto" => 0,
         "lactancia_materna_hora" => 0,

         "hipotiroidismo_congenito" => 0,
         "fenilcetonuria" => 0,
         "galactosemia" => 0,
         "hiperplasia_sup_cong" => 0,
         "fibrosis_quistica" => 0,
         "catarata_congenita" => 0,
         "hipoacusia" => 0,

         "sindrome_dristres_respiratorio" => 0,
         "sindromes_aspiracion_neonatal" => 0,
         "asfixia_neonatal" => 0,
         "sepsis_neonatal" => 0,
         "ictericia" => 0,
         "hipoglucemia" => 0,
         "sifilis_congenita" => 0,
         "vih_expuesto" => 0,
         "retinopatia_prematuridad" => 0
       );
           // Only process POST reqeusts.
           if ($_SERVER["REQUEST_METHOD"] == "GET") {
               // Get the form fields and remove whitespace.

               $red = isset($_GET["red"]) ? strip_tags(trim($_GET["red"])) : '';
               $mred =  isset($_GET["mred"]) ? strip_tags(trim($_GET["mred"])) : '';
               $provincia = isset($_GET["provincia"]) ? strip_tags(trim($_GET["provincia"])) : '';
               $distrito = isset($_GET["distrito"]) ? strip_tags(trim($_GET["distrito"])) : '';
               $start_date = strip_tags(trim($_GET["startDate"]));
               $end_date = strip_tags(trim($_GET["endDate"]));

               $results = DB::select('exec dbo.atencionInmediataNacido ?,?,?,?,?,?',[$red, $mred, $provincia, $distrito, $start_date, $end_date]);
               // $json = json_encode($result);
               // $this->exportarpdf($result);
               foreach ($results as $result) {
                 $atencion_recien_nacido["atencion_inmediata"] += (int)$result->atc_rn;
                 $atencion_recien_nacido["tamizaje_neonatal"] += (int)$result->tamizaje_neonatal;
                 $atencion_recien_nacido["tamizaje_va"] += (int)$result->tamizaje_visual_auditivo;
                 $atencion_recien_nacido["contacto_piel_madre"] += (int)$result->contacto_piel_madre;
                 $atencion_recien_nacido["alojamiento_conjunto"] += (int)$result->alojamiento_conjunto;
                 $atencion_recien_nacido["lactancia_materna_hora"] += (int)$result->lactancia_materna_una_hora;

                 $atencion_recien_nacido["hipotiroidismo_congenito"] += (int)$result->hipotiroidismo_congenito;
                 $atencion_recien_nacido["fenilcetonuria"] += (int)$result->fenilcetonuria;
                 $atencion_recien_nacido["galactosemia"] += (int)$result->galactosemia;
                 $atencion_recien_nacido["hiperplasia_sup_cong"] += (int)$result->hiperplasia_suprarrenal_congenita;
                 $atencion_recien_nacido["fibrosis_quistica"] += (int)$result->fibrosis_quistica;
                 $atencion_recien_nacido["catarata_congenita"] += (int)$result->catarata_congenita;
                 $atencion_recien_nacido["hipoacusia"] += (int)$result->hipoacusia;

                 $atencion_recien_nacido["sindrome_dristres_respiratorio"] += (int)$result->sindrome_dristres_respiratorio;
                 $atencion_recien_nacido["sindromes_aspiracion_neonatal"] += (int)$result->sindromes_aspiracion_neonatal;
                 $atencion_recien_nacido["asfixia_neonatal"] += (int)$result->asfixia_neonatal;
                 $atencion_recien_nacido["sepsis_neonatal"] += (int)$result->sepsis_neonatal;
                 $atencion_recien_nacido["ictericia"] += (int)$result->ictericia;
                 $atencion_recien_nacido["hipoglucemia"] += (int)$result->hipoglucemia;
                 $atencion_recien_nacido["sifilis_congenita"] += (int)$result->sifilis_congenita;
                 $atencion_recien_nacido["vih_expuesto"] += (int)$result->vih_expuesto;
                 $atencion_recien_nacido["retinopatia_prematuridad"] += (int)$result->retinopatia_prematuridad;

               }
               // echo "<pre>";
               // echo var_dump($atencion_recien_nacido);
               // echo "</pre>";
               return $atencion_recien_nacido;

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
