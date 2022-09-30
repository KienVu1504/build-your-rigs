<template>
    <div id="gist" class="page-top">
        <Sidenav></Sidenav>
        <router-view></router-view>
    </div>
</template>

<script>
import HeaderComp from './header.vue';

export default {
    data() {
        return {};
    },
    mounted() {
    },
    methods: {},
    components: { 
        HeaderComp,
        
    }
};
</script>
"
<style scoped>

</style>