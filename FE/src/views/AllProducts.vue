<template>
    <div class="view-container">
        <article>
            <header>
                <div class="view-progress">
                    <h3>Search Options</h3>
                    <hr>
                    <div class="center-search">
                        <p>Brands</p>
                        <v-select multiple label="name" :options="brandsOptions" :reduce="name => name.id"
                            class="form-control" v-model="brand">
                        </v-select>
                        <hr>
                        <p>Components</p>
                        <v-select multiple label="name" :options="formSteps" :reduce="name => name.id"
                            class="form-control" v-model="components">
                        </v-select>
                    </div>
                </div>
            </header>
            <section :class="animation">
                <div class="section-header">
                    <p class="section-title">Products</p>
                </div>
                <div class="separator"></div>
                <div class="input-fields">

                </div>
                <div class="actions">
                    <router-link :to="{ name: 'build-guide' }" tag="button" @mouseleave.native="rotateBackGuide"
                        @mouseenter.native="resetBgGuide" id="action-guide">Build Guides</router-link>
                    <router-link :to="{ name: 'home' }" tag="button" @mouseleave.native="rotateBackPicker"
                        @mouseenter.native="resetBgPicker" id="action-picker">PC Part Picker</router-link>
                    <router-link :to="{ name: 'pre-build' }" tag="button" @mouseleave.native="rotateBackRouter"
                        @mouseenter.native="resetBgRouter" id="action-router">Pre-build</router-link>
                </div>
            </section>
        </article>
    </div>
</template>
  
<script>
import { createNamespacedHelpers } from 'vuex'
const brandsStore = createNamespacedHelpers('brandsData')
const formStepsStore = createNamespacedHelpers('formStepsData')
const searchStore = createNamespacedHelpers('search')
import vSelect from "vue-select";
export default {
    data() {
        return {
            animation: "animate-in",
            brand: null,
            components: null
        };
    },
    watch: {
        'brand': function () {
            this.setSelectedBrand(this.brand)
            setTimeout(() => {
                this.fetchAllWithSearch()
            }, 100);
        },
        'components': function () {
            this.setSelectedComponent(this.components)
            setTimeout(() => {
                this.fetchAllWithSearch()
            }, 100);
        }
    },
    components: {
        "v-select": vSelect
    },
    computed: {
        ...brandsStore.mapState([
            'brandsOptions'
        ]),
        ...formStepsStore.mapState([
            'formSteps'
        ])
    },
    mounted() {
        this.fetchAllDatas();
        this.fetchSteps()
        this.fetchAllWithSearch()
    },
    methods: {
        ...searchStore.mapMutations([
            'setSelectedBrand',
            'setSelectedComponent'
        ]),
        ...searchStore.mapActions([
            'fetchAllWithSearch'
        ]),
        ...brandsStore.mapActions([
            'fetchAllDatas'
        ]),
        ...formStepsStore.mapActions([
            'fetchSteps'
        ]),
        rotateBackRouter() {
            const btn = document.getElementById("action-router");
            btn.classList.add("bg-back");
        },
        resetBgRouter() {
            const btn = document.getElementById("action-router");
            btn.classList.remove("bg-back");
        },
        rotateBackPicker() {
            const btn = document.getElementById("action-picker");
            btn.classList.add("bg-back");
        },
        resetBgPicker() {
            const btn = document.getElementById("action-picker");
            btn.classList.remove("bg-back");
        },
        rotateBackGuide() {
            const btn = document.getElementById("action-guide")
            btn.classList.add("bg-back");
        },
        resetBgGuide() {
            const btn = document.getElementById("action-guide")
            btn.classList.remove("bg-back");
        },
    },
};
</script>
  
<style scoped>
@import url(@/assets/styles/customDropdown.css);
@import "vue-select/dist/vue-select.css";

article header {
    width: 250px;
    padding: 10px;
    justify-content: unset;
}

article section {
    width: 87%;
}

.view-progress {
    width: 100%;
}
</style>