/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('example-component', require('./components/ModelSelect.vue'));

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
