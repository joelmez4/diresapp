@extends('layouts.app')

@section('custom-css')
<style>
#iseqchart	{
	border:1px solid #000;
	border-collapse:collapse;
	font-family:Arial, Sans-Serif;
	font-size:12px;
	text-align:right;
	}

#iseqchart th	{
	border:1px solid #333;
	padding:3px 6px;
	}

#iseqchart td	{
	border:1px solid #999;
	padding:3px 6px;
	}

.neg	{
	color:red;
}

.pos	{
	color:green;
}


@media only screen and (max-width: 768px) {
	#turnover, tr td:nth-child(9)		{ display:none; visibility:hidden; }
}

@media only screen and (max-width: 420px) {
	#changepercent, tr td:nth-child(4)	{ display:none; visibility:hidden; }
	#yhigh, tr td:nth-child(5)			{ display:none; visibility:hidden; }
	#ylow, tr td:nth-child(6)			{ display:none; visibility:hidden; }
	#turnover, tr td:nth-child(9)		{ display:none; visibility:hidden; }
}

@media only screen and (max-width: 320px) {
	#changepercent, tr td:nth-child(4)	{ display:none; visibility:hidden; }
	#yhigh, tr td:nth-child(5)			{ display:none; visibility:hidden; }
	#ylow, tr td:nth-child(6)			{ display:none; visibility:hidden; }
	#dhigh, tr td:nth-child(7)			{ display:none; visibility:hidden; }
	#dlow, tr td:nth-child(8)			{ display:none; visibility:hidden; }
	#turnover, tr td:nth-child(9)		{ display:none; visibility:hidden; }
}

</style>
@endsection

@section('content')
<section class="section">
  <div class="container">
		@include('form.main')
  	<br>
		<div class="columns">
		  <div class="column">
		    <p class="notification is-info">A) Atención Inmediata</p>
				<table class="table is-bordered" width="100%">
					<thead>
						<th>ACTIVIDADES</th>
						<th>Nº</th>
					</thead>
					<tbody>
						<tr>
							<td>Atención Inmediata</td>
							<td id="nino1"></td>
						</tr>
						<tr>
							<td>Tamizaje Neonatal (Enfermed. Metabólicas)</td>
							<td id="nino2"></td>
						</tr>
						<tr>
							<td>Tamizaje Visual y Auditivo</td>
							<td id="nino3"></td>
						</tr>
						<tr>
							<td>Contacto Piel a Piel con la madre</td>
							<td id="nino4"></td>
						</tr>
						<tr>
							<td>Alojamiento Conjunto</td>
							<td id="nino5"></td>
						</tr>
						<tr>
							<td>Lactancia Materna en la 1º Hora</td>
							<td id="nino6"></td>
						</tr>
					</tbody>
				</table>
		  </div>
			<div class="column">
		    <p class="notification is-info">B) Resultados del Tamizaje Neonatal</p>
				<table class="table is-bordered" width="100%">
					<thead>
						<th>DIAGNÓSTICOS</th>
						<th>Nº</th>
					</thead>
					<tbody>
						<tr>
							<td>Hipotiroidismo Congénito</td>
							<td id="nino7"></td>
						</tr>
						<tr>
							<td>Fenilcetonuria</td>
							<td id="nino8"></td>
						</tr>
						<tr>
							<td>Galactosemia</td>
							<td id="nino9"></td>
						</tr>
						<tr>
							<td>Hiperplasia Suprarrenal Congénita</td>
							<td id="nino10"></td>
						</tr>
						<tr>
							<td>Fibrosis Quística</td>
							<td id="nino11"></td>
						</tr>
						<tr>
							<td>Catarata Congénita</td>
							<td id="nino12"></td>
						</tr>
						<tr>
							<td>Hipoacusia (todas las clasificaciones)</td>
							<td id="nino13"></td>
						</tr>
					</tbody>
				</table>
		  </div>
			<div class="column">
		    <p class="notification is-info">C) Condición al Nacimiento</p>
				<table class="table is-bordered" width="100%">
					<thead>
						<tr>
							<th rowspan="2">CONDICIÓN</th>
							<th colspan="3">Lugar de Nacimiento</th>
						</tr>
						<tr>
							<th>EESS</th>
							<th>Domicilio</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>RN Normal</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
						<tr>
							<td>RN Deprimido </td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
						<tr>
							<td>Prematuro</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
		  </div>
		</div>
		<div class="columns">
		  <div class="column">
		    <p class="notification is-info">D) Morbilidad Neonatal</p>
				<table class="table is-bordered" style="width: 100%;">
					<thead>
						<th>CAUSAS DE MORBILIDAD</th>
						<th>Nº</th>
					</thead>
					<tbody>
						<tr>
							<td>Síndrome de Dristres Respiratorio</td>
							<td id="nino14"></td>
						</tr>
						<tr>
							<td>Síndromes de Aspiración Neonatal</td>
							<td id="nino15"></td>
						</tr>
						<tr>
							<td>Asfixia Neonatal</td>
							<td id="nino16"></td>
						</tr>
						<tr>
							<td>Sepsis Neonatal</td>
							<td id="nino17"></td>
						</tr>
						<tr>
							<td>Ictericia</td>
							<td id="nino18"></td>
						</tr>
						<tr>
							<td>Hipoglucemia</td>
							<td id="nino19"></td>
						</tr>
						<tr>
							<td>Sífilis Congénita</td>
							<td id="nino20"></td>
						</tr>
						<tr>
							<td>VIH Expuesto</td>
							<td id="nino21"></td>
						</tr>
						<tr>
							<td>Retinopatía de la Prematuridad</td>
							<td id="nino22"></td>
						</tr>
					</tbody>
		    </table>
		  </div>
			<div class="column">
		    <p class="notification is-info">E) Mortalidad Neonatal</p>
				<table width="100%" class="table is-bordered" >
					<thead>
						<th>PESO AL NACER</th>
						<th>Nº</th>
					</thead>
					<tbody>
						<tr>
							<td>< 1,000 gr.</td>
							<td id="nino23"></td>
						</tr>
						<tr>
							<td>1,000 a 1,499 gr.</td>
							<td id="nino24"></td>
						</tr>
						<tr>
							<td>1,500 a 2,499 gr.</td>
							<td id="nino25"></td>
						</tr>
						<tr>
							<td>2,500 a 4,000 gr.</td>
							<td id="nino26"></td>
						</tr>
						<tr>
							<td>> 4,000 y más gr.</td>
							<td id="nino27"></td>
						</tr>
						<tr>
							<td>No especificado</td>
							<td id="nino28"></td>
						</tr>
					</tbody>
				</table>
				<table width="100%" class="table is-bordered" >
					<thead>
						<th>TIEMPO DE VIDA</th>
						<th>Nº</th>
					</thead>
					<tbody>
						<tr>
							<td>Óbito fetal</td>
							<td id="nino29"></td>
						</tr>
						<tr>
							<td>< 24 horas</td>
							<td id="nino30"></td>
						</tr>
						<tr>
							<td>01 a 07 días</td>
							<td id="nino31"></td>
						</tr>
						<tr>
							<td>08 a 28 días</td>
							<td id="nino32"></td>
						</tr>
					</tbody>
				</table>
				<table width="100%" class="table is-bordered" >
					<thead>
						<th>Causas Defunción</th>
						<th>Nº</th>
					</thead>
					<tbody>
						<tr>
							<td>Asfixia</td>
							<td id="nino33"></td>
						</tr>
						<tr>
							<td>SDR</td>
							<td id="nino34"></td>
						</tr>
						<tr>
							<td>Sepsis</td>
							<td id="nino35"></td>
						</tr>
						<tr>
							<td>Malformaciones Congénitas</td>
							<td id="nino36"></td>
						</tr>
						<tr>
							<td>Otras</td>
							<td id="nino37"></td>
						</tr>
					</tbody>
				</table>
		  </div>
		</div>
  </div>
</section>

<!-- <script src="../node_modules/bulma-calendar/dist/js/bulma-calendar.min.js"></script> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>


<script type="text/javascript">

  $(document).ready(function() {

    $("#cmb_provincia").change(function () {

      var val = $(this).val();
      var prov_html = "";

      $.ajax({
        url: "getDistrito?cod_prov="+val,
        async: false,
        success: function(result){
					prov_html += "<option value='' selected>Todos los Distritos</option>";
          for (var i = 0; i < result.length; i++) {
            prov_html += "<option value='"+result[i].cod_dist+"'>"+result[i].desc_dist+"</option>";
          }
        }
      });

      $("#cmb_distrito").html(prov_html);

			if (!val) {
				document.getElementById("cmb_red").disabled=false;
				document.getElementById("cmb_mred").disabled=false;

			} else {
				document.getElementById("cmb_red").disabled=true;
				document.getElementById("cmb_mred").disabled=true;
			}

    });

		$("#cmb_red").change(function () {

      var val = $(this).val();
      var prov_html = "";

      $.ajax({
        url: "getMicroRed?cod_red="+val,
        async: false,
        success: function(result){
					prov_html += "<option value='' selected>Todas las Micro Redes</option>";
          for (var i = 0; i < result.length; i++) {
            prov_html += "<option value='"+result[i].cod_mic+"'>"+result[i].desc_micro+"</option>";
          }
        }
      });

      $("#cmb_mred").html(prov_html);

			if (!val) {
				document.getElementById("cmb_provincia").disabled=false;
				document.getElementById("cmb_distrito").disabled=false;

			} else {
				document.getElementById("cmb_provincia").disabled=true;
				document.getElementById("cmb_distrito").disabled=true;
			}

    });

  });

  $(function() {
        // Get the form.
        var form = $('#form-recien-nacido');

        // Get the messages div.
        var formMessages = $('#form-messages');

        // TODO: The rest of the code will go here...
        // Set up an event listener for the contact form.
        $(form).submit(function(event) {
            // Stop the browser from submitting the form.
            event.preventDefault();

            // TODO

            // Serialize the form data.
            var formData = $(form).serialize();

            // Submit the form using AJAX.
            $.ajax({
                type: 'GET',
                url: $(form).attr('action'),
                data: formData
            }).done(function(response) {

							console.log(response);

							// var nino = [];
							//
							// for (var i = 1; i <= 37; i++) {
							// 	nino[i] = 0;
							// }
							//
							// response.forEach(function (response, index) {
							// 		nino[1] += parseInt(response.NINO1);
							// 		nino[2] += parseInt(response.NINO2);
							// 		nino[3] += parseInt(response.NINO3);
							// 		nino[4] += parseInt(response.NINO4);
							// 		nino[5] += parseInt(response.NINO5);
							// 		nino[6] += parseInt(response.NINO6);
							// 		nino[7] += parseInt(response.NINO7);
							// 		nino[8] += parseInt(response.NINO8);
							// 		nino[9] += parseInt(response.NINO9);
							// 		nino[10] += parseInt(response.NINO10);
							// 		nino[11] += parseInt(response.NINO11);
							// 		nino[12] += parseInt(response.NINO12);
							// 		nino[13] += parseInt(response.NINO13);
							// 		nino[14] += parseInt(response.NINO14);
							// 		nino[15] += parseInt(response.NINO15);
							// 		nino[16] += parseInt(response.NINO16);
							// 		nino[17] += parseInt(response.NINO17);
							// 		nino[18] += parseInt(response.NINO18);
							// 		nino[19] += parseInt(response.NINO19);
							// 		nino[20] += parseInt(response.NINO20);
							// 		nino[21] += parseInt(response.NINO21);
							// 		nino[22] += parseInt(response.NINO22);
							// 		nino[23] += parseInt(response.NINO23);
							// 		nino[24] += parseInt(response.NINO24);
							// 		nino[25] += parseInt(response.NINO25);
							// 		nino[26] += parseInt(response.NINO26);
							// 		nino[27] += parseInt(response.NINO27);
							// 		nino[28] += parseInt(response.NINO28);
							// 		nino[29] += parseInt(response.NINO29);
							// 		nino[30] += parseInt(response.NINO30);
							// 		nino[31] += parseInt(response.NINO31);
							// 		nino[32] += parseInt(response.NINO32);
							// 		nino[33] += parseInt(response.NINO33);
							// 		nino[34] += parseInt(response.NINO34);
							// 		nino[35] += parseInt(response.NINO35);
							// 		nino[36] += parseInt(response.NINO36);
							// 		nino[37] += parseInt(response.NINO37);
							//
							// 		console.log(nino[1]);
							// });
							//
							// for (var i = 1; i <= 37; i++) {
							// 	$("#nino"+i).html(nino[i]);
							// }

            }).fail(function(data) {
                alert("ERROR");
            });
        });
    });


</script>


@endsection
