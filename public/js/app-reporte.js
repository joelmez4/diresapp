const reporte = new Vue({
  el: '#reporte',

  data: {
    atIntegralSaludNino: '',
    startDate: '',
    endDate: '',

    selectedRed: '',
    selectedMred: '',
    selectedProvincia: '',
    selectedDistrito: ''

  },

  mounted () {

    //this.atIntegralSaludNino = "Joe cool"
    this.atIntegralSaludNino = atIntegralSaludNino.data;
    this.startDate = atIntegralSaludNino.startDate;
    this.endDate = atIntegralSaludNino.endDate;
    this.selectedRed = atIntegralSaludNino.selectedRed;
    this.selectedMred = atIntegralSaludNino.selectedMred;
    this.selectedProvincia = atIntegralSaludNino.selectedProvincia;
    this.selectedDistrito = atIntegralSaludNino.selectedDistrito;

  },

  methods: {



  }

});
