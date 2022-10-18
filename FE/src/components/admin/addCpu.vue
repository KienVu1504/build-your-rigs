<template>
    <div class="wrapper">
        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
                <div class="col-12">
                    <h2 class="tm-block-title d-inline-block">Add CPU</h2>
                </div>
            </div>
            <div class="row tm-edit-product-row">
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <form action="" class="tm-edit-product-form" autocomplete="off" @submit.prevent="addCPU">
                        <div class="form-group mb-3">
                            <label for="name">Name</label>
                            <input id="name" name="name" v-model="name" type="text" placeholder="Enter CPU name"
                                class="form-control validate" required="">
                        </div>
                        <div class="row">
                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                <label for="description">Socket</label>
                                <input class="form-control validate" v-model="socket" type="text" required=""
                                    wt-ignore-input="true" placeholder="Enter CPU socket">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                <label for="stock">Brands</label>
                                <v-select label="name" :options="options" :reduce="name => name.id" class="form-control"
                                    v-model="brand">
                                </v-select>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <label for="description">Image</label>
                            <textarea class="form-control validate" rows="4" v-model="image"
                                placeholder="Enter image's embed link"></textarea>
                        </div>
                        <div class="form-group mb-3 image-upload">
                            <label for="inputTag">
                                Select Image <br />
                                <center>
                                    <i class="fa fa-2x fa-camera"></i>
                                </center>
                                <input id="inputTag" name="image" ref="imgInput" type="file" />
                                <br />
                                <span id="imageName"></span>
                            </label>
                        </div>
                        <div class="row">
                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                <label for="expire_date">Wattage (W)</label>
                                <input id="wattage" placeholder="Example: 65" required name="wattage" type="number"
                                    v-model="wattage" class="form-control validate hasDatepicker" data-large-mode="true"
                                    min="0">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                <label for="stock">Price ($)</label>
                                <input placeholder="Price in $USD" id="price" name="price" type="number" v-model="price"
                                    class="form-control validate" min="0" required="">
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block text-uppercase">Add
                                CPU</button>
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
import { createNamespacedHelpers } from 'vuex'
const brandStore = createNamespacedHelpers('brandsData')

export default {
    data() {
        return {
            name: '',
            socket: '',
            image: '',
            wattage: null,
            price: null,
            brand: null,
        };
    },
    computed: {
        options() {
            return this.$store.state.brandsData.brandsOptions
        }
    },
    mounted() {
        this.fetchAllDatas();
    },

    methods: {
        ...brandStore.mapActions([
            'fetchAllDatas'
        ]),
        addCPU(e) {
            console.log(this.$refs.imgInput.files);
            let formData = new FormData();
            formData.append("product_id", 1);
            formData.append("name", this.name);
            formData.append("socket", this.socket);
            formData.append("brand_id", this.brand);
            formData.append("img", this.image);
            formData.append("wattage", this.wattage);
            formData.append("price", this.price);
            if (this.$refs.imgInput.files[0]) formData.append("image", this.$refs.imgInput.files[0]);
            axios.post(`pr_attributes`, formData, {
                headers: {
                    "Content-Type": "multipart/form-data",
                },
            }).then(() => {
                this.$refs.imgInput.value = ''
                alert("Add CPU successfully!")
                this.$router.push({ path: "/admin/add-product" })
                e.preventDefault();
            }).catch(() => {
                alert("Something wrong happen !");
                e.preventDefault();
            });
        },
    },
};
</script>

<style scoped>
@import url(@/assets/styles/admin.css);
@import url(@/assets/styles/customDropdown.css);

.wrapper {
    width: 95%;
}

.input-fields-wrapper {
    justify-content: center;
    align-items: center;
    height: 100%;
}

.image-upload input {
    display: none;
}

.image-upload label {
    cursor: pointer;
}

.image-upload #imageName {
    color: green;
}
</style>