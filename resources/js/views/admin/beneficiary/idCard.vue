<template>
    <view-page>
        <div id="printIdCard">
            <div id="id_card_3">
                <div class="employee_id_card main_card portrait mb-5">
                    <div class="front_id_card card_equal d-flex flex-column">
                        <div class="top_m d-flex justify-content-center align-items-center">
                            <h5 class="text-white text-center fw-bold">Beneficiary ID</h5>
                        </div>
                        <div class="main_info">
                            <div class="org_logo d-flex justify-content-center gap-3">
                                <div class="logo">
                                    <img src="http://103.163.247.4:8081/design/aosed/images/logo.webp" class="img-fluid"
                                        alt="">
                                </div>
                                <h6 class="pt-3">An Organization for Socio-Economic Development-AOSED</h6>
                            </div>
                            <div class="image_m"
                                style="display: flex; justify-content: center; align-items: center; width: 100%;">
                                <img :src="data?.thumb_one ? data?.thumb_one : emptyImage()" alt="img-cover"
                                    style="width: 150px; height: 150px; border-radius: 50%; object-fit: cover;">
                            </div>

                            <div class="text_m text-center">
                                <h1 class="name">{{ ucfirst(data.full_name ?? "") }}</h1>
                                <h4 class="id">{{ ucfirst(data.id ?? "") }}</h4>
                                <h5 class="group">B+</h5>
                            </div>
                        </div>
                        <div class="top_m d-flex align-items-center justify-content-center mt-auto">
                            <h6 class="web text-white">htpps://aosed.org/</h6>
                        </div>
                    </div>
                    <div class="back_id_card card_equal d-flex flex-column">
                        <div class="top_m d-flex justify-content-center align-items-center">
                            <h5 class="text-white text-center fw-bold">Personal Information</h5>
                        </div>
                        <div class="main_info">
                            <div class="personal">
                                <div class="info d-flex">
                                    <p>Name</p>
                                    <p>:</p>
                                    <p class="ps-2 fw-bold text-dark">{{ data.full_name ?? "" }}</p>
                                </div>
                                <div class="info d-flex">
                                    <p>Date of Birth</p>
                                    <p>:</p>
                                    <p class="ps-2">{{ enFormat(data.date_of_birth ?? "") }}</p>
                                </div>
                                <div class="info d-flex">
                                    <p>NID No</p>
                                    <p>:</p>
                                    <p class="ps-2 fw-bold text-dark">{{ data.nid ?? "" }}</p>
                                </div>
                                <div class="info d-flex">
                                    <p>Address</p>
                                    <p>:</p>
                                    <p class="ps-2">{{ data.permanent_address ?? "" }}</p>
                                </div>
                                <div class="info d-flex">
                                    <p class="text-dark fw-bold">Contact No</p>
                                    <p class="text-dark fw-bold">:</p>
                                    <p class="text-dark fw-bold ps-2">{{ data.mobile_no ?? "" }}</p>
                                </div>
                            </div>
                            <div class="instruction pt-1">
                                <h6 class="fw-bold text-dark">Instruction</h6>
                                <p>This card is non-transferable. If found, please return it to the owner or report it
                                    to the nearest police station</p>
                            </div>
                            <div class="qr-co">
                                <span v-html="data.qr_code"></span>
                            </div>
                            <div class="info d-flex emergency text-danger pt-1">
                                <h6 class="fw-bold">Emergency Contact</h6>
                                <h6 class="fw-bold">: </h6>
                                <h6 class="fw-bold ps-2">{{ data.emergencey_contact ?? "" }}</h6>
                            </div>
                            <div class="instruction">
                                <p>{{ data.permanent_address ?? "" }}</p>
                            </div>
                            <div class="qr-co text-center pt-3">
                                <img v-if="qrCodeDataUrl" :src="qrCodeDataUrl" alt="QR Code"
                                    style="width: 150px; height: 150px;">
                            </div>
                        </div>
                        <div class="top_m d-flex align-items-center justify-content-center mt-auto">
                            <h6 class="web text-white">htpps://aosed.org/</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="print_id_card mb-3">
            <button type="button" class="print_id_card_btn" @click="printCard"><i class="fa-solid fa-id-card-clip"
                    aria-hidden="true"></i> Print Id
                Card</button>
        </div>
    </view-page>
</template>

<script>
import QRCode from "qrcode";
const model = "beneficiary";
export default {
    data() {
        return {
            page_title: "",
            model: model,
            data: {
                qrCodeDataUrl: "", // To store the QR code URL

            },
            fileColumns: [{ field: "thumb_one", title: "Image" },],
        };
    },
    methods: {
        printCard() {
            const printContents = document.getElementById('printIdCard').innerHTML;
            const originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
            window.location.reload();
        },
        emptyImage() {
            return `${this.$root.baseurl}/public/images/user.png`;
        },
        generateQRCode() {
            const baseUrl = this.$root.baseurl;
            const beneficiaryId = this.data.id ?? "";
            if (!beneficiaryId) {
                console.error("Beneficiary ID is missing");
                return;
            }
            const qrLink = `${baseUrl}/admin/backend/beneficiary-profile/${beneficiaryId}`;
            QRCode.toDataURL(qrLink)
                .then(url => {
                    this.qrCodeDataUrl = url;
                    console.log('Generated QR Code Link:', qrLink);
                    console.log('QR Code Data URL:', this.qrCodeDataUrl);
                })
                .catch(error => {
                    console.error("Error generating QR code:", error);
                });
        },
    },
    watch: {
        'data.id': function (newValue) {
            if (newValue) {
                this.generateQRCode();
            }
        },
    },
    created() {
        this.page_title = `${this.headline(this.model)} ID Card`;
        this.get_data(`${this.model}/${this.$route.params.id}`);
        // console.log('route',this.$root.baseurl);

    },
};

</script>
