<%-- 
    Document   : testModalBody
    Created on : May 24, 2024, 3:08:02 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="selectedMeal" value="${requestScope.updatedMeal}"/>
<%--<c:set var="mealDetails" value="${requestScope.mealDetails}"/>--%>
<c:set var="listCategoryMeal" value="${requestScope.listCategoryMeal}"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Meal</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
                <link href="img/favicon.ico" rel="icon" />

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
            rel="stylesheet" />

        <!-- Icon Font Stylesheet -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            rel="stylesheet" />

        <!-- Libraries Stylesheet -->
        <link
            href="lib/owlcarousel/assets/owl.carousel.min.css"
            rel="stylesheet" />
        <link
            href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
            rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css-dashboard/bootstrap.min.css" rel="stylesheet" />

        <!-- Template Stylesheet -->
        <link href="css-dashboard/style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div
                id="spinner"
                class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div
                    class="spinner-border text-primary"
                    style="width: 3rem; height: 3rem"
                    role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Sidebar Start -->
            <jsp:include page="../admin/sidebar.jsp"/>
            <!-- Sidebar End -->

            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <jsp:include page="../admin/header-dashboard.jsp"/>
                <!-- Navbar End -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <h5 class="modal-title" id="exampleModalLabel">#${selectedMeal.mealName}</h5>
                        <div class="col-sm-12 col-xl-12">
    <form action="update-meal" method="post" class="bg-light rounded h-100 p-4">
        <input name="mealID" type="hidden" value="${selectedMeal.mealID}"/>
        <div class="form-floating mb-3">
            <select name="cateID" class="form-select" id="floatingSelect"
                aria-label="Floating label select example">
                <option selected>Category</option>
                <c:if test="${listCategoryMeal != null}" >
                    <c:forEach var="category" items="${listCategoryMeal}" >
                            <option
                                <c:if test="${category.cateName == selectedMeal.cateName}">selected</c:if>
                                value="${category.cateID}">${category.cateName}</option>
                    </c:forEach>
                </c:if>
            </select>
            <label for="floatingSelect">Category</label>
        </div>
        <div class="form-floating mb-3">
            <input value="${selectedMeal.mealName}" name="mealName" type="text" class="form-control" id="floatingInput"
                placeholder="Enter meal name">
            <label for="floatingInput">Meal name</label>
        </div>
        <div class="form-floating">
            <textarea name="mealDesc" class="form-control" placeholder="Leave a comment here"
                id="floatingTextarea" style="height: 100px; resize: none; margin-bottom: 20px">${selectedMeal.mealDesc}</textarea>
            <label for="floatingTextarea">Meal description</label>
        </div>
        <div class="form-floating">
            <textarea name="nutrition" class="form-control" placeholder="Nutrition per meal"
                id="floatingTextarea" style="height: 100px; resize: none; margin-bottom: 20px">${selectedMeal.nutritionValue}</textarea>
            <label for="floatingTextarea">Nutritional Value</label>
        </div>
        <div class="form-floating">
            <textarea name="shelfLife" class="form-control" placeholder="Shelf life of meal"
                id="floatingTextarea" style="height: 100px; resize: none; margin-bottom: 20px">${selectedMeal.shelfLife}</textarea>
            <label for="floatingTextarea">Shelf Life</label>
        </div>
        <div class="form-floating mb-3">
            <input value="${selectedMeal.preparationTime}" name="prepareTime" type="text" class="form-control" id="floatingInput"
                placeholder="Enter preparation time">
            <label for="floatingInput">Preparation time</label>
        </div>
        <div class="form-floating mb-3">
            <input value="${selectedMeal.price}" name="price" type="text" class="form-control" id="floatingPassword"
                placeholder="Price">
            <label for="floatingPassword">Price</label>
        </div>
        <div class="form-floating mb-3">
            <input value="${selectedMeal.stock}" name="stock" type="text" class="form-control" id="floatingPassword"
                placeholder="Stock">
            <label for="floatingPassword">Stock</label>
        </div>
        <div class="mb-3">
            <label for="formFile" class="form-label">Meal Image</label>
            <input name="mealImg" class="form-control" type="text" id="formFile" value="${selectedMeal.image}">
        </div>
        <div class="form-floating mb-3">
            <input class="btn btn-outline-light" type="submit"
            value="Submit" style=" padding: 10px 20px; width: 100%; font-size: 14px; background-color: #4ACD8D" >
        </div>
    </form>
</div>
                    </div>
                </div>
            </div>
            <!-- Content End -->

            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"
                ><i class="bi bi-arrow-up"></i
            ></a>
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
        <script src="js-dashboard/main.js"></script>
        <!--<script src="js-dashboard/handleSelectCategory.js"></script>-->
    </body>
</html>
<!-- Modal -->

      
      
