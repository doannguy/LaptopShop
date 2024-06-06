<div class="modal fade" id="product-seri-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-650px">
        <div class="modal-content">
            <form class="form" action="#" id="product-seri-form">
                <div class="modal-header" id="modal-header">
                    <h2 class="fw-bold">Thêm dòng sản phẩm</h2>
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
                            <label class="required fs-6 fw-semibold mb-2" for="product-seri-name">Tên dòng sản
                                phẩm</label>
                            <input type="text" id="product-seri-name" class="form-control form-control-solid"
                                placeholder="Ex: Lenovo Thinkpad" name="name" autofocus />
                        </div>

                        <div class="fv-row mb-7" id="category-select">
                            <label class="required fs-6 fw-semibold mb-2">Danh mục</label>
                            <select class="form-select form-select-solid" id="category-id" name="category_id"
                                aria-label="Danh mục">
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
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
        const productSeriModal = $('#product-seri-modal');
        const productSeriForm = productSeriModal.find('#product-seri-form');

        productSeriForm.find('#category-id').select2({
            dropdownParent: '#category-select'
        });

        productSeriModal.on('hidden.bs.modal', function() {
            productSeriModal.find('#modal-header h2').text('Thêm dòng sản phẩm');
            productSeriForm.trigger('reset');
        })

        productSeriForm.on('submit', function(e) {
            e.preventDefault();
            const btnSubmit = $(this).find('button[type="submit"]');
            btnSubmit.attr('data-kt-indicator', "on");

            const data = {
                id: productSeriForm.find('input[name="id"]').val(),
                name: productSeriForm.find('input[name="name"]').val(),
                category_id: productSeriForm.find('select[name="category_id"]').val(),
                _token: $("input[name=_token]").val(),
            }

            $.ajax({
                url: !data.id ? "{{ route('product_seri.store') }}" :
                    "{{ route('product_seri.update') }}",
                type: 'POST',
                data: data,
                success: function(res) {
                    if (res.code == 0) {
                        productSeriModal.modal('hide');
                        toastr.success(!data.id ? "Thêm mới dòng sản phẩm thành công!" :
                            "Sửa dòng sản phẩm thành công!");
                        $('#product-seri-table').DataTable().ajax.reload();
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
