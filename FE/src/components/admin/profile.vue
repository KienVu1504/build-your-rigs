<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Your Profile</p>
        </div>
        <div class="separator"></div>
        <div class="input-fields">

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
        checkToken: {
            const token = this.$store.state.token
            if (token.length == 0 || token == null || token == '') {
                this.$router.push({ path: "/admin/login" }).catch(() => { });
            }
        }
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

</style>