import Vue from 'vue'
import Vuex from 'vuex'
import preBuild from '@/store/modules/preBuild'
import search from "@/store/modules/search"
import userInfo from '@/store/modules/userInfo'
import formStepsData from "@/store/modules/formStepsData"
import userToken from '@/store/modules/userToken'
import paging from '@/store/modules/paging'
import brandsData from '@/store/modules/brandsData'
import productsData from '@/store/modules/productsData'
import relatePr from '@/store/modules/relatePr'
import comments from '@/store/modules/comments'
import createPersistedState from "vuex-persistedstate";
const dataState = createPersistedState({
  paths: ['userToken.token']
})

Vue.use(Vuex)

export default new Vuex.Store({
  namespaced: true,
  strict: true,
  state: {
    estimated: 0,
    wattage: 0,
    animation: 'animate-in',
  },
  getters: {
  },
  mutations: {
    setAnimate(state, newAnimate) {
      state.animation = newAnimate
    },
  },
  actions: {

  },
  modules: {
    search,
    formStepsData,
    preBuild,
    userInfo,
    userToken,
    paging,
    brandsData,
    productsData,
    relatePr,
    comments
  },
  plugins: [dataState]
})
