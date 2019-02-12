const reporte = new Vue({
  el: '#reporte',

  data: {
    ecr: '',
    startDate: '',
    endDate: '',

    selectedRed: '',
    selectedMred: '',
    selectedProvincia: '',
    selectedDistrito: ''

  },

  mounted () {

    //this.dataCancer = "Joe cool"
    this.ecr = dataCancer.data;
    this.startDate = dataCancer.startDate;
    this.endDate = dataCancer.endDate;
    this.selectedRed = dataCancer.selectedRed;
    this.selectedMred = dataCancer.selectedMred;
    this.selectedProvincia = dataCancer.selectedProvincia;
    this.selectedDistrito = dataCancer.selectedDistrito;

  },

  methods: {



  }

});
