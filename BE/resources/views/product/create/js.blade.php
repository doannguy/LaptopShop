
$(document).ready(function () {
    const listAttribute = JSON.parse('{!! json_encode($attributes) !!}');
    const form = $('#product-save-form');
    let lastSelectValue = null;

    // init text editor
    ClassicEditor
        .create(document.querySelector('#add_product_description'))
        .then(editor => {
            console.log(editor);
        })
        .catch(error => {
            console.error(error);
        });
    /// form thêm phiên bản động
    $("#product-options").repeater({
        initEmpty: true,

        show: function () {
            $(this).slideDown((e) => {
                // console.log($(this).index());
                handleProductOptionRowAdd($(this));
            })
        },
        hide: function (e) {
            $(this).slideUp(e)
        }
    })
    const handleProductOptionRowAdd = (row_collapse) => {
        let collapseButton = row_collapse.find('a.collapse-button');
        collapseButton.attr('href', `#product_option_collapse_${row_collapse.index()}`);
        collapseButton.attr('aria-controls', `product_option_collapse_${row_collapse.index()}`);
        row_collapse.find('.option-status').select2();
        let collapseForm = row_collapse.find('div.collapse');

        collapseForm.attr('id', `product_option_collapse_${row_collapse.index()}`);
        let nameInput = collapseForm.find('.product-option-name');

        nameInput.on('change', (e) => {
            let name = e.target.value;

            collapseButton.text(name);
        })
        let productAttributeForm = collapseForm.find('.product-attribute-form');
        productAttributeForm.attr('id', `product_attribute_form_${row_collapse.index()}`);
        productAttributeForm.find('div[data-repeater-list]').attr('data-repeater-list', 'product_attribute_values_' + row_collapse.index());
        let listAttributeStatus = createNewListAttribute();

        productAttributeForm.repeater({
            initEmpty: true,
            defaultValues: {
                "text-input": "foo"
            },
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
        const handleRowAdd = (row) => {
            row.on('change', 'select.product-variable', function (e) {

                var attributeSelectId = e.target.value;
                let attributeValues = listAttributeStatus.find((attribute) => attribute.id ==
                    attributeSelectId).values;
                let variableValue = row.find('select.product-variable-value');
                console.log("change", attributeValues);
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
                    let option = row_collapse.find(`option[value="${value.id}"]`);
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
    // handle category select change
    form.find('select[name="category"]').on('select2:select', function (e) {
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
                form.find('select[name="product_seri"]').html(html);
                form.find('select[name="product_seri"]').prop('disabled', false);
            },
            error: function (res) {
                toastr.error(res.responseText);
            }
        })
    })
    /// handle submit form
    form.on('submit', function (e) {
        e.preventDefault();
        const data = form.serializeArray();

        const dataSend = new FormData();
        try {
            dataSend.append('_token', $("input[name=_token]").val());
            dataSend.append('name', $("input[name=name]").val());
            dataSend.append('thumbnail', $("input[name=thumbnail]")[0].files[0]);
            dataSend.append('short_description', $("textarea[name=short_description]").val());
            dataSend.append('description', $("textarea[name=description]").val());
            dataSend.append('brand_id', $("select[name=brand]").val());
            dataSend.append('category_id', $("select[name=category]").val());
            dataSend.append('product_seri_id', $("select[name=product_seri]").val());
            let product_option = [];
            productOptionElements = document.querySelectorAll('#product-options .product-option')
            productOptionElements.forEach((element, index) => {
                let productAttributeElements = element.querySelectorAll('.product-attribute-form')
                let product_attribute_values = [];

                productAttributeElements.forEach((attribute) => {
                    product_attribute_values.push(attribute.querySelector('select.product-variable-value')?.value)
                })
                product_option.push({
                    name: element.querySelector('input.option-name').value,

                    amount: element.querySelector('input.option-amount').value,
                    price: element.querySelector('input.option-price').value,
                    current_price: element.querySelector('input.option-current-price').value,
                    product_attribute_values: product_attribute_values,
                    status: element.querySelector('select.option-status').value
                })
                let image_files = element.querySelector('input.option-image').files;
                if (image_files.length > 0) {
                    for (let i = 0; i < image_files.length; i++) {
                        dataSend.append('product_option_image_' + index + '[]', image_files[i]);
                    }
                }

            })

            dataSend.append('product_options', JSON.stringify(product_option))


            $.ajax({
                url: "{{ route('product.store') }}",
                type: 'POST',
                data: dataSend,
                processData: false,
                contentType: false,
                success: function (res) {
                    console.log(res);
                    if(res.code == 0) {
                        toastr.success("Thêm thành công");
                        setTimeout(() => {
                            window.location.href = "{{ route('product.index') }}";
                        }, 2000)
                    }else {
                        toastr.error(res.message);
                    }


                },
                error: function (res) {
                    console.log(res);
                    toastr.error(res.responseJSON.message);
                }
            })
        } catch (error) {
            console.log(error);
            toastr.error("Hãy điền đầy đủ thông tin sản phâmr");
        }


    })

})

