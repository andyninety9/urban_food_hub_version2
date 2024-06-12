<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <a href="dashboard" class="navbar-brand mx-4 mb-3">
            <h3 class="text-black-50">
                <i class="fa fa-hashtag me-2"></i>Dashboard
            </h3>
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
            <a href="dashboard" class="nav-item nav-link ${requestScope.currentPage == 'dashboard' ? 'active' : ''}"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
            <div class="nav-item dropdown">
                <a href="" class="nav-link dropdown-toggle ${requestScope.currentPage == 'manage-products' ? 'active' : ''}" data-bs-toggle="dropdown"><i class="fa-solid fa-mortar-pestle me-2"></i>Products</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <!--<a href="manage-category-material" class="dropdown-item"><i class="fa-solid fa-layer-group me-2"></i>View all categories</a>-->
                    <a style="padding: 5px 10px; text-align: center" href="manage-products" class="dropdown-item"><i class="fa-solid fa-list me-2"></i>View all products</a>
                </div>
            </div>
            
            <a href="manage-foods?action=all" class="nav-item nav-link ${requestScope.currentPage == 'manage-foods' ? 'active' : ''}"><i class="fa-solid fa-utensils me-2"></i>Manage Foods</a>
            <a href="#" class="nav-item nav-link ${requestScope.currentPage == 'manage-plans' ? 'active' : ''}"><i class="fa fa-th me-2"></i>Manage Plans</a>
            <a href="admin-router?action=manage-order" class="nav-item nav-link ${requestScope.currentPage == 'manage-order' ? 'active' : ''}"><i class="fa-solid fa-cart-shopping me-2"></i>Manage Order</a>
            <a href="admin-router?action=manage-user" class="nav-item nav-link ${requestScope.currentPage == 'manage-user' ? 'active' : ''}"><i class="fa-solid fa-users me-2"></i>Users</a>
            <a href="#" class="nav-item nav-link"><i class="fa-solid fa-truck me-2"></i>Manage Delivery</a>
        </div>
    </nav>
</div>