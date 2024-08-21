<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
    <title> Sản Phẩm - LaptopHaui</title>
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
    <style>
        .page-link.disabled {
            color: var(--bs-pagination-disabled-color);
            pointer-events: none;
            background-color: var(--bs-pagination-disabled-bg);
        }
    </style>
</head>
</head>

<body>

<!-- Spinner Start -->
<div id="spinner"
     class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->

<jsp:include page="../layout/header.jsp"/>

<!-- Single Product Start -->
<div class="container-fluid py-6 mt-5">
    <div class="container py-6">
        <div class="row g-4 mb-5">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Danh Sách Sản Phẩm
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="row g-4 fruite" style="padding-right: 0px; --bs-gutter-y: 0.25rem">
                <div class="col-12 col-md-3">
                    <div class="row g-4">
                        <div class="col-12" id="factoryFilter">
                            <div class="mb-2"><b>Hãng sản xuất</b></div>
                           <div class="row ms-sm-1">
                               <div class="form-check form-check-inline col-sm-4">
                                   <input class="form-check-input" type="checkbox" id="factory-1"
                                          value="APPLE">
                                   <label class="form-check-label" for="factory-1">Apple</label>
                               </div>
                               <div class="form-check form-check-inline col-sm-4">
                                   <input class="form-check-input" type="checkbox" id="factory-2"
                                          value="ASUS">
                                   <label class="form-check-label" for="factory-2">Asus</label>
                               </div>

                               <div class="form-check form-check-inline col-sm-4">
                                   <input class="form-check-input" type="checkbox" id="factory-3"
                                          value="LENOVO">
                                   <label class="form-check-label" for="factory-3">Lenovo</label>
                               </div>
                           </div>

                            <div class="row ms-sm-1">
                                <div class="form-check form-check-inline col-sm-4">
                                    <input class="form-check-input" type="checkbox" id="factory-4"
                                           value="DELL">
                                    <label class="form-check-label" for="factory-4">Dell</label>
                                </div>
                                <div class="form-check form-check-inline col-sm-4">
                                    <input class="form-check-input" type="checkbox" id="factory-5"
                                           value="LG">
                                    <label class="form-check-label" for="factory-5">LG</label>
                                </div>
                                <div class="form-check form-check-inline col-sm-4">
                                    <input class="form-check-input" type="checkbox" id="factory-6"
                                           value="ACER">
                                    <label class="form-check-label" for="factory-6">Acer</label>
                                </div>
                            </div>

                        </div>
                        <div class="col-12" id="targetFilter">
                            <div class="mb-2"><b>Mục đích sử dụng</b></div>
                            <div class="row ms-sm-1">
                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="checkbox" id="target-1"
                                           value="GAMING">
                                    <label class="form-check-label" for="target-1">Gaming</label>
                                </div>

                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="checkbox" id="target-5"
                                           value="BUSINESS">
                                    <label class="form-check-label" for="target-5">Doanh nhân</label>
                                </div>
                            </div>
                            <div class="row ms-sm-1">
                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="checkbox" id="target-3"
                                           value="GRAPHIC">
                                    <label class="form-check-label" for="target-3">Thiết kế đồ
                                        họa</label>
                                </div>
                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="checkbox" id="target-4"
                                           value="THIN">
                                    <label class="form-check-label" for="target-4">Mỏng nhẹ</label>
                                </div>
                            </div>
                            <div class="row ms-sm-1">
                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="checkbox" id="target-2"
                                           value="OFFICE">
                                    <label class="form-check-label" for="target-2">Văn phòng</label>
                                </div>
                            </div>


                        </div>
                        <div class="col-12" id="priceFilter">
                            <div class="mb-2"><b>Mức giá</b></div>

                            <div class="row ms-sm-1">
                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="checkbox" id="price-2"
                                           value="duoi-10-trieu">
                                    <label class="form-check-label" for="price-2">Dưới 10 triệu</label>
                                </div>

                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="checkbox" id="price-3"
                                           value="10-toi-15-trieu">
                                    <label class="form-check-label" for="price-3">Từ 10 - 15
                                        triệu</label>
                                </div>
                            </div>

                            <div class="row ms-sm-1">
                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="checkbox" id="price-4"
                                           value="15-toi-20-trieu">
                                    <label class="form-check-label" for="price-4">Từ 15 - 20
                                        triệu</label>
                                </div>

                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="checkbox" id="price-5"
                                           value="tren-20-trieu">
                                    <label class="form-check-label" for="price-5">Trên 20 triệu</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mb-2"><b>Sắp xếp</b></div>

                            <div class="row ms-sm-1">
                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="radio" id="sort-1"
                                           value="gia-tang-dan" name="radio-sort">
                                    <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                </div>

                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="radio" id="sort-2"
                                           value="gia-giam-dan" name="radio-sort">
                                    <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                </div>
                            </div>

                            <div class="row ms-sm-1">
                                <div class="form-check form-check-inline col-sm-6">
                                    <input class="form-check-input" type="radio" id="sort-3" checked
                                           value="gia-nothing" name="radio-sort">
                                    <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                </div>
                            </div>

                        </div>
                        <div class="col-12 ">
                            <button id="btnFilter"
                                    class="btn border-secondary rounded-pill px-3 py-2 text-primary text-uppercase mb-4">

                                Lọc Sản Phẩm
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-9 text-center">
                    <c:if test="${totalPages == 0}">
                        <div>Không tìm thấy sản phẩm nào</div>
                    </c:if>

                    <div class="row g-4">
                        <c:forEach var="product" items="${products}">
                            <div class="col-md-6 col-lg-4">
                                <div class="rounded position-relative fruite-item bg-light">
                                    <div class="fruite-img">
                                        <a href="/product/${product.id}">
                                            <img src="/images/product/${product.getProductImages().get(0).image}"
                                                 class="img-fluid w-100 rounded-top" alt="">
                                        </a>
                                    </div>
                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                         style="top: 10px; left: 10px;">Laptop
                                    </div>
                                    <div
                                            class="p-4 border-top-0 rounded-bottom">
                                        <h4 style="font-size: 15px;">
                                            <a href="/product/${product.id}">
                                                    ${product.name}
                                            </a>

                                        </h4>
                                        <p style="font-size: 13px;">
                                                ${product.shortDesc}</p>
                                        <div
                                                class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                            <p style="font-size: 15px; text-align: center; width: 100%;"
                                               class="text-dark  fw-bold mb-3">
                                                <fmt:formatNumber type="number"
                                                                  value="${product.price}"/>
                                                đ
                                            </p>
                                            <form action="/add-product-to-cart/${product.id}"
                                                  method="post">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>
                                                <button data-product-id="${product.id}"
                                                        class="mx-auto btn btn-secondary rounded-pill px-3">
                                                    <i class="fa fa-shopping-bag me-2"></i>
                                                    Thêm vào giỏ
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <c:if test = "${totalPages > 0}" >
                        <div class="pagination d-flex justify-content-center mt-5">
                            <li class="page-item">
                                <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                   href="/products?page=${currentPage - 1}${queryString}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                <li class="page-item">
                                    <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                       href="/products?page=${loop.index + 1}${queryString}">
                                            ${loop.index + 1}
                                    </a>
                                </li>
                            </c:forEach>
                            <li class="page-item">
                                <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                   href="/products?page=${currentPage + 1}${queryString}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>

                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Single Product End -->

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