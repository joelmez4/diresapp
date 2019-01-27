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

<div class="column is-9" id="app">

	<section class="hero is-info welcome is-small">
	    <div class="hero-body">
	        <div class="container">
	            <h1 class="title">
	                Atención Integral de Salud del Niño
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

			<div v-if="flag == true" class="field is-grouped is-grouped-centered">
			  <p class="control">
					<a class="button is-primary" v-on:click="shareData">
			      Ver
			    </a>
			  </p>
			  <p class="control">
					<a class="button is-info" href="atencionRecienNacido/exportarpdf">
	          <span>Descargar</span>
	          <span class="icon">
	            <i class="fas fa-file-pdf"></i>
	          </span>
	        </a>
			  </p>
			</div>

			<div v-if="flag == false" class="field is-grouped is-grouped-centered">
			  <p class="control">
					<i class="fas fa-spinner fa-spin fa-2x"></i>
					<span>Cargando...</span>
					<progress class="progress is-large is-info" max="100">60%</progress>
			  </p>
			</div>

	</section>

</div>

@endsection

@section('custom-js')
	<!-- <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script> -->

	<script src="{{ url('/node_modules/axios/dist/axios.min.js') }}"></script>

	<script src="{{ url('/node_modules/vue/dist/vue.min.js') }}"></script>

	<!-- <script src="{{ url('/resources/assets/js/app.js') }}"></script> -->
	<script src="{{ asset('/public/js/app.js') }}"></script>

@endsection
