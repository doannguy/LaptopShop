@extends('layouts.app')
@section('content')
    <input type="hidden" name="user_id" value="{{ $order->user->id }}">
    <input type="hidden" name="order_id" value="{{ $order->id }}">
    <div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
        <div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
            <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                <h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">
                    Thông tin đơn hàng
                </h1>
                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        <a href="{{ route('dashboard') }}" class="text-muted text-hover-primary">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-500 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">
                        <a href="{{ route('dashboard') }}" class="text-muted text-hover-primary">Đơn hàng</a>
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-500 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">{{ $order->code }}</li>
                </ul>
            </div>
        </div>
    </div>
    <div id="kt_app_content" class="app-content flex-column-fluid">
        <div id="kt_app_content_container" class="app-container container-xxl">
            <div class="d-flex flex-column gap-7 gap-lg-10">
                <div class="d-flex flex-wrap flex-stack gap-5 gap-lg-10">
                    <ul
                        class="nav nav-custom nav-tabs nav-line-tabs nav-line-tabs-2x border-0 fs-4 fw-semibold mb-lg-n2 me-auto">
                        <li class="nav-item">
                            <a class="nav-link text-active-primary pb-4 active" data-bs-toggle="tab"
                                href="#kt_ecommerce_sales_order_summary">Chi tiết</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-active-primary pb-4" data-bs-toggle="tab"
                                href="#kt_ecommerce_sales_order_history">Lịch sử</a>
                        </li>
                    </ul>
                    {{-- <a href="#" onclick="history.back()"
                        class="btn btn-icon btn-light btn-active-secondary btn-sm ms-auto me-lg-n7">
                        <i class="ki-duotone ki-left fs-2"></i>
                    </a> --}}
                    <button type="button" onclick="history.back()" class="btn btn-active-light-primary btn-sm me-lg-n7">
                        <i class="ki-duotone ki-left fs-2"></i>
                        Quay lại
                    </button>
                </div>
                <div class="d-flex flex-column flex-xl-row gap-7 gap-lg-10">
                    <div class="card card-flush py-4 flex-row-fluid">
                        <div class="card-header">
                            <div class="card-title">
                                <h2>Thông tin người dùng</h2>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <div class="table-responsive">
                                <table class="table align-middle table-row-bordered mb-0 fs-6 gy-5 min-w-300px">
                                    <tbody class="fw-semibold text-gray-600">
                                        <tr>
                                            <td class="text-muted">
                                                <div class="d-flex align-items-center">
                                                    <i class="ki-duotone ki-profile-circle fs-2 me-2">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                        <span class="path3"></span>
                                                    </i>
                                                    Tên khách hàng
                                                </div>
                                            </td>
                                            <td class="fw-bold text-end">
                                                <a href="javascript:void(0)"
                                                    class="text-gray-600 text-hover-primary">{{ $order->user->name }}</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted">
                                                <div class="d-flex align-items-center">
                                                    <i class="ki-duotone ki-sms fs-2 me-2">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                    </i>
                                                    Email
                                                </div>
                                            </td>
                                            <td class="fw-bold text-end">
                                                <a href="javascript:void(0)"
                                                    class="text-gray-600 text-hover-primary">{{ $order->user->email }}</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted">
                                                <div class="d-flex align-items-center">
                                                    <i class="ki-duotone ki-devices fs-2 me-2">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                        <span class="path3"></span>
                                                        <span class="path4"></span>
                                                        <span class="path5"></span>
                                                    </i>
                                                    Số lượng đơn hàng
                                                    <span class="ms-1" data-bs-toggle="tooltip"
                                                        title="Tổng số đơn hàng người dùng đã đặt.">
                                                        <i class="ki-duotone ki-information-5 text-gray-500 fs-6">
                                                            <span class="path1"></span>
                                                            <span class="path2"></span>
                                                            <span class="path3"></span>
                                                        </i>
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="fw-bold text-end">
                                                <a href="javascript:void(0)"
                                                    class="text-gray-600 text-hover-primary">{{ count($order->user->orders) }}</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted">
                                                <div class="d-flex align-items-center">
                                                    <i class="ki-duotone ki-calendar fs-2 me-2">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                    </i>
                                                    Ngày tham gia
                                                </div>
                                            </td>
                                            <td class="fw-bold text-end">
                                                <a href="javascript:void(0)"
                                                    class="text-gray-600 text-hover-primary">{{ $order->created_at }}</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-content pb-10">
                    <div class="tab-pane fade show active" id="kt_ecommerce_sales_order_summary" role="tab-panel">
                        <div class="d-flex flex-column gap-7 gap-lg-10">
                            <div class="card card-flush py-4 flex-row-fluid">
                                <div class="card-body pt-0">
                                    <div class="row">
                                        <div class="col-md-6 mb-5">
                                            <div class="fv-row" id="dropdown-status-parent">
                                                <label class="form-label text-gray-600" for="stauts">Trạng thái đơn hàng</label>
                                                <select class="form-select form-select-solid" name="status"
                                                    id="stauts">
                                                    @foreach (\App\Models\Order::STATUS_LABEL as $key => $value)
                                                        <option value="{{ $key }}"
                                                            {{ $order->status == $key ? 'selected' : '' }}>
                                                            {{ $value }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="fv-row">
                                                <label class="form-label text-gray-600" for="note">Lời nhắn</label>
                                                <input name="note" id="note" class="form-control form-control-solid" value="{{ $order->note }}"/>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="card card-flush py-4 flex-row-fluid overflow-hidden">
                                <div class="card-header">
                                    <div class="card-title">
                                        <h2>Chi tiết đơn hàng</h2>
                                    </div>
                                </div>
                                <div class="card-body pt-0">
                                    <div class="table-responsive pb-10">
                                        <table class="table align-middle table-row-bordered mb-0 fs-6 gy-5 min-w-300px">
                                            <tbody class="fw-semibold text-gray-600">
                                                <tr>
                                                    <td class="text-muted">
                                                        <div class="d-flex align-items-center">
                                                            <i class="ki-duotone ki-devices fs-2 me-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                                <span class="path3"></span>
                                                                <span class="path4"></span>
                                                                <span class="path5"></span>
                                                            </i>
                                                            Mã đơn hàng
                                                            <span class="ms-1" data-bs-toggle="tooltip"
                                                                title="View the invoice generated by this order.">
                                                                <i class="ki-duotone ki-information-5 text-gray-500 fs-6">
                                                                    <span class="path1"></span>
                                                                    <span class="path2"></span>
                                                                    <span class="path3"></span>
                                                                </i>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td class="fw-bold text-end">
                                                        <a href="javascript:void(0)"
                                                            class="text-gray-600 text-hover-primary">{{ $order->code }}</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-muted">
                                                        <div class="d-flex align-items-center">
                                                            <i class="ki-duotone ki-calendar fs-2 me-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                            </i>
                                                            Ngày đặt hàng
                                                        </div>
                                                    </td>
                                                    <td class="fw-bold text-end">{{ $order->created_at }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-muted">
                                                        <div class="d-flex align-items-center">
                                                            <i class="ki-duotone ki-profile-circle fs-2 me-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                                <span class="path3"></span>
                                                            </i>
                                                            Tên người nhận
                                                        </div>
                                                    </td>
                                                    <td class="fw-bold text-end">
                                                        <a href="javascript:void(0)"
                                                            class="text-gray-600 text-hover-primary">{{ $order->user_name }}
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-muted">
                                                        <div class="d-flex align-items-center">
                                                            <i class="ki-duotone ki-phone fs-2 me-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                            </i>
                                                            Số điện thoại
                                                        </div>
                                                    </td>
                                                    <td class="fw-bold text-end">{{ $order->phone }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-muted">
                                                        <div class="d-flex align-items-center">
                                                            <i class="ki-duotone ki-wallet fs-2 me-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                                <span class="path3"></span>
                                                                <span class="path4"></span>
                                                            </i>Phương thức thanh toán
                                                        </div>
                                                    </td>
                                                    <td class="fw-bold text-end">
                                                        {{ \App\Models\Order::getPaymentMethod($order->payment_method) }}
                                                    </td>
                                                    {{-- <img src="assets/media/svg/card-logos/visa.svg"
                                                            class="w-50px ms-2" /> --}}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-muted">
                                                        <div class="d-flex align-items-center">
                                                            <i class="ki-duotone ki-truck fs-2 me-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                                <span class="path3"></span>
                                                                <span class="path4"></span>
                                                                <span class="path5"></span>
                                                            </i>Phương thức giao hàng
                                                        </div>
                                                    </td>
                                                    <td class="fw-bold text-end">
                                                        {{ \App\Models\Order::getShippingType($order->shipping_type) }}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-muted">
                                                        <div class="d-flex align-items-center">
                                                            <i class="ki-duotone ki-geolocation fs-2 me-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                            </i>
                                                            Địa chỉ giao hàng
                                                        </div>
                                                    </td>
                                                    <td class="fw-bold text-end">
                                                        <a href="#"
                                                            class="text-gray-600 text-hover-primary">{{ $order->address }}</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-muted">
                                                        <div class="d-flex align-items-center">
                                                            <i class="ki-duotone ki-notepad-edit fs-2 me-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                            </i>
                                                            Ghi chú
                                                            <span class="ms-1" data-bs-toggle="tooltip"
                                                                title="Ghi chú của người đặt hàng">
                                                                <i class="ki-duotone ki-information-5 text-gray-500 fs-6">
                                                                    <span class="path1"></span>
                                                                    <span class="path2"></span>
                                                                    <span class="path3"></span>
                                                                </i>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td class="fw-bold text-end">{{ $order->note }}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="table align-middle table-row-dashed fs-6 gy-5 mb-0">
                                            <thead>
                                                <tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
                                                    <th class="min-w-175px">Sản phẩm</th>
                                                    <th class="min-w-70px text-end">Số lượng</th>
                                                    <th class="min-w-70px text-end">Đơn giá</th>
                                                    <th class="min-w-100px text-end">Tổng</th>
                                                </tr>
                                            </thead>
                                            <tbody class="fw-semibold text-gray-600">
                                                @foreach ($order->orderDetails as $orderDetail)
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <a href="javascript:void(0)" class="symbol symbol-50px">
                                                                    <span class="symbol-label"
                                                                        style="background-image:url('{{ url('/storage') . '/' . $orderDetail->productOption->product->thumbnailMedia?->path ?? '' }}')"></span>
                                                                </a>
                                                                <div class="ms-5">
                                                                    <a href="javascript:void(0)"
                                                                        class="fw-bold text-gray-600 text-hover-primary">{{ $orderDetail->productOption->product->name }}</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="text-end">{{ $orderDetail->quantity }}</td>
                                                        <td class="text-end">{{ number_format($orderDetail->price) }}</td>
                                                        <td class="text-end">
                                                            {{ number_format($orderDetail->quantity * $orderDetail->price) }}
                                                        </td>
                                                    </tr>
                                                @endforeach
                                                <tr>
                                                    <td colspan="3" class="text-end">Tổng tiền</td>
                                                    <td class="text-end">{{ number_format($order->total_price) }}</td>
                                                </tr>
                                                {{-- <tr>
                                                    <td colspan="3" class="text-end">VAT (0%)</td>
                                                    <td class="text-end">0</td>
                                                </tr> --}}
                                                <tr>
                                                    <td colspan="3" class="text-end">Phí vận chuyển</td>
                                                    <td class="text-end">{{ number_format($order->shipping_fee) }}</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" class="fs-3 text-gray-900 text-end">Tổng thanh
                                                        toán
                                                    </td>
                                                    <td class="text-gray-900 fs-3 fw-bolder text-end">
                                                        {{ number_format($order->total_price + $order->shipping_fee) }}
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="kt_ecommerce_sales_order_history" role="tab-panel">
                        <div class="d-flex flex-column gap-7 gap-lg-10">
                            <div class="card card-flush py-4 flex-row-fluid">
                                <div class="card-header">
                                    <div class="card-title">
                                        <h2>Lịch sử đặt hàng</h2>
                                    </div>
                                </div>
                                <div class="card-body pt-0">
                                    <div class="table-responsive">
                                        <table class="table align-middle table-row-dashed fs-6 gy-5 mb-0"
                                            id="order-table">
                                            <thead>
                                                <tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
                                                    <th class="text-center w-10px">STT</th>
                                                    <th class="text-center min-w-125px">Mã đơn hàng</th>
                                                    <th class="text-center min-w-125px">Khách hàng</th>
                                                    <th class="text-center min-w-125px">SĐT</th>
                                                    <th class="text-center min-w-125px">Đơn giá</th>
                                                    <th class="text-center min-w-125px">Thời gian đặt hàng</th>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    @include('order.edit.js')
@endsection
