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
                <div class="tile" v-for="(pr_attribute, index) in cpu" :key="'pr_attribute'+index">
                    <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice"
                        class="tile-input">
                    <label for="userChoice" class="tile-label">
                        <div class="tile-wrapper">
                            <div class="item-img-wrapper">
                                <img src="" alt="" class="item-img">
                            </div>
                            <h5 class="tile-name">{{ pr_attribute.name }}</h5>
                            <h6 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h6>
                        </div>
                    </label>
                </div>
            </div>
        </div>
        <ActionButton></ActionButton>
        <!-- <paginate :page-count="20" :page-range="3" :margin-pages="2" :click-handler="clickCallback" :prev-text="'Prev'"
            :next-text="'Next'" :container-class="'pagination'" :page-class="'page-item'">
        </paginate> -->
    </section>
</template>

<script>
import SectionHeader from '@/components/SectionHeader.vue'
import ActionButton from '@/components/ActionButton.vue'
// var Paginate = require('vuejs-paginate')
// Vue.component('paginate', Paginate)
// import { createNamespacedHelpers } from "vuex";
// const { mapActions } = createNamespacedHelpers("formSteps");
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
        main() {
            return this.$store.state.main
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
        checkValid(index) {
            this.$store.commit("setValid")
        },
        // checkLocalStorage() {
        //     let oldData = this.$store.state.cih
        //     if (oldData == 0 || oldData == null || oldData.length == 0) {
        //         this.$router.push({ path: '/' })
        //     }
        // }
    }
}
</script>