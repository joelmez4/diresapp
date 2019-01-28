var navmenu = new Vue({
	el: '#navmenu',
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
