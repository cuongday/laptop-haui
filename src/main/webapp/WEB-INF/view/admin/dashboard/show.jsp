<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/png" href="/images/auth-bg/icon.png"/>
</head>
<body class="sb-nav-fixed">

<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />

    <div id="layoutSidenav_content">

        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Thống kê chi tiết</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Thống kê</li>
                </ol>
                <div class="row">
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body">Số lượng người dùng (${countUsers})</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/admin/user">Chi tiết</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-danger text-white mb-4">
                            <div class="card-body">Số lượng sản phẩm (${countProducts})</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/admin/product">Chi tiết</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body">Doanh thu tháng này: <fmt:formatNumber type="number" value="${totalAmount}"/></div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/admin/order">Chi tiết</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                Biểu đồ đường
                            </div>
                            <div class="card-body"><canvas id="salesChart" width="100%" height="40"></canvas></div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                Biểu đồ cột
                            </div>
                            <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
    // Lấy ngày hiện tại
    let endDate = new Date();
    endDate.setDate(endDate.getDate() + 1);
    // Lấy ngày 30 ngày trước
    let startDate = new Date();
    startDate.setDate(startDate.getDate() - 30);

    let formatDate = (date) => {
        let month = '' + (date.getMonth() + 1),
            day = '' + date.getDate(),
            year = date.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }
    console.log(endDate);
    // Gọi API để lấy dữ liệu thống kê
    $.ajax({
        url: '/api/statistics/sales', // Đường dẫn của API thống kê
        type: 'GET',
        data: {
            startDate: formatDate(startDate), // Ngày bắt đầu
            endDate: formatDate(endDate) // Ngày kết thúc
        },
        success: function(data) {
            // Tạo một đồ thị từ dữ liệu nhận được
            var ctx = document.getElementById('salesChart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: data.map(item => new Date(item.date).toLocaleDateString('vi-VN')), // Ngày bán hàng
                    datasets: [{
                        label: 'Số lượng laptop bán được trong 30 ngày qua',
                        data: data.map(item => item.counts), // Số lượng laptop bán được
                        backgroundColor: 'rgba(2, 123, 253, 0.2)',
                        borderColor: 'rgba(2, 123, 253, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        x: {
                            beginAtZero: true,
                            min: 0,
                            max: 32
                        },
                        yAxes: {
                            beginAtZero: true,
                            min: 0,
                            ticks: {
                                stepSize: 1
                            }
                        }
                    }
                }
            });
        },
        error: function(error) {
            // Xử lý lỗi ở đây
            console.error(error);
        }
    });

    // Gọi API để lấy dữ liệu thống kê
    $.ajax({
        url: '/api/statistics/sales-by-factory', // Đường dẫn của API thống kê
        type: 'GET',
        data: {
            startDate: formatDate(startDate), // Ngày bắt đầu
            endDate: formatDate(endDate) // Ngày kết thúc
        },
        success: function(data) {
            // Tạo một đồ thị từ dữ liệu nhận được
            console.log(data);
            var ctx = document.getElementById('myBarChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.map(item => item.factory), // Hãng sản xuất
                    datasets: [{
                        label: 'Số lượng sản phẩm bán được trong 30 ngày qua',
                        data: data.map(item => item.counts), // Số lượng sản phẩm bán được
                        backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#C35AF2', '#ED700D'],
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                min: 0,
                                max: 20,
                                maxTicksLimit: 5
                            },
                            gridLines: {
                                display: true
                            }
                        }],
                    }
                }
            });
        },
        error: function(error) {
            // Xử lý lỗi ở đây
            console.error(error);
        }
    });

</script>
</body>
</html>

