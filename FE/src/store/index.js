import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: {
    formSteps: [],
    estimated: '0',
    name: '',
    wattage: '0',
    cih: '0'
  },
  getters: {
  },
  mutations: {
    getData(state, newData) {
      state.formSteps = newData
    },
    getName(state, newName) {
      state.name = newName
    },
    getCih(state, newCih) {
      state.cih = newCih
    }
  },
  actions: {
  },
  modules: {
  }
})
