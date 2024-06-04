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
    <link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
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
            <div>

                <form:form method="post" modelAttribute="user" action="/info-setting" enctype="multipart/form-data">
                    <div style=" margin-top: 25px;  padding-left: 25%; padding-right: 25%">
                        <div class="st-div">
                            <div style="margin-top: 5%"><p style="padding-top: 3% ; margin-left:15px; font-size:30px; color: #000; font-weight: bold; text-align: center">
                                Sửa thông tin người dùng</p>
                                <hr style="margin-left: 5%;margin-right: 5%; margin-bottom: 5% ;"/>
                            </div>
                            <div class="mb-3 d-flex justify-content-between" style="margin-left: 30px; margin-top: 15px">
                                <div class="d-flex">
                                    <img src="/images/avatar/${user.avatar}"
                                         style="width: 70px; height: 70px; border-radius: 50%; overflow: hidden;">
                                </div>

                                <div class="fw-bold mb-3" style="margin-right: 33px; width: 44%">
                                    <label for="avatarFile" class="form-label">Ảnh đại diện:</label>
                                    <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg"
                                           name="uploadAvatarFile">
                                </div>
                            </div>
                            <div class="mb-3" style="display: none;">
                                <label class="form-label">ID:</label>
                                <form:input type="text" class="form-control"
                                            path = "id"
                                />
                            </div>
                            <div style="display: inline-grid; margin-left: 33px ; width:47%">
                                <label class="fw-bold">Họ và tên </label>
                                <form:input type="text" path="fullName" class="col-info-2 mb-3"/>
                            </div>
                            <div style="display: inline-grid; width:47%">
                                <label class="fw-bold">Giới tính </label>
                                <form:input path="gender" class="col-info-2 mb-3"/>
                            </div>
                            <div style="display: inline-grid; width:47%; margin-left: 33px">
                                <label class="fw-bold">Ngày sinh </label>
                                <form:input type="date" pattern="\d{4}-\d{2}-\d{2}" path="dob" class="col-info-2 mb-3"/>
                            </div>
                            <div style="display: inline-grid; width:47%">
                                <label class="fw-bold">Số điện thoại </label>
                                <form:input type="text" path="phoneNumber" class="col-info-2 mb-3"/>
                            </div>
                            <div style="display: grid; margin-left: 33px">
                                <label class="fw-bold">Địa chỉ </label>
                                <form:input type="text" path="address" class="col-info-2 mb-3" style="width: 95%"/>
                            </div>
                            <div class="d-flex justify-content-center mt-4">
                                <button type="submit" class="btn btn-color-blue mb-5 mx-2">Xác nhận sửa</button>
                                <a href="/show-info"><button type="submit" class="btn btn-color-blue mb-4 mx-2">Hủy</button></a>
                            </div>
                        </div>
                    </div>
                </form:form>
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