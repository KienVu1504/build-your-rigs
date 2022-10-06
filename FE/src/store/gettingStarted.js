import Vue from 'vue'
import Vuex from 'vuex'
import axios from "../plugins/axios";
import qs from "qs"

Vue.use(Vuex)

export default new Vuex.Store({
    namespace: true,
    strict: true,
    state: {
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
        resetStep(state) {
            state.activeStep = 0
        },
    },
    actions: {

    },
    modules: {
    }
})
