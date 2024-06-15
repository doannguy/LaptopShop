<script>
    const orderIndex = () => {
        let datatable, timeoutSearch;

        const alert = (text = '', iconType, data = {}) => {
            return Swal.fire({
                text: text,
                icon: iconType,
                buttonsStyling: false,
                confirmButtonText: data.confirmButtonText ?? 'Xác nhận',
                showDenyButton: data.showDenyButton ?? false,
                denyButtonText: data.denyButtonText ?? '',
                showCancelButton: data.showCancelButton ?? false,
                cancelButtonText: data.cancelButtonText ?? 'Đóng',
                customClass: {
                    confirmButton: "btn btn-success",
                    cancelButton: "btn btn-danger",
                    denyButton: 'btn btn-warning'
                }
            })
        }

        const getRowData = (row) => {
            return datatable.row(row).data();
        }

        const handleSearchDatatable = () => {
            $('#order-search').on("keyup", (function(e) {
                clearTimeout(timeoutSearch)
                timeoutSearch = setTimeout(function() {
                    datatable.draw();
                }, 500)
            }));
        }

        const formatTime = (time) => {
            const dateTime = new Date(time);
            const year = dateTime.getFullYear();
            const month = String(dateTime.getMonth() + 1).padStart(2, "0");
            const day = String(dateTime.getDate()).padStart(2, "0");
            const hour = String(dateTime.getHours()).padStart(2, "0");
            const minute = String(dateTime.getMinutes()).padStart(2, "0");
            const second = String(dateTime.getSeconds()).padStart(2, "0");
            return `${day}-${month}-${year} ${hour}:${minute}:${second}`;
        }

        const formatAmount = (amount) => {
            return amount?.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VNĐ'
            }).replaceAll('.', ',').slice(0, -1) ?? 0;
        }

        const initDatatable = () => {
            datatable = $("#order-table").DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('order.datatable') }}",
                    type: "POST",
                    data: function(d) {
                        d.search = $('#order-search').val();
                        d._token = $("input[name=_token]").val();
                    }
                },
                columnDefs: [{
                        targets: 0,
                        data: 'id',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row, meta) {
                            return `<span>${meta.row + meta.settings._iDisplayStart + 1}</span>`
                        }
                    },
                    {
                        targets: 1,
                        data: 'created_at',
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span>${formatTime(data)}</span>`
                        }
                    },
                    {
                        targets: 2,
                        data: 'user',
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span>${data.name}</span>`
                        }
                    },
                    {
                        targets: 3,
                        data: 'total_amount',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span>${formatAmount(data)}</span>`
                        }
                    },
                    {
                        targets: 4,
                        data: 'status',
                        className: 'text-center',
                        render: function(data, type, row) {
                            switch (data) {
                                case 0:
                                    return `<span class="badge badge-light-warning">Đang chờ</span>`
                                case 1:
                                    return `<span class="badge badge-light-success">Thành công</span>`
                                case 2:
                                    return `<span class="badge badge-light-danger">Đã hủy</span>`
                            }
                        }
                    },
                    {
                        targets: -1,
                        data: null,
                        orderable: false,
                        className: 'text-center min-w-150px',
                        render: function(data, type, row) {
                            return `
                                    <a href="{{ route('order.edit', '') }}${row.id}" class="btn btn-warning btn-active-light-warning me-2 btn-sm btn-edit">Sửa</a>
                                `;
                        },
                    },
                ],
            });

            datatable.on('draw', function() {});
            handleSearchDatatable();
        }

        return {
            initDatatable
        }
    }

    KTUtil.onDOMContentLoaded((function() {
        orderIndex().initDatatable();
    }));
</script>
