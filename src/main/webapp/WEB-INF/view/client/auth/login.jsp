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
        <link href="/client/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="/client/css/style.css">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
    </head>
    <body class="bg-login">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container d-flex align-items-center min-vh-100 min-vw-100 justify-content-center">
                        <div class="row justify-content-center col-md-6">
                            <img class="col-md-6 flex-column " style="padding: 0;border-radius: 10px 0px 0px 10px;" src="/images/auth-bg/login.jpg">
                            <div class="col-md-6 flex-column" style="padding: 0;">
                                <div class="card-login shadow-lg border-0 rounded-lg" style=" border-radius: 0px 10px 10px 0px; ">
                                    <div class="card-header-log">
                                        <h3 class="text-center font-weight-light my-top">Đăng nhập</h3>

                                    </div>

                                    <div class="card-body">
                                        <c:if test="${param.error != null}">
                                            <div class="my-2" style="color: red;">Nhập sai địa chỉ email hoặc mật khẩu</div>
                                        </c:if>
                                        <form method="post" action="/login" style="padding-left: 30px; padding-right: 30px;">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" type="email"
                                                       placeholder="name@example.com"
                                                       name="username"
                                                />
                                                <label>Địa chỉ email</label>
                                            </div>
                                            <div class="form-floating mb-3 d-flex">
                                                <input class="form-control rad-left"
                                                       type="password"
                                                       placeholder="Password"
                                                       name="password"
                                                       id="password"
                                                       style="width: 85%"
                                                />
                                                 <button class="btn rad-right hide-pass" type="button" id="show-password" onclick="togglePassword()" style="width: 70px">Hiện</button>
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
                                                    <button type="submit" class="btn btn-login btn-block lh-lg">Đăng nhập</button>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                    <div class="text-center">
                                        <div class="small mb-1">Chưa có tài khoản? <a href="/register">Đăng kí ngay!</a></div>
                                        <div class="small mb-6"><a href="/forgot-password/verify-email">Quên mật khẩu</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>

        </div>
        <script>
                function togglePassword() {
                    const passwordInput = document.getElementById('password');
                    const showPasswordButton = document.getElementById('show-password');
                    if (passwordInput.type === 'password') {
                        passwordInput.type = 'text';
                        showPasswordButton.textContent = 'Ẩn';
                    } else {
                        passwordInput.type = 'password';
                        showPasswordButton.textContent = 'Hiện';
                    }
                }
            </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
    </body>
</html>
