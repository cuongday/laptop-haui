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
    <title>Dashboard - user</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $('#avatarFile');
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr('src', imgURL);
                $("#avatarPreview").css('display', 'block');
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
                <h1 class="mt-4">Quản lý tài khoản</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a
                            style="text-decoration: none; color:var(--bs-breadcrumb-item-active-color)" href="/admin">Thống kê</a>
                    </li>
                    <li class="breadcrumb-item active">Tài khoản</li>

                </ol>

                <div class="container container-xl mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mb-3 col-12 mx-auto">
                            <h2>
                                Thêm tài khoản
                            </h2>
                            <hr>
                            <form:form class="row g-3" method="post" action="/admin/user/create"
                                       modelAttribute="newUser" enctype="multipart/form-data">
                                <c:set var="errorEmail">
                                    <form:errors path="email" cssClass="invalid-feedback"/>
                                </c:set>
                                <c:set var="errorPassword">
                                    <form:errors path="password" cssClass="invalid-feedback"/>
                                </c:set>
                                <c:set var="errorFullName">
                                    <form:errors path="fullName" cssClass="invalid-feedback"/>
                                </c:set>
                                <div class="col-md-6 col-12 mb-3">
                                    <label class="form-label">Email:</label>
                                    <form:input type="email"
                                                class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                path="email"/>
                                        ${errorEmail}
                                </div>
                                <div class="col-md-6 col-12 mb-3">
                                    <label class="form-label">Mật khẩu:</label>
                                    <form:input type="password"
                                                class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                path="password"/>
                                        ${errorPassword}
                                </div>
                                <div class="col-md-6 col-12 mb-3">
                                    <label class="form-label">Số điện thoại:</label>
                                    <form:input type="text" class="form-control"
                                                path="phoneNumber"
                                    />
                                </div>
                                <div class="col-md-6 col-12 mb-3">
                                    <label class="form-label">Họ tên:</label>
                                    <form:input type="text"
                                                class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                path="fullName"
                                    />
                                        ${errorFullName}
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label">Địa chỉ:</label>
                                    <form:input type="text" class="form-control"
                                                path="address"
                                    />
                                </div>

                                <div class="col-md-6 col-12 mb-3">
                                    <label class="form-label">Vai trò:</label>
                                    <form:select class="form-select" aria-label="Default select example"
                                                 path="role.name">
                                        <option value="ADMIN">Quản trị viên</option>
                                        <option value="USER">Người dùng</option>
                                        <option value="MANAGER">Nhân viên quản lý</option>
                                        <option value="SELLER">Nhân viên bán hàng</option>
                                    </form:select>
                                </div>
                                <div class="col-md-6 col-12 mb-3">
                                    <label for="avatarFile" class="form-label">Ảnh đại diện:</label>
                                    <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg"
                                           name="uploadAvatarFile">
                                </div>

                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display:none;" alt="avatar preview"
                                         id="avatarPreview">
                                </div>

                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-primary">Tạo tài khoản</button>
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
