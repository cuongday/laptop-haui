<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>HomePage</title>

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

    <meta name="_csrf" content="${_csrf.token}" />
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
          rel="stylesheet">
    <link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
</head>
<body>

<!-- Spinner Start -->
<div id="spinner"
     class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->

<jsp:include page="../layout/header.jsp"/>


<!-- Modal Search Start -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-75 mx-auto d-flex">
                    <input id="search-input" type="search" class="form-control p-3" placeholder="keywords"
                           aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text p-3"><i
                            class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Search End -->

<jsp:include page="../layout/banner.jsp"/>


<!-- Laptop Shop Start-->
<div class="container-fluid fruite py-3">
    <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4">
                <div class="col-lg-4 mb-3 text-start">
                    <h1>Sản phẩm nổi bật</h1>
                </div>
            </div>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4">
                                <c:forEach var="product" items="${products}">
                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <a href="/product/${product.id}">
                                                    <img src="/images/product/${product.getProductImages().get(0).image}"
                                                         class="img-fluid w-100 rounded-top" alt="">
                                                </a>
                                            </div>


                                            <div class="text-white px-2 py-1 position-absolute rounded"
                                                 style="top:10px; left: 10px; background: var(--bs-red);">New</div>
                                            <div
                                                    class="p-4 border-top-0 rounded-bottom bg-light">
                                                <h4 style="font-size: 15px;">
                                                    <a href="/product/${product.id}">
                                                            ${product.name}
                                                    </a>

                                                </h4>
                                                <p style="font-size: 13px;">${product.shortDesc}</p>
                                                <div
                                                        class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                                    <p style="font-size: 15px; text-align: center; width: 100%;"
                                                       class="text-dark  fw-bold mb-3">
                                                        <fmt:formatNumber type="number"
                                                                          value="${product.price}"/> đ
                                                    </p>
<%--                                                    <form action="/add-product-to-cart/${product.id}"--%>
<%--                                                          method="post">--%>
<%--                                                        <input type="hidden"--%>
<%--                                                               name="${_csrf.parameterName}"--%>
<%--                                                               value="${_csrf.token}"/>--%>
                                                        <button data-product-id="${product.id}"
                                                                class="btnAddToCartHomepage mx-auto btn btn-secondary rounded-pill px-3">
                                                            <i class="fa fa-shopping-bag me-2"></i>
                                                            Thêm vào giỏ
                                                        </button>
<%--                                                    </form>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="tab-2" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4 laptop-item">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Laptop Shop End-->

<jsp:include page="../layout/feature.jsp"/>

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

<script>
    $(document).ready(function () {
        searchProduct();
    });

    function searchProduct() {
        $('#search-icon-1').click(function () {
            let keyword = $('#search-input').val();
            if (keyword.length > 0) {
                $.ajax({
                    url: '/api/products/search?keyword=' + keyword,
                    type: 'GET',
                    contentType: "application/json",
                    dataType: "json",
                    success: function (json) {
                        $('#searchModal').modal('hide');
                        $('#tab-1').removeClass('active');
                        $('#tab-2').addClass('active');
                        console.log(json);
                        showSearchProduct(json);
                    }
                });
            }else{
                $('#searchModal').modal('hide');
                $('#tab-1').addClass('active');
                $('#tab-2').removeClass('active');
            }
        });
    }

    function showSearchProduct(data) {
        if (!data || !Array.isArray(data)) {
            console.error('Invalid data:', data);
            return;
        }
        let body = $('.laptop-item');
        body.empty();
        let str = '';
        for (let i = 0; i < data.length; i++) {
            str += '<div class="col-md-6 col-lg-4 col-xl-3">';
            str += '<div class="rounded position-relative fruite-item">';
            str += '<div class="fruite-img">';
            str += '<img src="/images/product/' + data[i].images[0].image + '" class="img-fluid w-100 rounded-top" alt="">';
            str += '</div>';
            str += '<div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Laptop</div> ';
            str += '<div class="p-4 border border-secondary border-top-0 rounded-bottom">';
            str += '<h4 style="font-size: 15px;"> <a href="/product/' + data[i].id + '">' + data[i].name + '</a></h4>';
            str += '<p style="font-size: 13px;">' + data[i].shortDesc + '</p>';
            str += '<div class="d-flex  flex-lg-wrap justify-content-center flex-column">';
            let formattedPrice = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(data[i].price);
            str += '<p style="font-size: 15px; text-align: center; width: 100%;" class="text-dark fw-bold mb-3">' + formattedPrice + '</p>';
            str += '<form action="/add-product-to-cart/' + data[i].id + '" method="post">';
            str += '<button class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</button>';
            str += '</form>';
            str += '</div>';
            str += '</div>';
            str += '</div>';
            str += '</div>';
        }
        body.append(str);
    }



</script>

</body>
</html>