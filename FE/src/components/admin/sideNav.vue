<template>
    <header>
        <div class="view-progress">
            <router-link :to="{ path: '/admin' }" class="progress-step" tag="div">Dashboard</router-link>
            <router-link :to="{ path: '/admin/profile' }" class="progress-step" tag="div">Profile</router-link>
            <router-link :to="{ path: '/admin/add-product' }" class="progress-step" tag="div">Add Product</router-link>
            <router-link :to="{ path: '/admin/add-brand' }" class="progress-step" tag="div">Add Brand</router-link>
            <router-link :to="{ path: '/admin/comments-manager' }" class="progress-step" tag="div">Comments
            </router-link>
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
    },
    methods: {
        logout() {
            this.$store.commit("userToken/clearToken");
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