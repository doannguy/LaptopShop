@extends('layouts.app')

@section('content')
    <div id="kt_app_toolbar" class="app-toolbar py-lg-6 py-3">
        <div id="app_toolbar_container" class="app-container container-fluid d-flex flex-stack flex-md-nowrap flex-wrap">
            <div data-kt-swapper="true" data-kt-swapper-mode="{default: 'prepend', lg: 'prepend'}"
                data-kt-swapper-parent="{default: '#kt_app_content_container', lg: '#app_toolbar_container'}"
                class="page-title d-flex flex-column justify-content-center mb-lg-0 mb-5 me-3 flex-wrap">

                <h1 class="page-heading d-flex fw-bold fs-3 flex-column justify-content-center my-0 text-gray-900">
                    Sản phẩm
                </h1>

                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        <a href="{{ route('dashboard') }}" class="text-muted text-hover-primary">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet w-5px h-2px bg-gray-500"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">Sản phẩm</li>
                </ul>
            </div>
        </div>
    </div>

    <div id="kt_app_content" class="app-content flex-column-fluid">
        <div id="kt_app_content_container" class="app-container">
            <div class="card">
                <div class="card-header border-0 pt-6">
                    <div class="card-title">
                        <div class="d-flex align-items-center position-relative my-1">
                            <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
                                <span class="path1"></span>
                                <span class="path2"></span>
                            </i>
                            <input type="text" id="product-search" class="form-control form-control-solid w-250px ps-12"
                                placeholder="Tìm kiếm" />
                                @csrf
                        </div>
                    </div>
                    <div class="card-toolbar">
                        <div class="d-flex justify-content-end base">
                            <a type="button" class="btn btn-primary btn-add-customer me-2"
                                href="{{ route('product.create') }}">Tạo mới</a>
                        </div>
                    </div>
                </div>
                <div class="card-body pt-0">
                    <table class="table-reponsive table-row-dashed table-bordered fs-6 gy-5 table align-middle"
                        id="product-table">
                        <thead>
                            <tr class="fw-bold fs-7 text-uppercase gs-0 text-start text-gray-500">
                                <th class="min-w-200px">Product</th>
                                <th class="min-w-100px text-end">Số lượng phiên bản</th>
                                <th class="min-w-100px text-end">Dòng sản phẩm</th>
                                <th class="min-w-100px text-end">Thương hiệu</th>
                                <th class="min-w-70px text-end">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="fw-semibold text-gray-600"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    @include('product.index.js')
@endsection
