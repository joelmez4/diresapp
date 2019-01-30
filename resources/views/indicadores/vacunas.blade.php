@extends('layouts.app')

@section('custom-css')

<style media="screen">
.v-select input[type=search], .v-select input[type=search]:focus {
  width: inherit !important;
}
</style>

@endsection

@section('content')
<script type="text/javascript"
  src="https://public.tableau.com/javascripts/api/tableau-2.min.js"></script>
<script type="text/javascript">
    function initViz() {
        var v1 = document.getElementById("vacuna1"),
            url1 = "https://public.tableau.com/views/GraficosVacunasenMenoresde5Aos/Dashboard1&:toolbar=no",
            options = {
                hideTabs: true,
                onFirstInteractive: function () {
                    console.log("Run this code when the viz has finished loading.");
                }
            };

            var v2 = document.getElementById("vacuna2"),
            url2 = "https://public.tableau.com/views/GraficosVacunasenMenoresde5Aos/Dashboard2&:toolbar=no";

            var v3 = document.getElementById("vacuna3"),
            url3 = "https://public.tableau.com/views/GraficosVacunasenMenoresde5Aos/Dashboard3&:toolbar=no";



        var viz = new tableau.Viz(v1, url1, options);
        var viz2 = new tableau.Viz(v2, url2, options);
        var viz3 = new tableau.Viz(v3, url3, options);
        // Create a viz object and embed it in the container div.


    }
</script>

<div class="column is-9" id="appOcular">
  <section class="hero is-info welcome is-small">
      <div class="hero-body">
          <div class="container">
              <h1 class="title">
                  Vacunas
              </h1>
              <h2 class="subtitle">
                  Indicadores
              </h2>
          </div>
      </div>
  </section>
  <div class="box">
    <article class="media">
      <div class="media-content">
        <div class="content" onload="initViz();">
          @csrf
          <div id="vacuna1" style="width:100%; height:460px;"></div>
          <div id="vacuna2" style="width:100%; height:460px;"></div>
          <div id="vacuna3" style="width:100%; height:560px;"></div>
        </div>
      </div>
    </article>
  </div>
</div>

@endsection

@section('custom-js')

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script src="{{ asset('node_modules/highcharts/highcharts.js') }} "></script>
<script src="{{ asset('node_modules/highcharts/modules/exporting.js') }} "></script>
<script src="{{ asset('node_modules/highcharts/modules/export-data.js') }}"></script>
<script src="{{ asset('node_modules/highcharts/modules/drilldown.js') }}"></script> -->

<script src="{{ url('/node_modules/axios/dist/axios.min.js') }}"></script>
<script src="{{ url('/node_modules/vue/dist/vue.min.js') }}"></script>
<script src="{{ asset('/public/js/indicadores/appVacunas.js') }}"></script>

@endsection
