@extends('layouts.app')

@section('custom-css')

<!--ARCHIVOS UTILIZADOS EN LA TABLA -->

<!-- <link href="{{ asset('public/highchart/tb/bootstrap.min.css') }}" rel="stylesheet" />
<link href="{{ asset('public/highchart/tb/estilos.css') }}" rel="stylesheet" /> -->

<!--<script src="tb/jquery-latest.min.js"></script> -->
<!-- <script src="{{ asset('public/highchart/tb/responsive.js') }}"></script>
<script src="{{ asset('public/highchart/tb/bootstrap.min.js') }}"></script> -->


<style media="screen">

/* .events-card .card-table {
  max-height: none;
} */

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

</style>

@endsection

@section('content')

<div class="column is-9" id="appDashboard">

<section class="hero is-info welcome is-small">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                Dashboard
            </h1>
            <h2 class="subtitle">
                Anemia
            </h2>
        </div>
    </div>
</section>
<br>
<div class="box">
  <article class="media">
    <div class="media-content">
      <div class="content">

        <form v-on:submit.prevent="getResult">

        <div class="field is-horizontal">
          <div class="field-label is-small">
            <label class="label">
              Redes:
              <input type="radio" id="one" name="picked" value="red" v-model="picked" v-on:change="selectQuery">
            </label>
          </div>
          <div class="field-body">
            <div class="field">
              <p class="control is-expanded has-icons-left">
                <span class="select is-fullwidth is-small">
                  <select v-model="selectedRed" v-on:change="microRedes" v-bind:disabled="cmbRedes" required>
                      <option value="" disabled selected>Selecciona Red</option>
                      <option v-for="red in redes" v-bind:value="red.cod_red">@{{red.desc_red}}</option>
                  </select>
                </span>
                <span class="icon is-small is-left">
                  <i class="fas fa-globe"></i>
                </span>
              </p>
            </div>
            <div class="field">
              <p class="control is-expanded has-icons-left">
                <span class="select is-fullwidth is-small">
                  <select v-model="selectedMred" v-on:change="establecByRedes" v-bind:disabled="cmbMredes">
                      <option value="" disabled selected>Selecciona Micro Red</option>
                      <option v-for="mred in mredes" v-bind:value="mred.cod_mic">@{{mred.desc_micro}}</option>
                  </select>
                </span>
                <span class="icon is-small is-left">
                  <i class="fas fa-globe"></i>
                </span>
              </p>
            </div>
            <div class="field">
              <p class="control is-expanded has-icons-left">
                <span class="select is-fullwidth is-small">
                  <select v-model="selectedEstablecRed" v-bind:disabled="cmbEstablecRed">
                      <option value="" disabled selected>Seleccionar Establecimiento</option>
                      <option v-for="establecRed in establecRedes" v-bind:value="establecRed.cod_2000">@{{establecRed.desc_estab}}</option>
                  </select>
                </span>
                <span class="icon is-small is-left">
                  <i class="fas fa-globe"></i>
                </span>
              </p>
            </div>
          </div>
        </div>

        <div class="field is-horizontal">
          <div class="field-label is-small">
            <label class="label">
              Provincias:
              <input type="radio" id="two" name="picked" value="provincia" v-model="picked" v-on:change="selectQuery">
            </label>
          </div>
          <div class="field-body">
            <div class="field">
              <p class="control is-expanded has-icons-left">
                <span class="select is-fullwidth is-small">
                  <select v-model="selectedProvincia" v-on:change="distrito" v-bind:disabled="cmbProvincias" required>
                      <option value="" disabled selected>Selecciona Provincia</option>
                      <option v-for="provincia in provincias" v-bind:value="provincia.cod_prov">@{{provincia.desc_prov}}</option>
                  </select>
                </span>
                <span class="icon is-small is-left">
                  <i class="fas fa-globe"></i>
                </span>
              </p>
            </div>
            <div class="field">
              <p class="control is-expanded has-icons-left">
                <span class="select is-fullwidth is-small">
                  <select v-model="selectedDistrito" v-on:change="establecByProvincias" v-bind:disabled="cmbDistritos">
                    <option value="" disabled selected>Selecciona Distrito</option>
                    <option v-for="distrito in distritos" v-bind:value="distrito.cod_dist" v-text="distrito.desc_dist"></option>
                  </select>
                </span>
                <span class="icon is-small is-left">
                  <i class="fas fa-globe"></i>
                </span>
              </p>
            </div>
            <div class="field">
              <p class="control is-expanded has-icons-left">
                <span class="select is-fullwidth is-small">
                  <select v-model="selectedEstablecProv" v-bind:disabled="cmbEstablecProv">
                      <option value="" disabled selected>Seleccionar Establecimiento</option>
                      <option v-for="establecProvincia in establecProvincias" v-bind:value="establecProvincia.cod_2000">@{{establecProvincia.desc_estab}}</option>
                  </select>
                </span>
                <span class="icon is-small is-left">
                  <i class="fas fa-globe"></i>
                </span>
              </p>
            </div>
          </div>
        </div>

        <!-- <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">
              Establec:
              <input type="radio" id="two" name="picked" value="establecimiento" v-model="picked" v-on:change="selectQuery">
            </label>
          </div>
          <div class="field-body">
            <div class="field">
              <p class="control is-expanded">
                <v-select v-model="selectedEstablec" :options="loadEstablec" v-bind:disabled="cmbEstablec">
                  <span slot="no-options">
                    No se encontró establecimiento.
                  </span>
                </v-select>
              </p>
            </div>
          </div>
        </div> -->

        <div class="field is-horizontal">
          <!-- <div class="field-label"></div> -->
          <div class="field-label is-small">
            <label class="label">Periodo: </label>
          </div>
          <div class="field-body">
            <div class="field">
              <p class="control is-expanded has-icons-left">
                <input class="input is-small" name="startDate" type="date" v-model="startDate" placeholder="Fecha Inicio" min="2017-01-01" :max="maxDate" required>
                <span class="icon is-small is-left">
                  <i class="far fa-calendar-alt"></i>
                </span>
              </p>
            </div>
            <div class="field">
              <p class="control is-expanded has-icons-left has-icons-right">
                <input class="input is-small" name="endDate" type="date" v-model="endDate" placeholder="Fecha Fin" min="2017-01-01" :max="maxDate" required>
                <span class="icon is-small is-left">
                  <i class="far fa-calendar-alt"></i>
                </span>
              </p>
            </div>
          </div>
        </div>

        <div class="field is-horizontal">
          <div class="field-label">
            <!-- Left empty for spacing -->
          </div>
          <div class="field-body">
            <div class="field">
              <div class="control">
                <button type="submit" class="button is-primary is-fullwidth is-small" v-on:click="">
                  <span class="icon"><i class="fa fa-search"></i></span>
                  <span>Procesar</span>
                </button>
              </div>
            </div>
          </div>
        </div>

      </form>
      <br>
        <div v-if="flag == false" class="field is-grouped is-grouped-centered">
          <p class="control">
            <i class="fas fa-spinner fa-spin fa-2x"></i>
            <span>Cargando...</span>
          </p>
        </div>

        <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
          <thead>
            <tr>
              <th><abbr title="Position">Pos</abbr></th>
              <th>Red Salud</th>
              <th><abbr title="Anemia">Anemia</abbr></th>
              <th><abbr title="Anemia Leve">Anemia Leve</abbr></th>
              <th><abbr title="Anemia Moderada">Anemia Moderada</abbr></th>
              <th><abbr title="Anemia Severa">Anemia Severa</abbr></th>
              <th><abbr title="Normal">Normal</abbr></th>
              <th><abbr title="Tamizados">Tamizados</abbr></th>
              <th><abbr title="Total Anemia">Total Anemia</abbr></th>
              <th><abbr title="Prevalencia">Prevalencia</abbr></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>1</th>
              <td><a href="#" title="Antabamba">ANTABAMBA</a> <strong>(C)</strong>
              </td>
              <td>38</td>
              <td>23</td>
              <td>12</td>
              <td>3</td>
              <td>68</td>
              <td>36</td>
              <td>+32</td>
              <td>81</td>
            </tr>
          </tbody>
        </table>

        <!-- <div v-if="flag == true" class="field is-grouped is-grouped-centered">
          <p class="control">
            <a class="button is-primary" v-on:click="reporteSaludOcular">
              Ver Reporte
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
        </div> -->

      </div>
    </div>
  </article>
</div>

<section class="info-tiles">
    <div class="tile is-ancestor has-text-centered">
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">39k</p>
                <p class="subtitle">Padron Nominal</p>
            </article>
        </div>
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">5k</p>
                <p class="subtitle">Tamizados</p>
            </article>
        </div>
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">3.4k</p>
                <p class="subtitle">Total Anemia</p>
            </article>
        </div>
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">19%</p>
                <p class="subtitle">Prevalencia</p>
            </article>
        </div>
    </div>
</section>

<div class="box">
  <article class="media">
    <div class="media-content">
      <div class="content">

        <!-- draw maps (Perú) -->
        <div id="container"></div>

      </div>
    </div>
  </article>
</div>

<div class="box">
  <article class="media">
    <div class="media-content">
      <div class="content">

        <!-- draw maps (Perú) -->
        <div id="container2"></div>

      </div>
    </div>
  </article>
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

<script src="{{ asset('public/highchart/js/jquery-1.10.2.min.js') }}"></script>
<script src="{{ asset('node_modules/highcharts/highmaps.js') }} "></script>

<script src="{{ asset('node_modules/highcharts/highcharts.js') }} "></script>
<!-- <script src="{{ asset('node_modules/highcharts/modules/series-label.js') }} "></script> -->
<script src="{{ asset('node_modules/highcharts/modules/exporting.js') }} "></script>
<script src="{{ asset('node_modules/highcharts/modules/export-data.js') }}"></script>
<script src="{{ asset('node_modules/highcharts/modules/drilldown.js') }}"></script>

<!-- Mapa de Apurímac -->
<script src="{{ asset('public/highchart/js/pe-all.js') }}"></script>
<script src="{{ asset('public/highchart/js/mapa.js') }}"></script>
<!-- <link rel="stylesheet" href="{{ asset('public/highchart/css/estilo.css') }}" type="text/css" />
<link rel="stylesheet" href="{{ asset('public/highchart/css/font-awesome.css') }}" type="text/css" /> -->


<script src="{{ url('/node_modules/axios/dist/axios.min.js') }}"></script>
<script src="{{ url('/node_modules/vue/dist/vue.min.js') }}"></script>
<script src="{{ asset('/public/js/indicadores/appDashboard.js') }}"></script>

<script>
Highcharts.setOptions({
  lang: {
    drillUpText: '⬅️ Regresar'
  }
});
</script>
@endsection
