<template>
    <div class="input-container">
        <div class="inputBg"></div>

        <div class="input-box">
            <div class="path" id="path"></div>

            <form class="input-form" autocomplete="off" id="form" @submit.prevent="checkForm">
                <h1 class="input-title">Admin Login</h1>
                <br>
                <label class="input-label">Email: </label>
                <br>
                <input class="input-text" type="email" id="email" placeholder="Enter Your Email..." required
                    v-model="email">
                <br>
                <br>
                <label class="input-label">Password: </label>
                <br>
                <input max="999999999" class="input-text" type="password" id="password"
                    placeholder="Enter Your Password..." required minlength="0" maxlength="50" v-model="password">
                <br>
                <button class="input-btn" type="submit" id="button">Login</button>
                <br>
                <span v-if="err" class="errorShow" id="errorShow">{{ err }}</span>
            </form>

            <img src="@/assets/images/gsImage.png" id="gsImage">
            <img src="@/assets/images/logo.png" id="logo">

            <h2 class="input-header" id="input-header">BUILD YOUR RIGS</h2>
        </div>
    </div>
</template>
  
<script>
import axios from "axios";
import { createNamespacedHelpers } from 'vuex'
const userTokenStore = createNamespacedHelpers('userToken')
export default {
    data() {
        return {
            email: "",
            password: "",
            err: ""
        };
    },
    methods: {
        adminAuthenticate() {
            let self = this;
            axios.post('http://localhost:3000/api/v1/login', {
                email: this.email,
                password: this.password
            }).then(function (response) {
                if (response.status == 200) {
                    self.setUserToken(response.data.token)
                    self.redirect()
                }
            }).catch(function (error) {
                console.log(error);
                self.err = "Email or password is incorrect"
            });
        },
        checkForm: function (e) {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            if (email == null || password == null) {
                e.preventDefault();
            } else {
                this.adminAuthenticate()
            }
        },
        redirect() {
            this.$router.push({ path: '/admin' })
        },
        ...userTokenStore.mapMutations([
            'setToken'
        ]),
        setUserToken(token) {
            this.setToken(token);
        }
    }
}
</script>