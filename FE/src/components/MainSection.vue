<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">{{ formStepsList[activeStep]?.name }}</p>
        </div>
        <MainSearch></MainSearch>

        <SectionHeader></SectionHeader>
        <div class="separator"></div>
        <div class="input-fields" v-if="filteredList">
            <input type="radio" name="userChoice" id="checkClone" @click="checkValid(index)" style="display:none"
                checked>
            <div class="no-data" v-if="filteredList.length == 0">
                <p>Can't find your item :(</p>
            </div>
            <div class="input-fields-wrapper">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(pr_attribute.id)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img || pr_attribute.image_url" alt="" class="item-img" />
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <ActionButton></ActionButton>
    </section>
</template>

<script>
import SectionHeader from '@/components/SectionHeader.vue'
import ActionButton from '@/components/ActionButton.vue'
import MainSearch from './admin/mainSearch.vue';
import { createNamespacedHelpers } from 'vuex'
const searchStore = createNamespacedHelpers('search')
const formStepsStore = createNamespacedHelpers('formStepsData')

export default {
    components: {
        ActionButton,
        SectionHeader,
        MainSearch
    },
    data() {
        return {
        };
    },
    computed: {
        filteredList() {
            if (this.activeStep == 0) {
                if (this.cpu) {
                    return this.cpu.filter(post => {
                        return post.name.toLowerCase().includes(this.searchData.toLowerCase())
                    })
                }
            } else if (this.activeStep == 1) {
                return this.cooler.filter(post => {
                    return post.name.toLowerCase().includes(this.searchData.toLowerCase())
                })
            } else if (this.activeStep == 2) {
                return this.main.filter(post => {
                    return post.name.toLowerCase().includes(this.searchData.toLowerCase())
                })
            } else if (this.activeStep == 3) {
                return this.ram.filter(post => {
                    return post.name.toLowerCase().includes(this.searchData.toLowerCase())
                })
            } else if (this.activeStep == 4) {
                return this.ssd.filter(post => {
                    return post.name.toLowerCase().includes(this.searchData.toLowerCase())
                })
            } else if (this.activeStep == 5) {
                return this.hdd.filter(post => {
                    return post.name.toLowerCase().includes(this.searchData.toLowerCase())
                })
            } else if (this.activeStep == 6) {
                return this.gpu.filter(post => {
                    return post.name.toLowerCase().includes(this.searchData.toLowerCase())
                })
            } else if (this.activeStep == 7) {
                return this.pcCase.filter(post => {
                    return post.name.toLowerCase().includes(this.searchData.toLowerCase())
                })
            } else if (this.activeStep == 8) {
                return this.psu.filter(post => {
                    return post.name.toLowerCase().includes(this.searchData.toLowerCase())
                })
            } else if (this.activeStep == 9) {
                return this.selectedData
            }
        },
        formStepsList() {
            return this.$store.state.formStepsData.formSteps
        },
        cpu() {
            return this.$store.state.search.cpu.data
        },
        cooler() {
            return this.$store.state.search.cooler.data
        },
        main() {
            return this.$store.state.search.main.data
        },
        ram() {
            return this.$store.state.search.ram.data
        },
        ssd() {
            return this.$store.state.search.ssd.data
        },
        hdd() {
            return this.$store.state.search.hdd.data
        },
        gpu() {
            return this.$store.state.search.gpu.data
        },
        pcCase() {
            return this.$store.state.search.case.data
        },
        psu() {
            return this.$store.state.search.psu.data
        },
        activeStep() {
            return this.$store.state.formStepsData.activeStep
        },
        valid() {
            return this.$store.state.valid
        },
        animation() {
            return this.$store.state.animation
        },
        searchData() {
            return this.$store.state.search.search
        },
        selectedData() {
            return this.$store.state.search.completedRig.data
        }
    },
    async mounted() {
        this.checkLocalStorage()
        await this.fetchSteps();
        if (this.activeStep == 0) {
            this.fetchCpus();
        }
    },

    methods: {
        ...searchStore.mapActions([
            'fetchCpus'
        ]),
        ...formStepsStore.mapActions([
            'fetchSteps'
        ]),
        redirect() {
            this.$router.push({ path: '/' })
        },
        checkValid(id) {
            this.$store.commit("formStepsData/setValid")
            if (this.activeStep == 0) {
                this.$store.commit('search/setCPU', id)
            } else if (this.activeStep == 1) {
                this.$store.commit('search/setCOOLER', id)
            } else if (this.activeStep == 2) {
                this.$store.commit('search/setMAIN', id)
            } else if (this.activeStep == 3) {
                this.$store.commit('search/setRAM', id)
            } else if (this.activeStep == 4) {
                this.$store.commit('search/setSSD', id)
            } else if (this.activeStep == 5) {
                this.$store.commit('search/setHDD', id)
            } else if (this.activeStep == 6) {
                this.$store.commit('search/setGPU', id)
            } else if (this.activeStep == 7) {
                this.$store.commit('search/setCASE', id)
            } else if (this.activeStep == 8) {
                this.$store.commit('search/setPSU', id)
            }
        },
        checkLocalStorage() {
            let oldData = this.$store.state.userInfo.cih
            if (oldData == 0 || oldData == null) {
                this.$router.push({ path: '/' })
            }
        }
    }
}
</script>

<style>

</style>