<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
    <title> ${product.name} - LaptopHaui</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
          rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>


    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
          rel="stylesheet">
</head>
</head>

<body>

<jsp:include page="../layout/header.jsp"/>

<div class="container-fluid py-6 mt-5">
    <div class="container py-6">
        <div class="row g-4 mb-3 mt-3 policy">
            <div class="pb-sm-2 policy-heading">
                <h2 class="text-primary">Chính sách bảo hành - Cam kết hỗ trợ khách hàng tối đa</h2>
            </div>
            <div class="policy-content">
                <p>LaptopHaui rất tiếc và xin lỗi vì sự bất tiện của Quý khách khi sản phẩm không may phát sinh lỗi phải bảo hành. Hi vọng chi tiết chính sách đổi trả – bảo hành tại LaptopHaui cũng như thông tin liên hệ các bộ phận hỗ trợ dưới đây có thể giúp Quý khách yên tâm hơn trong quá trình sử dụng sản phẩm.</p>
                <b>Hotline khiếu nại về sản phẩm dịch vụ: </b>
                <p>18003298</p>
                <b>Hotline tiếp nhận bảo hành: </b>
                <p>0396006368</p>
                <b>I. QUY ĐỊNH VỀ ĐỔI TRẢ SẢN PHẨM</b>
                <img class="mt-2" src="/client/img/bao-hanh.png">
            </div>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>


<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
        class="fa fa-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>


<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
</body>

</html>