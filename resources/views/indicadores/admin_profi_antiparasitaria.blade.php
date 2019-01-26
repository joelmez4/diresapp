@extends('layouts.app')

@section('custom-css')

<style media="screen">
.v-select input[type=search], .v-select input[type=search]:focus {
  width: inherit !important;
}
</style>

@endsection

@section('content')

<div class="column is-9" id="profilaxis">
  <section class="hero is-info welcome is-small">
      <div class="hero-body">
          <div class="container">
              <h1 class="title">
                  Administración de Profilaxis Antiparasitaria
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

          <div class="field is-horizontal">
            <div class="field-label is-normal">
              <label class="label">
                Redes:
                <input type="radio" id="one" name="picked" value="one" v-model="picked" v-on:change="selectQuery">
              </label>
            </div>
            <div class="field-body">
              <div class="field">
                <p class="control is-expanded has-icons-left">
                  <span class="select is-fullwidth">
                    <select v-model="selectedRed" v-on:change="microRedes" v-bind:disabled="cmbRedes">
                        <option value="" selected>Todas las Redes</option>
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
                    <select v-model="selectedMred" v-on:change="establec" v-bind:disabled="cmbMredes">
                        <option value="" selected>Todas las Micro Redes</option>
                        <option v-for="mred in mredes" v-bind:value="mred.cod_mic">@{{mred.desc_micro}}</option>
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
                <input type="radio" id="two" name="picked" value="two" v-model="picked" v-on:change="selectQuery">
              </label>
            </div>
            <div class="field-body">
              <div class="field">
                <p class="control is-expanded has-icons-left">
                  <span class="select is-fullwidth">
                    <select v-model="selectedProvincia" v-on:change="distrito" v-bind:disabled="cmbProvincias">
                        <option value="" selected>Todas las Provincias</option>
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
                    <select v-model="selectedDistrito" v-bind:disabled="cmbDistritos">
                      <option value="" selected>Todos los Distritos</option>
                      <option v-for="distrito in distritos" v-bind:value="distrito.cod_dist" v-text="distrito.desc_dist"></option>
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
                <input type="radio" id="two" name="picked" value="three" v-model="picked" v-on:change="selectQuery">
              </label>
            </div>
            <div class="field-body">
              <div class="field">
                <p class="control is-expanded">
                  <v-select v-model="selected" :options="options" @input="setEstablecimiento" v-bind:disabled="cmbEstablec">
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
                  <input class="input" name="startDate" type="date" v-model="startDate" v-on:input="setStartDate" placeholder="Fecha Inicio" min="2018-01-01" max="2018-12-31" required>
                  <span class="icon is-small is-left">
                    <i class="far fa-calendar-alt"></i>
                  </span>
                </p>
              </div>
              <div class="field">
                <p class="control is-expanded has-icons-left has-icons-right">
                  <input class="input" name="endDate" type="date" v-model="endDate" v-on:input="setEndDate" placeholder="Fecha Fin" min="2018-01-01" max="2018-12-31" required>
                  <span class="icon is-small is-left">
                    <i class="far fa-calendar-alt"></i>
                  </span>
                </p>
              </div>
            </div>
          </div>

          <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

        </div>
      </div>
    </article>
  </div>
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
<script src="{{ asset('/public/js/app-profilaxis.js') }}"></script>

@endsection
