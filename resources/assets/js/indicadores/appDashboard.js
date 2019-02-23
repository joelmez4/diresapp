import Vue from 'vue'
import vSelect from 'vue-select'
Vue.component('v-select', vSelect)

var vm2 = new Vue({
	el: '#vm2',
  data: {
    tab: 'inicio'
  }
});

const appOcular = new Vue({
  el: '#appDashboard',

  data: {

		dataAN: [],
		idAnemia: null,
		edadNino: null,

    flag: null,
		isActive: false,
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
    picked: 'red',

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

	computed: {
		totalAnemia: function () {
			return this.dataAN.reduce( (acc, crypt) => {
      	return acc += crypt.sum_anemia
	    }, 0)
		},
		totalLeve: function () {
			return this.dataAN.reduce( (acc, crypt) => {
      	return acc += crypt.sum_leve
	    }, 0)
		},
		totalModerada: function () {
			return this.dataAN.reduce( (acc, crypt) => {
      	return acc += crypt.sum_moderada
	    }, 0)
		},
		totalSevera: function () {
			return this.dataAN.reduce( (acc, crypt) => {
      	return acc += crypt.sum_severa
	    }, 0)
		},
		totalNormal: function () {
			return this.dataAN.reduce( (acc, crypt) => {
      	return acc += crypt.sum_normal
	    }, 0)
		},
		totalTamizados: function () {
			return this.dataAN.reduce( (acc, crypt) => {
      	return acc += crypt.total_tamizados
	    }, 0)
		},
		allAnemia: function () {
			return this.dataAN.reduce( (acc, crypt) => {
      	return acc += crypt.total_anemia
	    }, 0)
		},
    totalPrevalencia: function () {

			// this.dataAN.forEach(function(element) {
			// 	console.log(element.prevalencia);
			// 	element.prevalencia
			// });

			return ((this.allAnemia / this.totalTamizados) * 100).toFixed(1);
    }
  },

  mounted () {
    //axios.get('redes').then(response => this.redes = response.data);

    // Establecimientos | default selected
    this.cmbRedes = false;
    this.cmbMredes = false;
		this.cmbEstablecRed = false;
    this.cmbProvincias = true;
    this.cmbDistritos = true;
		this.cmbEstablecProv = true;
    this.cmbEstablec = true;

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

		 drawChart("joe");

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

				edadNino: this.edadNino,
        startDate: this.startDate,
        endDate: this.endDate
      };

      data = JSON.stringify(data);

      axios.get(base_url+'/anemia/nino/get', {
        params: {
          data: data
        }
      }).then(function (response) {

          if (response.status == 200) {
            this.flag = true;
          }

          //console.log(response.data);
					this.dataAN.push(response.data);
					console.log(this.dataAN);
          // drawChart(response.data);

       }.bind(this))
			 .catch(function (error) {
			    // handle error
					this.flag = true;
					alert("Error en el servidor: "+error);
			  }.bind(this));

    },

		detalles: function (val) {
			console.log(val);
			this.idAnemia = val;

		},

		launch: function(val) {
      this.isActive = true;
			this.detalles(val)
    },
    close: function() {
      this.isActive = false;
    },

		reporteSaludOcular: function (event) {

      console.log(this.dataAN);

      var thisIsAnObject = {
        data: this.dataAN,
        startDate: this.startDate,
        endDate: this.endDate,
        selectedRed: this.selectedRed,
        selectedMred: this.selectedMred,
        selectedProvincia: this.selectedProvincia,
        selectedDistrito: this.selectedDistrito
      };

      var w = window.open(base_url+"/ocular/reporte");
	      w.dataAN = thisIsAnObject;

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
		// chart: {
    //     type: 'column',
    //     renderTo: 'container2',
    //     plotBackgroundColor: null,
    //     plotBorderWidth: null,
    //     plotShadow: false
    // },


		chart: {
        type: 'line',
				renderTo: 'container2',
    },
		title: {
        text: 'NIÑOS MENORES DE 3 AÑOS CON ANEMIA'
    },
    subtitle: {
        text: 'Fuente: Diresa Apurímac | fecha: '+data.startDate+' hasta '+data.endDate
    },
    credits: {
        enabled: false
    },
    xAxis: {
        categories: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dec']
    },
    yAxis: {
        title: {
            text: 'Prevalencia (%)'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: true
        }
    },
    series: [{
        name: 'Abancay',
        data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
    }, {
        name: 'Andahuaylas',
        data: [13.9, 14.2, 15.7, 18.5, 111.9, 115.2, 117.0, 116.6, 114.2, 110.3, 16.6, 14.8]
    }, {
        name: 'Abancay',
        data: [27.0, 26.9, 29.5, 214.5, 218.4, 221.5, 225.2, 226.5, 223.3, 218.3, 213.9, 29.6]
    }, {
        name: 'Andahuaylas',
        data: [33.9, 34.2, 35.7, 38.5, 311.9, 315.2, 317.0, 316.6, 314.2, 310.3, 36.6, 34.8]
    }, {
        name: 'Abancay',
        data: [47.0, 46.9, 49.5, 414.5, 418.4, 421.5, 425.2, 426.5, 423.3, 418.3, 413.9, 49.6]
    }, {
        name: 'Andahuaylas',
        data: [53.9, 54.2, 55.7, 58.5, 511.9, 515.2, 517.0, 516.6, 514.2, 510.3, 56.6, 54.8]
    }]
  };
  //options.series[0].name = val;
  chart = new Highcharts.Chart(options);
};
// Highcharts.chart('container', {
//
//
// });


//Statics modals for bulma css ((byID))

// var link = document.getElementById('link-modal');
//
// var modal = document.getElementById('page-modal');
// var close = document.getElementsByClassName('delete')[0];
// var closeButton = document.getElementsByClassName('cerrar')[0];
//
//
// link.onclick = function() {
// 	modal.style.display = 'block';
// }
//
// close.onclick = function() {
// 	modal.style.display = 'none';
// }
//
// closeButton.onclick = function() {
// 	modal.style.display = 'none';
// }
//
// window.onclick = function(event) {
// 	if(event.target.className == 'modal-background') {
// 		modal.style.display = 'none';
// 	}
// }


//Dynamic modals for bulma css
// var buttons = Array.from(document.getElementsByClassName('modal-button'));
//
// for (var i = 0; i < buttons.length; i++) {
//   var button = buttons[i];
//   var target = document.querySelector(button.dataset.target);
//
//   button.addEventListener("click", function(e) {
//     target.classList.toggle('is-active');
//   }, false);
// }
