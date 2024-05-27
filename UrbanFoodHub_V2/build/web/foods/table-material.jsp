<%-- 
    Document   : table-material
    Created on : May 23, 2024, 9:39:41 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<c:set var="allMaterial" value="${requestScope.listMaterial}"/>
<c:set var="allCategory" value="${requestScope.allCategory}"/>
<c:set var="mealDetails" value="${requestScope.mealDetails}"/>
<c:set var="selectedMeal" value="${requestScope.selectedMeal}"/>
<c:set var="errorTableMaterial" value="${requestScope.errorTableMaterial}"/>
<%--<c:set var="sizeListMaterial" value="${requestScope.sizeMaterial}"/>--%>
<script src="js-dashboard/handlePagination.js"></script>

<div class="col-8">
    <div class="bg-light rounded h-100 p-4">
        <div style="display: flex; justify-content: space-between">
            <h5 class="mb-4">All materials</h5>
            <form action="manage-products" class="d-none d-md-flex ms-4" style="font-size: 12px; border-radius: 20px; height: 30px">
                <input name="keyword" class="form-control border-0" type="search" placeholder="Search material" style="font-size: 12px">
            </form>
        </div>
        
        <form method="get" action="#" id="categoryForm" style="display: flex; justify-content: space-between">
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
        </form>
        
        <div class="table-responsive" style="height: 550px;">
            <table class="table">
                <thead>
                    <tr style="font-size: 14px">
                        <th scope="col"></th>
                        <th scope="col">#SKU</th>
                        <th scope="col">Material</th>
                        <th scope="col">Price(VND)</th>
                        <th scope="col">Stock</th>
                    </tr>
                </thead>
                <c:if test="${allMaterial != null}">
                    <tbody>
                       <c:forEach var="material" items="${allMaterial}">
                            <c:set var="isDuplicate" value="false" />
                            <c:forEach var="details" items="${mealDetails}">
                                <c:if test="${details.materialID == material.mateSku}">
                                    <c:set var="isDuplicate" value="true" />
                                </c:if>
                            </c:forEach>
                            <c:if test="${!isDuplicate}">
                                <tr style="font-size: 10px;">
                                    <th scope="row">
                                        <a href="add-to-meal?mealID=${selectedMeal.mealID}&mateID=${material.mateSku}"><i class="fa-solid fa-plus"></i></a>
                                    </th>
                                    <th scope="row">${material.mateSku}</th>
                                    <td>${material.mateName}</td>
                                    <td>${material.price}</td>
                                    <td>
                                        <p style="margin: 0; text-align: center">${material.stock}</p>
                                        <c:if test="${material.stock <= 30}">
                                            <p style="margin: 0; text-align: center">
                                                <span class="badge rounded-pill bg-warning text-dark">Low</span>
                                            </p>
                                        </c:if>
                                        <c:if test="${material.stock > 30}">
                                            <p style="margin: 0; text-align: center">
                                                <span class="badge rounded-pill bg-success">Good</span>
                                            </p>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </c:if>
                <c:if test="${allMaterial == null}">
                    <p style="font-size: 12px; font-style: italic">Nothing to display</p>
                </c:if>
            </table>
        </div>
    </div>
</div>
            


<!--<script>-->
    <!--var sizeListMaterial = <%= request.getAttribute("sizeMaterial") %>;-->
    <!--var currentPage = <%= request.getParameter("page") %>;-->
<!--</script>-->