<div class="modal fade" id="product-option-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-650px">
        <div class="modal-content">
            <form class="form" action="#" id="product-option-form">
                <div class="modal-header" id="modal-header">
                    <h2 class="fw-bold">Thông tin phiên bản sản phẩm</h2>
                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ki-duotone ki-cross fs-1">
                            <span class="path1"></span>
                            <span class="path2"></span>
                        </i>
                    </div>
                </div>
                <div class="modal-body px-lg-17 py-10">
                    @csrf
                    <input type="text" name="id" class="d-none" >
                    <div class="fv-row">
                        <label class="required form-label">Tên phiên
                            bản</label>
                        <input type="text" class="form-control product-option-name option-name mb-2" name="name"
                            placeholder="Bản RAM:8GB SSD:512GB" value="" />
                    </div>
                    <div class="fv-row">
                        <label class="form-label">Ảnh sản phẩm</label>
                        <div class="dropzone" id="dropzone_product_option">
                            <!--begin::Message-->
                            <div class="dz-message needsclick">
                                <i class="ki-duotone ki-file-up fs-3x text-primary"><span class="path1"></span><span
                                        class="path2"></span></i>

                                <!--begin::Info-->
                                <div class="ms-4">
                                    <h3 class="fs-5 fw-bold mb-1 text-gray-900">Drop files here or click to upload.</h3>
                                    <span class="fs-7 fw-semibold text-gray-500">Upload up to 10 files</span>
                                </div>
                                <!--end::Info-->
                            </div>
                        </div>
                    </div>
                    <div class="fv-row">
                        <label class="required form-label">Số lượng</label>
                        <input type="number" class="form-control option-amount mb-2" name="amount" placeholder=""
                            value="" />
                    </div>
                    <div class="fv-row">
                        <label class="required form-label">Giá gốc</label>
                        <input type="number" class="form-control option-price mb-2" name="price" placeholder=""
                            value="" />
                    </div>
                    <div class="fv-row">
                        <label class="required form-label">Giá khuyến
                            mại</label>
                        <input type="number" class="form-control option-current-price mb-2" name="current_price"
                            placeholder="" value="" />
                    </div>
                    <div class="fv-row">
                        <label class="required form-label">Trạng thái</label>
                        <select class="form-select option-status data-hide-search= mb-2" name="status"
                            data-placeholder="Chọn trạng thái">
                            <option></option>
                            <option value="0" selected="selected">Công khai</option>
                            <option value="1">Hết hàng</option>
                            <option value="2">Ẩn</option>
                        </select>`
                    </div>
                    <div class="fv-row">
                        <h4>Cấu hình sản phẩm</h4>
                        <div class="" data-kt-ecommerce-catalog-add-product="auto-options">
                            <label class="form-label">Chọn cấu hình cho sản
                                phẩm</label>
                            <div class="product-attribute-form">
                                <div class="form-group">
                                    <div data-repeater-list="product_attribute" class="d-flex flex-column gap-3" >
                                        <div data-repeater-item=""
                                            class="form-group d-flex align-items-center variable-select-form flex-wrap gap-5">
                                            <div class="w-100 w-md-200px">
                                                <select class="form-select product-variable" name="product_variable"
                                                    data-placeholder="Chọn tên cấu hình">
                                                    <option></option>
                                                    @foreach ($attributes as $attribute)
                                                        <option value="{{ $attribute['id'] }}">
                                                            {{ $attribute['name'] }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="w-100 w-md-200px">
                                                <select class="form-select product-variable-value"
                                                    name="product_variable_value" disabled
                                                    data-placeholder="Chọn tên cấu hình"
                                                    data-kt-ecommerce-catalog-add-product="product_variable_value">
                                                    <option></option>
                                                </select>
                                            </div>
                                            <button type="button" data-repeater-delete
                                                class="btn btn-sm btn-icon btn-light-danger">
                                                <i class="ki-duotone ki-cross fs-1">
                                                    <span class="path1"></span>
                                                    <span class="path2"></span>
                                                </i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-5">
                                    <button type="button" data-repeater-create class="btn btn-sm btn-light-primary">
                                        <i class="ki-duotone ki-plus fs-2"></i>Thêm
                                        cấu hình sản
                                        phẩm</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer flex-center">
                    <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">
                        <span class="indicator-label">Xác nhận</span>
                        <span class="indicator-progress">
                            Loading... <span class="spinner-border spinner-border-sm ms-2 align-middle"></span>
                        </span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

