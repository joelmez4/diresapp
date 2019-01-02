@extends('layouts.app')

@section('custom-css')

@endsection

@section('content')
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
        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
      </div>
    </div>
  </article>
</div>

@endsection

@section('custom-js')

<script src="{{ asset('node_modules/highcharts/highcharts.js') }} "></script>
<script src="{{ asset('node_modules/highcharts/modules/exporting.js') }} "></script>
<script src="{{ asset('node_modules/highcharts/modules/export-data.js') }}"></script>

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
          'Ene',
          'Feb',
          'Mar',
          'Abr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec'
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
  plotOptions: {
      column: {
          pointPadding: 0.2,
          borderWidth: 0
      }
  },
  series: [{
      name: 'Abancay',
      data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

  }, {
      name: 'Andahuaylas',
      data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

  }, {
      name: 'Antabamba',
      data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

  }, {
      name: 'Aymaraes',
      data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

  }, {
      name: 'Cotabamba',
      data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

  }, {
      name: 'Chincheros',
      data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

  }, {
      name: 'Grau',
      data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

  }]
});
  </script>
@endsection
