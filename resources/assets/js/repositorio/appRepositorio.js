import Vue from 'vue'
import vSelect from 'vue-select'
Vue.component('v-select', vSelect)

var vm2 = new Vue({
	el: '#vm2',
  data: {
    tab: 'repositorio'
  }
});

const appOcular = new Vue({
  el: '#appRepositorio',

  data: {


  },


  mounted () {
    //axios.get('redes').then(response => this.redes = response.data);

  },

  methods: {



  }

});
