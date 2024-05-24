<%-- 
    Document   : add-new-material
    Created on : May 23, 2024, 6:34:13 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="allCategory" value="${requestScope.allCategory}"/>
<div class="col-sm-12 col-xl-12">
    <form action="add-new-material" method="post" class="bg-light rounded h-100 p-4">
        <!--<h6 class="mb-4">Add new material</h6>-->
        <div class="form-floating mb-3">
            <input name="mateName" type="text" class="form-control" id="floatingInput"
                placeholder="Cá hồi...">
            <label for="floatingInput">Material name</label>
        </div>
        <div class="form-floating">
            <textarea name="mateDesc" class="form-control" placeholder="Leave a comment here"
                id="floatingTextarea" style="height: 100px; resize: none; margin-bottom: 20px"></textarea>
            <label for="floatingTextarea">Material description</label>
        </div>
        <div class="form-floating mb-3">
            <input name="price" type="text" class="form-control" id="floatingPassword"
                placeholder="Price">
            <label for="floatingPassword">Price</label>
        </div>
        <div class="form-floating mb-3">
            <select name="cateID" class="form-select" id="floatingSelect"
                aria-label="Floating label select example">
                <option selected>Category</option>
                <c:if test="${allCategory != null}" >
                    <c:forEach var="category" items="${allCategory}" >
                        <option value="${category.cateID}">${category.cateName}</option>
                    </c:forEach>
                </c:if>
            </select>
            <label for="floatingSelect">Category</label>
        </div>
        <div class="form-floating mb-3">
            <input name="packaging" type="text" class="form-control" id="floatingPassword"
                placeholder="Packaging">
            <label for="floatingPassword">Packaging</label>
        </div>
        <div class="form-floating mb-3">
            <input name="stock" type="text" class="form-control" id="floatingPassword"
                placeholder="Stock">
            <label for="floatingPassword">Stock</label>
        </div>
        <div class="mb-3">
            <label for="formFile" class="form-label">Material Image</label>
            <input name="mateImg" class="form-control" type="file" id="formFile">
        </div>
        <div class="form-check form-switch mb-3">
            <input name="status" class="form-check-input" type="checkbox" role="switch"
                   id="flexSwitchCheckDefault" value="1" >
            <label class="form-check-label" for="flexSwitchCheckDefault">Status material</label>
        </div>
        <div class="form-floating mb-3">
            <input class="btn btn-outline-light" type="submit"
            value="Submit" style=" padding: 10px 20px; width: 100%; font-size: 14px; background-color: #4ACD8D" >
        </div>
    </form>
</div>

