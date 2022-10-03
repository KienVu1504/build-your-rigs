import Vue from 'vue'
import Vuex from 'vuex'
import axios from "../plugins/axios";
import qs from "qs"
import formSteps from "./formSteps"
import products from "./products"
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex)

const dataState = createPersistedState({
  paths: ['token']
})

export default new Vuex.Store({
  namespace: true,
  strict: true,
  state: {
    estimated: 0,
    name: '',
    wattage: 0,
    cpu: [],
    cih: 0,
    formSteps: [],
    valid: false,
    activeStep: 0,
    main: [],
    animation: 'animate-in',
    token: ""
  },
  getters: {
  },
  mutations: {
    setCPUData(state, newData) {
      state.cpu = newData
    },
    setAnimate(state, newAnimate) {
      state.animation = newAnimate
    },
    setName(state, newName) {
      state.name = newName
    },
    setCih(state, newCih) {
      state.cih = newCih
    },
    setFormSteps(state, newData) {
      state.formSteps = newData.map(item => {
        return {
          id: item.id,
          name: item.name,
        }
      })
    },
    resetStep(state) {
      state.activeStep = 0
    },
    setValid(state) {
      state.valid = !state.valid
    },
    setStep(state) {
      state.activeStep += 1
    },
    setToken(state, newToken) {
      state.token = newToken
    },
    clearToken(state) {
      console.log('1111111')
      state.token = ''
    }
  },
  actions: {
    async fetchSteps({ commit }) {
      const productsQuery = {
        method: "GET",
        url: "products",
      };
      await axios(productsQuery).then(res => {
        this.dataFormSteps = res.data;
        commit("setFormSteps", this.dataFormSteps);
      }).catch(err => {
        console.log(err)
      })
    },
    async fetchCpus({ commit }) {
      const cpusQuery = {
        method: "GET",
        url: "search",
        params: {
          q: {
            product_name_cont: 'CPU',
            price_lt: this.state.cih
          }
        },
        paramsSerializer: params => {
          return qs.stringify(params)
        }
      }
      await axios(cpusQuery).then(res => {
        this.dataCPU = res.data;
        commit("setCPUData", this.dataCPU);
      }).catch(err => {
        console.log(err)
      })
    },
  },
  modules: {
    // products,
    // formSteps
  },
  plugins: [dataState]
})
