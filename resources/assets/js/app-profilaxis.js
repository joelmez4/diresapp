import Vue from 'vue'
import vSelect from 'vue-select'
Vue.component('v-select', vSelect)


var profilaxis = new Vue({
  el: '#profilaxis',

  data: {

    flag: null,

    //Date
    startDate: null,
    endDate: null,

    //vue-select  for Establecimientos
    establecimientos: [],

    //load establecimientos
    options: [],
    //set establecimiento
    selected: {id: null, label: null},

    //Form Kind of query
    picked: 'establecimiento',

    selectedRed: null,
    selectedMred: null,
    selectedProvincia: null,
    selectedDistrito: null,

    redes: [],
    mredes: [],
    establecimientos: [],
    provincias: [],
    distritos: [],

    cmbRedes: null,
    cmbMredes: null,
    cmbProvincias: null,
    cmbDistritos: null,
    cmbEstablec: null
  },

  mounted () {

    //axios.get('redes').then(response => this.redes = response.data);

    // Establecimientos | default selected
    this.cmbRedes = true;
    this.cmbMredes = true;
    this.cmbProvincias = true;
    this.cmbDistritos = true;
    this.cmbEstablec = false;

    // Current Date minus one month
    var currentDate = new Date(new Date().toISOString().substr(0, 10));
    this.endDate = currentDate.toISOString().substr(0, 10);
    currentDate.setMonth(currentDate.getMonth() - 1);
    this.startDate = currentDate.toISOString().substr(0, 10);


    axios.get(base_url+'/establecimientos')
    .then(function (response) {
        this.establecimientos = response.data;

        for (var i = 0; i < this.establecimientos.length; i++) {
          this.options.push({id: this.establecimientos[i].cod_2000, label: this.establecimientos[i].desc_estab});
        }
        // this.selected.id = this.establecimientos[4].cod_2000;
        // this.selected.label = this.establecimientos[4].desc_estab;

     }.bind(this));

     axios.get(base_url+'/redes').then(response => this.redes = response.data);

     axios.get(base_url+'/provincias').then(response => this.provincias = response.data);

  },

  methods: {

    setEstablecimiento() {

      this.flag = false;

      console.log("loading..");

      var data;
      data = {
        picked: this.picked,
        red: this.selectedRed,
        mred: this.selectedMred,
        provincia: this.selectedProvincia,
        distrito: this.selectedDistrito,
        establecimiento: this.selected.id,
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

          if (response.status == 200) {
            this.flag = true;
          }

          console.log(response.data);

          drawChart(response.data);

       }.bind(this));

    },

    microRedes: function (event) {

      axios.get(base_url+'/getMicroRed?cod_red='+this.selectedRed).then(response => this.mredes = response.data);

    },

    establec: function (event) {

      axios.get(base_url+'/getEstablecimiento?cod_red='+this.selectedRed+'&cod_mic='+this.selectedMred).then(response => this.establecimientos = response.data);

    },

    distrito: function (event) {

      axios.get(base_url+'/getDistrito?cod_prov='+this.selectedProvincia).then(response => this.distritos = response.data);

    },

    selectQuery: function (event) {

      if (this.picked == 'red') {

        this.cmbRedes = false;
        this.cmbMredes = false;
        this.cmbProvincias = true;
        this.cmbDistritos = true;
        this.cmbEstablec = true;

        this.selectedProvincia = null;
        this.selectedDistrito = null;
        this.selected.id = null;

      } else if (this.picked == 'provincia') {

        this.cmbRedes = true;
        this.cmbMredes = true;
        this.cmbProvincias = false;
        this.cmbDistritos = false;
        this.cmbEstablec = true;

        this.selectedRed = null;
        this.selectedMred = null;
        this.selected.id = null;

      } else if (this.picked == 'establecimiento') {

        this.cmbRedes = true;
        this.cmbMredes = true;
        this.cmbProvincias = true;
        this.cmbDistritos = true;
        this.cmbEstablec = false;

        this.selectedRed = null;
        this.selectedMred = null;
        this.selectedProvincia = null;
        this.selectedDistrito = null;
        
      }
      console.log(this.picked);
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
        text: 'Administración de Profilaxis Antiparasitaria'
    },
    subtitle: {
        text: 'Fuente: Diresa Apurímac | fecha: '+data.startDate+' hasta '+data.endDate
    },
    credits: {
        enabled: false
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
