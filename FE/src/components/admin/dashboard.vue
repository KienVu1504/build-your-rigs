<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Dashboard</p>
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">
                <router-link tag="div" :to="{path: `/admin/products/` + category.id}"
                    class="counter-wrapper-outer col-lg-4 col-md-6 col-sm-12" v-for="(category, index) in formSteps"
                    :key="category.id" v-if="index <= 8">
                    <div class="counter-wrapper">
                        <div class="counter-right">
                            <img :src="category.img" v-if="category.image_url == null" alt="">
                            <img :src="category.img" v-if="category.img == null" alt="">
                        </div>
                        <div class="counter-left">
                            <p class="counter-name">{{category.name}}</p>
                            <p class="counter">{{category.count}} products</p>
                        </div>
                    </div>
                </router-link>
                <router-link tag="div" :to="{path: '/admin/pre-builds/'}" class="counter-wrapper-outer col-lg-6 col-md-6 col-sm-12">
                    <div class="counter-wrapper">
                        <div class="counter-right">
                            <img src="@/assets/images/gsImage.png" alt="">
                        </div>
                        <div class="counter-left">
                            <p class="counter-name">Pre-build set</p>
                            <p class="counter">{{preBuildCountData.count}} sets</p>
                        </div>
                    </div>
                </router-link>
                <router-link tag="div" :to="{path: '/admin/brands'}" class="counter-wrapper-outer col-lg-6 col-md-6 col-sm-12">
                    <div class="counter-wrapper">
                        <div class="counter-right">
                            <img src="@/assets/images/logo.png" alt="">
                        </div>
                        <div class="counter-left">
                            <p class="counter-name">Brands</p>
                            <p class="counter">{{preBuildCountData.count}} brands</p>
                        </div>
                    </div>
                </router-link>
            </div>
        </div>
    </section>
</template>

<script>
import { createNamespacedHelpers } from 'vuex'
const formStepsStore = createNamespacedHelpers('formStepsData')
const preBuildStore = createNamespacedHelpers('preBuild')

export default {
    data() {
        return {

        };
    },
    async mounted() {
        await this.fetchSteps()
        await this.preBuildCount()
    },
    computed: {
        animation() {
            return this.$store.state.animation
        },
        formSteps() {
            return this.$store.state.formStepsData.formSteps
        },
        preBuildCountData() {
            return this.$store.state.preBuild.preBuildCount
        }
    },
    methods: {
        ...formStepsStore.mapActions([
            'fetchSteps'
        ]),
        ...preBuildStore.mapActions([
            'preBuildCount'
        ])
    },
};
</script>

<style scoped>

</style>