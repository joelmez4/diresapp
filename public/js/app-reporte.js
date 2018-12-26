const reporte = new Vue({
  el: '#reporte',

  data: {
    aisn: '',
    startDate: '',
    endDate: '',

    selectedRed: '',
    selectedMred: '',
    selectedProvincia: '',
    selectedDistrito: ''

  },

  mounted () {

    //this.aisn = "Joe cool"
    this.aisn = aisn.data;
    this.startDate = aisn.startDate;
    this.endDate = aisn.endDate;
    this.selectedRed = aisn.selectedRed;
    this.selectedMred = aisn.selectedMred;
    this.selectedProvincia = aisn.selectedProvincia;
    this.selectedDistrito = aisn.selectedDistrito;

  },

  methods: {



  }

});
