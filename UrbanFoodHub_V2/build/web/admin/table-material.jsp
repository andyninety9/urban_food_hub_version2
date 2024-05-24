<%-- 
    Document   : table-material
    Created on : May 23, 2024, 9:39:41 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<c:set var="allMaterial" value="${sessionScope.allMaterial}"/>
<c:set var="allCategory" value="${sessionScope.allCategory}"/>
<c:set var="selectedCate" value="${sessionScope.selectedCate}"/>
<c:set var="errorTableMaterial" value="${requestScope.errorTableMaterial}"/>


<div class="col-12">
    <div class="bg-light rounded h-100 p-4">
        <h5 class="mb-4">All materials</h5>
        <form method="get" action="manage-products" id="categoryForm" style="display: flex; justify-content: space-between">
            <a class="btn btn-outline-light" href="add-new-material" style=" padding: 10px 20px; font-size: 14px; background-color: #4ACD8D" role="button">Add new <i class="fa-solid fa-plus"></i></a>
            <div class="col-sm-12 col-xl-6">
                <div class="bg-light rounded h-100 p-1">
                    <div class="btn-toolbar" role="toolbar">
                        <div class="btn-group me-2" role="group" aria-label="First group">
                            <button type="button" class="btn btn-outline-light btn-custom-sm" style="height: 30px; width: 30px; padding: 3px; font-size: 10px; background-color: #4ACD8D">1</button>
                            <button type="button" class="btn btn-outline-light btn-custom-sm" style="height: 30px; width: 30px; padding: 3px; font-size: 10px; background-color: #4ACD8D">2</button>
                            <button type="button" class="btn btn-outline-light btn-custom-sm" style="height: 30px; width: 30px; padding: 3px; font-size: 10px; background-color: #4ACD8D">3</button>
                            <button type="button" class="btn btn-outline-light btn-custom-sm" style="height: 30px; width: 30px; padding: 3px; font-size: 10px; background-color: #4ACD8D">4</button>
                        </div>
                        <div class="btn-group me-2" role="group" aria-label="Second group">
                            <button type="button" class="btn btn-outline-light btn-custom-sm" style="height: 30px; width: 30px; padding: 3px; font-size: 10px; background-color: #77D9AA">5</button>
                            <button type="button" class="btn btn-outline-light btn-custom-sm" style="height: 30px; width: 30px; padding: 3px; font-size: 10px; background-color: #77D9AA">6</button>
                            <button type="button" class="btn btn-outline-light btn-custom-sm" style="height: 30px; width: 30px; padding: 3px; font-size: 10px; background-color: #77D9AA">7</button>
                        </div>
                        <div class="btn-group" role="group" aria-label="Third group">
                            <button type="button" class="btn btn-outline-light btn-custom-sm" style="height: 30px; width: 30px; padding: 3px; font-size: 10px; background-color: #8C6DFD">8</button>
                        </div>
                    </div>
                </div>
            </div>
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
        
        <div class="table-responsive" style="height: 500px; overflow-y: scroll">
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
                            <tr style="font-size: 10px">
                                <th scope="row">${material.mateSku}</th>
                                <!--<td></td>-->
                                <td>${material.mateName}</td>
                                <td>${material.mateDesc}</td>
                                <td>${material.price}</td>
                                <td>${material.packagingSpec}</td>
                                <td>${material.stock}</td>
                                <td>${material.cateName}</td>
                                <td>
                                    <c:if test="${material.mateStatus == 1}">
                                        <a href="hide-material?mateID=${material.mateSku}&statusID=${material.mateStatus}" type="button" class="btn btn-outline-success" style="font-size: 10px">Active</a>
                                    </c:if>
                                    <c:if test="${material.mateStatus == 2}">
                                        <a href="hide-material?mateID=${material.mateSku}&statusID=${material.mateStatus}" type="button" class="btn btn-outline-warning" style="font-size: 10px">Out stock</a>
                                    </c:if>
                                    <c:if test="${material.mateStatus == 3}">
                                        <a href="hide-material?mateID=${material.mateSku}&statusID=${material.mateStatus}" type="button" class="btn btn-outline-secondary" style="font-size: 10px">Inactive</a>
                                    </c:if>   
                                </td>
                                <td class="action">                 
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