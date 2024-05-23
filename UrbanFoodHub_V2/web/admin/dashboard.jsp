<%-- 
    Document   : dashboard
    Created on : May 22, 2024, 12:51:36 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="icon" href="images/Logo.png" type="image/x-icon">
       <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css-dashboard/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css-dashboard/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
<!--            Loadingg-->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <c:set var="user" value="${sessionScope.user}"/>
            <!--        sidebar-->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="dashboard" class="navbar-brand mx-4 mb-3">
                        <img style="height: 35px; width: 35px; object-fit: cover" src="images/Logo2.png" alt="alt"/>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <c:if test="${user != null}" >
                        <div class="position-relative">
                            <img class="rounded-circle" src="images/avatar-default.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Hi, ${user.firstname}</h6>
                            <!--<span>Admin</span>-->
                        </div>
                        </c:if>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="index.html" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-carrot me-2"></i>Materials</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="#" class="dropdown-item"><i class="fa-solid fa-plus me-2"></i>Add new</a>
                                <a href="#" class="dropdown-item"><i class="fa-solid fa-list me-2"></i>View all</a>
<!--                                <a href="element.html" class="dropdown-item">Other Elements</a>-->
                            </div>
                        </div>
                        <a href="#" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Manage Plans</a>
                        <a href="#" class="nav-item nav-link"><i class="fa-solid fa-cart-shopping me-2"></i>Manage Order</a>
                        <a href="#" class="nav-item nav-link"><i class="fa-solid fa-truck me-2"></i>Manage Delivery</a>
                        <a href="#" class="nav-item nav-link"><i class="fa-solid fa-users me-2"></i>Users</a>
                    </div>
                </nav>
            </div>
            <%--<jsp:include page="sidebar.jsp"/>--%>
            <div class="content">
            <jsp:include page="header-dashboard.jsp"/>
            </div>
        </div>
        

        
        
        <script src="js-dashboard/main.js"></script>
        
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    </body>
</html>
