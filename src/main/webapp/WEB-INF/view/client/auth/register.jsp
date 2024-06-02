<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Register</title>
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/client/css/style.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
</head>
<body class="bg-login">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Tạo tài khoản</h3></div>
                            <div class="card-body">
                                <form:form method="post" action="/register" modelAttribute="registerUser">
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorPassword">
                                        <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorFirstName">
                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                    </c:set>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input class="form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                                                            path="firstName" type="text" placeholder="Nhập họ của bạn" />
                                                <label>Họ</label>
                                                ${errorFirstName}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <form:input class="form-control" path="lastName" type="text" placeholder="Nhập tên của bạn" />
                                                <label>Tên</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <form:input class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                    path="email" type="email" placeholder="Nhập địa chỉ email" />
                                        <label>Địa chỉ email</label>
                                        ${errorEmail}
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                            path="password" type="password" placeholder="Nhập mật khẩu" />
                                                <label>Mật khẩu</label>
                                                ${errorPassword}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input class="form-control" path="confirmPassword" type="password" placeholder="Nhập lại mật khẩu" />
                                                <label>Xác nhận mật khẩu</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-primary btn-block">Tạo tài khoản</button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small">Đã có tài khoản? <a href="/login">Đăng nhập</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>


</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>
</html>
