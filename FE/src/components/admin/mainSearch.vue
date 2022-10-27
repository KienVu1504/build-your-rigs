<template>
    <div class="search-wrapper" v-if="activeStep != 9">
        <input type="text" v-model="search" @keyup="updateSearch" placeholder="Search by name.." />
    </div>
</template>
<script>
import { createNamespacedHelpers } from 'vuex'
const searchStore = createNamespacedHelpers('search')
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
        ...searchStore.mapMutations([
            'setSearchData'
        ]),
        updateSearch() {
            this.setSearchData(this.search)
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