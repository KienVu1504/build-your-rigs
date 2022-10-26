<template>
    <transition name="component-fade" mode="out-in">
        <router-view></router-view>
    </transition>
</template>
  
<script>
import Vue from "vue";
import vSelect from "vue-select";

Vue.component("v-select", vSelect);

export default {
    mounted() {
        checkToken: {
            const token = this.$store.state.userToken.token
            if (token.length == 0 || token == null || token == '') {
                this.$router.push({ path: "/admin/login" }).catch(() => { });
            }
        }
    }
}
</script>
  
<style scoped>
@import url('https://pro.fontawesome.com/releases/v5.15.3/css/all.css');
@import "@/assets/styles/styles.css";
@import "vue-select/dist/vue-select.css";
</style>