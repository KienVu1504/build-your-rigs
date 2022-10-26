<template>
    <div class="search-wrapper" v-if="activeStep != 9">
        <input type="text" v-model="search" @keyup="updateSearch" placeholder="Search by name.." />
    </div>
</template>
<script>
import { createNamespacedHelpers } from 'vuex'
const formStepsStore = createNamespacedHelpers('formStepsData')
export default {
    data() {
        return {
            search: ''
        };
    },
    computed: {
        ...formStepsStore.mapState([
            'activeStep'
        ])
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