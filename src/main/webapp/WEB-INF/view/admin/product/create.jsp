<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Dashboard - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const productFile = $('#productFile');
            productFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#procuctPreview").attr('src', imgURL);
                $("#procuctPreview").css('display', 'block');
            });
        });
    </script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Quản lý sản phẩm</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a
                            style="text-decoration: none; color:var(--bs-breadcrumb-item-active-color)" href="/admin">Thống kê</a>
                    </li>
                    <li class="breadcrumb-item active">Sản phẩm</li>

                </ol>

                <div class="container container-xl mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mb-3 col-12 mx-auto">
                            <h2>
                                Thêm sản phẩm
                            </h2>
                            <hr>
                            <form:form class="row g-3" method="post" action="/admin/product/create"
                                       modelAttribute="newProduct" enctype="multipart/form-data">
                                <div class="col-md-6 col-12 mb-3">
                                    <c:set var="errorProductName">
                                        <form:errors path="name" cssClass="invalid-feedback" />
                                    </c:set>
                                    <label class="form-label">Tên sản phẩm:</label>
                                    <form:input type="text" class="form-control ${not empty errorProductName ? 'is-invalid' : ''}"
                                                path="name"
                                    />
                                    ${errorProductName}
                                </div>
                                <div class="col-md-6 col-12 mb-3">
                                    <c:set var="errorProductPrice">
                                        <form:errors path="price" cssClass="invalid-feedback" />
                                    </c:set>
                                    <label class="form-label">Giá thành:</label>
                                    <form:input type="text" class="form-control ${not empty errorProductPrice ? 'is-invalid' : ''}"
                                                path="price"
                                    />
                                    ${errorProductPrice}
                                </div>
                                <div class="col-md-12 mb-3">
                                    <c:set var="errorProductDetailDes">
                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                    </c:set>
                                    <label class="form-label">Thông tin mô tả:</label>
                                    <form:input type="text" class="form-control ${not empty errorProductDetailDes ? 'is-invalid' : ''}"
                                                path="detailDesc"
                                    />
                                    ${errorProductDetailDes}
                                </div>
                                <div class="col-md-6 col-12 mb-3">
                                    <c:set var="errorProductShortDes">
                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                    </c:set>
                                    <label class="form-label">Mô tả vắn tắt:</label>
                                    <form:input type="text" class="form-control ${not empty errorProductShortDes ? 'is-invalid' : ''}"
                                                path="shortDesc"
                                    />
                                    ${errorProductShortDes}
                                </div>
                                <div class="col-md-6 col-12 mb-3">
                                    <c:set var="errorProductQuantity">
                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                    </c:set>
                                    <label class="form-label">Số lượng:</label>
                                    <form:input type="text" class="form-control ${not empty errorProductQuantity ? 'is-invalid' : ''}"
                                                path="quantity"
                                    />
                                    ${errorProductQuantity}
                                </div>

                                <div class="col-md-6 col-12 mb-3">
                                    <label class="form-label">Nhãn hiệu:</label>
                                    <form:select class="form-select" aria-label="Default select example" path="factory">
                                        <option value="APPLE">Apple (Macbook)</option>
                                        <option value="ASUS">Asus</option>
                                        <option value="LENOVO">Lenovo</option>
                                        <option value="ACER">Acer</option>
                                        <option value="DELL">Dell</option>
                                        <option value="HP">HP</option>
                                    </form:select>
                                </div>

                                <div class="col-md-6 col-12 mb-3">
                                    <label class="form-label">Phân loại:</label>
                                    <form:select class="form-select" aria-label="Default select example" path="target">
                                        <option value="OFFICE">Văn phòng</option>
                                        <option value="GAMING">Gaming</option>
                                        <option value="GRAPHIC">Thiết kế đồ họa</option>
                                        <option value="THIN">Mỏng nhẹ</option>
                                    </form:select>
                                </div>

                                <div class="col-md-6 col-12 mb-3">
                                    <label for="productFile" class="form-label">Hình ảnh:</label>
                                    <input class="form-control" type="file" id="productFile" accept=".png, .jpg, .jpeg"
                                           name="uploadProductFile" multiple>
                                </div>

                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display:none;" alt="avatar preview"
                                         id="procuctPreview">
                                </div>

                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>
</html>
