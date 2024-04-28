<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
    <title> Thank you </title>
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
<jsp:include page="../layout/header.jsp"/>

<div class="container">
    <div class="card text-center" style="margin-top: 95px">
        <div class="card-header">
            <h2 class="w-100 text-center text-success">
                Đặt hàng thành công
            </h2>
        </div>
        <div class="card-body">
            <p class="card-text w-75 mx-auto">
                Chân thành cảm ơn quý khách vì đã tin tưởng và chọn mua sản
                phẩm tại LaptopHaui. Điều này là một động lực lớn đối với chúng tôi để tiếp tục cung cấp
                những sản phẩm chất lượng và dịch vụ tốt nhất đến quý khách hàng.
            </p>
            <img src="/client/img/thankyou.png" alt="thank you very much" class="w-25">
            <br>
            <a href="/" class="btn btn-success mt-4">Về trang chủ</a>
        </div>
    </div>
</div>

<jsp:include page="../layout/feature.jsp"/>
<jsp:include page="../layout/footer.jsp"/>

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