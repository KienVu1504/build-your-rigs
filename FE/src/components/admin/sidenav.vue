<template>
    <div>

    </div>
</template>

<script>
export default {
    data() {
        return {

        };
    },

    mounted() {

    },

    methods: {
        logout() {
            this.$store.commit("clearToken");
        }
    },
};
</script>

<style lang="scss" scoped>

</style>