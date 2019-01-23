import Vue from 'vue'
import vSelect from 'vue-select'
Vue.component('v-select', vSelect)


var profilaxis = new Vue({
  el: '#profilaxis',

  data: {

    option: { provincia : null, red : null, establecimiento : null, selected: null},
    group: '1',
    month: '2018-12',

    establecimientos: [],

    options: [],
    selected: {id: null, label: null}
  },

  mounted () {
    this.option.provincia = 'is-info is-selected';
    this.option.selected = "provincia";

    //axios.get('redes').then(response => this.redes = response.data);

    axios.get('../establecimientos')
    .then(function (response) {
        this.establecimientos = response.data;

        for (var i = 0; i < this.establecimientos.length; i++) {
          this.options.push({id: this.establecimientos[i].cod_2000, label: this.establecimientos[i].desc_estab});
          this.selected.id = this.establecimientos[3].cod_2000;
          this.selected.label = this.establecimientos[3].desc_estab;
        }

        drawChart(this.selected.label);

     }.bind(this));
  },

  methods: {

    clickOption: function(opt) {

      if (opt == 'provincia') {
        this.option.selected = "provincia";
        this.option.provincia = 'is-info is-selected';
        this.option.red = null;
        this.option.establecimiento = null;
      }

      if (opt == 'red') {
        this.option.selected = "red";
        this.option.provincia = null;
        this.option.red = 'is-info is-selected';
        this.option.establecimiento = null;
      }

      if (opt == 'establecimiento') {
        this.option.selected = "establecimiento";
        this.option.provincia = null;
        this.option.red = null;
        this.option.establecimiento = 'is-info is-selected';
      }

    },

    setEstablec(val) {
      this.selected.id = val.id;
      this.selected.label = val.label;
      drawChart(this.selected.label);
    }

  }

});





var chart;
var options;
function drawChart(val) {
  options  = {
    chart: {
        type: 'column',
        renderTo: 'container',
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false
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
    // series: [{
    //     name: 'Abancay',
    //     data: [{ y: 40, drilldown: 'abancay' },{ y: 52, drilldown: 'abancay2' }]
    // }, {
    //     name: 'Andahuaylas',
    //     data: [83.6, 78.8],
    //
    // }, {
    //     name: 'Antabamba',
    //     data: [48.9, 38.8]
    //
    // }, {
    //     name: 'Aymaraes',
    //     data: [42.4, 33.2]
    //
    // }, {
    //     name: 'Cotabamba',
    //     data: [42.4, 33.2]
    //
    // }, {
    //     name: 'Chincheros',
    //     data: [42.4, 33.2]
    //
    // }, {
    //     name: 'Grau',
    //     data: [42.4, 33.2]
    //
    // }],
    series: [{
        name: val,
        data: [83.6, 78.8],
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
  };
  options.series[0].name = val;
  chart = new Highcharts.Chart(options);
};
// Highcharts.chart('container', {
//
//
// });
