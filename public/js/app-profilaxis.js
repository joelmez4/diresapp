const profilaxis = new Vue({
  el: '#profilaxis',

  data: {

    option: { provincia : null, red : null, establecimiento : null, selected: null},
    group: '1',
    month: '2018-12'

  },

  mounted () {
    this.option.provincia = 'is-info is-selected';
    this.option.selected = "provincia";
    console.log(this.option.selected);
    //axios.get('redes').then(response => this.redes = response.data);
  },

  methods: {

    clickOption: function(opt) {

      if (opt == 'provincia') {
        this.option.selected = "provincia";
        this.option.provincia = 'is-info is-selected';
        this.option.red = null;
        this.option.establecimiento = null;
      }

      if (opt == 'red') {
        this.option.selected = "red";
        this.option.provincia = null;
        this.option.red = 'is-info is-selected';
        this.option.establecimiento = null;
      }

      if (opt == 'establecimiento') {
        this.option.selected = "establecimiento";
        this.option.provincia = null;
        this.option.red = null;
        this.option.establecimiento = 'is-info is-selected';
      }

      console.log(this.option.selected);

    }

  }

});
