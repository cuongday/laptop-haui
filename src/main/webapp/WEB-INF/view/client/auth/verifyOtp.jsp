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
        <form method="post"
              class="col-lg-6 bg-primary rounded p-5">
            <h2 class="text-center text-white mb-4">Xác thực OTP</h2>
            <%--            thêm thời gian đếm ngược 60s--%>
            <div class="mb-3">
                <div class="d-flex justify-content-between">
                    <label for="otp" class="form-label text-white">OTP</label>
                    <div id="countdown"></div>
                </div>
                <input class="form-control" id="otp" name="otp"/>
            </div>
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-light submitOtp">Xác thực</button>
                <button type="submit" class="btn btn-light submitResend">Gửi lại OTP</button>
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
        const countdownElement = $('#countdown');
        countdownElement.css('color', 'white');
        const submitBtn = $('.submitOtp');
        const submitResendBtn = $('.submitResend');
        submitResendBtn.css('display', 'none');
        // let timeLeft = 5;


        <%--function updateCountdown(timeLeft) {--%>
        <%--    const csrfToken = $('[name="${_csrf.parameterName}"]').val();--%>
        <%--    const minutes = Math.floor(timeLeft / 60);--%>
        <%--    const seconds = timeLeft % 60;--%>
        <%--    if(seconds < 10){--%>
        <%--        countdownElement.text(`Time left: ` + minutes + `: 0` + seconds);--%>
        <%--    } else--%>
        <%--        countdownElement.text(`Time left: ` + minutes + `: ` + seconds);--%>
        <%--    timeLeft--;--%>

        <%--    if (timeLeft >= 0) {--%>
        <%--        setTimeout(updateCountdown, 1000);--%>
        <%--    } else {--%>
        <%--        countdownElement.text("Time's up!");--%>
        <%--        submitBtn.prop('disabled', true);--%>
        <%--        $.toast({--%>
        <%--            text: "Hết thời gian xác thực, vui lòng gửi lại mã OTP",--%>
        <%--            showHideTransition: 'slide',--%>
        <%--            bgColor: 'red',--%>
        <%--            textColor: 'white',--%>
        <%--            allowToastClose: true,--%>
        <%--            hideAfter: 5000,--%>
        <%--            stack: 5,--%>
        <%--            textAlign: 'left',--%>
        <%--            position: 'top-right',--%>
        <%--            icon: 'error'--%>
        <%--        });--%>
        <%--        submitResendBtn.css('display', 'block')--%>
        <%--        $.ajax({--%>
        <%--            url:`/forgot-password/delete/${email}`,--%>
        <%--            type: 'POST',--%>
        <%--            headers: {--%>
        <%--                'X-CSRF-TOKEN': csrfToken // Gửi CSRF token trong header--%>
        <%--            },--%>
        <%--        });--%>
        <%--    }--%>
        <%--}--%>

        function updateCountdown(timeLeft) {
            const csrfToken = $('[name="${_csrf.parameterName}"]').val();
            const minutes = Math.floor(timeLeft / 60);
            const seconds = timeLeft % 60;
            if(seconds < 10){
                countdownElement.text(`Time left: ` + minutes + `: 0` + seconds);
            } else
                countdownElement.text(`Time left: ` + minutes + `: ` + seconds);
            timeLeft--;

            if (timeLeft >= 0) {
                setTimeout(() => updateCountdown(timeLeft), 1000);
            } else {
                countdownElement.text("Time's up!");
                submitBtn.prop('disabled', true);
                $.toast({
                    text: "Hết thời gian xác thực, vui lòng gửi lại mã OTP",
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
                submitResendBtn.css('display', 'block')
                $.ajax({
                    url:`/forgot-password/delete/${email}`,
                    type: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': csrfToken // Gửi CSRF token trong header
                    },
                });
            }
        }
        updateCountdown(60);

        submitBtn.click((e) => {
            e.preventDefault();
            const otp = $('#otp').val();
            const csrfToken = $('[name="${_csrf.parameterName}"]').val(); // Lấy CSRF token từ input hidden
            const email = encodeURIComponent('${email}'); // Mã hóa email để sử dụng trong URL

            $.ajax({
                url: `/forgot-password/verify-otp/` + otp ,
                type: 'POST',
                headers: {
                    'X-CSRF-TOKEN': csrfToken // Gửi CSRF token trong header
                },
                success: function (data) {
                    $.toast({
                        text: "Xác thực thành công",
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
                    setTimeout(() => {
                        window.location.href = `/forgot-password/reset-password/${sessionScope.userEmail}`;
                    }, 5000);
                },
                error: function (error) {
                    $.toast({
                        text: "Mã otp không chính xác hoặc đã hết hạn",
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

        submitResendBtn.click((e) => {
            e.preventDefault();
            const csrfToken = $('[name="${_csrf.parameterName}"]').val(); // Lấy CSRF token từ input hidden
            const email = encodeURIComponent('${email}'); // Mã hóa email để sử dụng trong URL

            $.ajax({
                url: `/forgot-password/verify-email/${sessionScope.userEmail}` ,
                type: 'POST',
                headers: {
                    'X-CSRF-TOKEN': csrfToken // Gửi CSRF token trong header
                },
                success: function (data) {
                    $.toast({
                        text: "Gửi mã OTP thành công",
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
                    submitBtn.prop('disabled', false);
                    updateCountdown(60);
                },
                error: function (error) {
                    $.toast({
                        text: "Gửi mã OTP thất bại",
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