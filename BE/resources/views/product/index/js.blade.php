<script>
    const poductIndex = () => {
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
            $('#product-search').on("keyup", (function(e) {
                clearTimeout(timeoutSearch)
                timeoutSearch = setTimeout(function() {
                    datatable.draw();
                }, 500)
            }));
        }


        const initDeleteAction = () => {
            $(document).on('click', '.btn-delete', function() {
                const data = getRowData($(this).closest('tr'));
                const productId = data.id

                const url = "{{ route('product.delete') }}";
                alert('Bạn có muốn xóa sản phẩm này không ?', 'question', {
                        showCancelButton: true
                    })
                    .then((result) => {
                        if (result.isConfirmed) {
                            const data = {
                                id: productId,
                                _token: $("input[name=_token]").val(),
                            }
                            $.ajax({
                                url: url,
                                type: 'POST',
                                dataType: 'json',
                                data: data,
                                success: function(response) {
                                    if (response.code == 0) {
                                        alert('Xóa thành công!',
                                            'success');
                                        datatable.ajax.reload();
                                    } else {
                                        alert('Có lỗi xảy ra, vui lòng thử lại sau.',
                                            'error');
                                    }
                                },
                                error: function(response) {
                                    alert('Có lỗi xảy ra, vui lòng thử lại sau.',
                                        'error');
                                }
                            })
                        }
                    })
            })
        }

        const initDatatable = () => {
            datatable = $("#product-table").DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('product.datatable') }}",
                    type: "POST",
                    data: function(d) {
                        d.search = $('#product-search').val();
                        d._token = $("input[name=_token]").val();
                    }
                },
                columnDefs: [{
                        targets: 0,
                        data: 'name',
                        orderable: true,
                        render: function(data, type, row, meta) {
                            return `<div class="d-flex align-items-center">
                                        <a href="{{ route('product.edit','') }}/${row.id}" class="symbol symbol-50px">
                                            <span class="symbol-label" style="background-image:url('{{ url('/storage') }}/${row?.thumbnail_media?.path ?? ''}');"></span>
                                        </a>
                                        <div class="ms-5">
                                            ${data ?? ''}
                                        </div>
                                    </div>`
                        }
                    },
                    {
                        targets: 1,
                        data: 'product_options_count',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span class="fw-bold">${data ?? ''} phiên bản</span>`
                        }
                    },
                    {
                        targets: 2,
                        data: 'product_seri',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span class="fw-bold">${data.name || " "}</span>`
                        }
                    },
                    {
                        targets: 3,
                        data: 'brand',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span class="fw-bold">${data.name || " "}</span>`
                        }
                    },
                    {
                        targets: -1,
                        data: null,
                        orderable: false,
                        className: 'text-center min-w-150px',
                        render: function(data, type, row) {
                            return `
                                    <a class="btn btn-warning btn-active-light-warning me-2 btn-sm" href="{{ route('product.edit','') }}/${row.id}">Sửa</a>
                                    <button class="btn btn-danger btn-active-light-danger btn-sm btn-delete">Xóa</button>
                                `;
                        },
                    },
                ],
            });

            datatable.on('draw', function() {

                initDeleteAction();
            });
            handleSearchDatatable();
        }

        return {
            initDatatable
        }
    }

    KTUtil.onDOMContentLoaded((function() {
        poductIndex().initDatatable();
    }));
</script>
