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


// import axios from "axios";

// const options = {
//   method: 'GET',
//   url: 'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly',
//   params: { lat: '35.5', lon: '-78.5' },
//   headers: {
//     'X-RapidAPI-Key': 'f3be17e144msh008dcd2d3dd4fdap1ac8b5jsna6bd17d59a9d',
//     'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
//   }
// };

// axios.request(options).then(function (response) {
//   console.log(response.data);
// }).catch(function (error) {
//   console.error(error);
// });

import axios from "axios";

const options = {
  method: 'GET',
  url: 'http://localhost:3000/api/v1/types'
};

axios.request(options).then(function (response) {
  console.log(response.data);
}).catch(function (error) {
  console.error(error);
});