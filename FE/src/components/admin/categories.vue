<template>
    <div class="flex">
        <router-link :to="{path: `/admin/add-product/add-` + formStep.name}" tag="div"
            class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" v-for="(formStep, index) in formSteps"
            :key="'formSteps'+index" v-if="index <= 8">
            <div class="tile">
                <input tag="input" type="radio" id="inputCheckbox" name="userChoice" class="tile-input">
                <label for="userChoice" class="tile-label">
                    <div class="tile-wrapper">
                        <div class="item-img-wrapper">
                            <img :src="formStep.img" alt="" class="item-img">
                        </div>
                        <h4 class="tile-name">{{formStep.name}}</h4>
                    </div>
                </label>
            </div>
        </router-link>
    </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
    data() {
        return {

        };
    },
    computed: {
        formSteps() {
            return this.$store.state.formSteps
        },
    },
    mounted() {
        this.fetchSteps();
    },

    methods: {
        ...mapActions([
            'fetchSteps'
        ]),
    },
};
</script>

<style scoped>
.input-fields-wrapper {
    height: 100%;
    justify-content: center;
    align-content: center;
}
</style>