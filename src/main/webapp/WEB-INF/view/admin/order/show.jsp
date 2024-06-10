<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Dashboard - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                    <li class="breadcrumb-item">Thống kê</li>
                    <li class="breadcrumb-item active">Đơn hàng</li>

                </ol>
                <div class="mt-4">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h2>
                                    Danh sách đơn hàng
                                </h2>
                                <select id="status" style="min-width: 200px; max-height: 40px">
                                    <option value="Tất cả" ${status == '' ? 'selected' : ''}>Tất cả</option>
                                    <option value="PENDING" ${status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                    <option value="SHIPPING" ${status == 'SHIPPING' ? 'selected' : ''}>SHIPPING</option>
                                    <option value="COMPLETE" ${status == 'COMPLETE' ? 'selected' : ''}>COMPLETE</option>
                                    <option value="CANCEL" ${status == 'CANCEL' ? 'selected' : ''}>CANCEL</option>
                                </select>

                            </div>

                            <hr>

                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Thành tiền</th>
                                    <th scope="col">Tài khoản</th>
                                    <th scope="col">Địa chỉ nhận hàng</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Tùy chọn</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${orders}" var="order">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td><fmt:formatNumber value="${order.totalPrice}" type="number" /> đ</td>
                                        <td>${sessionScope.fullName}</td>
                                        <td>${order.receiverAddress}</td>
                                        <td>${order.status}</td>
                                        <td>${order.createAt}</td>
                                        <td>
                                            <a href="/admin/order/${order.id}" class="btn btn-success">Xem</a>
                                            <a href="/admin/order/update/${order.id}" class="btn btn-warning">Cập nhật</a>
                                            <a href="/admin/order/delete/${order.id}" class="btn btn-danger">Xóa</a>
                                            <a data-id="${order.id}" class="btn btn-secondary exportBill">Xuất hóa đơn</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>

                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                           href="/admin/order?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="0" end="${totalPages -1}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'} "
                                            href="#" data-page="${loop.index + 1}">
                                                    ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="${currentPage eq totalPages ? 'disabled page-link' : 'page-link'}"
                                           href="/admin/order?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>

<script>
    $(document).ready(function () {
        $('.page-link').click(function(event) {
            event.preventDefault(); // Ngăn chặn chuyển hướng mặc định

            let page = $(this).attr('href'); // Lấy URL trên thẻ <a>
            let status = $('#status').val(); // Lấy giá trị từ select box
            if(status == "Tất cả") status='';

            // Thêm giá trị của ô input và select box vào URL
            page += `&status=` + status;

            // Điều hướng trang đến URL mới với các tham số đã thêm
            location.href = page;
        });

        $('.exportBill').click(function () {
            // lấy ra id của user để xuất hóa đơn
            let id = $(this).data('id');
            console.log(id);
            $.ajax({
                url: '/api/admin/report/' + id,
                type: 'GET',
                success: function (data) {
                    window.open(/reports/ + data);
                }
            });
        });

        $('#status').change(() => {
            let status = $('#status').val();
            if (status === 'Tất cả') {
                status = '';
            }
            location.href = `/admin/order?status=` + encodeURIComponent(status);
        });

    });
</script>
</body>
</html>
