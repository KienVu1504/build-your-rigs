import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueLoadmore from 'vuejs-loadmore'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

global.jQuery = require('jquery');
var $ = global.jQuery;
window.$ = $;

Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
Vue.use(VueLoadmore);
Vue.config.productionTip = false

Vue.filter('toCurrency', function (value) {
  if (typeof value !== "number") {
    return value;
  }
  var formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD'
  });
  return formatter.format(value);
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')