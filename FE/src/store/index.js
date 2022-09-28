import Vue from 'vue'
import Vuex from 'vuex'
import axios from "../plugins/axios";
import qs from "qs"

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: {
    formSteps: [],
    estimated: 0,
    name: '',
    wattage: 0,
    cih: 0,
    activeStep: 0,
    cpu: [],
    main: []
  },
  getters: {
  },
  mutations: {
    setFormSteps(state, newData) {
      state.formSteps = newData.map(item => {
        return {
          id: item.id,
          name: item.name,
        }
      })
      // state.formSteps = newData
    },
    setCPUData(state, newData) {
      state.cpu = newData
    },
    setName(state, newName) {
      state.name = newName
    },
    setCih(state, newCih) {
      state.cih = newCih
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
      const cpusQuerry = {
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
      await axios(cpusQuerry).then(res => {
        this.dataCPU = res.data;
        commit("setCPUData", this.dataCPU);
      }).catch(err => {
        console.log(err)
      })
    },
  },
  modules: {
  }
})
