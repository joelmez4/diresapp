var appInmunizaciones = new Vue({
	el: '#appInmunizaciones',
  data: {
    tab: null
  },
	methods: {
		showName: function(val) {
			alert("The name of the other Vue instance is: "+this.tab);
      console.log(val);
		}
	}
});


var vm2 = new Vue({
	el: '#vm2',
  data: {
    tab: 'inmunizaciones'
  }
});
