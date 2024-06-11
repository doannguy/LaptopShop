 <div id="product-options">
     <div class="form-group">
         <div data-repeater-list="product-option-list">
             <div class="form-group">
                 <div data-repeater-item class="card product-option my-10">
                     <div class="card-header d-flex justify-content-between align-items-center">
                         <h5 class="mb-0">
                             <a class="btn btn-link collapse-button" data-bs-toggle="collapse" href="#collapseExample"
                                 aria-expanded="true" aria-controls="collapseExample">
                                 Phiên bản chưa có tên
                             </a>
                         </h5>
                         <button type="button" data-repeater-delete class="btn btn-sm btn-icon btn-light-danger">
                             <i class="ki-duotone ki-cross fs-1">
                                 <span class="path1"></span>
                                 <span class="path2"></span>
                             </i>
                         </button>
                     </div>
                     <div class="card-body form-group show collapse" id="collapseExample">

                         <div class="fv-row">
                             <label class="required form-label">Tên phiên
                                 bản</label>
                             <input type="text" class="form-control product-option-name mb-2 option-name"
                                 placeholder="Bản RAM:8GB SSD:512GB" value="" />
                         </div>
                         <div class="fv-row">
                             <label class="form-label">Ảnh sản phẩm</label>
                             <input type="file" multiple accept="image/*" class="form-control mb-2 option-image">
                         </div>
                         <div class="fv-row">
                             <label class="required form-label">Số lượng</label>
                             <input type="number" class="form-control mb-2 option-amount" placeholder=""
                                 value="" />
                         </div>
                         <div class="fv-row">
                             <label class="required form-label">Giá gốc</label>
                             <input type="number" name=" " class="form-control mb-2 option-price" placeholder=""
                                 value="" />
                         </div>
                         <div class="fv-row">
                             <label class="required form-label">Giá khuyến
                                 mại</label>
                             <input type="number" class="form-control mb-2 option-current-price" placeholder=""
                                 value="" />
                         </div>
                         <div class="fv-row">
                             <label class="required form-label">Trạng thái</label>
                             <select class="form-select mb-2 option-status
                                 data-hide-search="true" data-placeholder="Chọn trạng thái"
                                 >
                                 <option></option>
                                 <option value="0" selected="selected">Công khai</option>
                                 <option value="1">Hết hàng</option>
                                 <option value="2">Ẩn</option>
                             </select>
                         </div>
                         <div class="fv-row">
                             <h4>Cấu hình sản phẩm</h4>
                             <div class="" data-kt-ecommerce-catalog-add-product="auto-options">
                                 <label class="form-label">Chọn cấu hình cho sản
                                     phẩm</label>
                                 <div class="product-attribute-form">
                                     <div class="form-group">
                                         <div data-repeater-list="product_attribute_values"
                                             class="d-flex flex-column gap-3">
                                             <div data-repeater-item=""
                                                 class="form-group d-flex align-items-center variable-select-form flex-wrap gap-5">
                                                 <div class="w-100 w-md-200px">
                                                     <select class="form-select product-variable"
                                                         name="product_variable" data-placeholder="Chọn tên cấu hình">
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
                                         <button type="button" data-repeater-create
                                             class="btn btn-sm btn-light-primary">
                                             <i class="ki-duotone ki-plus fs-2"></i>Thêm
                                             cấu hình sản
                                             phẩm</button>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="form-group mt-5">
                     <button type="button" data-repeater-create class="btn btn-sm btn-light-primary">
                         <i class="ki-duotone ki-plus fs-2"></i>Thêm phiên bản
                         mới</button>
                 </div>
             </div>
         </div>
     </div>
 </div>
