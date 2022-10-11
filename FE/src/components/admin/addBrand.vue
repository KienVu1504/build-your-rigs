<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Add Product</p>
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">
                <div class="wrapper">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Add Brand</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form action="" class="tm-edit-product-form" autocomplete="off"
                                    @submit.prevent="addPSU">
                                    <div class="form-group mb-3">
                                        <label for="name">Name</label>
                                        <input id="name" name="name" v-model="name" type="text"
                                            placeholder="Enter brand name" class="form-control validate" required="">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="description">Image Link</label>
                                        <textarea class="form-control validate" rows="5" required="" v-model="image"
                                            placeholder="Enter image's embed link"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Add
                                            Brand</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
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
            name: '',
            wattage: '',
            image: '',
            price: null,
        };
    },

    mounted() {

    },
    computed: {
        animation() {
            return this.$store.state.animation
        },
    },
    methods: {
        async addPSU(e) {
            const psuData = {
                method: "POST",
                url: "pr_attributes",
                params: {
                    product_id: 9,
                    name: this.name,
                    img: this.image,
                    wattage: this.wattage,
                    price: this.price
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(psuData).then(res => {
                console.log(res)
                e.preventDefault();
                if (res.request.status >= 200 && res.request.status < 300) {
                    alert("Add BRAND successful!")
                    this.$router.push({ path: "/admin/add-product" })
                } else {
                    alert("Something went wrong, please try again!")
                }
            }).catch(err => {
                console.log(err)
                e.preventDefault();
                alert("Something went wrong, please try again!")
            })
        },
    },
};
</script>

<style scoped>
@import url(@/assets/styles/admin.css);

.wrapper {
    width: 40%;
}

.input-fields-wrapper {
    justify-content: center;
    align-items: center;
    height: 100%;
}
</style>