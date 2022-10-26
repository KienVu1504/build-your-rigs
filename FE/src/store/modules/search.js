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
        gpu: [],
        case: [],
        psu: [],
        completedRig: [],
        search: '',
        selectedData: [],
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
        },
        setSearchData(state, newData) {
            state.search = newData
        },
        setCPU(state, newData) {
            state.selectedData[0] = newData
        },
        setCOOLER(state, newData) {
            state.selectedData[1] = newData
        },
        setMAIN(state, newData) {
            state.selectedData[2] = newData
        },
        setRAM(state, newData) {
            state.selectedData[3] = newData
        },
        setSSD(state, newData) {
            state.selectedData[4] = newData
        },
        setHDD(state, newData) {
            state.selectedData[5] = newData
        },
        setGPU(state, newData) {
            state.selectedData[6] = newData
        },
        setCASE(state, newData) {
            state.selectedData[7] = newData
        },
        setPSU(state, newData) {
            state.selectedData[8] = newData
        },
        setAllData(state, newData) {
            state.completedRig = newData
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
                // console.log(this.dataCPU);
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
                // console.log(res.data)
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
        async fetchSelectedData({ state, commit }) {
            // console.log(this.selectedData)
            const data = {
                method: "POST",
                url: "selected",
                params: {
                    cpu: state.selectedData[0],
                    main: state.selectedData[1],
                    psu: state.selectedData[2],
                    cooler: state.selectedData[3],
                    ssd: state.selectedData[4],
                    ram: state.selectedData[5],
                    gpu: state.selectedData[6],
                    hdd: state.selectedData[7],
                    case: state.selectedData[8]
                },
                paramsSerializer: (params) => {
                    return qs.stringify(params);
                },
            };
            await axios(data).then((res) => {
                this.selectedData = res.data;
                commit("setAllData", this.selectedData);
            }).catch((err) => {
                console.log(err);
            });
        },
    },
    modules: {
        userInfo,
    },
}
