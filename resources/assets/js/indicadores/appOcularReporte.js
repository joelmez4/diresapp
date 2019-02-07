const reporte = new Vue({
  el: '#reporte',

  data: {
    dataOcular: '',
    startDate: '',
    endDate: '',

    selectedRed: '',
    selectedMred: '',
    selectedProvincia: '',
    selectedDistrito: ''

  },

  mounted () {

    //this.dataOcular = "Joe cool"
    this.dataOcular = dataOcular.data;
    this.startDate = dataOcular.startDate;
    this.endDate = dataOcular.endDate;
    this.selectedRed = dataOcular.selectedRed;
    this.selectedMred = dataOcular.selectedMred;
    this.selectedProvincia = dataOcular.selectedProvincia;
    this.selectedDistrito = dataOcular.selectedDistrito;

  },

  methods: {



  }

});
