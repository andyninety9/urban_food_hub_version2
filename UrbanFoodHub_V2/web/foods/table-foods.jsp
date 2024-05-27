<%-- 
    Document   : table-meal
    Created on : May 23, 2024, 9:39:41 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<c:set var="allMeal" value="${requestScope.listMeal}"/>
<c:set var="allCategory" value="${requestScope.listCateFood}"/>
<c:set var="selectedCate" value="${requestScope.selectedCate}"/>
<c:set var="errorTableMaterial" value="${requestScope.errorTableMaterial}"/>
<c:set var="sizeListMaterial" value="${requestScope.sizeMaterial}"/>
<script src="js-dashboard/handlePagination.js"></script>

<div class="col-9">
    <div class="bg-light rounded h-100 p-4">
        <div style="display: flex; justify-content: space-between">
            <h5 class="mb-4">All meals</h5>
            <form action="manage-products" class="d-none d-md-flex ms-4" style="font-size: 12px; border-radius: 20px; height: 30px">
                <input name="keyword" class="form-control border-0" type="search" placeholder="Search meal" style="font-size: 12px">
            </form>
        </div>
        
        <form method="get" action="manage-foods?action=sortByCate" id="categoryForm" style="display: flex; justify-content: space-between">
            <!--<a class="btn btn-outline-light" href="add-new-meal" style=" padding: 10px 20px; font-size: 14px; background-color: #4ACD8D" role="button">Add new <i class="fa-solid fa-plus"></i></a>-->
            <a style=" padding: 10px 20px; font-size: 14px; background-color: #4ACD8D; border: none" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Add meal <i class="fa-solid fa-plus"></i>
            </a>
            <ul id="pagination" class="pagination justify-content-center pagination-sm" style="padding: 0; margin: 0">
                <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <c:forEach begin="${1}" end="${((sizeListMaterial % 10) == 0) ? (sizeListMaterial / 10) : ((sizeListMaterial / 10) + 1) }" var="i">
                    <li class="page-item"><a class="page-link" href="manage-products?page=${i}">${i}</a></li>
                </c:forEach>
                <li class="page-item">
                  <a class="page-link" href="#">Next</a>
                </li>
            </ul>                   
            <c:if test="${errorTableMaterial != null}">
                <p style="color: red; font-size: 10px">${errorTableMaterial}</p>
            </c:if>
            <select name="cateID" onchange="categoryChanged()" id="select-category" class="form-select-sm" aria-label="Default select example" style="background-color: #F3F6F9; color: #75757D; border-radius: 5px; outline: none; padding: 5px ">
                <option value="all">All</option>
                <c:if test="${allCategory != null}" >
                    <c:forEach var="category" items="${allCategory}" >
                        <option 
                            <c:if test="${selectedCate == category.cateName}">
                                selected
                            </c:if>
                            value="${category.cateID}">${category.cateName}</option>
                    </c:forEach>
                </c:if>
            </select>
        </form>
        
        <div class="table-responsive" style="height: 550px;">
            <table class="table">
                <thead>
                    <tr style="font-size: 14px">
                        <th scope="col">#ID</th>
                        <th scope="col">Meal</th>
                        <th scope="col">Description</th>
                        <th scope="col">Price(VND)</th>
                        <th scope="col">Stock</th>
                        <th scope="col">Category</th>
                        <th scope="col">Created Date</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
               
                    <tbody>
                        <c:if test="${allMeal != null}">
                        <c:forEach var="meal" items="${allMeal}">
                            <tr style="font-size: 10px;">
                                <th scope="row">${meal.mealID}</th>
                                <td>${meal.mealName}</td>
                                <td>${meal.mealDesc}</td>
                                <td>${meal.price}</td>
                                <td>
                                    <p style="margin: 0; text-align: center">${meal.stock}</p>
                                    <c:if test="${meal.stock <= 30}">
                                        <p style="margin: 0; text-align: center">
                                            <span class="badge rounded-pill bg-warning text-dark">Low</span>
                                         </p>
                                    </c:if>
                                    <c:if test="${meal.stock > 30}">
                                        <p style="margin: 0; text-align: center">
                                            <span class="badge rounded-pill bg-success">Good</span>
                                        </p> 
                                    </c:if>
                                </td>
                                
                                <td>${meal.cateName}</td>
                                <td>${meal.createdDate}</td>
                                <td>
                                    <c:if test="${meal.statusID == 1}">
                                        <a href="update-status-meal?mealID=${meal.mealID}&statusID=${meal.statusID}" type="button" class="btn btn-outline-success" style="font-size: 10px; width: 70px">Active</a>
                                    </c:if>
                                    <c:if test="${meal.statusID == 2}">
                                        <a href="update-status-meal?mealID=${meal.mealID}&statusID=${meal.statusID}" type="button" class="btn btn-outline-warning" style="font-size: 10px; width: 70px">Out stock</a>
                                    </c:if>
                                    <c:if test="${meal.statusID == 3}">
                                        <a href="update-status-meal?mealID=${meal.mealID}&statusID=${meal.statusID}" type="button" class="btn btn-outline-secondary" style="font-size: 10px; width: 70px">Inactive</a>
                                    </c:if>   
                                </td>
                                <td class="action">
                                    <a style="color: #757575; font-size: 14px" href="update-meal?mealID=${meal.mealID}" data-bs-toggle="tooltip" data-bs-placement="top" title="Update"><i class="fa-solid fa-file-pen"></i></a>
                                    <button onclick="showMoreInfo('_${meal.mealID}')" id="showMoreInfo" style="color: #757575; font-size: 14px; border: none; background-color: transparent" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="More"><i class="fa-solid fa-list"></i></button>
                                </td>
                              
                            </tr>
                            <tr class="table-warning" id="moreInfo_${meal.mealID}" style="display: none">
                                <td colspan="3" style="border-right: 1px solid #eee">
                                    <p style="font-size: 12px; font-weight: bold; margin: 0">Shelf life</p>
                                    <p style="font-size: 10px; margin: 0">${meal.shelfLife}</p>
                                </td>
                                <td colspan="3" style="border-right: 1px solid #eee">
                                    <p style="font-size: 12px; font-weight: bold; margin: 0">Preparation time</p>
                                    <p style="font-size: 10px; margin: 0">${meal.preparationTime}</p>
                                </td>
                                <td colspan="2">
                                    <p style="font-size: 12px; font-weight: bold; margin: 0">Nutrition value</p>
                                    <p style="font-size: 10px; margin: 0">${meal.nutritionValue}</p>
                                </td>
                                <td colspan="2">
                                    <a style="font-size: 10px" href="add-material-to-meal?mealID=${meal.mealID}"><i class="fa-regular fa-pen-to-square me-2"></i>Manage material</a>
                                </td>
                            </tr>
                        </c:forEach> 
                        </c:if>   
                        <c:if test="${allMeal == null}">
                            <tr>
                                <td colspan="9">
                                    <p style="font-size: 12px; font-style: italic; text-align: center">Nothing to display</p>
                                </td>                               
                            </tr>
                            
                        </c:if>
                    </tbody>
                
               
            </table>
           
        </div>
    </div>
</div>
<jsp:include page="add-meal-modal.jsp"/>
<script src="js-dashboard/handle.js"></script>
<script>
    var sizeListMaterial = <%= request.getAttribute("sizeMaterial") %>;
    var currentPage = <%= request.getParameter("page") %>;
</script>