<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Your Profile</p>
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="mainDiv">
                <div class="cardStyle">
                    <form name="signupForm" id="signupForm" autocomplete="off" @submit="checkPassword">

                        <img src="@/assets/images/logo.png" id="signupLogo" />

                        <h2 class="formTitle">
                            Change password
                        </h2>

                        <div class="inputDiv">
                            <label class="inputLabel" for="password">New Password</label>
                            <input type="password" id="password" name="password" required v-model="password">
                        </div>

                        <div class="inputDiv">
                            <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required
                                v-model="confirmPassword">
                        </div>

                        <div class="buttonWrapper">
                            <button type="submit" id="submitButton"
                                class="submitButton pure-button pure-button-primary">
                                <span>Continue</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import axios from "@/plugins/axios";
import qs from "qs"
export default {

    data() {
        return {
            password: '',
            confirmPassword: ''
        };
    },
    computed: {
        animation() {
            return this.$store.state.animation
        }
    },
    methods: {
        checkPassword(e) {
            e.preventDefault();
            if (this.password != this.confirmPassword) {
                console.log("password is incorrect")
                alert("Password is not match")
            } else {
                this.changePassword()
                console.log("password is correct")
            }
        },
        async changePassword() {
            const PasswordParams = {
                method: "PUT",
                url: "users/1",
                params: {
                    password: this.password
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(PasswordParams).then(res => {
                // console.log(res)
                if (res.status == "200") {
                    alert("Update successful")
                } else {
                    alert("Something went wrong")
                }
            }).catch(err => {
                console.log(err)
                alert(err.response.data.message)
            })
        },
    },
};
</script>

<style scoped>
.mainDiv {
    display: flex;
    min-height: 100%;
    align-items: center;
    justify-content: center;
    background-color: #f9f9f9;
    font-family: 'Open Sans', sans-serif;
}

.cardStyle {
    width: 500px;
    border-color: #ff008b;
    border: 1px solid #ff008b;
    background: #fff;
    padding: 36px 0;
    border-radius: 10px;
    margin: 30px 0;
    box-shadow: 0px 0 2px 0 #ff008b;
}

#signupLogo {
    max-height: 100px;
    margin: auto;
    display: flex;
    flex-direction: column;
}

.formTitle {
    font-weight: 600;
    margin-top: 20px;
    color: #2F2D3B;
    text-align: center;
}

.inputLabel {
    font-size: 12px;
    color: #555;
    margin-bottom: 6px;
    margin-top: 24px;
}

.inputDiv {
    width: 70%;
    display: flex;
    flex-direction: column;
    margin: auto;
}

input {
    height: 40px;
    font-size: 16px;
    border-radius: 10px;
    border: solid 1px #ff008b;
    padding: 0 11px;
}

input:focus {
    border: solid 1px #ff008b;
    box-shadow: 0 0 0 0.1rem #ff008b;
    outline: none;
}

input:disabled {
    cursor: not-allowed;
    border: solid 1px #eee;
}

.buttonWrapper {
    margin-top: 40px;
}

.submitButton {
    width: 70%;
    height: 40px;
    margin: auto;
    display: block;
    color: #fff;
    background-color: #ff008b;
    border-color: #ff008b;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
    box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
}

.submitButton:disabled,
button[disabled] {
    border: 1px solid #cccccc;
    background-color: #cccccc;
    color: #666666;
}

#loader {
    position: absolute;
    z-index: 1;
    margin: -2px 0 0 10px;
    border: 4px solid #f3f3f3;
    border-radius: 50%;
    border-top: 4px solid #666666;
    width: 14px;
    height: 14px;
    -webkit-animation: spin 2s linear infinite;
    animation: spin 2s linear infinite;
}
</style>