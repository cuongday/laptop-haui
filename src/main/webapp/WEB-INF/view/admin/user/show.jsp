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
                                <h2>
                                    Danh sách tài khoản
                                </h2>
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
                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                           href="/admin/user?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="0" end="${totalPages -1}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'} " href="/admin/user?page=${loop.index + 1}">
                                                    ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="${currentPage eq totalPages ? 'disabled page-link' : 'page-link'}"
                                           href="/admin/user?page=${currentPage + 1}" aria-label="Next">
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
<script src="/js/scripts.js"></script>
</body>
</html>
