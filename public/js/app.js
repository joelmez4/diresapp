new Vue({
  el: '#app',

  data: {
    picked: 'one',

    selectedRed: '',
    selectedMred: '',

    selectedProvincia: '',
    selectedDistrito: '',

    redes: [],
    mredes: [],
    provincias: [],
    distritos: [],

    cmbRedes: false,
    cmbMredes: false,
    cmbProvincias: true,
    cmbDistritos: true
  },

  mounted () {

    //Make an ajax request to our $_SERVER

    // axios

    axios.get('redes').then(response => this.redes = response.data);

    axios.get('provincias').then(response => this.provincias = response.data);

  },

  methods: {

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
