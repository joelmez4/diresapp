@extends('layouts.app')

@section('content')

<div class="column is-9" id="profilaxis">
  <section class="hero is-info welcome is-small">
      <div class="hero-body">
          <div class="container">
              <h1 class="title">
                  Permanencia Personal
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
                    <input type="month" id="start" name="start" min="2017-01" max="20" value="2018-05" class="input is-small">
                  </p>
                </div>
              </div>
              <!-- <div class="field">
                <div class="field has-addons has-addons-right">

                </div>
              </div> -->
            </div>
          </div>
          <div id="container" style="min-width: 310px; max-width: 400px; height: 300px; margin: 0 auto"></div>
        </div>
      </div>
    </article>
  </div>
</div>
@endsection


@section('custom-js')

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

  <script type="text/javascript">
  Highcharts.chart('container', {

  chart: {
      type: 'gauge',
      plotBackgroundColor: null,
      plotBackgroundImage: null,
      plotBorderWidth: 0,
      plotShadow: false
  },

  title: {
      text: 'Speedometer'
  },

  pane: {
      startAngle: -150,
      endAngle: 150,
      background: [{
          backgroundColor: {
              linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
              stops: [
                  [0, '#FFF'],
                  [1, '#333']
              ]
          },
          borderWidth: 0,
          outerRadius: '109%'
      }, {
          backgroundColor: {
              linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
              stops: [
                  [0, '#333'],
                  [1, '#FFF']
              ]
          },
          borderWidth: 1,
          outerRadius: '107%'
      }, {
          // default background
      }, {
          backgroundColor: '#DDD',
          borderWidth: 0,
          outerRadius: '105%',
          innerRadius: '103%'
      }]
  },

  // the value axis
  yAxis: {
      min: 0,
      max: 200,

      minorTickInterval: 'auto',
      minorTickWidth: 1,
      minorTickLength: 10,
      minorTickPosition: 'inside',
      minorTickColor: '#666',

      tickPixelInterval: 30,
      tickWidth: 2,
      tickPosition: 'inside',
      tickLength: 10,
      tickColor: '#666',
      labels: {
          step: 2,
          rotation: 'auto'
      },
      title: {
          text: 'km/h'
      },
      plotBands: [{
          from: 0,
          to: 120,
          color: '#55BF3B' // green
      }, {
          from: 120,
          to: 160,
          color: '#DDDF0D' // yellow
      }, {
          from: 160,
          to: 200,
          color: '#DF5353' // red
      }]
  },

  series: [{
      name: 'Speed',
      data: [80],
      tooltip: {
          valueSuffix: ' km/h'
      }
  }]

},
// Add some life
function (chart) {
  if (!chart.renderer.forExport) {
      setInterval(function () {
          var point = chart.series[0].points[0],
              newVal,
              inc = Math.round((Math.random() - 0.5) * 20);

          newVal = point.y + inc;
          if (newVal < 0 || newVal > 200) {
              newVal = point.y - inc;
          }

          point.update(newVal);

      }, 3000);
  }
});
  </script>
@endsection
