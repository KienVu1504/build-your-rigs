<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Dashboard</p>
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">

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
    computed: {
        animation() {
            return this.$store.state.animation
        }
    },

    mounted() {
        checkToken: {
            const token = this.$store.state.token
            if (token.length == 0 || token == null || token == '') {
                this.$router.push({ path: "/admin/login" }).catch(() => { });
            }
        }
    },

    methods: {

    },
};
</script>

<style lang="scss" scoped>

</style>