@extends('layouts.app')
@section('content')
    <div id="kt_app_toolbar" class="app-toolbar py-lg-6 py-3">
        <div id="app_toolbar_container" class="app-container container-fluid d-flex flex-stack flex-md-nowrap flex-wrap">
            <div data-kt-swapper="true" data-kt-swapper-mode="{default: 'prepend', lg: 'prepend'}"
                data-kt-swapper-parent="{default: '#kt_app_content_container', lg: '#app_toolbar_container'}"
                class="page-title d-flex flex-column justify-content-center mb-lg-0 mb-5 me-3 flex-wrap">
                <h1 class="page-heading d-flex fw-bold fs-3 flex-column justify-content-center my-0 text-gray-900">
                    Thêm Sản phẩm
                </h1>
                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        <a href="{{ route('dashboard') }}" class="text-muted text-hover-primary">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet w-5px h-2px bg-gray-500"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">
                        <a href="{{ route('product.index') }}" class="text-muted text-hover-primary">Danh sách sản phẩm></a>
                    </li>
                    <li class="breadcrumb-item text-muted">Thêm sản phẩm</li>
                </ul>
            </div>
        </div>
    </div>
    <div id="kt_app_content" class="app-content flex-column-fluid">
        <div id="kt_app_content_container" class="app-container container-xxl">
            <form id="product-save-form" class="form d-flex flex-column flex-lg-row"
                data-kt-redirect="apps/ecommerce/catalog/products.html">
                @csrf
                <div class="d-flex flex-column gap-lg-10 w-100 w-lg-300px me-lg-10 mb-7 gap-7">
                    <div class="card card-flush py-4">
                        <div class="card-header">
                            <div class="card-title">
                                <h2>Ảnh bìa</h2>
                            </div>
                        </div>
                        <div class="card-body pt-0 text-center">
                            <style>
                                .image-input-placeholder {
                                    background-image: url('assets/media/svg/files/blank-image.svg');
                                }

                                [data-bs-theme="dark"] .image-input-placeholder {
                                    background-image: url('assets/media/svg/files/blank-image-dark.svg');
                                }
                            </style>
                            <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3"
                                data-kt-image-input="true">
                                <div class="image-input-wrapper w-150px h-150px"></div>
                                <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                    data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                    <i class="ki-duotone ki-pencil fs-7">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                    </i>
                                    <input type="file" name="thumbnail" accept=".png, .jpg, .jpeg" />
                                    <input type="hidden" name="thumbnail_remove" />
                                </label>
                                <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                    data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel avatar">
                                    <i class="ki-duotone ki-cross fs-2">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                    </i>
                                </span>
                                <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                    data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove avatar">
                                    <i class="ki-duotone ki-cross fs-2">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                    </i>
                                </span>
                            </div>
                            <div class="text-muted fs-7">Thiết lập ảnh bìa cho sản phẩm. Chỉ chấp nhận các tệp hình ảnh
                                *.png, *.jpg và *.jpeg</div>
                        </div>
                    </div>

                    <div class="card card-flush py-4">
                        <div class="card-header">
                            <div class="card-title">
                                <h2>Danh mục sản phẩm</h2>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <select class="form-select" name="category" data-control="select2"
                                data-placeholder="Chọn loại sản phẩm">
                                <option></option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                            </select>
                            <div class="mt-5">
                                <label class="form-label"> Dòng sản phẩm</label>
                                <select name="product_seri" class="form-select" data-control="select2"
                                    data-placeholder="Chọn dòng sản phẩm" disabled></select>
                            </div>
                            <div class="text-muted fs-7 mb-7">Thêm sản phẩm vào danh mục.</div>
                            <a href="{{ route('category.index') }}" class="btn btn-light-primary btn-sm mb-10">
                                <i class="ki-duotone ki-plus fs-2"></i>Tạo danh mục mới</a>
                        </div>
                    </div>
                    <div class="card card-flush py-4">
                        <div class="card-header">
                            <div class="card-title">
                                <h2>Thương hiệu</h2>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <select class="form-select" name="brand" data-control="select2"
                                data-placeholder="Chọn loại sản phẩm">
                                <option></option>
                                @foreach ($brands as $brand)
                                    <option value="{{ $brand->id }}">{{ $brand->name }}</option>
                                @endforeach
                            </select>

                            <div class="text-muted fs-7 mb-7">Chọn thương hiệu của sản phẩm.</div>
                            <a href="{{ route('brand.index') }}" class="btn btn-light-primary btn-sm mb-10">
                                <i class="ki-duotone ki-plus fs-2"></i>Tạo thương hiệu mới</a>
                        </div>
                    </div>
                </div>
                <div class="d-flex flex-column flex-row-fluid gap-lg-10 gap-7">
                    <ul class="nav nav-custom nav-tabs nav-line-tabs nav-line-tabs-2x fs-4 fw-semibold mb-n2 border-0">
                        <li class="nav-item">
                            <a class="nav-link text-active-primary active pb-4" data-bs-toggle="tab"
                                href="#kt_ecommerce_add_product_general">Thông tin chung</a>
                        </li>

                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="kt_ecommerce_add_product_general" role="tab-panel">
                            <div class="d-flex flex-column gap-lg-10 gap-7">
                                <div class="card card-flush py-4">
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h2>Thông tin chung</h2>
                                        </div>
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="fv-row mb-10">
                                            <label class="required form-label">Tên sản phẩm</label>
                                            <input type="text" name="name" class="form-control mb-2"
                                                placeholder="Product name" value="" />
                                            <div class="text-muted fs-7">Tên sản phẩm là bắt buộc và được khuyến nghị phải
                                                là duy nhất.</div>
                                        </div>
                                        <div class="fv-row mb-10">
                                            <label class="required form-label">Mô tả ngắn</label>
                                            <textarea type="text" name="short_description" class="form-control mb-2" placeholder="Mô tả ngắn về sản phẩm"
                                                maxlength="255"></textarea>
                                            <div class="text-muted fs-7">Mô tả ngắn gọn, tổng quát về sản phẩm này</div>
                                        </div>
                                        <div>
                                            <label class="form-label">Mô tả sản phẩm</label>
                                            <textarea id="add_product_description" name="description" class="min-h-200px mb-2">
                                            </textarea>
                                            <div class="text-muted fs-7"> mô tả chi tiết cho sản phẩm để hiển thị tốt hơn.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card card-flush mb-10 py-4">
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h2>Phiên bản sản phẩm</h2>
                                        </div>
                                    </div>
                                    <div class="card-body pt-0">
                                        <div>
                                            <label class="form-label">Thêm các phiên bản cho sản phẩm này</label>
                                            <div class="text-muted fs-7">một mẫu sản phẩm sẽ có rất
                                                nhiều phiên bản khác nhau, có thể khác nhau về màu sắc,
                                                dung lượng và giá thành.</div>
                                            @include('product.components.product_option_form')
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="d-flex justify-content-end">
                            <a href="{{ route('product.index') }}" id="kt_ecommerce_add_product_cancel"
                                class="btn btn-light me-5">Quay lại</a>
                            <button type="submit" id="kt_ecommerce_add_product_submit" class="btn btn-primary">
                                <span class="indicator-label">Tạo sản phẩm</span>
                                <span class="indicator-progress">Please wait...
                                    <span class="spinner-border spinner-border-sm ms-2 align-middle"></span></span>
                            </button>
                        </div>
                    </div>
            </form>
        </div>
    </div>
@endsection
@section('script')
    <script src="assets/plugins/custom/datatables/datatables.bundle.js"></script>
    <script src="assets/plugins/custom/formrepeater/formrepeater.bundle.js"></script>
    {{-- <script src="assets/js/custom/apps/ecommerce/catalog/save-product.js"></script> --}}
    <script src="assets/plugins/custom/ckeditor/ckeditor-classic.bundle.js"></script>
    <script src="assets/js/widgets.bundle.js"></script>
    <script src="assets/js/custom/widgets.js"></script>
    <script src="assets/js/custom/apps/chat/chat.js"></script>
    <script src="assets/js/custom/utilities/modals/upgrade-plan.js"></script>
    <script src="assets/js/custom/utilities/modals/create-app.js"></script>
    <script>
        var _token = "{{ csrf_token() }}";
    </script>
    @include('product.create.js')
@endsection
