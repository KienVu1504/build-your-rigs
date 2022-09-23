import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import VueLoadmore from 'vuejs-loadmore';
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

global.jQuery = require('jquery');
var $ = global.jQuery;
window.$ = $;

Vue.use(VueLoadmore);
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

const axios = require('axios');

axios.get('http://localhost:3000/api/v1/types').then(resp => {

  console.log(resp.data);
});
