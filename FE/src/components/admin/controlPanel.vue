<template>
    <div>
        <Sidenav></Sidenav>
        <router-view></router-view>
    </div>
</template>

<script>
import Sidenav from './sidenav.vue';
export default {
    data() {
        return {};
    },
    mounted() {
    },
    methods: {},
    components: { Sidenav }
};
</script>

<style lang="scss" scoped>

</style>