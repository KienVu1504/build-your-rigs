<template>
    <router-view></router-view>
</template>
  
<script>
import Vue from "vue";
import vSelect from "vue-select";

Vue.component("v-select", vSelect);

export default {
    mounted() {
        checkToken: {
            // console.log(this.$store.state.userToken.token)
            const token = this.$store.state.userToken.token
            if (token.length == 0 || token == null || token == '') {
                this.$router.push({ path: "/admin/login" }).catch(() => { });
            }
        }
    }
}
</script>
  
<style scoped>
@import url('https://use.fontawesome.com/releases/v5.8.2/css/all.css');
@import "@/assets/styles/styles.css";
@import "vue-select/dist/vue-select.css";
</style>