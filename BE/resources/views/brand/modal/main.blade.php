<div class="modal fade" id="brand-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-650px">
        <div class="modal-content">
            <form class="form" action="#" id="brand-form">
                <div class="modal-header" id="modal-header">
                    <h2 class="fw-bold">Thêm thương hiệu</h2>
                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ki-duotone ki-cross fs-1">
                            <span class="path1"></span>
                            <span class="path2"></span>
                        </i>
                    </div>
                </div>
                <div class="modal-body py-10 px-lg-17">
                    <div class="scroll-y me-n7 pe-7" id="modal-scroll" data-kt-scroll="true"
                        data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-max-height="auto"
                        data-kt-scroll-dependencies="#modal-header" data-kt-scroll-wrappers="#modal-scroll"
                        data-kt-scroll-offset="300px">

                        <input type="hidden" name="id">
                        <div class="fv-row mb-7">
                            <label class="required fs-6 fw-semibold mb-2">Tên thương hiệu</label>
                            <input type="text" class="form-control form-control-solid"
                                placeholder="Ex: Apple" name="name" />
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
        const brandModal = $('#brand-modal');
        const brandForm = brandModal.find('#brand-form');

        brandModal.on('hidden.bs.modal', function() {
            brandModal.find('#modal-header h2').text('Thêm thương hiệu');
            brandForm.trigger('reset');
        })

        brandForm.on('submit', function(e) {
            e.preventDefault();
            const btnSubmit = $(this).find('button[type="submit"]');
            btnSubmit.attr('data-kt-indicator', "on");

            const data = {
                id: brandForm.find('input[name="id"]').val(),
                name: brandForm.find('input[name="name"]').val(),
                _token: $("input[name=_token]").val(),
            }

            $.ajax({
                url: !data.id ? "{{ route('brand.store') }}" :
                    "{{ route('brand.update') }}",
                type: 'POST',
                dataType: 'json',
                data: data,
                success: function(res) {
                    if (res.code == 0) {
                        brandModal.modal('hide');
                        toastr.success(!data.id ? "Thêm mới thương hiệu thành công!" : "Cập nhật thương hiệu thành công!");
                        $('#brand-table').DataTable().ajax.reload();
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
