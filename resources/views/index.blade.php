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
              Anemia Niños
            </h1>
            <h2 class="subtitle">
                Indicadores
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

        <div class="field is-horizontal">
          <div class="field-label is-small">
            <label class="label">
              Edad:
            </label>
          </div>
          <div class="field-body">
            <div class="field">
              <div class="control">
                <div class="select is-fullwidth is-small">
                  <select>
                    <option>Niños menores de 5 años con anemia</option>
                    <option>Niños menores de 3 años con anemia</option>
                    <option>Niños menores de 1 año con anemia</option>
                  </select>
                </div>
              </div>
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
                <button type="submit" class="button is-primary is-fullwidth is-small" v-on:click="" :disabled="flag == false ? true : false">
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
              <th><abbr title="Tamizados">Total Tamizados</abbr></th>
              <th><abbr title="Total Anemia">Total Anemia</abbr></th>
              <th><abbr title="Prevalencia">Prevalencia</abbr></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>1</th>
              <td>
                <strong><a href="#" title="Antabamba">@{{dataAN.red_desc}}</a></strong>
              </td>
              <td>
                <a class="button is-text is-small" id="anemia" @click="detalles('anemia')">@{{dataAN.sum_anemia}}</a>
              </td>
              <td>
                <a class="button is-text is-small" id="leve" @click="detalles('leve')">@{{dataAN.sum_leve}}</a>
              </td>
              <td>
                <a class="button is-text is-small" id="moderada" @click="detalles('moderada')">@{{dataAN.sum_moderada}}</a>
              </td>
              <td>
                <a class="button is-text is-small" id="severa" @click="detalles('severa')">@{{dataAN.sum_severa}}</a>
                <!-- <button class="button is-link is-small" id="button" @click="detalles('severa')">Ver</button> -->
              </td>
              <td>
                <a class="button is-text is-small" id="normal" @click="detalles('normal')">@{{dataAN.sum_normal}}</a>
              </td>

              <td>@{{dataAN.total_tamizados}}</td>
              <td>@{{dataAN.total_anemia}}</td>
              <td>@{{dataAN.prevalencia}} %</td>
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
                <p class="title">@{{dataAN.total_tamizados}}</p>
                <p class="subtitle">Total Tamizados</p>
            </article>
        </div>
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">@{{dataAN.total_anemia}}</p>
                <p class="subtitle">Total Anemia</p>
            </article>
        </div>
        <div class="tile is-parent">
            <article class="tile is-child box">
                <p class="title">@{{dataAN.prevalencia}} %</p>
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

<div class="modal" id="page-modal">
  <div class="modal-background"></div>
  <div class="modal-card">
    <header class="modal-card-head">
      <p class="modal-card-title">Detalles</p>
      <button class="delete" aria-label="close"></button>
    </header>
    <section class="modal-card-body">
      <!-- Content ... -->
      <div v-if="idAnemia === 'anemia'">
        <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
          <thead>
            <tr>
              <th><abbr title="Número">N°</abbr></th>
              <th><abbr title="DNI">DNI</abbr></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(dni, index) in dataAN.data_anemia">
              <td>@{{index + 1}}</td>
              <td>@{{dni}}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-if="idAnemia === 'leve'">
        <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
          <thead>
            <tr>
              <th><abbr title="Position">DNI</abbr></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="dni in dataAN.data_leve">
              <td>@{{dni}}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-if="idAnemia === 'moderada'">
        <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
          <thead>
            <tr>
              <th><abbr title="Position">DNI</abbr></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="dni in dataAN.data_moderada">
              <td>@{{dni}}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-if="idAnemia === 'severa'">
        <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
          <thead>
            <tr>
              <th><abbr title="Position">DNI</abbr></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="dni in dataAN.data_severa">
              <td>@{{dni}}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-if="idAnemia === 'normal'">
        <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
          <thead>
            <tr>
              <th><abbr title="Position">DNI</abbr></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="dni in dataAN.data_normal">
              <td>@{{dni}}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>
    <footer class="modal-card-foot">
      <!-- <button class="button is-success cerrar">Save changes</button> -->
      <button class="button cerrar">Cerrar</button>
    </footer>
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
