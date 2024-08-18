<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
                                <div class="col-md-6 col-12 mx-auto">
                                    <h2>
                                        Cập nhật tài khoản
                                    </h2>
                                    <hr>
                                    <form:form method="post" action="/admin/user/update" modelAttribute="newUser" enctype="multipart/form-data">
        
                                        <div class="mb-3" style="display: none;">
                                            <label class="form-label">ID:</label>
                                            <form:input type="text" class="form-control"
                                            path = "id"
                                            />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Email:</label>
                                            <form:input type="email" class="form-control"
                                            path = "email" disabled = "true"
                                            />
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label class="form-label">Số điện thoại:</label>
                                            <form:input type="text" class="form-control"
                                            path = "phoneNumber"
                                            />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Họ tên:</label>
                                            <form:input type="text" class="form-control"
                                            path = "fullName"
                                            />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ:</label>
                                            <form:input type="text" class="form-control"
                                            path = "address"
                                            />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Vai trò:</label>
                                            <form:select class="form-select" aria-label="Default select example" path="role.name">
                                                <option value="ADMIN">Quản trị viên</option>
                                                <option value="USER">Người dùng</option>
                                                <option value="MANAGER">Quản lý</option>
                                                <option value="SELLER">Nhân viên bán hàng</option>
                                            </form:select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="avatarFile" class="form-label">Ảnh đại diện:</label>
                                            <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg" name="uploadAvatarFile">
                                        </div>

                                        <div class="col-12 mb-3">
                                            <img style="max-height: 250px; display:none;" alt="avatar preview" id="avatarPreview">
                                        </div>
                                        
                                        <button type="submit" class="btn btn-warning">Cập nhật</button>
                                    </form:form>
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
