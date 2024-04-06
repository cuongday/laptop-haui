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
        <title>Login</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary bg-login">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container d-flex align-items-center min-vh-100 justify-content-center">
                        <div class="row justify-content-center align-items-stretch">
                            <img class="col-lg-5 d-flex flex-column" src="/images/auth-bg/login.jpg">
                            <div class="col-lg-5 d-flex flex-column">
                                <div class="card shadow-lg border-0 rounded-lg">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-2">Đăng nhập</h3></div>
                                    <div class="card-body">
                                        <form method="post" action="/login">
                                            <c:if test="${param.error != null}">
                                                <div class="my-2" style="color: red;">Nhập sai địa chỉ email hoặc mật khẩu</div>
                                            </c:if>

                                            <div class="form-floating mb-3">
                                                <input class="form-control" type="email"
                                                       placeholder="name@example.com"
                                                       name="username"
                                                />
                                                <label>Địa chỉ email</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control"
                                                       type="password"
                                                       placeholder="Password"
                                                       name="password"
                                                />
                                                <label>Mật khẩu</label>
                                            </div>

                                            <div>
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>

                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" name="rememberMe" id="rememberMe">
                                                <label class="form-check-label text-secondary" for="rememberMe">Lưu tài khoản</label>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                    <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small">Chưa có tài khoản? <a href="/register">Đăng kí ngay!</a></div>
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
