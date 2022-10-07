<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">{{ formSteps[activeStep]?.name }}</p>
        </div>
        <div class="search-wrapper" v-if="activeStep != 9">
            <input type="text" v-model="search" placeholder="Search by name.." />
        </div>

        <SectionHeader></SectionHeader>
        <div class="separator"></div>
        <div class="input-fields">
            <input type="radio" name="userChoice" id="checkClone" @click="checkValid(index)" style="display:none"
                checked>
            <div class="no-data" v-if="filteredList.length == 0">
                <p>Can't find your item :(</p>
            </div>
            <div class="input-fields-wrapper" v-if="activeStep == 0">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img" alt="" class="item-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <div class="input-fields-wrapper" v-else-if="activeStep == 1">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img" alt="" class="item-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <div class="input-fields-wrapper" v-else-if="activeStep == 2">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img" alt="" class="item-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <div class="input-fields-wrapper" v-else-if="activeStep == 3">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img" alt="" class="item-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <div class="input-fields-wrapper" v-else-if="activeStep == 4">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img" alt="" class="item-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <div class="input-fields-wrapper" v-else-if="activeStep == 5">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img" alt="" class="item-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <div class="input-fields-wrapper" v-else-if="activeStep == 6">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img" alt="" class="item-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <div class="input-fields-wrapper" v-else-if="activeStep == 7">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img" alt="" class="item-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <div class="input-fields-wrapper" v-else-if="activeStep == 8">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                            class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img" alt="" class="item-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
                            </div>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <ActionButton v-on:changeTitle="updateTitle($event)"></ActionButton>
    </section>
</template>

<script>
import SectionHeader from '@/components/SectionHeader.vue'
import ActionButton from '@/components/ActionButton.vue'
import { mapActions } from 'vuex'

export default {
    components: {
        ActionButton,
        SectionHeader,
    },
    data() {
        return {
            search: ''
        };
    },
    computed: {
        // productsData() {
        //     if (this.formSteps == 0) {
        //         return this.$store.state.cpu
        //     } else if (this.formSteps == 1) {
        //         console.log(this.$store.state.cooler)
        //         return this.$store.state.cooler
        //     } else if (this.formSteps == 2) {
        //         return this.main();
        //     }
        // },
        filteredList() {
            if (this.activeStep == 0) {
                return this.cpu.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            } else if (this.activeStep == 1) {
                return this.cooler.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            } else if (this.activeStep == 2) {
                return this.main.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            } else if (this.activeStep == 3) {
                return this.ram.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            } else if (this.activeStep == 4) {
                return this.ssd.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            } else if (this.activeStep == 5) {
                return this.hdd.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            } else if (this.activeStep == 6) {
                return this.gpu.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            } else if (this.activeStep == 7) {
                return this.pcCase.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            } else if (this.activeStep == 8) {
                return this.psu.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            }
        },
        formSteps() {
            return this.$store.state.formSteps
        },
        cpu() {
            return this.$store.state.cpu
        },
        cooler() {
            return this.$store.state.cooler
        },
        main() {
            return this.$store.state.main
        },
        ram() {
            return this.$store.state.ram
        },
        ssd() {
            return this.$store.state.ssd
        },
        hdd() {
            return this.$store.state.hdd
        },
        gpu() {
            return this.$store.state.gpu
        },
        pcCase() {
            return this.$store.state.case
        },
        psu() {
            return this.$store.state.psu
        },
        activeStep() {
            return this.$store.state.activeStep
        },
        valid() {
            return this.$store.state.valid
        },
        animation() {
            return this.$store.state.animation
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
        ...mapActions([
            'fetchSteps',
            'fetchCpus'
        ]),
        updateTitle: function (updatedTitle) {
            this.title = updatedTitle;
        },
        redirect() {
            this.$router.push({ path: '/' })
        },
        checkValid() {
            this.$store.commit("setValid")
        },
        checkLocalStorage() {
            let oldData = this.$store.state.cih
            if (oldData == 0 || oldData == null || oldData.length == 0) {
                this.$router.push({ path: '/' })
            }
        }
    }
}
</script>

<style>
.search-wrapper {
    right: unset;
    left: 9rem;
}
</style>