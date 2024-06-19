@extends('layouts.app')
@section('content')
    <div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
        <div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
            <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                <h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">Trang chủ
                </h1>
                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        <a href="{{ route('dashboard') }}" class="text-muted text-hover-primary">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-500 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">Thống kê</li>
                </ul>
            </div>
        </div>
    </div>
    <div id="kt_app_content" class="app-content flex-column-fluid">
        <div id="kt_app_content_container" class="app-container container-xxl">
            <div class="row g-5 g-xl-10 mb-xl-10">
                <div class="col-xxl-3 mb-5 mb-xl-10">
                    <div class="card card-flush h-md-50 mb-5 mb-xl-10">
                        <div class="card-header pt-5">
                            <div class="card-title d-flex flex-column">
                                <div class="d-flex align-items-center">
                                    <span
                                        class="fs-2hx fw-bold text-gray-900 me-2 lh-1 ls-n2">{{ $user['currentMonthUsers'] }}</span>
                                    <span
                                        class="badge {{ $user['percentageChange'] >= 100 ? 'badge-light-success' : 'badge-light-danger' }}  fs-base">
                                        <i
                                            class="ki-duotone {{ $user['percentageChange'] >= 100 ? 'ki-arrow-up text-success' : 'ki-arrow-down text-danger' }} fs-5  ms-n1">
                                            <span class="path1"></span>
                                            <span class="path2"></span>
                                        </i>{{ $user['percentageChange'] }}%</span>
                                </div>
                                <span class="text-gray-500 pt-1 fw-semibold fs-6">Người dùng</span>
                            </div>
                        </div>
                        <div class="card-body d-flex align-items-end pt-0">
                            <div class="d-flex align-items-center flex-column mt-3 w-100">
                                <div class="d-flex justify-content-between w-100 mt-auto mb-2">
                                    <span class="fw-bolder fs-6 text-gray-900">Tháng này:
                                        {{ $user['currentMonthUsers'] }}</span>
                                    <span class="fw-bold fs-6 text-gray-500">Tháng trước:
                                        {{ $user['lastMonthUsers'] }}</span>
                                </div>
                                <div class="h-8px mx-3 w-100 bg-light-success rounded">
                                    <div class="bg-success rounded h-8px" role="progressbar"
                                        style="width: {{ $user['percentageChange'] }}%;" aria-valuenow="50"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card card-flush h-md-50 mb-5 mb-xl-10">
                        <div class="card-header pt-5">
                            <div class="card-title d-flex flex-column">
                                <div class="d-flex align-items-center">
                                    <span
                                        class="fs-2hx fw-bold text-gray-900 me-2 lh-1 ls-n2">{{ $order['currentMonthOrders'] }}</span>
                                    <span
                                        class="badge {{ $order['percentageChange'] >= 100 ? 'badge-light-success' : 'badge-light-danger' }}  fs-base">
                                        <i
                                            class="ki-duotone {{ $order['percentageChange'] >= 100 ? 'ki-arrow-up text-success' : 'ki-arrow-down text-danger' }} fs-5  ms-n1">
                                            <span class="path1"></span>
                                            <span class="path2"></span>
                                        </i>{{ $order['percentageChange'] }}%</span>
                                </div>
                                <span class="text-gray-500 pt-1 fw-semibold fs-6">Đơn hàng tháng này</span>
                            </div>
                        </div>
                        <div class="card-body d-flex align-items-end pt-0">
                            <div class="d-flex align-items-center flex-column mt-3 w-100">
                                <div class="d-flex justify-content-between w-100 mt-auto mb-2">
                                    <span class="fw-bolder fs-6 text-gray-900">Tháng này:
                                        {{ $order['currentMonthOrders'] }}</span>
                                    <span class="fw-bold fs-6 text-gray-500">Tháng trước:
                                        {{ $order['lastMonthOrders'] }}</span>
                                </div>
                                <div class="h-8px mx-3 w-100 bg-light-success rounded">
                                    <div class="bg-success rounded h-8px" role="progressbar"
                                        style="width: {{ $order['percentageChange'] }}%;" aria-valuenow="50"
                                        aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xxl-9 mb-5 mb-xl-0">
                    <div class="card card-flush overflow-hidden h-md-100">
                        <div class="card-header py-5">
                            <h3 class="card-title align-items-start flex-column">
                                <span class="card-label fw-bold text-gray-900">Doanh thu 14 ngày gần nhất</span>
                                <span
                                    class="text-gray-500 mt-1 fw-semibold fs-6">{{ number_format(array_sum($sales['revenue']), 0) }}
                                    vnđ</span>
                            </h3>
                            <div class="card-toolbar"></div>
                        </div>
                        <div class="card-body d-flex justify-content-between flex-column pb-1 px-0">
                            <div id="charts_sale_per_day" class="min-h-auto ps-4 pe-6" style="height: 300px"></div>
                        </div>
                    </div>
                </div>
            </div>

            {{-- <div class="row">
                <div class="col-12 mb-5 mb-xl-0">
                    <div class="card card-flush overflow-hidden h-md-100">
                        <div class="card-header py-5">
                            <h3 class="card-title align-items-start flex-column">
                                <span class="card-label fw-bold text-gray-900">Sản phẩm bán chạy</span>
                            </h3>
                            <div class="card-toolbar"></div>
                        </div>
                        <div class="card-body pt-0">
                            <table class="table table-reponsive align-middle table-row-dashed fs-6 gy-5" id="product-table">
                                <thead>
                                    <tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
                                        <th class="min-w-200px text-center">Sản phẩm</th>
                                        <th class="min-w-100px text-end">Bán ra</th>
                                        <th class="min-w-100px text-end">Doanh thu</th>
                                    </tr>
                                </thead>
                                <tbody class="fw-semibold text-gray-600"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div> --}}
        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('assets/js/widgets.bundle.js') }}"></script>
    <script src="{{ asset('assets/js/custom/widgets.js') }}"></script>
    @include('js')
@endsection
