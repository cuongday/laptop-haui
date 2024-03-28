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
                        <h1 class="mt-4">Manage User</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a style="text-decoration: none; color:var(--bs-breadcrumb-item-active-color)" href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">User</li>

                        </ol> 

                        <div class="container container-xl mt-5">    
                            <div class="row">
                                <div class="col-md-6 col-12 mx-auto">
                                    <h2>
                                        Delete User
                                    </h2>
                                    <hr />
                                    
                                    <div class="alert alert-danger" role="alert">
                                        Are you sure to delete this User?
                                    </div>
        
                                    <form:form action="/admin/user/delete" modelAttribute="newUser" method ="post">
                                        <div class="mb-3" style="display: none;">
                                            <label class="form-label">ID:</label>
                                            <form:input type="text" class="form-control" value="${id}"
                                            path = "id"
                                            />
                                        </div>
                                        <button class="btn btn-danger">Confirm</button>
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
