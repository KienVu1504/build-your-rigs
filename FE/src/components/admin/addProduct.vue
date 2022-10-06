<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Add Product</p>
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">
                <router-view></router-view>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    data() {
        return {

        };
    },

    mounted() {

    },
    computed: {
        animation() {
            return this.$store.state.animation
        }
    },
    methods: {

    },
};
</script>

<style scoped>
@import url(@/assets/styles/admin.css);

.input-fields-wrapper {
    justify-content: center;
    align-items: center;
    height: 100%;
}
</style>