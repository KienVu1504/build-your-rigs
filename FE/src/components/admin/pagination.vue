<template>
    <center class="pagi-center" v-if="pages.page">
        <div class="pagination-wrapper" v-if="pages.pages > 1">
            <div v-if="pages.page > 1" @click="goToPrePage">&laquo;</div>
            <div v-if="pages.page == 4 || pages.page > 5" @click="changePageFunc(1)">
                <p>1</p>
            </div>
            <template v-for="pageIndex in 2">
                <div :key="pageIndex" v-if="pages.page == 5" :class="{ active: pages.page === pageIndex }"
                    @click="changePageFunc(pageIndex)">
                    <p>{{ pageIndex }}</p>
                </div>
            </template>
            <div v-if="pages.page > 5">
                <p>...</p>
            </div>
            <template v-for="pageIndex in pages.pages">
                <div :key="pageIndex" v-if="pageIndex <= pages.page + 2 && pageIndex >= pages.page - 2"
                    :class="{ active: pages.page === pageIndex }" @click="changePageFunc(pageIndex)">
                    <p>{{ pageIndex }}</p>
                </div>
            </template>
            <div v-if="pages.page <= pages.pages - 5">
                <p>...</p>
            </div>
            <div v-if="pages.page == pages.pages - 4" @click="changePageFunc(pages.pages)">
                <p>{{ pages.pages - 1 }}</p>
            </div>
            <div v-if="pages.page <= pages.pages - 3 || pages.page < pages.pages - 4"
                @click="changePageFunc(pages.pages)">
                <p>{{ pages.pages }}</p>
            </div>
            <div v-if="pages.page < pages.pages" @click="goToNextPageFunc">&raquo;</div>
        </div>
    </center>
</template>

<script>
import { createNamespacedHelpers } from 'vuex'
const pagingStore = createNamespacedHelpers('paging')
export default {
    computed: {
        ...pagingStore.mapState([
            'pages',
        ])
    },
    methods: {
        ...pagingStore.mapMutations([
            'prePage',
            'nextPage',
            'changePage'
        ]),
        goToPrePage() {
            this.prePage()
            this.$emit('fetchNewDatas')
        },
        goToNextPageFunc() {
            this.nextPage()
            this.$emit('fetchNewDatas')
        },
        changePageFunc(newPage) {
            this.changePage(newPage)
            this.$emit('fetchNewDatas')
        },
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