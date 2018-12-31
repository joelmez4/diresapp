@extends('layouts.app')

@section('custom-css')
<script src="{{ asset('public/highchart/js/jquery-1.10.2.min.js') }}"></script>
<script src="{{ asset('public/highchart/js/highmaps.js') }}"></script>
<script src="{{ asset('public/highchart/js/highcharts.js') }} "></script>
<script src="{{ asset('public/highchart/js/exporting.js') }} "></script>
<script src="{{ asset('public/highchart/js/modulos/exporting.js') }}"></script>
<script src="{{ asset('public/highchart/js/pe-all.js') }}"></script>
<script src="{{ asset('public/highchart/js/mapa.js') }}"></script>
<script src="{{ asset('public/highchart/js/drilldown.js') }}"></script>
<link rel="stylesheet" href="{{ asset('public/highchart/css/estilo.css') }}" type="text/css" />
<link rel="stylesheet" href="{{ asset('public/highchart/css/font-awesome.css') }}" type="text/css" />

<!--ARCHIVOS UTILIZADOS EN LA TABLA -->

<!-- <link href="{{ asset('public/highchart/tb/bootstrap.min.css') }}" rel="stylesheet" />
<link href="{{ asset('public/highchart/tb/estilos.css') }}" rel="stylesheet" /> -->

<!--<script src="tb/jquery-latest.min.js"></script> -->
<!-- <script src="{{ asset('public/highchart/tb/responsive.js') }}"></script>
<script src="{{ asset('public/highchart/tb/bootstrap.min.js') }}"></script> -->

<style media="screen">
.events-card .card-table {
  max-height: none;
}
</style>

@endsection

@section('content')
<section class="hero is-info welcome is-small">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                Indicadores
            </h1>
            <h2 class="subtitle">
                DIRESA
            </h2>
        </div>
    </div>
</section>
<section class="info-tiles">
    <div class="tile is-ancestor has-text-centered">
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">439k</p>
                <p class="subtitle">Users</p>
            </article>
        </div>
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">59k</p>
                <p class="subtitle">Products</p>
            </article>
        </div>
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">3.4k</p>
                <p class="subtitle">Open Orders</p>
            </article>
        </div>
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">19</p>
                <p class="subtitle">Exceptions</p>
            </article>
        </div>
    </div>
</section>
<div class="columns">
    <div class="column is-7">
        <div class="card events-card">
            <header class="card-header">
                <p class="card-header-title">
                    Mapa
                </p>
            </header>
            <div class="card-table">
                <div class="content">
                  <!-- draw maps (Perú) -->
                  <div id="container"></div>
                </div>
            </div>
            <footer class="card-footer">
                <a href="#" class="card-footer-item">Ver más</a>
            </footer>
        </div>
    </div>
    <div class="column is-5">
        <div class="card">
            <header class="card-header">
                <p class="card-header-title">
                    Inventory Search
                </p>
                <a href="#" class="card-header-icon" aria-label="more options">
  <span class="icon">
    <i class="fa fa-angle-down" aria-hidden="true"></i>
  </span>
</a>
            </header>
            <div class="card-content">
                <div class="content">
                    <div class="control has-icons-left has-icons-right">
                        <input class="input is-large" type="text" placeholder="">
                        <span class="icon is-medium is-left">
      <i class="fa fa-search"></i>
    </span>
                        <span class="icon is-medium is-right">
                          <i class="fa fa-check"></i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <header class="card-header">
                <p class="card-header-title">
                    User Search
                </p>
                <a href="#" class="card-header-icon" aria-label="more options">
                  <span class="icon">
                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                  </span>
                </a>
            </header>
            <div class="card-content">
                <div class="content">
                    <div class="control has-icons-left has-icons-right">
                        <input class="input is-large" type="text" placeholder="">
                        <span class="icon is-medium is-left">
      <i class="fa fa-search"></i>
    </span>
                        <span class="icon is-medium is-right">
      <i class="fa fa-check"></i>
    </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- <section class="section">
<div class="container">
  <h1 class="title">
    DIRESA
  </h1>
  <br>
  <a href="AtencionIntegralSaludNino">REPORTE MENSUAL DE ACTIVIDADES  ATENCIÓN INTEGRAL DE SALUD DEL NIÑO</a>
</div>
</section> -->
@endsection

@section('custom-js')
<script>
Highcharts.setOptions({
  lang: {
    drillUpText: '⬅️ Regresar'
  }
});
</script>
@endsection
