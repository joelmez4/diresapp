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

/* custom */

.notification.is-info {
    background-color: #209cee;
    color: #fff;
    font-size: 15px;
    padding: 10px;
    margin: 0.5px;
    border-radius: 0%;
}

</style>
@endsection

@section('content')
<section class="hero is-info welcome is-small">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                ATENCIÓN INTEGRAL DE SALUD DEL NIÑO
            </h1>
            <h2 class="subtitle">
                Consultas por redes y provincias.
            </h2>
        </div>
    </div>
</section>

<section class="section">
		@include('form.main')
		<br>

		<div v-if="selectedAtencionRN === '1'">
			@include('template_at_rn.atencion_rn')
		</div>
		<div v-else-if="selectedAtencionRN === '2'">
			@include('template_at_rn.control_cd')
		</div>
		<div v-else-if="selectedAtencionRN === '3'">
		  @include('template_at_rn.tamizaje')
		</div>
		<div v-else-if="selectedAtencionRN === '4'">
		  @include('template_at_rn.admin_prof_anti')
		</div>
		<div v-else-if="selectedAtencionRN === '5'">
		  @include('template_at_rn.admin_micro_n')
		</div>
		<div v-else-if="selectedAtencionRN === '6'">
		  @include('template_at_rn.lactancia_materna_e')
		</div>
		<div v-else-if="selectedAtencionRN === '7'">
		  @include('template_at_rn.alimentacion_comp')
		</div>

		<div v-else-if="selectedAtencionRN === '8'">
		  @include('template_at_rn.evaluacion_est_nut')
		</div>
		<div v-else-if="selectedAtencionRN === '9'">
		  <!-- @include('template_at_rn.alimentacion_comp') -->
		</div>
		<div v-else-if="selectedAtencionRN === '10'">
		  <!-- @include('template_at_rn.alimentacion_comp') -->
		</div>
		<div v-else-if="selectedAtencionRN === '11'">
		  <!-- @include('template_at_rn.alimentacion_comp') -->
		</div>
		<div v-else-if="selectedAtencionRN === '12'">
		  <!-- @include('template_at_rn.alimentacion_comp') -->
		</div>
		<div v-else-if="selectedAtencionRN === '13'">
		  <!-- @include('template_at_rn.alimentacion_comp') -->
		</div>
		<div v-else-if="selectedAtencionRN === '14'">
		  <!-- @include('template_at_rn.alimentacion_comp') -->
		</div>
		<div v-else-if="selectedAtencionRN === '15'">
		  <!-- @include('template_at_rn.alimentacion_comp') -->
		</div>
		<div v-else-if="selectedAtencionRN === '16'">
		  <!-- @include('template_at_rn.alimentacion_comp') -->
		</div>
		<div v-else-if="selectedAtencionRN === '17'">
		  <!-- @include('template_at_rn.alimentacion_comp') -->
		</div>
		<div v-else>
		  Not A/B/C
		</div>


</section>

@endsection
