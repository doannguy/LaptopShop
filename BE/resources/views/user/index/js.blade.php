<script>
    const user = () => {
        let datatable, timeoutSearch;
        const userSearch = $('#user-search');

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
            userSearch.on("keyup", (function(e) {
                clearTimeout(timeoutSearch)
                timeoutSearch = setTimeout(function() {
                    datatable.draw();
                }, 500)
            }));
        }

        const initEditAction = () => {
            $(document).on('click', '.btn-edit', function() {
                const data = getRowData($(this).closest('tr'));
                const userId = data.id

                const userModal = $('#user-modal');
                const userForm = userModal.find('#user-form');
                userForm.find('input[name="id"]').val(userId);
                userForm.find('input[name="name"]').val(data.name);
                userForm.find('input[name="email"]').val(data.email);
                userForm.find('select[name="gender"]').val(data.gender);
                userForm.find('select[name="role"]').val(data.roles[0].name);
                userForm.find('select[name="status"]').val(data.status);
                userModal.modal('show');
            })
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

        const initDatatable = () => {
            datatable = $("#user-table").DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('user.datatable') }}",
                    type: "POST",
                    data: function(d) {
                        d.search = userSearch.val();
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
                            return `<span>${data}</span>`
                        }
                    },
                    {
                        targets: 2,
                        data: 'email',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span>${data}</span>`
                        }
                    },
                    {
                        targets: 3,
                        data: 'roles',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            switch (data[0].name) {
                                case 'admin':
                                    return `<span class="badge badge-light-danger">${data[0].name}</span>`
                                case 'member':
                                    return `<span class="badge badge-light-primary">${data[0].name}</span>`
                                case 'staff':
                                    return `<span class="badge badge-light-warning">${data[0].name}</span>`
                            }
                        }
                    },
                    {
                        targets: 4,
                        data: 'created_at',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            return `<span>${formatTime(data)}</span>`
                        }
                    },
                    {
                        targets: 5,
                        data: 'status',
                        orderable: false,
                        className: 'text-center',
                        render: function(data, type, row) {
                            switch (data) {
                                case 0:
                                    return `<span class="badge badge-light-success">Hoạt động</span>`
                                case 1:
                                    return `<span class="badge badge-light-danger">Khóa</span>`
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
                                    <button class="btn btn-warning btn-active-light-warning me-2 btn-sm btn-edit">Sửa</button>
                                `;
                        },
                    },
                ],
            });

            datatable.on('draw', function() {
                initEditAction();
            });
            handleSearchDatatable();
        }

        return {
            initDatatable
        }
    }

    KTUtil.onDOMContentLoaded((function() {
        user().initDatatable();
    }));
</script>
