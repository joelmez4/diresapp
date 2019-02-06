@extends('layouts.app')

@section('custom-css')

<style media="screen">
.v-select input[type=search], .v-select input[type=search]:focus {
  width: inherit !important;
}
</style>

@endsection

@section('content')
<div class="column is-9" id="appOcular">
  <section class="hero is-info welcome is-small">
      <div class="hero-body">
          <div class="container">
              <h1 class="title">
                  Salud Ocular
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
        <div class="content">

          <form v-on:submit.prevent="getResult">

          <div class="field is-horizontal">
            <div class="field-label is-normal">
              <label class="label">
                Redes:
                <input type="radio" id="one" name="picked" value="red" v-model="picked" v-on:change="selectQuery">
              </label>
            </div>
            <div class="field-body">
              <div class="field">
                <p class="control is-expanded has-icons-left">
                  <span class="select is-fullwidth">
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
                  <span class="select is-fullwidth">
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
                  <span class="select is-fullwidth">
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
            <div class="field-label is-normal">
              <label class="label">
                Provincias:
                <input type="radio" id="two" name="picked" value="provincia" v-model="picked" v-on:change="selectQuery">
              </label>
            </div>
            <div class="field-body">
              <div class="field">
                <p class="control is-expanded has-icons-left">
                  <span class="select is-fullwidth">
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
                  <span class="select is-fullwidth">
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
                  <span class="select is-fullwidth">
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
          </div>

          <div class="field is-horizontal">
            <!-- <div class="field-label"></div> -->
            <div class="field-label is-normal">
              <label class="label">Periodo: </label>
            </div>
            <div class="field-body">
              <div class="field">
                <p class="control is-expanded has-icons-left">
                  <input class="input" name="startDate" type="date" v-model="startDate" placeholder="Fecha Inicio" min="2017-01-01" :max="maxDate" required>
                  <span class="icon is-small is-left">
                    <i class="far fa-calendar-alt"></i>
                  </span>
                </p>
              </div>
              <div class="field">
                <p class="control is-expanded has-icons-left has-icons-right">
                  <input class="input" name="endDate" type="date" v-model="endDate" placeholder="Fecha Fin" min="2017-01-01" :max="maxDate" required>
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
                  <button type="submit" class="button is-primary is-fullwidth" v-on:click="">
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
    					<progress class="progress is-large is-info" max="100">60%</progress>
    			  </p>
    			</div>

          <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

        </div>
      </div>
    </article>
  </div>  <br>
</div>

@endsection

@section('custom-js')

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script src="{{ asset('node_modules/highcharts/highcharts.js') }} "></script>
<script src="{{ asset('node_modules/highcharts/modules/exporting.js') }} "></script>
<script src="{{ asset('node_modules/highcharts/modules/export-data.js') }}"></script>
<script src="{{ asset('node_modules/highcharts/modules/drilldown.js') }}"></script>

<script src="{{ url('/node_modules/axios/dist/axios.min.js') }}"></script>
<script src="{{ url('/node_modules/vue/dist/vue.min.js') }}"></script>
<script src="{{ asset('/public/js/indicadores/appOcular.js') }}"></script>

@endsection
