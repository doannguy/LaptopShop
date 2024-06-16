<script>
    const attributeIndex = () => {
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
            $('#attribute-search').on("keyup", (function(e) {
                clearTimeout(timeoutSearch)
                timeoutSearch = setTimeout(function() {
                    datatable.draw();
                }, 500)
            }));
        }
        const initAddAction = () => {
            $(document).on('click', '.open-add-modal', function() {
                const attributeModal = $('#attribute-modal');
                const attributeForm = $('#attribute-form');
                attributeForm.find('input[name="id"]').val('');
                attributeForm.find('input[name="name"]').val('');
                repeater.setList([]);
                attributeModal.modal('show');
            })
        }
        const initEditAction = () => {
            $(document).on('click', '.btn-edit', function() {
                const data = getRowData($(this).closest('tr'));
                const attributeId = data.id

                const attributeModal = $('#attribute-modal');
                const attributeForm = $('#attribute-form');
                attributeModal.find('#modal-header h2').text('Sửa thông tin cấu hình sản phẩm')
                attributeForm.find('input[name="id"]').val(attributeId);
                attributeForm.find('input[name="name"]').val(data.name);
                list_attribute_value = [];
                data.attribute_values.forEach(element => {
                    list_attribute_value.push({
                        value: element.value,
                        id: element.id
                    })
                })
                repeater.setList(list_attribute_value);

                if (data.status == 1) {
                    attributeForm.find('#status_hien_thi').prop('checked', true);
                    attributeForm.find('#status_an').prop('checked', false);
                } else if (data.status == 0) {
                    attributeForm.find('#status_an').prop('checked', true);
                    attributeForm.find('#status_hien_thi').prop('checked', false);
                }
                attributeForm.find('select[name="status"]').val(data.status + "");
                attributeModal.modal('show');

            })
        }

        const initDeleteAction = () => {
            $(document).on('click', '.btn-delete', function() {
                const data = getRowData($(this).closest('tr'));
                const attributeId = data.id

                const url = "{{ route('attribute.delete') }}";
                const deleteType = {
                    soft: 0,
                    hard: 1
                }

                alert('Bạn có muốn xóa cấu hình này?', 'question', {
                        showCancelButton: true
                    })
                    .then((result) => {
                        if (result.isConfirmed) {
                            const data = {
                                id: attributeId,
                                _token: $("input[name=_token]").val(),
                            }
                            $.ajax({
                                url: url,
                                type: 'POST',
                                dataType: 'json',
                                data: data,
                                success: function(response) {
                                    if (response.code == 0) {
                                        alert('Xóa cấu hình thành công!',
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
            datatable = $("#attribute-table").DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('attribute.datatable') }}",
                    type: "POST",
                    data: function(d) {
                        d.search = $('#attribute-search').val();
                        d._token = $("input[name=_token]").val();
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
                        data: 'name',
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span class="fw-bold">${data ?? ''}</span>`
                        }
                    },
                    {
                        targets: 2,
                        data: 'attribute_values',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            let attribute_values = data.map((item) => {
                                return `<span class="fw-bold badge badge-light-primary me-2">${item.value}</span>`
                            })

                            return attribute_values
                        }
                    },
                    {
                        targets: 3,
                        data: 'status',
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span class="fw-bold badge ${data == 1 ? 'badge-light-success' : 'badge-light-danger'} me-2">${data == 1 ? 'Hiển thị' : 'Ẩn'}</span>`
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
            initAddAction();
        }

        return {
            initDatatable
        }
    }

    KTUtil.onDOMContentLoaded((function() {
        attributeIndex().initDatatable();
    }));
</script>
