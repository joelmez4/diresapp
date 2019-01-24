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
            <div class="field-body">
              <div class="field">
                <div class="buttons has-addons">
                  <span class="button is-small" v-bind:class="option.provincia" v-on:click="clickOption('provincia')">Provincia</span>
                  <span class="button is-small" v-bind:class="option.red" v-on:click="clickOption('red')">Red</span>
                  <v-select v-model="selected" :options="options" @input="setEstablecimiento">
                    <span slot="no-options">
                      No se encontró establecimiento.
                    </span>
                  </v-select>
                </div>
              </div>
              <div class="field">
                <div class="field has-addons has-addons-right">
                  <!-- <p class="control">
                    <span class="select is-small">
                      <select v-model="group" v-on:change="setGroup">
                        <option value="1">1 año</option>
                        <option value="2">2 años</option>
                        <option value="3">3 años</option>
                        <option value="4">4 años</option>
                        <option value="5">0 a 11 años</option>
                        <option value="6">5 a 11 años</option>
                        <option value="7">12 a 17 años</option>
                        <option value="8">18 a 29 años</option>
                        <option value="9">30 a 59 años</option>
                        <option value="10">60 años a más</option>
                      </select>
                    </span>
                  </p> -->
                  <!-- <p class="control">
                    <input type="month" id="start" name="start" min="2017-01" max="20" value="2019-01" class="input is-small">
                  </p> -->
                      <p class="control is-expanded has-icons-left">
                        <input class="input is-small" name="startDate" type="date" v-model="startDate" placeholder="Fecha Inicio" value="2018-12-01" min="2018-01-01" max="2018-12-31" required>
                        <span class="icon is-small is-left">
                          <i class="far fa-calendar-alt"></i>
                        </span>
                      </p>

                      <p class="control is-expanded has-icons-left has-icons-right">
                        <input class="input is-small" name="endDate" type="date" v-model="endDate" placeholder="Fecha Fin" value="2018-12-31" min="2018-01-01" max="2018-12-31" required>
                        <span class="icon is-small is-left">
                          <i class="far fa-calendar-alt"></i>
                        </span>
                      </p>

                </div>
              </div>
              <!-- <div class="field">
                <div class="field has-addons has-addons-right">

                </div>
              </div> -->
            </div>
          </div>
          <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
          <p>@{{startDate+' - '+endDate}}</p>
          <p>@{{group}}</p>
          <p>@{{selected.id +" - "+ selected.label}}</p>
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
