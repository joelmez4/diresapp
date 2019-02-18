import Vue from 'vue'
import vSelect from 'vue-select'
Vue.component('v-select', vSelect)

var vm2 = new Vue({
	el: '#vm2',
  data: {
    tab: 'anemiaDeficiencia'
  }
});

const appOcular = new Vue({
  el: '#appAnemiaDef',

  data: {

		dataCancer: [],

    flag: null,

    //Date
    startDate: null,
    endDate: null,

		maxDate: null,

    //vue-select  for Establecimientos
    establecimientos: [],

    //load establecimientos
    loadEstablec: [],
    //set establecimiento
    selectedEstablec: {id: null, label: null},

    //Form Kind of query
    picked: 'establecimiento',

    selectedRed: null,
    selectedMred: null,
		selectedEstablecRed: null,
    selectedProvincia: null,
    selectedDistrito: null,
		selectedEstablecProv: null,

    redes: [],
    mredes: [],
		establecRedes: [],
    provincias: [],
    distritos: [],
		establecProvincias: [],

    cmbRedes: null,
    cmbMredes: null,
		cmbEstablecRed: null,
    cmbProvincias: null,
    cmbDistritos: null,
		cmbEstablecProv: null,
    cmbEstablec: null
  },

  mounted () {
    //axios.get('redes').then(response => this.redes = response.data);

    // Establecimientos | default selected
    this.cmbRedes = true;
    this.cmbMredes = true;
		this.cmbEstablecRed = true;
    this.cmbProvincias = true;
    this.cmbDistritos = true;
		this.cmbEstablecProv = true;
    this.cmbEstablec = false;

    // Current Date minus one month
    var currentDate = new Date(new Date().toISOString().substr(0, 10));
		this.maxDate = currentDate.toISOString().substr(0, 10);
    this.endDate = currentDate.toISOString().substr(0, 10);
    currentDate.setMonth(currentDate.getMonth() - 1);
    this.startDate = currentDate.toISOString().substr(0, 10);

    axios.get(base_url+'/establecimientos')
    .then(function (response) {
        this.establecimientos = response.data;

        for (var i = 0; i < this.establecimientos.length; i++) {
          this.loadEstablec.push({id: this.establecimientos[i].cod_2000, label: this.establecimientos[i].desc_estab});
        }
        // this.selectedEstablec.id = this.establecimientos[4].cod_2000;
        // this.selectedEstablec.label = this.establecimientos[4].desc_estab;

     }.bind(this));

     axios.get(base_url+'/redes').then(response => this.redes = response.data);

     axios.get(base_url+'/provincias').then(response => this.provincias = response.data);

  },

  methods: {

    getResult() {

      this.flag = false;

      console.log("loading..");

      var data;
      data = {
        picked: this.picked,

        red: this.selectedRed,
        mred: this.selectedMred,
				establecRed: this.selectedEstablecRed,

        provincia: this.selectedProvincia,
        distrito: this.selectedDistrito,
				establecProv: this.selectedEstablecProv,

        establecimiento: this.selectedEstablec.id,

        startDate: this.startDate,
        endDate: this.endDate
      };

      data = JSON.stringify(data);

      axios.get(base_url+'/anemia/deficiencia/get', {
        params: {
          data: data
        }
      }).then(function (response) {

          if (response.status == 200) {
            this.flag = true;
          }

          console.log(response.data);
					this.dataCancer = response.data;
          drawChart(response.data);

       }.bind(this))
			 .catch(function (error) {
			    // handle error
					this.flag = true;
					alert("Error en el servidor: "+error);
			  }.bind(this));

    },

		reporteSaludOcular: function (event) {

      console.log(this.dataCancer);

      var thisIsAnObject = {
        data: this.dataCancer,
        startDate: this.startDate,
        endDate: this.endDate,
        selectedRed: this.selectedRed,
        selectedMred: this.selectedMred,
        selectedProvincia: this.selectedProvincia,
        selectedDistrito: this.selectedDistrito
      };

      var w = window.open(base_url+"/cancer/reporte");
	      w.dataCancer = thisIsAnObject;

		},

    microRedes: function (event) {

      axios.get(base_url+'/getMicroRed?cod_red='+this.selectedRed).then(response => this.mredes = response.data);

    },

    establecByRedes: function (event) {

      axios.get(base_url+'/getEstablecimiento?cod_red='+this.selectedRed+'&cod_mic='+this.selectedMred).then(response => this.establecRedes = response.data);

    },

		establecByProvincias: function (event) {

      axios.get(base_url+'/getEstablecimiento2?cod_prov='+this.selectedProvincia+'&cod_dist='+this.selectedDistrito).then(response => this.establecProvincias = response.data);

    },

	  distrito: function (event) {

      axios.get(base_url+'/getDistrito?cod_prov='+this.selectedProvincia).then(response => this.distritos = response.data);

    },

    selectQuery: function (event) {

      if (this.picked == 'red') {

        this.cmbRedes = false;
        this.cmbMredes = false;
				this.cmbEstablecRed = false;
        this.cmbProvincias = true;
        this.cmbDistritos = true;
				this.cmbEstablecProv = true;
        this.cmbEstablec = true;

        this.selectedProvincia = null;
        this.selectedDistrito = null;
				this.selectedEstablecProv = null;
        this.selectedEstablec.id = null;
        this.selectedEstablec.label = null;

      } else if (this.picked == 'provincia') {

        this.cmbRedes = true;
        this.cmbMredes = true;
				this.cmbEstablecRed = true;
        this.cmbProvincias = false;
        this.cmbDistritos = false;
				this.cmbEstablecProv = false;
        this.cmbEstablec = true;

        this.selectedRed = null;
        this.selectedMred = null;
				this.selectedEstablecRed = null;
        this.selectedEstablec.id = null;
        this.selectedEstablec.label = null;

      } else if (this.picked == 'establecimiento') {

        this.cmbRedes = true;
        this.cmbMredes = true;
				this.cmbEstablecRed = true;
        this.cmbProvincias = true;
        this.cmbDistritos = true;
				this.cmbEstablecProv = true;
        this.cmbEstablec = false;

        this.selectedRed = null;
        this.selectedMred = null;
				this.selectedEstablecRed = null;
        this.selectedProvincia = null;
        this.selectedDistrito = null;
				this.selectedEstablecProv = null;

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
        type: 'cylinder',
        renderTo: 'container',
        options3d: {
            enabled: true,
            alpha: 15,
            beta: 15,
            depth: 50,
            viewDistance: 25
        }
    },
    title: {
        text: 'Deficiencia de Hierro y Recuperado Menores 3 Años'
    },
    subtitle: {
        text: 'Fuente: Diresa Apurímac | fecha: '+data.startDate+' hasta '+data.endDate
    },
    xAxis: {
        categories: ['', 'Diresa'],
        title: {
            text: null
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Atenciones',
            align: 'high'
        },
        labels: {
            overflow: 'justify'
        }
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -40,
        y: 80,
        floating: true,
        borderWidth: 1,
        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        shadow: true
    },
    credits: {
        enabled: false
    },
    plotOptions: {
    		bar: {
            dataLabels: {
                enabled: true
            }
        }
    },
    series: [{
        data: [data.anemia_por_deficiencia_de_hierro_menor_3a],
        name: 'Anemia por Deficiencia de Hierro',
        showInLegend: true
    },{
        data: [data.anemia_recuperado_menor_3a],
        name: 'Anemia Recuperado',
        showInLegend: true
    },{
        data: [data.sin_anemia_menor_3A],
        name: 'Sin Anemia',
        showInLegend: true
    }]
  };
  //options.series[0].name = val;
  chart = new Highcharts.Chart(options);
};
// Highcharts.chart('container', {
//
//
// });
