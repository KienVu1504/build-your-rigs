import axios from "../../plugins/axios";
import qs from "qs"
import userInfo from "@/store/modules/userInfo"

export default {
    namespaced: true,
    strict: true,
    state: {
        cpu: [],
        cooler: [],
        main: [],
        ram: [],
        ssd: [],
        hdd: [],
        search: ''
    },
    getters: {
    },
    mutations: {
        setSearchData(state, newData) {
            state.search = newData
        },
        setCPUData(state, newData) {
            state.cpu = newData
        },
        setCOOLERData(state, newData) {
            state.cooler = newData
        },
        setMAINData(state, newData) {
            state.main = newData
        },
        setRAMData(state, newData) {
            state.ram = newData
        },
        setSSDData(state, newData) {
            state.ssd = newData
        },
        setHDDData(state, newData) {
            state.hdd = newData
        },
        setGPUData(state, newData) {
            state.gpu = newData
        },
        setCASEData(state, newData) {
            state.case = newData
        },
        setPSUData(state, newData) {
            state.psu = newData
        }
    },
    actions: {
        async fetchCpus({ commit }) {
            const cpusQuery = {
                method: "GET",
                url: "search_pr",
                params: {
                    q: {
                        product_name_cont: 'CPU',
                        price_lt: userInfo.state.cih
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
                        price_lt: userInfo.state.cih
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
                        price_lt: userInfo.state.cih
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
        async fetchRams({ commit }) {
            const ramsQuery = {
                method: "GET",
                url: "search_pr",
                params: {
                    q: {
                        product_name_cont: 'RAM',
                        price_lt: userInfo.state.cih
                    }
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(ramsQuery).then(res => {
                this.dataRAM = res.data;
                commit("setRAMData", this.dataRAM);
            }).catch(err => {
                console.log(err)
            })
        },
        async fetchSsds({ commit }) {
            const ssdsQuery = {
                method: "GET",
                url: "search_pr",
                params: {
                    q: {
                        product_name_cont: 'SSD',
                        price_lt: userInfo.state.cih
                    }
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(ssdsQuery).then(res => {
                this.dataSSD = res.data;
                commit("setSSDData", this.dataSSD);
            }).catch(err => {
                console.log(err)
            })
        },
        async fetchHdds({ commit }) {
            const hddsQuery = {
                method: "GET",
                url: "search_pr",
                params: {
                    q: {
                        product_name_cont: 'HDD',
                        price_lt: userInfo.state.cih
                    }
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(hddsQuery).then(res => {
                this.dataHDD = res.data;
                commit("setHDDData", this.dataHDD);
            }).catch(err => {
                console.log(err)
            })
        },
        async fetchGpus({ commit }) {
            const gpusQuery = {
                method: "GET",
                url: "search_pr",
                params: {
                    q: {
                        product_name_cont: 'GPU',
                        price_lt: userInfo.state.cih
                    }
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(gpusQuery).then(res => {
                this.dataGPU = res.data;
                commit("setGPUData", this.dataGPU);
            }).catch(err => {
                console.log(err)
            })
        },
        async fetchCases({ commit }) {
            const casesQuery = {
                method: "GET",
                url: "search_pr",
                params: {
                    q: {
                        product_name_cont: 'CASE',
                        price_lt: userInfo.state.cih
                    }
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(casesQuery).then(res => {
                this.dataCASE = res.data;
                commit("setCASEData", this.dataCASE);
            }).catch(err => {
                console.log(err)
            })
        },
        async fetchPsus({ commit }) {
            const psusQuery = {
                method: "GET",
                url: "search_pr",
                params: {
                    q: {
                        product_name_cont: 'PSU',
                        price_lt: userInfo.state.cih
                    }
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(psusQuery).then(res => {
                this.dataPSU = res.data;
                commit("setPSUData", this.dataPSU);
            }).catch(err => {
                console.log(err)
            })
        },
    },
    modules: {
        userInfo,
    },
}