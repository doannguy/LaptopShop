"use strict";

// Class definition
var KTAccountSettingsSigninMethods = (function () {
    var passwordMainEl;
    var passwordEditEl;
    var passwordChange;
    var passwordCancel;
    var toggleChangePassword = function () {
        passwordMainEl.classList.toggle("d-none");
        passwordChange.classList.toggle("d-none");
        passwordEditEl.classList.toggle("d-none");
    };

    // Private functions
    var initSettings = function () {

        passwordChange
            .querySelector("button")
            .addEventListener("click", function () {
                toggleChangePassword();
            });

        passwordCancel.addEventListener("click", function () {
            toggleChangePassword();
        });
    };

    var handleChangePassword = function (e) {
        var validation;

        // form elements
        var passwordForm = document.getElementById("kt_signin_change_password");

        if (!passwordForm) {
            return;
        }

        validation = FormValidation.formValidation(passwordForm, {
            fields: {
                currentpassword: {
                    validators: {
                        notEmpty: {
                            message: "Bạn chưa điền mật khẩu hiện tại",
                        },
                    },
                },

                newpassword: {
                    validators: {
                        notEmpty: {
                            message: "Bạn chưa điền mật khẩu mới",
                        },
                    },
                },

                confirmpassword: {
                    validators: {
                        notEmpty: {
                            message: "Bạn chưa nhập lại mật khẩu mới",
                        },
                        identical: {
                            compare: function () {
                                return passwordForm.querySelector(
                                    '[name="newpassword"]'
                                ).value;
                            },
                            message:
                                "Mật khẩu nhập lại không trùng khớp",
                        },
                    },
                },
            },

            plugins: {
                //Learn more: https://formvalidation.io/guide/plugins
                trigger: new FormValidation.plugins.Trigger(),
                bootstrap: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".fv-row",
                }),
            },
        });

        passwordForm
            .querySelector("#kt_password_submit")
            .addEventListener("click", function (e) {
                e.preventDefault();
                console.log("click");

                validation.validate().then(function (status) {
                    if (status == "Valid") {
                        passwordForm.submit();
                    } else {
                        swal.fire({
                            text: "Có lỗi xảy ra, hãy kiểm tra lại",
                            icon: "error",
                            buttonsStyling: false,
                            confirmButtonText: "Ok, got it!",
                            customClass: {
                                confirmButton:
                                    "btn font-weight-bold btn-light-primary",
                            },
                        });
                    }
                });
            });
    };

    // Public methods
    return {
        init: function () {
            passwordMainEl = document.getElementById("kt_signin_password");
            passwordEditEl = document.getElementById("kt_signin_password_edit");

            passwordChange = document.getElementById(
                "kt_signin_password_button"
            );
            passwordCancel = document.getElementById("kt_password_cancel");

            initSettings();
            handleChangePassword();
        },
    };
})();

// On document ready
KTUtil.onDOMContentLoaded(function () {
    KTAccountSettingsSigninMethods.init();
});
