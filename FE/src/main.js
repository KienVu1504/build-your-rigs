import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueLoadmore from 'vuejs-loadmore'
// import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
// import 'bootstrap/dist/css/bootstrap.css'
// import 'bootstrap-vue/dist/bootstrap-vue.css'

// global.jQuery = require('jquery');
// var $ = global.jQuery;
// window.$ = $;

// Vue.use(BootstrapVue)
// Vue.use(IconsPlugin)
Vue.use(VueLoadmore);
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')