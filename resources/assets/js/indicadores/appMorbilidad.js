 import Vue from 'vue'
import vSelect from 'vue-select'
Vue.component('v-select', vSelect)

var vm2 = new Vue({
	el: '#vm2',
  data: {
    tab: 'morbilidad'
  }
});

const appMorbilidad = new Vue({
  el: '#appMorbilidad',

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

      axios.get(base_url+'/morbilidad/get', {
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
        this.selected.label = null;

      } else if (this.picked == 'provincia') {

        this.cmbRedes = true;
        this.cmbMredes = true;
        this.cmbProvincias = false;
        this.cmbDistritos = false;
        this.cmbEstablec = true;

        this.selectedRed = null;
        this.selectedMred = null;
        this.selected.id = null;
        this.selected.label = null;

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

  console.log("tnt,tech");

  console.log(data.data_morb_0_11a_nino);

  options  = {
    chart: {
        type: 'column',
        renderTo: 'container',
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false
    },
    title: {
        text: 'Morbilidad por Consulta Externa'
    },
    subtitle: {
        text: 'Fuente: Diresa Apurímac | fecha: '+data.startDate+' hasta '+data.endDate
    },
    credits: {
        enabled: false
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: 'Atenciones'
        }
    },
    legend: {
       enabled: false
    },

    // tooltip: {
    //     headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
    //     pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
    //         '<td style="padding:0"><b>{point.y:.0f} </b></td></tr>',
    //     footerFormat: '</table>',
    //     shared: true,
    //     useHTML: true
    // },

    // plotOptions: {
    //       series: {
    //           cursor: 'pointer',
    //           point: {
    //               events: {
    //                   click: function () {
    //                       //alert('Category: ' + this.category + ', value: ' + this.y);
    //                   }
    //               }
    //           },
    //
    //           borderWidth: 0,
    //           dataLabels: {
    //               enabled: false,
    //               format: '{point.y:.1f}%'
    //           }
    //       }
    //   },

      plotOptions: {
          series: {
              borderWidth: 0,
              dataLabels: {
                  enabled: true,
                  format: '{point.y:.0f}'
              }
          }
      },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}</b><br/>'
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

    // series: [{
    //     name: "0-11a Niño",
    //     data: [{"y": data.morb_0_11a_nino, drilldown: 'nino'}]
    // }, {
    //     name: "12-17a Adolescente",
    //     data: [data.morb_12_17a_adolescente]
    // }, {
    //     name: "18-29a Joven",
    //     data: [data.morb_18_29a_joven]
    // }, {
    //     name: "30-59a Adulto",
    //     data: [data.morb_30_59a_adulto]
    // }, {
    //     name: "60a+ Adulto Mayor",
    //     data: [data.morb_60a_a_mas_adulto_mayor]
    // }, {
    //     name: "Materna",
    //     data: [data.morb_materna]
    // }],

    series: [
        {
            name: "Morbilidad por Consulta Externa",
            colorByPoint: true,
            data: [
                {
                    "name": "0-11a Niño",
                    "y": data.morb_0_11a_nino,
                    "drilldown": "nino"
                },
                {
                    "name": "12-17a Adolescente",
                    "y": data.morb_12_17a_adolescente,
                    "drilldown": "adolescente"
                },
                {
                    "name": "18-29a Joven",
                    "y": data.morb_18_29a_joven,
                    "drilldown": "joven"
                },
                {
                    "name": "30-59a Adulto",
                    "y": data.morb_30_59a_adulto,
                    "drilldown": "adulto"
                },
                {
                    "name": "60a+ Adulto Mayor",
                    "y": data.morb_60a_a_mas_adulto_mayor,
                    "drilldown": "adulto_mayor"
                },
                {
                    "name": "Materna",
                    "y": data.morb_materna,
                    "drilldown": "materna"
                }
            ]
        }
    ],

    drilldown: {
        series: [{
        		name: '0 a 11 años Niños',
            id: 'nino',
            data: [
                [data.data_morb_0_11a_nino[0].desc_gru, data.data_morb_0_11a_nino[0].morb_0_11a_nino],
                [data.data_morb_0_11a_nino[1].desc_gru, data.data_morb_0_11a_nino[1].morb_0_11a_nino],
                [data.data_morb_0_11a_nino[2].desc_gru, data.data_morb_0_11a_nino[2].morb_0_11a_nino],
                [data.data_morb_0_11a_nino[3].desc_gru, data.data_morb_0_11a_nino[3].morb_0_11a_nino],
                [data.data_morb_0_11a_nino[4].desc_gru, data.data_morb_0_11a_nino[4].morb_0_11a_nino],
                [data.data_morb_0_11a_nino[5].desc_gru, data.data_morb_0_11a_nino[5].morb_0_11a_nino],
                [data.data_morb_0_11a_nino[6].desc_gru, data.data_morb_0_11a_nino[6].morb_0_11a_nino],
                [data.data_morb_0_11a_nino[7].desc_gru, data.data_morb_0_11a_nino[7].morb_0_11a_nino],
                [data.data_morb_0_11a_nino[8].desc_gru, data.data_morb_0_11a_nino[8].morb_0_11a_nino],
                [data.data_morb_0_11a_nino[9].desc_gru, data.data_morb_0_11a_nino[9].morb_0_11a_nino]
            ]
        }, {
        		name: '12-17a Adolescente',
            id: 'adolescente',
            data: [
                [data.data_morb_12_17a_adolescente[0].desc_gru, data.data_morb_12_17a_adolescente[0].morb_12_17a_adolescente],
                [data.data_morb_12_17a_adolescente[1].desc_gru, data.data_morb_12_17a_adolescente[1].morb_12_17a_adolescente],
                [data.data_morb_12_17a_adolescente[2].desc_gru, data.data_morb_12_17a_adolescente[2].morb_12_17a_adolescente],
                [data.data_morb_12_17a_adolescente[3].desc_gru, data.data_morb_12_17a_adolescente[3].morb_12_17a_adolescente],
                [data.data_morb_12_17a_adolescente[4].desc_gru, data.data_morb_12_17a_adolescente[4].morb_12_17a_adolescente],
                [data.data_morb_12_17a_adolescente[5].desc_gru, data.data_morb_12_17a_adolescente[5].morb_12_17a_adolescente],
                [data.data_morb_12_17a_adolescente[6].desc_gru, data.data_morb_12_17a_adolescente[6].morb_12_17a_adolescente],
                [data.data_morb_12_17a_adolescente[7].desc_gru, data.data_morb_12_17a_adolescente[7].morb_12_17a_adolescente],
                [data.data_morb_12_17a_adolescente[8].desc_gru, data.data_morb_12_17a_adolescente[8].morb_12_17a_adolescente],
                [data.data_morb_12_17a_adolescente[9].desc_gru, data.data_morb_12_17a_adolescente[9].morb_12_17a_adolescente]
            ]
        }, {
        		name: '18-29a Joven',
            id: 'joven',
            data: [
                [data.data_morb_18_29a_joven[0].desc_gru, data.data_morb_18_29a_joven[0].morb_18_29a_joven],
                [data.data_morb_18_29a_joven[1].desc_gru, data.data_morb_18_29a_joven[1].morb_18_29a_joven],
                [data.data_morb_18_29a_joven[2].desc_gru, data.data_morb_18_29a_joven[2].morb_18_29a_joven],
                [data.data_morb_18_29a_joven[3].desc_gru, data.data_morb_18_29a_joven[3].morb_18_29a_joven],
                [data.data_morb_18_29a_joven[4].desc_gru, data.data_morb_18_29a_joven[4].morb_18_29a_joven],
                [data.data_morb_18_29a_joven[5].desc_gru, data.data_morb_18_29a_joven[5].morb_18_29a_joven],
                [data.data_morb_18_29a_joven[6].desc_gru, data.data_morb_18_29a_joven[6].morb_18_29a_joven],
                [data.data_morb_18_29a_joven[7].desc_gru, data.data_morb_18_29a_joven[7].morb_18_29a_joven],
                [data.data_morb_18_29a_joven[8].desc_gru, data.data_morb_18_29a_joven[8].morb_18_29a_joven],
                [data.data_morb_18_29a_joven[9].desc_gru, data.data_morb_18_29a_joven[9].morb_18_29a_joven]
            ]
        }, {
        		name: '30-59a Adulto',
            id: 'adulto',
            data: [
                [data.data_morb_30_59a_adulto[0].desc_gru, data.data_morb_30_59a_adulto[0].morb_30_59a_adulto],
                [data.data_morb_30_59a_adulto[1].desc_gru, data.data_morb_30_59a_adulto[1].morb_30_59a_adulto],
                [data.data_morb_30_59a_adulto[2].desc_gru, data.data_morb_30_59a_adulto[2].morb_30_59a_adulto],
                [data.data_morb_30_59a_adulto[3].desc_gru, data.data_morb_30_59a_adulto[3].morb_30_59a_adulto],
                [data.data_morb_30_59a_adulto[4].desc_gru, data.data_morb_30_59a_adulto[4].morb_30_59a_adulto],
                [data.data_morb_30_59a_adulto[5].desc_gru, data.data_morb_30_59a_adulto[5].morb_30_59a_adulto],
                [data.data_morb_30_59a_adulto[6].desc_gru, data.data_morb_30_59a_adulto[6].morb_30_59a_adulto],
                [data.data_morb_30_59a_adulto[7].desc_gru, data.data_morb_30_59a_adulto[7].morb_30_59a_adulto],
                [data.data_morb_30_59a_adulto[8].desc_gru, data.data_morb_30_59a_adulto[8].morb_30_59a_adulto],
                [data.data_morb_30_59a_adulto[9].desc_gru, data.data_morb_30_59a_adulto[9].morb_30_59a_adulto]
            ]
        }, {
        		name: '60a+ Adulto Mayor',
            id: 'adulto_mayor',
            data: [
                [data.data_morb_60a_a_mas_adulto_mayor[0].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[0].morb_60a_a_mas_adulto_mayor],
                [data.data_morb_60a_a_mas_adulto_mayor[1].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[1].morb_60a_a_mas_adulto_mayor],
                [data.data_morb_60a_a_mas_adulto_mayor[2].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[2].morb_60a_a_mas_adulto_mayor],
                [data.data_morb_60a_a_mas_adulto_mayor[3].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[3].morb_60a_a_mas_adulto_mayor],
                [data.data_morb_60a_a_mas_adulto_mayor[4].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[4].morb_60a_a_mas_adulto_mayor],
                [data.data_morb_60a_a_mas_adulto_mayor[5].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[5].morb_60a_a_mas_adulto_mayor],
                [data.data_morb_60a_a_mas_adulto_mayor[6].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[6].morb_60a_a_mas_adulto_mayor],
                [data.data_morb_60a_a_mas_adulto_mayor[7].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[7].morb_60a_a_mas_adulto_mayor],
                [data.data_morb_60a_a_mas_adulto_mayor[8].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[8].morb_60a_a_mas_adulto_mayor],
                [data.data_morb_60a_a_mas_adulto_mayor[9].desc_gru, data.data_morb_60a_a_mas_adulto_mayor[9].morb_60a_a_mas_adulto_mayor]
            ]
        }, {
        		name: 'Materna',
            id: 'materna',
            data: [
                [data.data_morb_materna[0].desc_gru, data.data_morb_materna[0].morb_materna],
                [data.data_morb_materna[1].desc_gru, data.data_morb_materna[1].morb_materna],
                [data.data_morb_materna[2].desc_gru, data.data_morb_materna[2].morb_materna],
                [data.data_morb_materna[3].desc_gru, data.data_morb_materna[3].morb_materna],
                [data.data_morb_materna[4].desc_gru, data.data_morb_materna[4].morb_materna]
                // [data.data_morb_materna[5].desc_gru, data.data_morb_materna[5].morb_materna],
                // [data.data_morb_materna[6].desc_gru, data.data_morb_materna[6].morb_materna],
                // [data.data_morb_materna[7].desc_gru, data.data_morb_materna[7].morb_materna],
                // [data.data_morb_materna[8].desc_gru, data.data_morb_materna[8].morb_materna],
                // [data.data_morb_materna[9].desc_gru, data.data_morb_materna[9].morb_materna]
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
