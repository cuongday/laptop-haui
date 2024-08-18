<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Dashboard - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Quản lý sản phẩm</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item">Thống kê</li>
                    <li class="breadcrumb-item active">Sản phẩm</li>

                </ol>
                <div class="mt-4">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h2>
                                    Danh sách sản phẩm
                                </h2>
                                <div class="d-flex" style="max-height: 40px">
                                    <input class="form-control me-2" type="search" id="keyword" name="keyword" placeholder="Tìm kiếm" aria-label="Search" style="min-width: 400px" value="${name}">
                                    <button class="btn btn-outline-success" type="submit" id="searchBtn" style="min-width: 100px">Tìm kiếm</button>
                                </div>
                                <select id="factoryName" style="min-width: 200px; max-height: 40px">
                                    <option value="Tất cả" ${factoryName == '' ? 'selected' : ''}>Tất cả</option>
                                    <option value="Asus" ${factoryName == 'Asus' ? 'selected' : ''}>Asus</option>
                                    <option value="Dell" ${factoryName == 'Dell' ? 'selected' : ''}>Dell</option>
                                    <option value="Lenovo" ${factoryName == 'Lenovo' ? 'selected' : ''}>Lenovo</option>
                                    <option value="LG" ${factoryName == 'LG' ? 'selected' : ''}>LG</option>
                                    <option value="Apple" ${factoryName == 'Apple' ? 'selected' : ''}>Apple</option>
                                    <option value="Acer" ${factoryName == 'Acer' ? 'selected' : ''}>Acer</option>
                                </select>
                                <a href="/admin/product/create" class="btn btn-primary">Thêm sản phẩm</a>
                            </div>

                            <hr>
                            <%-- desgin this table more vibrant and beautiful--%>
                            <table class="table table-striped table-hover table-responsive-md">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Giá thành</th>
                                    <th scope="col">Nhãn hiệu</th>
                                    <th scope="col">Tùy chọn</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="product" items="${products}">
                                    <tr>
                                        <th>${product.id}</th>
                                        <td>${product.name}</td>
                                        <td><fmt:formatNumber value="${product.price}" type="number" /> đ</td>
                                        <td>${product.factory}</td>
                                        <td>
                                            <a href="/admin/product/${product.id}" class="btn btn-success">Xem</a>
                                            <a href="/admin/product/update/${product.id}" class="btn btn-warning">Cập nhật</a>
                                            <a href="/admin/product/delete/${product.id}" class="btn btn-danger">Xóa</a>
                                        </td>
                                    </tr>
                                </c:forEach>


                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                           href="/admin/product?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="0" end="${totalPages -1}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'} "
                                            href="#" data-page="${loop.index + 1}">
                                                    ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="${currentPage eq totalPages ? 'disabled page-link' : 'page-link'}"
                                           href="/admin/product?page=${currentPage + 1}" aria-label="Next">
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
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script>
    $(document).ready(() => {

        $('.page-link').click(function(event) {
            event.preventDefault(); // Ngăn chặn chuyển hướng mặc định

            let page = $(this).attr('href'); // Lấy URL trên thẻ <a>
            let keyword = $('#keyword').val(); // Lấy giá trị từ ô input
            let factoryName = $('#factoryName').val(); // Lấy giá trị từ select box
            if(factoryName == "Tất cả") factoryName='';

            // Thêm giá trị của ô input và select box vào URL
            page += `&name=` + keyword + `&factory=` + factoryName;

            // Điều hướng trang đến URL mới với các tham số đã thêm
            location.href = page;
        });

        $('#searchBtn').click(() => {
            let keyword = $('#keyword').val();
            let ft = $('#factoryName').val();
            if (ft === 'Tất cả') {
                ft = '';
            }
            location.href = `/admin/product?name=` + encodeURIComponent(keyword) + `&factory=` + encodeURIComponent(ft);
        });

        $('#factoryName').change(() => {
            let keyword = $('#keyword').val();
            let ft = $('#factoryName').val();
            if (ft === 'Tất cả') {
                ft = '';
            }
            location.href = `/admin/product?name=` + encodeURIComponent(keyword) + `&factory=` + encodeURIComponent(ft);
        });
    });
</script>
</body>
</html>
