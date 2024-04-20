<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
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

                <jsp:include page="../layout/header.jsp" />

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
                            <div>
                                <div style="text-align: center">
                                    <img src="/images/avatar/1710516069724-ảnh lớp.png" style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;">
                                    <br/>
                                    <input style="margin-top:1%; font-size:20px; font-weight: bold; text-align:center" type="text" value="UserName">

                                </div>
                                <div style=" margin-top: 25px;  padding-left: 25%; padding-right: 25%">
                                    <div style="background: #f0f8ff; border: 1px solid">
                                        <p style="margin-top: 5px; margin-left:15px; font-size:30px; color: #000; font-weight: bold; text-align: center">Thông tin người dùng</p>
                                        <label for="hoTen" class="col-info-1">Họ tên người dùng </label>
                                        <input type="text" value="FullName" class="col-info-2">
                                        <br/>
                                        <br/>
                                        <label for="hoTen" class="col-info-1">Giới tính </label>
                                        <input type="text" value="Gender" class="col-info-2">
                                        <br/>
                                        <br/>
                                        <label for="hoTen" class="col-info-1">Ngày sinh </label>
                                        <input type="date" class="col-info-2">
                                        <br/>
                                        <br/>

                                    </div>
                                    <br/>
                                    <div style="background: #f0f8ff; border: 1px solid">
                                        <p style="margin-top: 5px; margin-left:15px; font-size:30px; color: #000; font-weight: bold; text-align: center">Thông tin tài khoản</p>
                                        <label for="hoTen" class="col-info-1">Địa chỉ email </label>
                                        <input type="text" value="Email" class="col-info-2">
                                        <br/>
                                        <br/>
                                        <label for="hoTen" class="col-info-1">Số điện thoại </label>
                                        <input type="text" value="Phone number" class="col-info-2">
                                        <br/>
                                        <br/>
                                        <label for="hoTen" class="col-info-1">Mật khẩu </label>
                                        <input type="text" value="Passwork" class="col-info-2">
                                        <br/>
                                        <br/>
                                        <label for="hoTen" class="col-info-1">Địa chỉ </label>
                                        <input type="text" value="Address" class="col-info-2">
                                        <br/>
                                        <br/>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div style="text-align: right;margin-left:25%; margin-right:25%; margin-top: 15px"><a href="/show-info" class="btn btn-success">Xác nhận sửa</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Cart Page End -->


                <jsp:include page="../layout/footer.jsp" />


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