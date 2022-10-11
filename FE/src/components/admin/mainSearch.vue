<template>
    <div class="search-wrapper" v-if="activeStep != 9">
        <input type="text" v-model="search" @keyup="updateSearch" placeholder="Search by name.." />
    </div>
</template>

<script>
export default {
    data() {
        return {
            search: ''
        };
    },

    mounted() {

    },
    computed: {
        activeStep() {
            return this.$store.state.formStepsData.activeStep
        },
    },
    methods: {
        updateSearch() {
            this.$store.commit('search/setSearchData', this.search);
        }
    },
};
</script>

<style scoped>
.search-wrapper {
    right: unset;
    left: 9rem;
}
</style>