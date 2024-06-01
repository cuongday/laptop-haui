<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Forgot Password</title>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
          rel="stylesheet">
</head>
<body>

<jsp:include page="../layout/header.jsp"/>


<div class="container h-100" style="margin-top: 158px ">
    <div class="row h-100 justify-content-center align-items-center py-7">
        <form method="post" class="col-lg-6 bg-primary rounded p-5">
            <h2 class="text-center text-white mb-4">Đổi mật khẩu</h2>
            <div class="mb-3">
                <label class="form-label text-white">Mật khẩu</label>
                <input type="password" class="form-control" id="password" />
            </div>
            <div class="mb-3">
                <label class="form-label text-white">Xác nhận mật khẩu</label>
                <input type="password" class="form-control" id="confirmPassword"/>
            </div>
            <div>
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </div>
            <div class="d-grid gap-2">
                <button type="button" class="btn btn-light submitOtp">Xác nhận</button>
            </div>
        </form>

    </div>
</div>




<jsp:include page="../layout/footer.jsp"/>



<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(() => {
        const password = $('#password');
        const confirmPassword = $('#confirmPassword');
        const submitBtn = $('.submitOtp');
        const csrfToken = $('[name="${_csrf.parameterName}"]').val();
        submitBtn.click((e) => {
            e.preventDefault();  // Ngăn chặn form submit mặc định
            if (password.val() !== confirmPassword.val()) {
                $.toast({
                    text: 'Password and confirm password must be the same',
                    showHideTransition: 'slide',
                    bgColor: 'red',
                    textColor: 'white',
                    allowToastClose: true,
                    hideAfter: 5000,
                    stack: 5,
                    textAlign: 'left',
                    position: 'top-right',
                    icon: 'error'
                });
                return;
            }
            $.ajax({
                url: `/forgot-password/reset-password/${email}`, // Chú ý dấu ngoặc kép
                type: 'POST',
                contentType: 'application/json',
                headers: {
                    'X-CSRF-TOKEN': csrfToken  // Gửi CSRF token trong header
                },
                data: JSON.stringify({
                    password: password.val(),
                    confirmPassword: confirmPassword.val()
                }),
                success: function (data) {
                    $.toast({
                        text: "Đổi mật khẩu thành công",
                        showHideTransition: 'slide',
                        bgColor: '#28a745',
                        textColor: 'white',
                        allowToastClose: true,
                        hideAfter: 5000,
                        stack: 5,
                        textAlign: 'left',
                        position: 'top-right',
                        icon: 'success'
                    });
                    window.location.href = '/';
                },
                error: function (error) {
                    $.toast({
                        text: "Đổi mật khẩu không thành công",
                        showHideTransition: 'slide',
                        bgColor: '#dc3545',
                        textColor: 'white',
                        allowToastClose: true,
                        hideAfter: 5000,
                        stack: 5,
                        textAlign: 'left',
                        position: 'top-right',
                        icon: 'error'
                    });
                }
            });
        });
    });

</script>

</body>
</html>