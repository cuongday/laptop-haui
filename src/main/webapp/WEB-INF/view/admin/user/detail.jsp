<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
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

                        <div class="container container-xl mt-5">    
                            <div class="row">
                                <div class="col-12 mx-auto">
                                    <h2>
                                        Thông tin tài khoản
                                    </h2>
                                    <hr  style="width: 60%;" />
        
                                    <div class="card" style="width: 60%;">
                                        <div class="card-header">
                                            Thông tin
                                        </div>
                                        <div>
                                            <img src="/images/avatar/${user.avatar}" alt="ảnh đại diện" style="max-width: 200px; height: auto">
                                        </div>
                                        <ul class="list-group list-group-flu    sh">
                                            <li class="list-group-item">ID: ${id} </li>
                                            <li class="list-group-item">Email: ${user.email} </li>
                                            <li class="list-group-item">Họ tên: ${user.fullName}</li>
                                            <li class="list-group-item">Địa chỉ: ${user.address}</li>
                                            <li class="list-group-item">Vai trò: ${user.role.description}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class=""><a href="/admin/user" class="btn btn-success mt-2">Trở lại</a></div>
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
