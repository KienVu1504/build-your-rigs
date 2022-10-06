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
    cooler: [],
    main: [],
    cih: 0,
    formSteps: [],
    valid: false,
    activeStep: 0,
    animation: 'animate-in',
    token: "",
    preBuildCount: ""
  },
  getters: {
  },
  mutations: {
    setCPUData(state, newData) {
      state.cpu = newData
    },
    setCOOLERData(state, newData) {
      state.cooler = newData
    },
    setMAINData(state, newData) {
      state.main = newData
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
      // state.formSteps = newData.map(item => {
      //   return {
      //     id: item.id,
      //     name: item.name,
      //   }
      // })
      state.formSteps = newData
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
    setPreBuildCount(state, newToken) {
      state.preBuildCount = newToken
    },
    clearToken(state) {
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
        url: "search_pr",
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
    async fetchCoolers({ commit }) {
      const coolersQuery = {
        method: "GET",
        url: "search_pr",
        params: {
          q: {
            product_name_cont: 'COOLER',
            price_lt: this.state.cih
          }
        },
        paramsSerializer: params => {
          return qs.stringify(params)
        }
      }
      await axios(coolersQuery).then(res => {
        this.dataCOOLER = res.data;
        commit("setCOOLERData", this.dataCOOLER);
      }).catch(err => {
        console.log(err)
      })
    },
    async fetchMains({ commit }) {
      const mainsQuery = {
        method: "GET",
        url: "search_pr",
        params: {
          q: {
            product_name_cont: 'MAIN',
            price_lt: this.state.cih
          }
        },
        paramsSerializer: params => {
          return qs.stringify(params)
        }
      }
      await axios(mainsQuery).then(res => {
        this.dataCOOLER = res.data;
        commit("setMAINData", this.dataCOOLER);
      }).catch(err => {
        console.log(err)
      })
    },
    async preBuildCount({ commit }) {
      const preBuildQuery = {
        method: "GET",
        url: "pre_builds"
      }
      await axios(preBuildQuery).then(res => {
        this.setCount = res.data;
        commit("setPreBuildCount", this.setCount);
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
