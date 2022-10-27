import axios from "../../plugins/axios";

export default {
  namespaced: true,
  strict: true,
  state: {
    activeStep: 0,
    formSteps: [],
    valid: false,
  },
  getters: {
  },
  mutations: {
    setFormSteps(state, newData) {
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
  },
  actions: {
    async fetchSteps({ commit }) {
      const productsQuery = {
        method: "GET",
        url: "products",
      };
      await axios(productsQuery).then(res => {
        this.dataFormSteps = res.data;
        // console.log(this.dataFormSteps);
        commit("setFormSteps", this.dataFormSteps);
      }).catch(err => {
        console.log(err)
      })
    },
  }
}
