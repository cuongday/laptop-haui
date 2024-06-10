<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Thông tin tài khoản - Laptopshop</title>
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
<div class="container-fluid py-7">
    <div class="container py-5">
        <div class="mb-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Quản lý người dùng</li>
                </ol>
            </nav>
            <form:form method="get" modelAttribute="user">
                <div style="margin-left:20%; margin-right:20%" class="mt-6 st-div-2 ">
                    <div>
                        <div style="text-align: center; display: absolute"><img src="/images/avatar/${user.avatar}"
                                                             style="width: 150px; height: 150px; border-radius: 50%; margin-top: -10%; box-shadow: 0 0 10px #8C8C8C;">
                        </div>
                    </div>
                    <div >
                        <div class="mt-3">
                            <div class="offset-12 d-inline-block">
                                <div class="fs-4 d-flex"><p class="fw-bold mb-3 text-primary">Họ và tên:&nbsp; </p> ${user.fullName}</div>
                                <div class="fs-4 d-flex"><p class="fw-bold mb-3">Ngày sinh:&nbsp; </p> <fmt:formatDate value="${user.dob}" pattern="dd/MM/yyyy"/></div>
                            </div>
                            <div class="offset-12 d-inline-block ">
                                <div class="fs-4 d-flex "><p class="fw-bold mb-3"> Giới tính:&nbsp;</p>${user.gender}</div>
                                <div class="fs-4 d-flex "><p class="fw-bold mb-3"> Số điện thoại:&nbsp; </p> ${user.phoneNumber}</div>
                            </div>
                            <div class="fs-4 offset-12 d-flex mb-2"> <p class="fw-bold">Địa chỉ:&nbsp; </p> ${user.address}</div>
                            <div class="fs-4 offset-12 d-flex mb-3"> <p class="fw-bold">Email:&nbsp; </p> ${user.email}</div>
                            <div>
                                <div class="mt-3 d-flex justify-content-center ">
                                <a href="/info-setting" class="btn btn-color-blue mb-4">Sửa thông tin</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>

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

<script>
    $(document).ready(() => {

    });
</script>
</body>

</html>