<template>
    <div class="wrapper">
        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
                <div class="col-12">
                    <h2 class="tm-block-title d-inline-block">Add SSD</h2>
                </div>
            </div>
            <div class="row tm-edit-product-row">
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <form action="" class="tm-edit-product-form" autocomplete="off" @submit.prevent="addSSD">
                        <div class="form-group mb-3">
                            <label for="name">Name</label>
                            <input id="name" name="name" v-model="name" type="text" placeholder="Enter SSD name"
                                class="form-control validate" required="">
                        </div>
                        <div class="form-group mb-3">
                            <label for="description">Type</label>
                            <input class="form-control validate" v-model="ssd" type="text" required=""
                                wt-ignore-input="true" placeholder="Enter SSD type">
                        </div>
                        <div class="form-group mb-3">
                            <label for="description">Image Link</label>
                            <textarea class="form-control validate" rows="5" required="" v-model="image"
                                placeholder="Enter image's embed link"></textarea>
                        </div>
                        <div class="row">
                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                <label for="expire_date">Capacity (GB)</label>
                                <input id="wattage" placeholder="Enter SSD capacity" required name="wattage"
                                    type="number" v-model="capacity" class="form-control validate hasDatepicker"
                                    data-large-mode="true" min="0">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                <label for="stock">Price ($)</label>
                                <input placeholder="Price in $USD" id="price" name="price" type="number" v-model="price"
                                    class="form-control validate" min="0" required="">
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block text-uppercase">Add SSD</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "@/plugins/axios";
import qs from "qs"
export default {
    data() {
        return {
            name: '',
            ssd: '',
            image: '',
            capacity: null,
            price: null,
        };
    },

    mounted() {

    },

    methods: {
        async addSSD(e) {
            const ssdData = {
                method: "POST",
                url: "pr_attributes",
                params: {
                    product_id: 5,
                    name: this.name,
                    ssd: this.ssd,
                    img: this.image,
                    capacity: this.capacity,
                    price: this.price
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(ssdData).then(res => {
                console.log(res)
                e.preventDefault();
                if (res.request.status >= 200 && res.request.status < 300) {
                    alert("Add SSD successful!")
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
</style>