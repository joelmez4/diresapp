import Vue from 'vue'
import vSelect from 'vue-select'
Vue.component('v-select', vSelect)

var vm2 = new Vue({
	el: '#vm2',
  data: {
    tab: 'anemiagestantes'
  }
});

const appOcular = new Vue({
  el: '#appAnemiaGestantes',

  data: {

		dataAN: [],

		idAnemia: null,
		detalleAnemia: null,
		totalPrevalenciaColor: null,
		updatedDB: null,
		countRowsPadronNominal: null,
		person: [],

    flag: null,
		//modals bulma css
		isActive: false,
		isActive2: false,
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
			var tp = ((this.allAnemia / this.totalTamizados) * 100).toFixed(1);
			//color prevalencia
			if (tp <= 4.9) {
				this.totalPrevalenciaColor = 'green';
			} else if (tp >= 5.0 && tp <= 19.9) {
				this.totalPrevalenciaColor = 'yellow';
			} else if (tp >= 20.0 && tp <= 39.9) {
				this.totalPrevalenciaColor = '#FF6600';
			} else if (tp >= 40) {
				this.totalPrevalenciaColor = 'red';
			}

			return tp;
    }
  },

  mounted () {
    //axios.get('redes').then(response => this.redes = response.data);

		/* get all from Padron Nominal */
		axios.get(base_url+'/padronnominal/countrows/get', {
			params: {
				data: 'foo'
			}
		}).then(function (response) {
				this.countRowsPadronNominal = response.data[0].rows;
		 }.bind(this))
		 .catch(function (error) {
				// handle error
				alert("Error en el servidor: "+error);
			}.bind(this));

		/* DateTime: Last update Database SQL */
		axios.get(base_url+'/anemia/datedb2/get', {
			params: {
				data: 'foo'
			}
		}).then(function (response) {
				this.updatedDB = response.data[0].fecha;
		 }.bind(this))
		 .catch(function (error) {
				// handle error
				alert("Error en el servidor: "+error);
			}.bind(this));


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

      axios.get(base_url+'/anemia/gestantes/get', {
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
          drawChart(this.dataAN);

       }.bind(this))
			 .catch(function (error) {
			    // handle error
					this.flag = true;
					alert("Error en el servidor: "+error);
			  }.bind(this));

    },

		detalles: function (val, index) {
			console.log(val+" - "+index);
			this.idAnemia = val;
			this.detalleAnemia = this.dataAN[index];
			console.log(this.detalleAnemia);
		},

		launch: function(val,index) {
      this.isActive = true;
			this.detalles(val, index);
    },
    close: function() {
      this.isActive = false;
    },

		close2: function() {
      this.isActive2 = false;
    },

		verDetalleDNI: function(dni) {
			this.isActive2 = true;

			/* get details by DNI from Padron Nominal */
			axios.get(base_url+'/padronnominal/person/get', {
				params: {
					data: dni
				}
			}).then(function (response) {
				this.person = response.data[0];
				console.log(this.person);
			 }.bind(this))
			 .catch(function (error) {
					// handle error
					alert("Error en el servidor: "+error);
				}.bind(this));

		},

		removeDataAN: function(index) {
			if (index > -1) {
			  this.dataAN.splice(index, 1);
			}
			drawChart(this.dataAN);
			console.log(this.dataAN);
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

	var dataElement = [];

	data.forEach(function (element) {

		if (element.prov_desc != null) {
			dataElement.push(
				{
					"name": element.prov_desc,
					"y": element.prevalencia,
					"drilldown": "Chrome",
					// "color": "red"
				}
			);
		}

		if (element.red_desc != null) {
			dataElement.push(
				{
					"name": element.red_desc,
					"y": element.prevalencia,
					"drilldown": "Chrome",
					// "color": "red"
				}
			);
		}

		console.log('Hi from drawChart');
		console.log(dataElement);
	});

  options  = {

		chart: {
        type: 'column',
				renderTo: 'container2',
    },
		title: {
        text: 'NIÑOS CON ANEMIA'
    },
    subtitle: {
			text: 'Fuente: Diresa Apurímac - SIEN'
        // text: 'Fuente: Diresa Apurímac | fecha: '+data.startDate+' hasta '+data.endDate
    },
    credits: {
        enabled: false
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: 'Total de Prevalencia (%)'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.1f}%'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> de prevalencia<br/>'
    },

    "series": [
        {
            "name": "Anemia Niños",
            "colorByPoint": true,
            "data": dataElement
        }
    ],
    "drilldown": {
        "series": [
            {
                "name": "Chrome",
                "id": "Chrome",
                "data": [
                    [
                        "v65.0",
                        0.1
                    ],
                    [
                        "v64.0",
                        1.3
                    ],
                    [
                        "v63.0",
                        53.02
                    ],
                    [
                        "v62.0",
                        1.4
                    ],
                    [
                        "v61.0",
                        0.88
                    ],
                    [
                        "v60.0",
                        0.56
                    ],
                    [
                        "v59.0",
                        0.45
                    ],
                    [
                        "v58.0",
                        0.49
                    ],
                    [
                        "v57.0",
                        0.32
                    ],
                    [
                        "v56.0",
                        0.29
                    ],
                    [
                        "v55.0",
                        0.79
                    ],
                    [
                        "v54.0",
                        0.18
                    ],
                    [
                        "v51.0",
                        0.13
                    ],
                    [
                        "v49.0",
                        2.16
                    ],
                    [
                        "v48.0",
                        0.13
                    ],
                    [
                        "v47.0",
                        0.11
                    ],
                    [
                        "v43.0",
                        0.17
                    ],
                    [
                        "v29.0",
                        0.26
                    ]
                ]
            },
            {
                "name": "Firefox",
                "id": "Firefox",
                "data": [
                    [
                        "v58.0",
                        1.02
                    ],
                    [
                        "v57.0",
                        7.36
                    ],
                    [
                        "v56.0",
                        0.35
                    ],
                    [
                        "v55.0",
                        0.11
                    ],
                    [
                        "v54.0",
                        0.1
                    ],
                    [
                        "v52.0",
                        0.95
                    ],
                    [
                        "v51.0",
                        0.15
                    ],
                    [
                        "v50.0",
                        0.1
                    ],
                    [
                        "v48.0",
                        0.31
                    ],
                    [
                        "v47.0",
                        0.12
                    ]
                ]
            },
            {
                "name": "Internet Explorer",
                "id": "Internet Explorer",
                "data": [
                    [
                        "v11.0",
                        6.2
                    ],
                    [
                        "v10.0",
                        0.29
                    ],
                    [
                        "v9.0",
                        0.27
                    ],
                    [
                        "v8.0",
                        0.47
                    ]
                ]
            },
            {
                "name": "Safari",
                "id": "Safari",
                "data": [
                    [
                        "v11.0",
                        3.39
                    ],
                    [
                        "v10.1",
                        0.96
                    ],
                    [
                        "v10.0",
                        0.36
                    ],
                    [
                        "v9.1",
                        0.54
                    ],
                    [
                        "v9.0",
                        0.13
                    ],
                    [
                        "v5.1",
                        0.2
                    ]
                ]
            },
            {
                "name": "Edge",
                "id": "Edge",
                "data": [
                    [
                        "v16",
                        2.6
                    ],
                    [
                        "v15",
                        0.92
                    ],
                    [
                        "v14",
                        0.4
                    ],
                    [
                        "v13",
                        0.1
                    ]
                ]
            },
            {
                "name": "Opera",
                "id": "Opera",
                "data": [
                    [
                        "v50.0",
                        0.96
                    ],
                    [
                        "v49.0",
                        0.82
                    ],
                    [
                        "v12.1",
                        0.14
                    ]
                ]
            }
        ]
    }
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
