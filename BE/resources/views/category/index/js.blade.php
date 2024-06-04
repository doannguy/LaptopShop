<script>
    const categoryIndex = () => {
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
            $('#category-search').on("keyup", (function(e) {
                clearTimeout(timeoutSearch)
                timeoutSearch = setTimeout(function() {
                    datatable.draw();
                }, 500)
            }));
        }

        const initEditAction = () => {
            $(document).on('click', '.btn-edit', function() {
                const data = getRowData($(this).closest('tr'));
                const categoryId = data.id

                const categoryModal = $('#category-modal');
                const categoryForm = $('#category-form');
                categoryForm.find('input[name="id"]').val(categoryId);
                categoryForm.find('input[name="name"]').val(data.name);
                categoryModal.modal('show');
            })
        }

        const initDeleteAction = () => {
            $(document).on('click', '.btn-delete', function() {
                const data = getRowData($(this).closest('tr'));
                const categoryId = data.id

                const url = "{{ route('category.delete') }}";
                const deleteType = {
                    soft: 0,
                    hard: 1
                }

                alert('Bạn có muốn xóa danh mục này?', 'question', {
                        showCancelButton: true
                    })
                    .then((result) => {
                        if (result.isConfirmed) {
                            alert('Bạn có muốn xóa toàn bộ sản phẩm của danh mục này không?',
                                    'question', {
                                        showCancelButton: true,
                                        cancelButtonText: 'Đóng',
                                        confirmButtonText: 'Có',
                                        showDenyButton: true,
                                        denyButtonText: 'Không'
                                    }
                                )
                                .then((result) => {
                                    if (!result.dismiss) {
                                        const data = {
                                            id: categoryId,
                                            delete_type: result.isConfirmed ?
                                                deleteType.hard : deleteType.soft,
                                            _token: $("input[name=_token]").val(),
                                        }
                                        $.ajax({
                                            url: url,
                                            type: 'POST',
                                            dataType: 'json',
                                            data: data,
                                            success: function(response) {
                                                if (response.code == 0) {
                                                    alert('Xóa danh mục thành công!',
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
                        }
                    })
            })
        }

        const initDatatable = () => {
            datatable = $("#category-table").DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('category.datatable') }}",
                    type: "POST",
                    data: function(d) {
                        d.search = $('#category-search').val();
                        d._token = $("input[name=_token]").val();
                    }
                },
                columnDefs: [{
                        targets: 0,
                        data: null,
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row, meta) {
                            return `<span>${meta.row + meta.settings._iDisplayStart + 1}</span>`
                        }
                    },
                    {
                        targets: 1,
                        data: 'name',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span>${data ?? ''}</span>`
                        }
                    },
                    {
                        targets: 2,
                        data: null,
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span>${row.productCount || 0}</span>`
                        }
                    },
                    {
                        targets: -1,
                        data: null,
                        orderable: false,
                        className: 'text-center min-w-150px',
                        render: function(data, type, row) {
                            return `
                                    <button class="btn btn-warning btn-active-light-warning me-2 btn-sm btn-edit">Sửa</button>
                                    <button class="btn btn-danger btn-active-light-danger btn-sm btn-delete">Xóa</button>
                                `;
                        },
                    },
                ],
            });

            datatable.on('draw', function() {
                initEditAction();
                initDeleteAction();
            });
            handleSearchDatatable();
        }

        return {
            initDatatable
        }
    }

    KTUtil.onDOMContentLoaded((function() {
        categoryIndex().initDatatable();
    }));
</script>
