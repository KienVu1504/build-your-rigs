<template>
    <header>
        <div class="view-progress">
            <router-link :to="{path: '/admin'}" class="progress-step" tag="div" @click="animationOut">Dashboard</router-link>
            <router-link :to="{path: '/admin/profile'}" class="progress-step" @click="animationOut" tag="div">Profile</router-link>
        </div>

        <div class="header-action">
            <div @click="logout">Log Out</div>
        </div>
    </header>
</template>

<script>
export default {
    data() {
        return {

        };
    },
    mounted() {
        checkToken: {
            const token = this.$store.state.token
            if (token.length == 0 || token == null || token == '') {
                this.$router.push({ path: "/admin/login" }).catch(() => { });
            }
        }
    },
    methods: {
        logout() {
            console.log('222222')
            this.$store.commit("clearToken");
            this.$router.push({ path: '/admin/login' })
        }
    },
};
</script>

<style scoped>
article header {
    width: 250px !important;
}

.view-progress {
    width: -webkit-fill-available;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.progress-step {
    width: 90%;
    height: 40px;
    background-color: white;
    border-radius: 10px;
    color: #ff008b;
    transition: .2s all ease-in-out;
    border: 1px #ff008b solid;
}

.progress-step:hover {
    cursor: pointer;
    background-color: #ff008b;
    color: white;
    transform: scale(1.1)
}
</style>