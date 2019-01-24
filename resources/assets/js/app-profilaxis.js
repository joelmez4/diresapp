import Vue from 'vue'
import vSelect from 'vue-select'
Vue.component('v-select', vSelect)


var profilaxis = new Vue({
  el: '#profilaxis',

  data: {

    option: { provincia : null, red : null, establecimiento : null, selected: null},
    group: '1',

    startDate: '2018-10-01',
    endDate: '2018-10-31',

    establecimientos: [],

    //vue-select
    options: [],
    selected: {id: null, label: 'ANTABAMBA'}
  },

  mounted () {
    this.option.provincia = 'is-info is-selected';
    this.option.selected = "provincia";

    //axios.get('redes').then(response => this.redes = response.data);

    axios.get(base_url+'/establecimientos')
    .then(function (response) {
        this.establecimientos = response.data;

        for (var i = 0; i < this.establecimientos.length; i++) {
          this.options.push({id: this.establecimientos[i].cod_2000, label: this.establecimientos[i].desc_estab});
          this.selected.id = this.establecimientos[4].cod_2000;
          this.selected.label = this.establecimientos[4].desc_estab;
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

    setEstablecimiento(val) {
      //tab color
      this.option.selected = "establecimiento";
      this.option.provincia = null;
      this.option.red = null;
      this.option.establecimiento = 'is-info is-selected';

      this.selected.label = val.label;

      var data;
      data = {
        query: this.option.selected,
        establecimiento: this.selected.label,
        group: this.group,
        startDate: this.startDate,
        endDate: this.endDate
      };

      data = JSON.stringify(data);

      axios.get(base_url+'/indicadores/admin-profix-antiparasitaria/get', {
        params: {
          data: data
        }
      }).then(function (response) {
          // this.establecimientos = response.data;
          console.log("joextech");
          console.log(response.data);
          drawChart(response.data);
       }.bind(this));

    },

    setGroup(val) {
      console.log(this.group);

    }

  }

});





var chart;
var options;
function drawChart(data) {
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
            text: 'Atención'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.0f} </b></td></tr>',
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
                  enabled: false,
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
        name: "1 año",
        data: [data.admin_profilaxis_antiparasitaria_1A_LAB1, data.admin_profilaxis_antiparasitaria_1A_LAB2]
    }, {
        name: "2 años",
        data: [data.admin_profilaxis_antiparasitaria_2A_LAB1, data.admin_profilaxis_antiparasitaria_2A_LAB2]
    }, {
        name: "3 años",
        data: [data.admin_profilaxis_antiparasitaria_3A_LAB1, data.admin_profilaxis_antiparasitaria_3A_LAB2]
    }, {
        name: "4 años",
        data: [data.admin_profilaxis_antiparasitaria_4A_LAB1, data.admin_profilaxis_antiparasitaria_4A_LAB2]
    }, {
        name: "0 a 11 años",
        data: [data.admin_profilaxis_antiparasitaria_0_11a_LAB1, data.admin_profilaxis_antiparasitaria_0_11a_LAB2]
    }, {
        name: "5 a 11 años",
        data: [data.admin_profilaxis_antiparasitaria_5_11a_LAB1, data.admin_profilaxis_antiparasitaria_5_11a_LAB2]
    }, {
        name: "12 a 17 años",
        data: [data.admin_profilaxis_antiparasitaria_12_17a_LAB1, data.admin_profilaxis_antiparasitaria_12_17a_LAB2]
    }, {
        name: "18 a 29 años",
        data: [data.admin_profilaxis_antiparasitaria_18_29a_LAB1, data.admin_profilaxis_antiparasitaria_18_29a_LAB2]
    }, {
        name: "30 a 59 años",
        data: [data.admin_profilaxis_antiparasitaria_30_59a_LAB1, data.admin_profilaxis_antiparasitaria_30_59a_LAB2]
    }, {
        name: "60 años a más",
        data: [data.admin_profilaxis_antiparasitaria_60_a_mas_LAB1, data.admin_profilaxis_antiparasitaria_60_a_mas_LAB2]
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
  //options.series[0].name = val;
  chart = new Highcharts.Chart(options);
};
// Highcharts.chart('container', {
//
//
// });
