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
                                    @submit.prevent="addBrand">
                                    <div class="form-group mb-3">
                                        <label for="name">Name</label>
                                        <input id="name" name="name" v-model="name" type="text"
                                            placeholder="Enter brand name" class="form-control validate" required="">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="description">Add image link</label>
                                        <textarea class="form-control validate" rows="5" v-model="image"
                                            placeholder="Enter image's embed link"></textarea>
                                    </div>
                                    <label>Or</label>
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
import { mapState } from 'vuex'
export default {
    data() {
        return {
            name: '',
            image: ''
        };
    },
    computed: {
        ...mapState([
            'animation'
        ])
    },
    methods: {
        addBrand(e) {
            console.log(this.$refs.imgInput.files);
            let formData = new FormData();
            formData.append("name", this.name);
            formData.append("img", this.image);
            if (this.$refs.imgInput.files[0]) formData.append("image", this.$refs.imgInput.files[0]);
            axios.post(`brands`, formData, {
                headers: {
                    "Content-Type": "multipart/form-data",
                },
            }).then(() => {
                this.$refs.imgInput.value = ''
                alert("Add brand successfully!")
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

.wrapper {
    width: 40%;
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