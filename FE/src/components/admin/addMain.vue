<template>
    <div class="wrapper">
        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
                <div class="col-12">
                    <h2 class="tm-block-title d-inline-block">Add MAIN</h2>
                </div>
            </div>
            <div class="row tm-edit-product-row">
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <form class="tm-edit-product-form" autocomplete="off" @submit.prevent="addCOOLER">
                        <div class="row">
                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                <label for="name">Name</label>
                                <input id="name" name="name" v-model="name" type="text" placeholder="Enter COOLER name"
                                    class="form-control validate" required="">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                <label for="description">Socket</label>
                                <input class="form-control validate" v-model="socket" type="text" required=""
                                    wt-ignore-input="true" placeholder="Enter MAIN socket">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group mb-3 col-xs-12 col-sm-4">
                                <label for="description">DIMM</label>
                                <input class="form-control validate" v-model="dimm" type="text" required=""
                                    wt-ignore-input="true" placeholder="Enter DIMM type">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-4">
                                <label for="description">SSD</label>
                                <input class="form-control validate" v-model="ssd" type="text" required=""
                                    wt-ignore-input="true" placeholder="Enter SSD type">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-4">
                                <label for="description">HDD</label>
                                <input class="form-control validate" v-model="hdd" type="text" required=""
                                    wt-ignore-input="true" placeholder="Enter HDD type">
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <label for="description">Image Link</label>
                            <textarea class="form-control validate" rows="5" required="" v-model="image"
                                placeholder="Enter image's embed link"></textarea>
                        </div>
                        <div class="row">
                            <div class="form-group mb-3 col-xs-12 col-sm-4">
                                <label for="description">RAM Capacity</label>
                                <input class="form-control validate" v-model="capacity" type="text" required=""
                                    wt-ignore-input="true" placeholder="Enter RAM Capacity">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-4">
                                <label for="description">Form</label>
                                <input class="form-control validate" v-model="form" type="text" required=""
                                    wt-ignore-input="true" placeholder="Enter Form type">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-4">
                                <label for="stock">Price ($)</label>
                                <input placeholder="Price in $USD" id="price" name="price" type="number" v-model="price"
                                    class="form-control validate" min="0" required="">
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block text-uppercase">Add
                                MAIN</button>
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
            socket: '',
            dimm: '',
            ssd: '',
            hdd: '',
            form: '',
            image: '',
            capacity: '',
            price: null,
        };
    },

    mounted() {

    },

    methods: {
        async addCOOLER(e) {
            const coolerData = {
                method: "POST",
                url: "pr_attributes",
                params: {
                    product_id: 3,
                    name: this.name,
                    socket: this.socket,
                    dimm: this.dimm,
                    ssd: this.ssd,
                    hdd: this.hdd,
                    form: this.form,
                    capacity: this.capacity,
                    img: this.image,
                    price: this.price
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(coolerData).then(res => {
                console.log(res)
                e.preventDefault();
                if (res.request.status >= 200 && res.request.status < 300) {
                    alert("Add MAIN successful!")
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
    width: 95%;
}
</style>