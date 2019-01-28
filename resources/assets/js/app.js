var vm2 = new Vue({
	el: '#vm2',
  data: {
    tab: 'saludnino'
  }
});

const app = new Vue({
  el: '#app',

  data: {
    //Get query ATENCIÓN INTEGRAL DE SALUD DEL NIÑO

    aisn: '',
    flag: null,

    //Data Send
    startDate: '',
    endDate: '',

    //Form query
    picked: 'one',

    selectedRed: '',
    selectedMred: '',
    selectedEstablec: '',
    selectedProvincia: '',
    selectedDistrito: '',

    redes: [],
    mredes: [],
    establecimientos: [],
    provincias: [],
    distritos: [],

    cmbRedes: false,
    cmbMredes: false,
    cmbEstablec: false,
    cmbProvincias: true,
    cmbDistritos: true,

  },

  mounted () {

    //Make an ajax request to our $_SERVER

    // axios

    axios.get('redes').then(response => this.redes = response.data);

    axios.get('provincias').then(response => this.provincias = response.data);

  },

  methods: {

    processForm: function (event) {
      this.flag = false;
      axios
      .get('getAtencionRecienNacido?red='+this.selectedRed+'&mred='+this.selectedMred+'&provincia='+this.selectedProvincia+'&distrito='+this.selectedDistrito+'&startDate='+this.startDate+"&endDate="+this.endDate)
      .then( response => {

        if (response.status == 200) {
          this.flag = true;
        }
        return this.aisn = response.data
      });

    },

    shareData: function (event) {
      console.log(this.aisn);

      var thisIsAnObject = {
        data: this.aisn,
        startDate: this.startDate,
        endDate: this.endDate,
        selectedRed: this.selectedRed,
        selectedMred: this.selectedMred,
        selectedProvincia: this.selectedProvincia,
        selectedDistrito: this.selectedDistrito
      };

      var w = window.open(base_url+"/atencion-integral-salud-nino/reporte");
      w.aisn = thisIsAnObject;

    },

    microRedes: function (event) {

      axios.get('getMicroRed?cod_red='+this.selectedRed).then(response => this.mredes = response.data);

    },

    establec: function (event) {

      axios.get('getEstablecimiento?cod_red='+this.selectedRed+'&cod_mic='+this.selectedMred).then(response => this.establecimientos = response.data);

    },

    distrito: function (event) {

      axios.get('getDistrito?cod_prov='+this.selectedProvincia).then(response => this.distritos = response.data);

    },

    selectQuery: function (event) {

      if (this.picked == 'one') {

        this.cmbRedes = false,

        this.cmbMredes = false,

        this.cmbEstablec = false,

        this.cmbProvincias = true,

        this.cmbDistritos = true

      } else if (this.picked == 'two') {

        this.cmbRedes = true;

        this.cmbMredes = true;

        this.cmbEstablec = true,

        this.cmbProvincias = false,

        this.cmbDistritos = false

      }
      console.log(this.picked);
    }

  }
});
