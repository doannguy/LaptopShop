<script>
    const orderEdit = () => {
        let datatable, timeoutEditNote;

        const getRowData = (row) => {
            return datatable.row(row).data();
        }

        const initEditStatus = () => {

            $('select[name="status"]').select2({
                dropdownParent: '#dropdown-status-parent'
            })

            $('select[name="status"]').on('change', function() {
                let status = $(this).val();
                updateOrder()
            })
        }

        const initEditMessage = () => {
            $('input[name="note"]').on('keyup', function() {
                clearTimeout(timeoutEditNote);
                let note = $(this).val();
                let order_id = $('input[name="order_id"]').val();
                timeoutEditNote = setTimeout(() => {
                    updateOrder()
                }, 500);
            })
        }

        const updateOrder = () => {
            const url = "{{ route('order.update', '') }}";
            $.ajax({
                url: url,
                type: 'POST',
                dataType: 'json',
                data: {
                    id: $('input[name="order_id"]').val(),
                    status: $("select[name=status]").val(),
                    note: $('input[name="note"]').val(),
                    _token: $("input[name=_token]").val(),
                },
                success: function(res) {
                    if (res.code == 0) {
                        toastr.success('Cập nhật đơn hàng thành công!');
                    } else {
                        toastr.error(res.data.join(', ') + ".");
                    }
                },
                error: function(res) {
                    toastr.error(res.responseText);
                }
            })
        }

        const formatTimeAgo = (time) => {
            const dateTime = new Date(time);
            const now = new Date();
            const diff = now - dateTime;
            const second = 1000;
            const minute = 60 * second;
            const hour = 60 * minute;
            const day = 24 * hour;
            const month = 30 * day;
            const year = 12 * month;
            let text;

            if (diff < second * 30) {
                text = 'vừa mới';
            } else if (diff < minute) {
                text = Math.floor(diff / second) + ' giây trước';
            } else if (diff < minute * 2) {
                text = '1 phút trước';
            } else if (diff < hour) {
                text = Math.floor(diff / minute) + ' phút trước';
            } else if (diff < hour * 2) {
                text = '1 giờ trước';
            } else if (diff < day) {
                text = Math.floor(diff / hour) + ' giờ trước';
            } else if (diff < day * 2) {
                text = '1 ngày trước';
            } else if (diff < month) {
                text = Math.floor(diff / day) + ' ngày trước';
            } else if (diff < month * 2) {
                text = '1 tháng trước';
            } else if (diff < year) {
                text = Math.floor(diff / month) + ' tháng trước';
            } else {
                text = Math.floor(diff / year) + ' năm trước';
            }

            return text;
        }

        const formatPrice = (amount) => {
            return amount?.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
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
                        d.user_id = $("input[name=user_id]").val();
                    }
                },
                columnDefs: [{
                        targets: 0,
                        data: 'id',
                        className: 'text-center',
                        render: function(data, type, row, meta) {
                            return `<span class="fw-bold">${meta.row + meta.settings._iDisplayStart + 1}</span>`
                        }
                    },
                    {
                        targets: 1,
                        data: 'code',
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<a href="{{ route('order.edit', '') }}/${row.id}" class="text-gray-600 text-hover-primary fs-5 fw-bold">${data}</a>`
                        }
                    },
                    {
                        targets: 2,
                        data: 'user.name',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<a href="{{ route('order.edit', '') }}/${row.id}" class="text-gray-600 text-hover-primary fs-5 fw-bold">${data}</a>`;
                        }
                    },
                    {
                        targets: 3,
                        data: 'phone',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span class="fw-bold">${data}</span>`
                        }
                    },
                    {
                        targets: 4,
                        data: 'total_price',
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span class="fw-bold">${formatPrice(data)}</span>`
                        }
                    },
                    {
                        targets: 5,
                        data: 'created_at',
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span class="fw-bold">${formatTimeAgo(data)}</span>`
                        }
                    },
                    {
                        targets: 6,
                        data: 'status',
                        className: 'text-center',
                        render: function(data, type, row) {
                            switch (data) {
                                case 0:
                                    return `<span class="badge badge-light-warning fw-bold">Đang chờ</span>`
                                case 1:
                                    return `<span class="badge badge-light-success fw-bold">Thành công</span>`
                                case 2:
                                    return `<span class="badge badge-light-danger fw-bold">Đã hủy</span>`
                                case 3:
                                    return `<span class="badge badge-light-primary fw-bold">Đã xác nhận</span>`
                                case 4:
                                    return `<span class="badge badge-light-info fw-bold">Đang giao hàng</span>`
                                case 5:
                                    return `<span class="badge badge-light-info fw-bold">Đang chờ thanh toán</span>`
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
                                    <a href="{{ route('order.edit', '') }}/${row.id}" class="btn btn-warning btn-active-light-warning me-2 btn-sm btn-edit">Chỉnh sửa</a>
                                `;
                        },
                    },
                ],
            });

            initEditStatus();
            initEditMessage();
        }

        return {
            initDatatable
        }
    }

    KTUtil.onDOMContentLoaded((function() {
        orderEdit().initDatatable();
    }));
</script>
