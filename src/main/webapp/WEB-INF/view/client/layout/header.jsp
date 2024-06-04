<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navbar start -->

<div class="container-fluid fixed-top" style = "padding: 0px">
    <div class="top_slide">
        <p class = "top_banner"> Chào đón tân sinh viên 2024, LaptopHaui tung ngàn Deal shock! </p>
    </div>
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="/" class="navbar-brand">
                <img src="/client/img/Logo.png" class="img-logo">
            </a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white justify-content-between ms-xxl-5 me-xxl-3" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="/" class="nav-item nav-link active">Trang Chủ</a>
                    <a href="/products" class="nav-item nav-link">Sản Phẩm</a>
                </div>
                <div class="d-flex me-0">
                    <button
                            class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
                            data-bs-toggle="modal" data-bs-target="#searchModal"><i
                            class="fas fa-search text-primary"></i></button>
                    <c:if test="${not empty pageContext.request.userPrincipal}">


                    <a href="/cart" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                        <span
                                class="position-absolute  rounded-circle d-flex align-items-center justify-content-center text-light px-1"
                                style="background: var(--bs-red); top: -5px; left: 15px; height: 20px; min-width: 20px;"
                                id="sumCart">${sessionScope.sum}
                        </span>
                    </a>

                    <div class="dropdown my-auto">
                        <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                           data-bs-toggle="dropdown" aria-expanded="false" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            <i class="fas fa-user fa-2x"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-4"
                            aria-labelledby="dropdownMenuLink">
                            <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                     src="/images/avatar/${sessionScope.avatar}" />
                                <div class="text-center my-3">
                                    <c:out value="${sessionScope.fullName}" />
                                </div>
                            </li>
                            <li><a class="dropdown-item" href="/show-info">Quản lý tài khoản</a></li>
                            <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                            <li><a class="dropdown-item" href="/forgot-password/verify-email">Đổi mật khẩu</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <form method="post" action="/logout">
                                    <input type="hidden" name="${_csrf.parameterName}"
                                           value="${_csrf.token}"/>
                                    <button class="dropdown-item" href="#">Đăng xuất</button>
                                </form>
                            </li>
                        </ul>
                    </div>
                    </c:if>
                    <c:if test="${empty pageContext.request.userPrincipal}">
                        <a href="/login" class="a-login btn btn-primary text-light text-center" style="line-height: 30px">Đăng Nhập</a>
                    </c:if>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Navbar End -->