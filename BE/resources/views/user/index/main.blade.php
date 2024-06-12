@extends('layouts.app')

@section('title')
    Thành viên
@endsection

@section('content')
    <div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
        <div id="app_toolbar_container" class="app-container container-fluid d-flex flex-stack flex-wrap flex-md-nowrap">
            <div data-kt-swapper="true" data-kt-swapper-mode="{default: 'prepend', lg: 'prepend'}"
                data-kt-swapper-parent="{default: '#kt_app_content_container', lg: '#app_toolbar_container'}"
                class="page-title d-flex flex-column justify-content-center flex-wrap me-3 mb-5 mb-lg-0">

                <h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">
                    Danh sách thành viên
                </h1>

                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        <a href="{{ route('dashboard') }}" class="text-muted text-hover-primary">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-500 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">Thành viên</li>
                </ul>
            </div>
        </div>
    </div>

    <div id="kt_app_content" class="app-content flex-column-fluid">
        <div id="kt_app_content_container" class="app-container ">
            <div class="card">
                <div class="card-header border-0 pt-6">
                    <div class="card-title">
                        <div class="d-flex align-items-center position-relative my-1">
                            <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
                                <span class="path1"></span>
                                <span class="path2"></span>
                            </i>
                            <input type="text" id="user-search" class="form-control form-control-solid w-250px ps-12"
                                placeholder="Tìm kiếm" />
                        </div>
                    </div>
                    <div class="card-toolbar">
                        {{-- <div class="d-flex justify-content-end base">
                            <button type="button" class="btn btn-primary btn-add-customer me-2" data-bs-toggle="modal"
                                data-bs-target="#user-modal">Thêm Thành viên</button>
                        </div> --}}
                    </div>
                </div>
                <div class="card-body pt-0">
                    <table class="table table-reponsive align-middle table-row-dashed table-bordered fs-6 gy-5"
                        id="user-table">
                        <thead>
                            <tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
                                <th class="text-center w-10px">STT</th>
                                <th class="text-center min-w-125px">Tên</th>
                                <th class="text-center min-w-125px">Email</th>
                                <th class="text-center min-w-125px">Vai trò</th>
                                <th class="text-center min-w-125px">Ngày tạo</th>
                                <th class="text-center min-w-125px">Trạng thái</th>
                                <th class="text-center min-w-100px">Hành động</th>
                            </tr>
                        </thead>
                        <tbody class="fw-semibold text-gray-600"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('modal')
    @include('user.modal.main')
@endsection

@section('script')
    @include('user.index.js')
@endsection