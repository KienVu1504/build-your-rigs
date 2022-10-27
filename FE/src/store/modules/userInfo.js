import axios from "../../plugins/axios";

export default {
  namespaced: true,
  strict: true,
  state: {
    name: '',
    cih: 0,
  },
  getters: {
  },
  mutations: {
    setName(state, newName) {
      state.name = newName
    },
    setCih(state, newCih) {
      state.cih = newCih
    },
  },
  actions: {

  }
}
