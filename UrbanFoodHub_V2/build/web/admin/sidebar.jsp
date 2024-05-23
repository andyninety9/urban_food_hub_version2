<%-- 
    Document   : sidebar
    Created on : May 22, 2024, 3:47:10 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                            <span>Admin</span>
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
            
                <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>