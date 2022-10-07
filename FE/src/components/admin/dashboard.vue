<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Dashboard</p>
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">
                <router-link tag="div" :to="{path: `/admin/` + category.id}" class="counter-wrapper-outer col-lg-4 col-md-6 col-sm-12"
                    v-for="(category, index) in formSteps" :key="category.id" v-if="index <= 8">
                    <div class="counter-wrapper">
                        <div class="counter-right">
                            <img :src="category.img" alt="">
                        </div>
                        <div class="counter-left">
                            <p class="counter-name">{{category.name}}</p>
                            <p class="counter">{{category.count}} products</p>
                        </div>
                    </div>
                </router-link>
                <router-link tag="div" :to="{path: '/'}" class="counter-wrapper counter-wrapper-big">
                    <div class="counter-right">
                        <img src="@/assets/images/gsImage.png" alt="">
                    </div>
                    <div class="counter-left">
                        <p class="counter-name">Pre-build set ready</p>
                        <p class="counter">{{preBuildCountData.count}} sets</p>
                    </div>
                </router-link>
            </div>
        </div>
    </section>
</template>

<script>
import { mapActions } from 'vuex'

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
            return this.$store.state.formSteps
        },
        preBuildCountData() {
            return this.$store.state.preBuildCount
        }
    },
    methods: {
        ...mapActions([
            'fetchSteps',
            'preBuildCount'
        ])
    },
};
</script>

<style lang="scss" scoped>

</style>