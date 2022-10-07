<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">{{ formSteps[activeStep]?.name }}</p>
        </div>
        <SectionHeader></SectionHeader>
        <div class="separator"></div>
        <div class="input-fields">
            <input type="radio" name="userChoice" id="checkClone" @click="checkValid(index)" style="display:none"
                checked>

            <div class="input-fields-wrapper" v-if="activeStep == 0">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" v-for="(pr_attribute, index) in cpu"
                    :key="'pr_attribute'+index">
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

            <div class="input-fields-wrapper" v-if="activeStep == 1">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in cooler" :key="'pr_attribute'+index">
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

            <div class="input-fields-wrapper" v-if="activeStep == 2">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" v-for="(pr_attribute, index) in main"
                    :key="'pr_attribute'+index">
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

            <div class="input-fields-wrapper" v-if="activeStep == 3">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" v-for="(pr_attribute, index) in ram"
                    :key="'pr_attribute'+index">
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

            <div class="input-fields-wrapper" v-if="activeStep == 4">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" v-for="(pr_attribute, index) in ssd"
                    :key="'pr_attribute'+index">
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

            <div class="input-fields-wrapper" v-if="activeStep == 5">
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" v-for="(pr_attribute, index) in hdd"
                    :key="'pr_attribute'+index">
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
        <ActionButton></ActionButton>
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
    computed: {
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