<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> Lịch sử mua hàng - Laptopshop</title>
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
</head>

<body>

<!-- Spinner Start -->
<div id="spinner"
     class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->

<jsp:include page="../layout/header.jsp"/>

<!-- Cart Page Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="mb-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Quản lý người dùng</li>
                </ol>
            </nav>
            <form:form method="get" modelAttribute="user">
                <div style="background:#f0f8ff; margin-left:25%; margin-right:25%" class="mt-5">
                    <div>
                        <div style="text-align: center"><img src="/images/avatar/${sessionScope.avatar}"
                                                             style="width: 150px; height: 150px; border-radius: 50%; margin-top: 25px">
                        </div>
                    </div>
                    <div style="display: inline-block; margin-left:45px" class="mt-3">
                        <div style="font-size: 20px; font-weight: bold;color: #000">Họ
                            tên: ${sessionScope.fullName}</div>
                        <br/>
                        <div style="display:flex">
                            <div style="font-size: 20px; font-weight: bold;color: #000;">Giới
                                tính: ${sessionScope.gender}</div>
                            <div style="font-size: 20px; font-weight: bold;color: #000;margin-left:90px">Ngày
                                sinh: ${sessionScope.dob}</div>
                        </div>
                        <br/>
                        <div style="font-size: 20px; font-weight: bold;color: #000;">Địa
                            chỉ: ${sessionScope.address}</div>
                        <br/>
                        <div style="font-size: 20px; font-weight: bold;color: #000;">Số điện
                            thoại: ${sessionScope.phoneNumber}</div>
                        <br/>
                        <div style="font-size: 20px; font-weight: bold;color: #000;">Email: d*****@gmail.com</div>
                        <br/>
                        <div style="font-size: 20px; font-weight: bold;color: #000;">Mật khẩu: ********</div>
                        <br/>
                    </div>
                </div>
            </form:form>
            <div>
                <div class="mt-3 d-flex justify-content-center"><a
                        href="/info-setting" class="btn btn-success">Sửa thông tin</a></div>
            </div>
        </div>
    </div>
</div>
<!-- Cart Page End -->


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

<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
</body>

</html>