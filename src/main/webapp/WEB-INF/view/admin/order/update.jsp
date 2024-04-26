<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            const orgImage = "${newProduct.image}";

            if (orgImage){
                const urlImage = "/images/product/" + orgImage;
                $("#procuctPreview").attr('src', urlImage);
                $("#procuctPreview").css('display', 'block');
            }


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
                <h1 class="mt-4">Quản lý đơn hàng</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a
                            style="text-decoration: none; color:var(--bs-breadcrumb-item-active-color)" href="/admin">Thống kê</a>
                    </li>
                    <li class="breadcrumb-item active">Đơn hàng</li>

                </ol>

                <div class="container container-xl mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mb-3 col-12 mx-auto">
                            <h2>
                                Cập nhật đơn hàng
                            </h2>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <p>  </p>
                            </div>
                            <form:form method="post" action="/admin/order/update" class="row"
                                       modelAttribute="newOrder">


                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">Id:</label>
                                    <form:input type="text" class="form-control" path="id" />
                                </div>
                                <div class="mb-3">
                                    <label>Mã đơn hàng: ${newOrder.id} </label>
                                    &nbsp; &nbsp; &nbsp; &nbsp;
                                    <label class="form-label">Thành tiền:
                                        <fmt:formatNumber type="number"
                                                          value="${newOrder.totalPrice}" /> đ
                                    </label>
                                </div>

                                <div class="mb-3 col-12 col-md-6">
                                    <label class="form-label">Tài khoản:</label>
                                    <form:input type="text" class="form-control" disabled="true"
                                                path="user.fullName" />
                                </div>

                                <div class="mb-3 col-12 col-md-6">
                                    <label class="form-label">Tình trạng:</label>
                                    <form:select class="form-select" path="status">
                                        <form:option value="PENDING">Đang chuẩn bị hàng</form:option>
                                        <form:option value="SHIPPING">Đang vận chuyển</form:option>
                                        <form:option value="COMPLETE">Đã giao hàng</form:option>
                                        <form:option value="CANCEL">Hủy đơn</form:option>
                                    </form:select>
                                </div>
                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-warning">Cập nhật</button>
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
