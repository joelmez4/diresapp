const app = new Vue({
  el: '#app',

  data: {
    //Get query Atencion Recien Nacido
    atencion_recien_nacido: '',

    //Data Send
    startDate: '',
    endDate: '',

    //Form query
    picked: 'one',

    selectedRed: '',
    selectedMred: '',
    selectedProvincia: '',
    selectedDistrito: '',
    selectedAtencionRN: '',

    redes: [],
    mredes: [],
    provincias: [],
    distritos: [],

    cmbRedes: false,
    cmbMredes: false,
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

      axios.get('getAtencionRecienNacido?red='+this.selectedRed+'&mred='+this.selectedMred+'&provincia='+this.selectedProvincia+'&distrito='+this.selectedDistrito+'&startDate='+this.startDate+"&endDate="+this.endDate).then(response => this.atencion_recien_nacido = response.data);

    },

    microRedes: function (event) {

      axios.get('getMicroRed?cod_red='+this.selectedRed).then(response => this.mredes = response.data);

    },

    distrito: function (event) {

      axios.get('getDistrito?cod_prov='+this.selectedProvincia).then(response => this.distritos = response.data);

    },

    selectQuery: function (event) {

      if (this.picked == 'one') {

        this.cmbRedes = false,

        this.cmbMredes = false,

        this.cmbProvincias = true,

        this.cmbDistritos = true

      } else if (this.picked == 'two') {

        this.cmbRedes = true;

        this.cmbMredes = true;

        this.cmbProvincias = false,

        this.cmbDistritos = false

      }
      console.log(this.picked);
    }

  }
});
