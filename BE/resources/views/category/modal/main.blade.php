<div class="modal fade" id="category-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-650px">
        <div class="modal-content">
            <form class="form" action="#" id="category-form">
                <div class="modal-header" id="modal-header">
                    <h2 class="fw-bold">Thông tin danh mục</h2>
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
                            <label class="required fs-6 fw-semibold mb-2" for="category-name">Tên danh mục</label>
                            <input type="text" id="category-name" class="form-control form-control-solid"
                                placeholder="Ex: Laptop văn phòng" name="name" autofocus />
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
        const categoryModal = $('#category-modal');
        const categoryForm = categoryModal.find('#category-form');

        categoryModal.on('hidden.bs.modal', function() {
            categoryModal.find('#modal-header h2').text('Thêm danh mục');
            categoryForm.trigger('reset');
        })

        categoryForm.on('submit', function(e) {
            e.preventDefault();
            const btnSubmit = $(this).find('button[type="submit"]');
            btnSubmit.attr('data-kt-indicator', "on");

            const data = {
                id: categoryForm.find('input[name="id"]').val(),
                name: categoryForm.find('input[name="name"]').val(),
                _token: $("input[name=_token]").val(),
            }

            $.ajax({
                url: !data.id ? "{{ route('category.store') }}" :
                    "{{ route('category.update') }}",
                type: 'POST',
                dataType: 'json',
                data: data,
                success: function(res) {
                    if (res.code == 0) {
                        categoryModal.modal('hide');
                        toastr.success(!data.id ? "Thêm mới danh mục thành công!" :
                            "Cập nhật danh mục thành công!");
                        $('#category-table').DataTable().ajax.reload();
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
