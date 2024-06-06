<%-- 
    Document   : table-material
    Created on : May 23, 2024, 9:39:41 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<c:set var="allMaterial" value="${requestScope.allMaterial}"/>
<c:set var="allCategory" value="${requestScope.allCategory}"/>
<c:set var="selectedCate" value="${requestScope.selectedCate}"/>
<c:set var="errorTableMaterial" value="${requestScope.errorTableMaterial}"/>
<c:set var="sizeListMaterial" value="${requestScope.sizeMaterial}"/>
<c:set var="checkedPage" value="${requestScope.checkedPage}"/>
<script src="js-dashboard/handlePagination.js"></script>

<div class="col-9">
    <div class="bg-light rounded h-100 p-4">
        <div style="display: flex; justify-content: space-between">
            <h5 class="mb-4">All materials</h5>
            <form action="manage-products" class="d-none d-md-flex ms-4" style="font-size: 12px; border-radius: 20px; height: 30px">
                <input value="${requestScope.keyword}" name="keyword" class="form-control border-0" type="search" placeholder="Search material" style="font-size: 12px">
            </form>
        </div>
        
        <form method="get" action="manage-products" id="categoryForm" style="display: flex; justify-content: space-between">
            <!--<a class="btn btn-outline-light" href="add-new-material" style=" padding: 10px 20px; font-size: 14px; background-color: #4ACD8D" role="button">Add new <i class="fa-solid fa-plus"></i></a>-->
            <a style=" padding: 10px 20px; font-size: 14px; background-color: #4ACD8D; border: none" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Add new <i class="fa-solid fa-plus"></i>
            </a>
            <ul id="pagination" class="pagination justify-content-center pagination-sm" style="padding: 0; margin: 0">
                <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <c:forEach begin="${1}" end="${((sizeListMaterial % 10) == 0) ? (sizeListMaterial / 10) : ((sizeListMaterial / 10) + 1) }" var="i">
                    <li class="page-item ${i == checkedPage ? 'active' : ''}"><a class="page-link" href="manage-products?page=${i}">${i}</a></li>
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
                        <th scope="col">#SKU</th>
                        <th scope="col">Material</th>
                        <th scope="col">Description</th>
                        <th scope="col">Price(VND)</th>
                        <th scope="col">Packaging</th>
                        <th scope="col">Stock</th>
                        <th scope="col">Category</th>  
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <c:if test="${allMaterial != null}">
                    <tbody>
                        <c:forEach var="material" items="${allMaterial}">
                            <tr style="font-size: 10px;">
                                <th scope="row">${material.mateSku}</th>
                                <!--<td></td>-->
                                <td>${material.mateName}</td>
                                <td>${material.mateDesc}</td>
                                <td>${material.price}</td>
                                <td>${material.packagingSpec}</td>
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
                                <td>${material.cateName}</td>
                                <td>
                                    <c:if test="${material.mateStatus == 1}">
                                        <a href="hide-material?mateID=${material.mateSku}&statusID=${material.mateStatus}" type="button" class="btn btn-outline-success" style="font-size: 10px; width: 70px">Active</a>
                                    </c:if>
                                    <c:if test="${material.mateStatus == 2}">
                                        <a href="hide-material?mateID=${material.mateSku}&statusID=${material.mateStatus}" type="button" class="btn btn-outline-warning" style="font-size: 10px; width: 70px">Out stock</a>
                                    </c:if>
                                    <c:if test="${material.mateStatus == 3}">
                                        <a href="hide-material?mateID=${material.mateSku}&statusID=${material.mateStatus}" type="button" class="btn btn-outline-secondary" style="font-size: 10px; width: 70px">Inactive</a>
                                    </c:if>   
                                </td>
                                <td class="action">
<!--                                    <a href="update-material?mateID=${material.mateSku}" style="color: #757575; font-size: 14px"  class="btn" data-bs-toggle="modal" data-bs-target="#UpdateModal">
                                        Update <i class="fa-solid fa-file-pen"></i>
                                    </a>-->
                                    <a style="color: #757575; font-size: 14px" href="update-material?mateID=${material.mateSku}" data-bs-toggle="tooltip" data-bs-placement="top" title="Update"><i class="fa-solid fa-file-pen"></i></a>
                                    <!--<a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Hide"><i class="fa-solid fa-trash"></i></a>-->
                                    <a style="color: #757575; font-size: 14px" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="More"><i class="fa-solid fa-list"></i></a>
                                </td>
                            </tr>
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

<jsp:include page="testModalBody.jsp"/>
<jsp:include page="ModalUpdate.jsp"/>
<script>
    var sizeListMaterial = <%= request.getAttribute("sizeMaterial") %>;
    var currentPage = <%= request.getParameter("page") %>;
</script>