<div class="modal fade" id="attribute-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-650px">
        <div class="modal-content">
            <form class="form" action="#" id="attribute-form">
                <div class="modal-header" id="modal-header">
                    <h2 class="fw-bold">Thêm mới</h2>
                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ki-duotone ki-cross fs-1">
                            <span class="path1"></span>
                            <span class="path2"></span>
                        </i>
                    </div>
                </div>
                <div class="modal-body px-lg-17 py-10">
                    <div class="scroll-y me-n7 pe-7" id="modal-scroll" data-kt-scroll="true"
                        data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-max-height="auto"
                        data-kt-scroll-dependencies="#modal-header" data-kt-scroll-wrappers="#modal-scroll"
                        data-kt-scroll-offset="300px">
                        @csrf
                        <input type="hidden" name="id">
                        <div class="fv-row mb-7">
                            <label class="required fs-6 fw-semibold mb-2">Tên cấu hình</label>
                            <input type="text" class="form-control form-control-solid" placeholder="Ex: RAM"
                                name="name" />
                        </div>
                        <div class="fv-row mb-7">
                            <label class="required fs-6 fw-semibold mb-2">Danh sách các giá trị</label>
                            <!--begin::Repeater-->
                            <div id="attribute_values">

                                <div data-repeater-list="attribute_values">
                                    <div data-repeater-item>
                                        <div class="d-flex mb-2">
                                            <input type="text" name="value" class="form-control w-100 me-2"
                                                placeholder="Ex: 32GB" />
                                            <input type="hidden" name="id" />
                                            <button type="button" class="btn btn-sm btn-light-danger min-w-75px"
                                                data-repeater-delete>
                                                <i class="ki-duotone ki-trash fs-5">
                                                    <span class="path1"></span>
                                                    <span class="path2"></span>
                                                    <span class="path3"></span>
                                                    <span class="path4"></span>
                                                    <span class="path5"></span>
                                                </i>
                                                Xóa
                                            </button>
                                        </div>

                                        {{-- <div class="form-group row">
                                                <div class="col-md-8">
                                                    <label class="form-label">Giá trị:</label>
                                                    <input type="text" name="value"
                                                        class="form-control mb-md-0 mb-2" placeholder="Ex: 32GB" />
                                                    <input type="hidden" name="id"
                                                        class="form-control mb-md-0 mb-2" placeholder="Ex: 32GB" />
                                                </div>

                                                <div class="col-md-4">
                                                    <a href="javascript:;" data-repeater-delete
                                                        class="btn btn-sm btn-light-danger mt-md-8 mt-3">
                                                        <i class="ki-duotone ki-trash fs-5"><span
                                                                class="path1"></span><span class="path2"></span><span
                                                                class="path3"></span><span class="path4"></span><span
                                                                class="path5"></span></i>
                                                        Xóa
                                                    </a>
                                                </div>
                                            </div> --}}
                                    </div>
                                </div>
                                <div class="form-group mt-5">
                                    <button type="button" class="btn btn-light-primary" data-repeater-create>
                                        <i class="ki-duotone ki-plus fs-3"></i>
                                        Thêm giá trị
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="fv-row mb-7">
                            <label class="required fs-6 fw-semibold mb-2">Trạng thái</label>
                            <div class="d-flex">
                                <div class="form-check form-check-custom form-check-solid">
                                    <input class="form-check-input" type="radio" value="1" name="status" checked
                                        id="status_hien_thi" />
                                    <label class="form-check-label" for="status_hien_thi">
                                        Hiển thị
                                    </label>
                                </div>
                                <div class="form-check form-check-custom form-check-solid ms-2">
                                    <input class="form-check-input" type="radio" name="status" value="0"
                                        id="status_an" />
                                    <label class="form-check-label" for="status_an">
                                        Ẩn
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer flex-center">
                    <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">
                        <span class="indicator-label">Xác nhận</span>
                        <span class="indicator-progress">
                            Loading... <span class="spinner-border spinner-border-sm ms-2 align-middle"></span>
                        </span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="assets/plugins/custom/formrepeater/formrepeater.bundle.js"></script>
<script>
    $(document).ready(function() {
        const attributeModal = $('#attribute-modal');
        const attributeForm = attributeModal.find('#attribute-form');
        const attributeValue = document.getElementById('attribute_values');

        attributeModal.on('hidden.bs.modal', function() {
            attributeModal.find('#modal-header h2').text('Thêm mới');
            attributeForm.trigger('reset');
        })

        attributeForm.on('submit', function(e) {
            e.preventDefault();
            const btnSubmit = $(this).find('button[type="submit"]');
            btnSubmit.attr('data-kt-indicator', "on");

            const dataArray = Object.fromEntries(attributeForm.serializeArray().map(({
                name,
                value
            }) => [name, value]));

            $.ajax({
                url: !dataArray.id ? "{{ route('attribute.store') }}" :
                    "{{ route('attribute.update') }}",
                type: 'POST',
                dataType: 'json',
                data: attributeForm.serialize(),
                success: function(res) {
                    if (res.code == 0) {
                        attributeModal.modal('hide');
                        toastr.success(!dataArray.id ? "Thêm mới cấu hình thành công!" :
                            "Cập nhật cấu hình thành công!");
                        $('#attribute-table').DataTable().ajax.reload();
                        repeater.setList([]);
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

        repeater = $('#attribute_values').repeater({
            initEmpty: true,

            show: function() {
                $(this).slideDown();
            },

            hide: function(deleteElement) {
                $(this).slideUp(deleteElement);
            }
        });
    })
</script>
