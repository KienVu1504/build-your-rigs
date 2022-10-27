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
                            <div class="form-group mb-3 col-xs-12 col-sm-8">
                                <label for="name">Name</label>
                                <input id="name" name="name" v-model="name" type="text" placeholder="Enter COOLER name"
                                    class="form-control validate" required="">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-2">
                                <label for="description">Socket</label>
                                <input class="form-control validate" v-model="socket" type="text" required=""
                                    wt-ignore-input="true" placeholder="Enter MAIN socket">
                            </div>
                            <div class="form-group mb-3 col-xs-12 col-sm-2">
                                <label for="stock">Brands</label>
                                <v-select label="name" :options="brandsOptions" :reduce="name => name.id"
                                    class="form-control" v-model="brand">
                                </v-select>
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
                            <label for="description">Image</label>
                            <textarea class="form-control validate" rows="5" v-model="image"
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
import { createNamespacedHelpers } from 'vuex'
const brandStore = createNamespacedHelpers('brandsData')

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
            brand: null,
            capacity: '',
            price: null,
        };
    },
    computed: {
        ...brandStore.mapState([
            'brandsOptions'
        ])
    },
    mounted() {
        this.fetchAllDatas();
    },
    methods: {
        ...brandStore.mapActions([
            'fetchAllDatas'
        ]),
        addCOOLER(e) {
            let formData = new FormData();
            formData.append("product_id", 3);
            formData.append("name", this.name);
            formData.append("socket", this.socket);
            formData.append("brand_id", this.brand);
            formData.append("dimm", this.dimm);
            formData.append("img", this.image);
            formData.append("ssd", this.ssd);
            formData.append("hdd", this.hdd);
            formData.append("form", this.form);
            formData.append("capacity", this.capacity);
            formData.append("price", this.price);
            if (this.$refs.imgInput.files[0]) formData.append("image", this.$refs.imgInput.files[0]);
            axios.post(`pr_attributes`, formData, {
                headers: {
                    "Content-Type": "multipart/form-data",
                },
            }).then(() => {
                this.$refs.imgInput.value = ''
                alert("Add MAIN successfully!")
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