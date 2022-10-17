<template>
    <center class="pagi-center" v-if="pagesData.page">
        <div class="pagination-wrapper" v-if="pagesData.pages > 1">
            <div>&laquo;</div>
            <div v-if="pagesData.page > 3" :class="{ active: pagesData.page === pageIndex }" @click="changePage(1)">
                <p>1</p>
            </div>
            <div v-if="pagesData.page >= 4">
                <p>...</p>
            </div>
            <template v-for="pageIndex in pagesData.pages">
                <div :key="pageIndex" v-if="pageIndex <= pagesData.page + 2 && pageIndex >= pagesData.page - 2"
                    :class="{ active: pagesData.page === pageIndex }" @click="changePage(pageIndex)">
                    <p>{{ pageIndex }}</p>
                </div>
            </template>
            <div v-if="pagesData.page <= pagesData.pages - 4">
                <p>...</p>
            </div>
            <div v-if="pagesData.page <= pagesData.pages - 3" :class="{ active: pagesData.page === pageIndex }"
                @click="changePage(pagesData.pages)">
                <p>{{pagesData.pages}}</p>
            </div>
            <div>&raquo;</div>
        </div>
    </center>
</template>

<script>
import { createNamespacedHelpers } from 'vuex'
import { eventBus } from "@/main";

const brandsStore = createNamespacedHelpers('brandsData')
export default {
    data() {
        return {

        };
    },
    created() {
        eventBus.$on('updatePages', () => {
            
        })
    },
    computed: {
        pagesData() {
            return this.$store.state.paging.pages
        }
    },
    methods: {
        changePage(newPage) {
            this.$store.commit('paging/changePage', newPage)
            this.fetchDatas()
        },
        ...brandsStore.mapActions([
            'fetchDatas'
        ])
    },
};
</script>

<style scoped>
.pagination-wrapper {
    display: inline-block;
}

.pagination-wrapper div {
    color: black;
    float: left;
    width: 50px;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-decoration: none;
    border: 1px solid #ff008b;
    color: #ff008b;
    cursor: pointer;
}

.active {
    background-color: #ff008b;
    color: white;
    border: 1px solid #ff008b;
}

.active p {
    color: white;
}

.pagination-wrapper div:hover:not(.active) {
    background-color: #ddd;
}

.pagination-wrapper div:first-child {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}

.pagination-wrapper div:last-child {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}
</style>