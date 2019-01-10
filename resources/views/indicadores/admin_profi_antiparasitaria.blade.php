@extends('layouts.app')

@section('custom-css')

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
                  <div class="field has-addons">
                    <div class="control">
                      <input class="input is-small" type="text" v-on:click="clickOption('establecimiento')" placeholder="Establecimientos">
                    </div>
                    <div class="control">
                      <a class="button is-small" v-bind:class="option.establecimiento">
                        Buscar
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <example-component></example-component>
              <div class="field">
                <div class="field has-addons has-addons-right">
                  <p class="control">
                    <span class="select is-small">
                      <select>
                        <option>1 año</option>
                        <option>2 año</option>
                        <option>3 año</option>
                        <option>4 año</option>
                        <option>5 a 11 años</option>
                        <option>Grandes grupos</option>
                      </select>
                    </span>
                  </p>
                  <p class="control">
                    <input  type="month" id="start" name="start" min="2017-01" max="20" value="2019-01" class="input is-small">
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
        </div>
      </div>
    </article>
  </div>
</div>

@endsection

@section('custom-js')

<script src="{{ asset('node_modules/highcharts/highcharts.js') }} "></script>
<script src="{{ asset('node_modules/highcharts/modules/exporting.js') }} "></script>
<script src="{{ asset('node_modules/highcharts/modules/export-data.js') }}"></script>
<script src="{{ asset('node_modules/highcharts/modules/drilldown.js') }}"></script>

<script src="{{ url('/node_modules/axios/dist/axios.min.js') }}"></script>
<script src="{{ url('/node_modules/vue/dist/vue.min.js') }}"></script>
<script src="{{ asset('/public/js/app-profilaxis.js') }}"></script>

  <script type="text/javascript">

Highcharts.chart('container', {
  chart: {
      type: 'column'
  },
  title: {
      text: 'Promedio mensual de Administración de Profilaxis Antiparasitaria'
  },
  subtitle: {
      text: 'Fuente: Diresa Apurímac'
  },
  xAxis: {
      categories: [
          'Dosis A',
          'Dosis B'
          // 'Mar',
          // 'Abr',
          // 'May',
          // 'Jun',
          // 'Jul',
          // 'Aug',
          // 'Sep',
          // 'Oct',
          // 'Nov',
          // 'Dec'
      ],
      crosshair: true
  },
  yAxis: {
      min: 0,
      title: {
          text: 'Rendimiento (mm)'
      }
  },
  tooltip: {
      headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
      pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
          '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
      footerFormat: '</table>',
      shared: true,
      useHTML: true
  },
  // plotOptions: {
  //     column: {
  //         pointPadding: 0.2,
  //         borderWidth: 0
  //     }
  // },

  plotOptions: {
        series: {
            cursor: 'pointer',
            point: {
                events: {
                    click: function () {
                        //alert('Category: ' + this.category + ', value: ' + this.y);
                    }
                }
            },

            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.1f}%'
            }
        }
    },
  series: [{
      name: 'Abancay',
      data: [{ y: 40, drilldown: 'abancay' },{ y: 52, drilldown: 'abancay2' }]
  }, {
      name: 'Andahuaylas',
      data: [83.6, 78.8],

  }, {
      name: 'Antabamba',
      data: [48.9, 38.8]

  }, {
      name: 'Aymaraes',
      data: [42.4, 33.2]

  }, {
      name: 'Cotabamba',
      data: [42.4, 33.2]

  }, {
      name: 'Chincheros',
      data: [42.4, 33.2]

  }, {
      name: 'Grau',
      data: [42.4, 33.2]

  }],

  drilldown : {
					series: [{
                name: 'Abancay',
                id: 'abancay',
                data: [
                    [ 'data A', 24.13 ],
                    [ 'data B', 17.2 ],
                    [ 'data C', 8.11 ],
                    [ 'data D', 5.33 ]
                ]
            },{
                  name: 'Test Drilldown',
                  id: 'abancay2',
                  data: [
                      [ 'data A', 24.13 ],
                      [ 'data B', 17.2 ],
                      [ 'data C', 8.11 ]
                  ]
              }]
        }

});
  </script>
@endsection
