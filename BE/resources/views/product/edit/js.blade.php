
const listAttribute = JSON.parse('{!! json_encode($attributes) !!}');
const productEdit = () => {
    let datatable, timeoutSearch, editForm, myDropzone, addButton, modal, formProductOption, productAttributeForm, listAttributeStatus, productAttributeReapeater, removeImages;
    let lastSelectValue = null;
    modal = $("#product-option-modal");
    editForm = $("#product-edit-form");
    formProductOption = modal.find("#product-option-form");
    const repeaterList = modal.find('div[data-repeater-list]');
    const repeaterItemTemplate = $(modal.find('div[data-repeater-item]')[0]).clone();
    productAttributeForm = modal.find(".product-attribute-form");
    const initDatatable = () => {
        datatable = $("#product-options-table").DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ route('product.product_options_datatable', ['id' => $product->id]) }}",
                type: "POST",
                data: function (d) {
                    d.search = $('#product-search').val();
                    d._token = $("input[name=_token]").val();
                }
            },
            columnDefs: [{
                targets: 0,
                data: 'name',
                orderable: true,
                render: function (data, type, row, meta) {

                    return `<div class="d-flex align-items-center">
                                        <a href="apps/ecommerce/catalog/edit-product.html" class="symbol symbol-50px">
                                            <span class="symbol-label" style="background-image:url('{{ url('/storage') }}/${row?.product_media[0]?.path ?? ''}');"></span>
                                        </a>
                                        <div class="ms-5">
                                            <a href="apps/ecommerce/catalog/edit-product.html" class="text-gray-800 text-hover-primary fs-5 fw-bold" data-kt-ecommerce-product-filter="product_name">${data ?? ''}</a>
                                        </div>
                                    </div>`
                }
            },
            {
                targets: 1,
                data: 'selled',
                orderable: false,
                className: 'text-center',
                render: function (data, type, row) {
                    return `<span class="fw-bold">${data ?? '0'}</span>`
                }
            },
            {
                targets: 2,
                data: 'amount',
                orderable: false,
                className: 'text-center',
                render: function (data, type, row) {
                    return `<span class="fw-bold">${data ?? '0'}</span>`
                }
            },
            {
                targets: 3,
                data: 'price',
                orderable: false,
                className: 'text-center',
                render: function (data, type, row) {
                    return `<span class="fw-bold">${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(data)}</span>`
                }
            },
            {
                targets: 4,
                data: 'current_price',
                orderable: false,
                className: 'text-center',
                render: function (data, type, row) {
                    return `<span class="fw-bold">${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(data)}</span>`
                }
            },
            {
                targets: 5,
                data: 'status_label',
                orderable: false,
                className: 'text-center',
                render: function (data, type, row) {
                    return `<span class="fw-bold">${data}</span>`
                }
            },
            {
                targets: -1,
                data: null,
                orderable: false,
                className: 'text-center min-w-150px',
                render: function (data, type, row) {
                    return `
                            <div>
                                <a class="btn btn-warning btn-active-light-warning me-2 btn-sm edit-button">Sửa</a>
                                <a class="btn btn-danger btn-active-light-danger btn-sm btn-delete">Xóa</a>
                            </div>
                                `;
                },
            },
            ],
        });
        const getRowData = (row) => {
            return datatable.row(row).data();
        }
        const initEditAction = () => {
            $(document).on('click', '.edit-button', function () {
                resetForm();
                const productOption = getRowData($(this).closest('tr'));
                const productOptionId = productOption.id

                modal.find('#modal-header h2').text('Sửa thông tin dòng sản phẩm')
                formProductOption.find('input[name="id"]').val(productOptionId);
                formProductOption.find('input[name="name"]').val(productOption.name);
                formProductOption.find('input[name="amount"]').val(productOption.amount);
                formProductOption.find('input[name="current_price"]').val(productOption.current_price);
                formProductOption.find('input[name="price"]').val(productOption.price);
                formProductOption.find('select[name="status"]').val(productOption.status);
                myDropzone.removeAllFiles(true);
                // render ảnh cũ
                for (let index = 0; index < productOption.product_media.length; index++) {
                    const media = productOption.product_media[index];
                    const url = "{{ url('/storage') }}/" + media.path
                    var mockFile = { name: "image_" + index, size: 0, url: url, serverID: 0, accepted: true, id: media.id };
                    myDropzone.emit("addedfile", mockFile);
                    myDropzone.emit("success", mockFile);
                    myDropzone.emit("thumbnail", mockFile, url);
                    myDropzone.emit("complete", mockFile);
                    myDropzone.files.push(mockFile);
                    mockFile.previewElement.querySelector(".dz-image img").style.width = "100%";
                    mockFile.previewElement.querySelector(".dz-details ").style.display = "none";
                    mockFile.url = url;
                }

                listAttributeStatus = listAttribute.map(attribute => ({
                    id: attribute.id,
                    name: attribute.name,
                    values: attribute.values.map(value => {
                        return {
                            id: value.id,
                            text: value.value,
                            isSelected: productOption.attribute_values.find(attributeValue => attributeValue.id === value.id) ? true : false
                        }
                    })
                }));
                // render list attribute
                repeaterList.empty();
                initReapeater();
                for (let index = 0; index < productOption.attribute_values.length; index++) {
                    const attributeValue = productOption.attribute_values[index];
                    let repeaterItem = repeaterItemTemplate.clone();
                    console.log(attributeValue.attribute_id);
                    repeaterList.append(repeaterItem);
                    handleRowAdd(repeaterItem);
                    repeaterItem.find('select[name="product_variable"]').val(attributeValue.attribute_id).trigger('change');
                    repeaterItem.find('select.product-variable-value').val(attributeValue.pivot.attribute_value_id).trigger('change');
                }

                modal.modal('show');
            })
        }
        const initDeleteAction = () => {
            $(document).on('click', '.btn-delete', function () {
                const productOption = getRowData($(this).closest('tr'));
                const productOptionId = productOption.id
                Swal.fire({
                    title: 'Xóa',
                    text: 'Bán có chắc chắn muốn xóa phiên bản này ?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Xóa',
                    cancelButtonText: 'Huỷ',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "{{ route('product_option.delete') }}",
                            type: 'POST',
                            data: {
                                id: productOptionId,
                                _token: $("input[name=_token]").val()
                            },
                            success: function (res) {
                                if (res.code == 0) {
                                    datatable.ajax.reload();
                                    toastr.success(res.message);
                                } else {
                                    toastr.error(res.message);
                                }
                            },
                            error: function (res) {
                                toastr.error(res.responseText);
                            }
                        });
                    }
                })
            })
        }
        datatable.on('draw', function () {
            initEditAction();
            initDeleteAction();
        });
    }
    const initDropzone = () => {
        myDropzone = new Dropzone("#dropzone_product_option", {
            url: "#", // Set the url for your upload script location
            paramName: "file", // The name that will be used to transfer the file
            maxFiles: 10,
            maxFilesize: 10, // MB
            addRemoveLinks: true,
            autoProcessQueue: false,
            acceptedFiles: ".jpeg,.jpg,.png,.gif",
        });
        myDropzone.on("removedfile", function (file) {
            if (file.id) {
                removeImages.push(file.id);

            }
        });
    }
    const initReapeater = (listInit = null) => {
        if (productAttributeReapeater == undefined) {
            productAttributeReapeater = productAttributeForm.repeater({
                initEmpty: true,
                show: function () {
                    $(this).slideDown(() => {
                        handleRowAdd($(this));
                    })
                },
                hide: function (e) {
                    handleRowRemove($(this));
                    $(this).slideUp(e)
                }
            })
        }
        if (listInit != null) {
            productAttributeReapeater.setList(listInit);
        }
    }
    const handleAddButton = () => {
        addButton = $('#btn-add-product-option');
        addButton.on('click', function () {
            // Reset toàn bộ form bằng cách sử dụng jQuery
            resetForm();
            modal.modal('show');
            initReapeater();
        });
    }
    const handleRowAdd = (row) => {
        row.on('change', 'select.product-variable', function (e) {
            var attributeSelectId = e.target.value;
            let attributeValues = listAttributeStatus.find((attribute) => attribute.id ==
                attributeSelectId).values;
            let variableValue = row.find('select.product-variable-value');
            html = '<option>Chọn giá trị</option>';
            attributeValues.forEach((value) => {
                if (value.isSelected == true) {
                    html = html.concat(
                        `<option value="${value.id}" disabled>${value.text}</option>`
                    )
                } else {
                    html = html.concat(`<option value="${value.id}">${value.text}</option>`)
                }
                variableValue.html(html);
            })
            variableValue.prop('disabled', false)
            variableValue.on('focus', function (e) {
                lastSelectValue = e.target.value
            })
            variableValue.on('change', function (e) {
                listAttributeStatus = listAttributeStatus.map(attribute => {
                    if (attribute.id == attributeSelectId) {
                        attribute.values = attribute.values.map(value => {
                            if (value.id == e.target.value) {
                                value.isSelected = true
                            }
                            if (value.id == lastSelectValue) {
                                value.isSelected = false
                            }
                            return value
                        })
                    }
                    return attribute
                })
                ChangeOptionDisable();
            })
        });
    }
    const ChangeOptionDisable = () => {
        listAttributeStatus.forEach((attribute) => {
            attribute.values.forEach((value) => {
                let option = productAttributeForm.find(`option[value="${value.id}"]`);
                if (value.isSelected == true) {
                    if (option.length > 0 && !option.is(':selected')) {
                        option.prop('disabled', true);
                    }
                } else {
                    if (option.length > 0) {
                        option.prop('disabled', false);
                    }
                }

            })
        })

    }
    const handleRowRemove = (row) => {
        let attributeValue = row.find('select.product-variable-value').val();
        listAttributeStatus = listAttributeStatus.map(attribute => {
            attribute.values = attribute.values.map(value => {
                if (value.id == attributeValue) {
                    value.isSelected = false
                }
                return value
            })
            return attribute
        })
        ChangeOptionDisable();
    }
    const createNewListAttribute = () => {
        return listAttribute.map(attribute => ({
            id: attribute.id,
            name: attribute.name,
            values: attribute.values.map(value => {
                return {
                    id: value.id,
                    text: value.value,
                    isSelected: false
                }
            })
        }));
    }
    const initTextEditor = () => {
        ClassicEditor
            .create(document.querySelector('#add_product_description'))
            .then(editor => {
                console.log(editor);
            })
            .catch(error => {
                console.error(error);
            });
    }
    const resetForm = () => {
        repeaterList.empty();
        $('#product-option-form').trigger('reset');
        myDropzone.removeAllFiles(true);
        listAttributeStatus = createNewListAttribute();
        removeImages = [];
    }

    formProductOption.submit(function (e) {
        e.preventDefault();
        var formData = new FormData(this);
        myDropzone.files.forEach(function (file) {
            if (!file.url) { // Chỉ thêm các tệp mới
                formData.append("product_option_image_file[]", file);
            }
        });
        let id = formProductOption.find('input[name="id"]').val();
        formData.append("product_id", "{{ $product->id }}");
        formData.append("removed_images", JSON.stringify(removeImages));
        document.querySelectorAll('.product-variable-value').forEach((value) => {
            formData.append("product_attribute_values[]", value.value);
        })

        $.ajax({
            url: id ? ("{{ route('product_option.update') }}") : ("{{ route('product_option.store') }}"),
            method: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            dataType: "json",
            success: function (res) {
                if (res.code == 0) {

                    toastr.success(res.message);
                    datatable.ajax.reload();
                    resetForm();
                    modal.modal('hide');
                    // window.location.href = "{{ route('product.index') }}";
                } else {
                    if (res.data?.length > 0) {
                        res.data.forEach((error) => {
                            toastr.error(error);
                        })
                    }
                    toastr.error(res.message);
                }
            }

        });
    });

    // handle category select change
    console.log($('select[name="category"]'));
    $('select[name="category"]').on('select2:select', function (e) {
        console.log(e);
        const categoryId = e.target.value;
        $.ajax({
            url: "{{ route('product_seri.get_by_category_id') }}",
            type: 'POST',
            data: {
                category_id: categoryId,
                _token: $("input[name=_token]").val()
            },
            success: function (res) {
                const html = res.data.map((seri) => {
                    return `<option value="${seri.id}">${seri.name}</option>`
                })
                $('select[name="product_seri"]').html(html);
                $('select[name="product_seri"]').prop('disabled', false);
            },
            error: function (res) {
                toastr.error(res.responseText);
            }
        })
    })

    // handle save product
    editForm.submit(function (e) {
        e.preventDefault();
        console.log(editForm.serializeArray());
        var formData = new FormData(this);
        formData.append("product_id", "{{ $product->id }}");
        $.ajax({
            url: "{{ route('product.update') }}",
            method: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            dataType: "json",
            success: function (res) {
                if (res.code == 0) {
                    toastr.success(res.message);
                } else {
                    if (res.data?.length > 0) {
                        res.data.forEach((error) => {
                            toastr.error(error);
                        })
                    }
                    toastr.error(res.message);
                }
            },
            error: function (res) {
                toastr.error(res.responseText);
            }
        });

    })

    initDatatable();
    initDropzone();
    handleAddButton();
    initTextEditor();
}
KTUtil.onDOMContentLoaded((function () {
    productEdit()
}));
