<div class="modal fade" id="user-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-650px">
        <div class="modal-content">
            <form class="form" action="#" id="user-form">
                <div class="modal-header" id="modal-header">
                    <h2 class="fw-bold">Sửa thông tin thành viên</h2>
                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ki-duotone ki-cross fs-1">
                            <span class="path1"></span>
                            <span class="path2"></span>
                        </i>
                    </div>
                </div>
                <div class="modal-body py-10 px-lg-17">
                    <div class="me-n7 pe-7" id="modal-scroll" data-kt-scroll="true"
                        data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-max-height="auto"
                        data-kt-scroll-dependencies="#modal-header" data-kt-scroll-wrappers="#modal-scroll"
                        data-kt-scroll-offset="300px">

                        <input type="hidden" name="id">
                        <div class="fv-row mb-7">
                            <label class="required fs-6 fw-semibold mb-2" for="user-name">Tên</label>
                            <input type="text" id="user-name" class="form-control form-control-solid" name="name"
                                readonly />
                        </div>

                        <div class="fv-row mb-7">
                            <label class="required fs-6 fw-semibold mb-2" for="user-email">Email</label>
                            <input type="email" id="user-email" class="form-control form-control-solid" name="email"
                                readonly />
                        </div>

                        <div class="fv-row mb-7" id="user-select-gender">
                            <label class="fs-6 fw-semibold mb-2" for="user-gender">Giới tính</label>
                            <select class="form-select form-select-solid" id="user-gender" name="gender"
                                aria-label="Giới tính" disabled>
                                <option value="">Không rõ</option>
                                @foreach ($genders as $key => $gender)
                                    <option value="{{ $key }}">{{ $gender }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="fv-row mb-7" id="user-select-role">
                            <label class="required fs-6 fw-semibold mb-2" for="user-role">Vai trò</label>
                            <select class="form-select form-select-solid" id="user-role" name="role"
                                aria-label="Chức vụ">
                                @foreach ($roles as $role)
                                    <option value="{{ $role->name }}">{{ $role->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="fv-row mb-7" id="user-select-status">
                            <label class="required fs-6 fw-semibold mb-2" for="user-status">Trạng thái</label>
                            <select class="form-select form-select-solid" id="user-status" name="status"
                                aria-label="Trạng thái">
                                @foreach ($status as $key => $s)
                                    <option value="{{ $key }}">{{ $s }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer flex-center">
                    <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">
                        <span class="indicator-label">Xác nhận</span>
                        <span class="indicator-progress">
                            Loading... <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                        </span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        const userModal = $('#user-modal');
        const userForm = userModal.find('#user-form');

        userModal.on('show.bs.modal', function() {
            userForm.find('#user-gender').select2({
                dropdownParent: '#user-select-gender'
            });

            userForm.find('#user-role').select2({
                dropdownParent: '#user-select-role'
            });

            userForm.find('#user-status').select2({
                dropdownParent: '#user-select-status'
            });
        })

        userModal.on('hidden.bs.modal', function() {
            userForm.trigger('reset');
        })

        userForm.on('submit', function(e) {
            e.preventDefault();
            const btnSubmit = $(this).find('button[type="submit"]');
            btnSubmit.attr('data-kt-indicator', "on");

            const data = {
                id: userForm.find('input[name="id"]').val(),
                role: userForm.find('select[name="role"]').val(),
                status: userForm.find('select[name="status"]').val(),
                _token: $("input[name=_token]").val(),
            }

            $.ajax({
                url: "{{ route('user.update') }}",
                type: 'POST',
                data: data,
                success: function(res) {
                    if (res.code == 0) {
                        userModal.modal('hide');
                        toastr.success("Cập nhật thành viên thành công!");
                        $('#user-table').DataTable().ajax.reload();
                    } else {
                        toastr.error(res.data.join(', ') + ".");
                    }
                },
                error: function(res) {
                    toastr.error(res.responseText);
                },
                complete: function() {
                    btnSubmit.attr('data-kt-indicator', "off");
                }
            })
        })
    })
</script>
