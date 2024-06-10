<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Quản lý tài khoản</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a style="text-decoration: none; color:var(--bs-breadcrumb-item-active-color)" href="/admin">Thống kê</a></li>
                    <li class="breadcrumb-item active">Tài khoản</li>
                </ol>

                <div class="mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h2>Danh sách tài khoản</h2>
                                <div class="d-flex" style="max-height: 40px">
                                    <input class="form-control me-2" type="search" id="keyword" name="keyword" placeholder="Tìm kiếm" aria-label="Search" style="min-width: 400px">
                                    <button class="btn btn-outline-success" type="submit" id="searchBtn" style="min-width: 100px">Tìm kiếm</button>
                                </div>
                                <select id="roleDes" style="min-width: 200px; max-height: 40px">
                                    <option value="Tất cả" ${roleDes == '' ? 'selected' : ''}>Tất cả</option>
                                    <option value="Admin" ${roleDes == 'Admin' ? 'selected' : ''}>Admin</option>
                                    <option value="Quản lý" ${roleDes == 'Quản lý' ? 'selected' : ''}>Quản lý</option>
                                    <option value="Nhân viên bán hàng" ${roleDes == 'Nhân viên bán hàng' ? 'selected' : ''}>Nhân viên</option>
                                    <option value="User thong thuong" ${roleDes == 'User thong thuong' ? 'selected' : ''}>User</option>
                                </select>
                                <a href="/admin/user/create" class="btn btn-primary">Tạo tài khoản</a>
                            </div>

                            <hr>

                            <table class="table table-striped table-hover table-responsive-md">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Họ tên</th>
                                    <th scope="col">Vai trò</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Tùy chọn</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <th>${user.id}</th>
                                        <td>${user.email}</td>
                                        <td>${user.fullName}</td>
                                        <td>${user.getRole().getDescription()}</td>
                                        <td>${user.createAt}</td>
                                        <td>
                                            <a href="/admin/user/${user.id}" class="btn btn-success">Xem</a>
                                            <a href="/admin/user/update/${user.id}" class="btn btn-warning">Cập nhật</a>
                                            <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Xóa</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}" href="/admin/user?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="0" end="${totalPages > 0 ? totalPages - 1 : 0}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                               href="#" data-page="${loop.index + 1}">
                                                    ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>

                                    <li class="page-item">
                                        <a class="${currentPage eq totalPages ? 'disabled page-link' : 'page-link'}" href="/admin/user?page=${currentPage + 1}" aria-label="Next">
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
        <jsp:include page="../layout/footer.jsp" />
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/scripts.js"></script>

<script>
    $(document).ready(() => {

        $('.page-link').click(function(event) {
            event.preventDefault(); // Ngăn chặn chuyển hướng mặc định

            let page = $(this).attr('href'); // Lấy URL trên thẻ <a>
            let keyword = $('#keyword').val(); // Lấy giá trị từ ô input
            let roleDes = $('#roleDes').val(); // Lấy giá trị từ select box
            if(roleDes == "Tất cả") roleDes='';

            // Thêm giá trị của ô input và select box vào URL
            page += `&fullName=` + keyword + `&roleDes=` + roleDes;

            // Điều hướng trang đến URL mới với các tham số đã thêm
            location.href = page;
        });

        $('#searchBtn').click(() => {
            let keyword = $('#keyword').val();
            let roleDes = $('#roleDes').val();
            if (roleDes === 'Tất cả') {
                roleDes = '';
            }
            location.href = `/admin/user?fullName=` + encodeURIComponent(keyword) + `&roleDes=` + encodeURIComponent(roleDes);
        });

        $('#roleDes').change(() => {
            let keyword = $('#keyword').val();
            let roleDes = $('#roleDes').val();
            if (roleDes === 'Tất cả') {
                roleDes = '';
            }
            location.href = `/admin/user?fullName=` + encodeURIComponent(keyword) + `&roleDes=` + encodeURIComponent(roleDes);
        });
    });
</script>

</body>
</html>
