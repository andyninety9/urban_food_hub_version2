<%-- 
    Document   : table-categories
    Created on : May 24, 2024, 8:03:42 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="allCategory" value="${requestScope.listCateFood}"/>
<div class="col-sm-12 col-md-3 col-xl-3">
       <div class="bg-light rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h6 class="mb-0">Category List</h6>
            <!--<a href="">Show All</a>-->
        </div>
        <form action="add-category-meal" class="d-flex mb-2" onsubmit="return confirm('Are you sure you want to add this category?')">
               <input name="cateName" style="font-size: 10px" class="form-control bg-transparent" type="text" placeholder="Enter new category name">
               <button type="submit" style="font-size: 12px; background-color: #4ACD8D; color: white; border: #4ACD8D" class="btn btn-primary ms-2">Add</button>
        </form>
           <div style="height: 300px; overflow-y: scroll">
            <c:forEach var="category" items="${allCategory}">
                <div class="d-flex align-items-center border-bottom py-2">
                    <!--<input class="form-check-input m-0" type="checkbox">-->
                    <div class="w-100 ms-3">
                        <div class="d-flex w-100 align-items-center justify-content-between">
                            <form onsubmit="return confirm('Are you sure you want to update this category?')" action="update-cate-meal" id="updateCate_${category.cateID}" style="display: flex; justify-content: space-between; align-items: center; gap: 10px">
                                <span id="nameCate_${category.cateID}" style="font-size: 12px; width: 110px; display: block">${category.cateName}</span>
                                <input class="form-control bg-transparent" name="newName" style="display: none; height: 30px; width: 100px; border-radius: 15px; outline: none; font-size: 10px; padding: 0 10px" id="newName_${category.cateID}" value="${category.cateName}" type="text"/>
                                <input name="cateID" type="hidden" value="${category.cateID}"/>
                                <button class="btn btn-sm" type="button" onclick="popup('nameCate_${category.cateID}', 'newName_${category.cateID}')">
                                    <i class="fa-regular fa-pen-to-square"></i>
                                </button>
                          </form>
                            
                            <form action="update-status-cate-meal" id="changeStatusCate_${category.cateID}" class="form-check form-switch">
                                <input onchange="document.getElementById('changeStatusCate_${category.cateID}').submit()"
                                    <c:if test="${category.cateStatus == 1}">checked</c:if>
                                    name="status" class="form-check-input" type="checkbox" role="switch"
                                    id="flexSwitchCheckDefault_${category.cateID}" value="1" >
                                <input type="hidden" name="cateID" value="${category.cateID}"/>
                                <label class="form-check-label" for="flexSwitchCheckDefault_${category.cateID}"></label>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        
       
    </div>
      
</div>
<script src="js-dashboard/handleUpdateCategory.js"></script>
