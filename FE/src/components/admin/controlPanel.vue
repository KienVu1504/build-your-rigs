<template>
    <div id="gist" class="page-top view-container">
        <article>
            <Sidenav></Sidenav>
            <router-view></router-view>
        </article>
    </div>
</template>

<script>
import Sidenav from './sideNav.vue';

export default {
    data() {
        return {};
    },
    mounted() {
    },
    methods: {},
    components: {
        Sidenav
    }
};
</script>
"
<style scoped>
article section {
    width: 87%;
}
</style>