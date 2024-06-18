<%-- 
    Document   : update-plan
    Created on : Jun 18, 2024, 11:04:40 PM
    Author     : duyma
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mealPlan" value="${requestScope.mealPlan}"/>
<c:set var="listCate" value="${requestScope.listCate}"/>
<div class="row" style="margin-top: 20px;">
    <h2 style="text-align: center; background-color: #eee; padding: 10px 20px; border-radius: 10px">${mealPlan.name}</h2>
    <form class="col-4" style="width: 40%; margin: 0 auto; padding: 20px; border: 1px solid #eee; border-radius: 10px; background-color: #A5E6C6">
        <h5 style="text-align: center">Edit meal plan</h5>
        <input type="hidden" name="planID" value="${mealPlan.id}"/>
        <div class="form-floating mb-3">
            <input value="${mealPlan.name}" type="text" class="form-control" id="planName" placeholder="Enter plan's name">
            <label for="planName">Plan name</label>
        </div>
        <div class="form-floating mb-3">
            <textarea class="form-control" placeholder="Leave a description here" id="planDesc" style="height: 150px; resize: none">${mealPlan.desc}</textarea>
            <label for="planDesc">Description</label>
        </div>
        <div class="form-floating mb-3">
            <select class="form-select" aria-label="Default select example">
                <!--<option selected>Category</option>-->
                <c:forEach var="cate" items="${listCate}">
                    <option ${mealPlan.category == cate.cateName ? 'selected' : ''} value="1">${cate.cateName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-floating mb-3">
            <input value="${mealPlan.startDate}" class="form-control" id="startDate" class="form-control" type="date" />
            <label for="startDate">Begin date</label>
        </div>
        <div class="form-floating mb-3">
            <input value="${mealPlan.endDate}" class="form-control" id="endDate" class="form-control" type="date" />
            <label for="endDate">End date</label>
        </div>
        <div class="form-floating mb-3" >
            <button type="button" class="btn btn-outline-secondary" style="width: 100%;">Update</button>
        </div>
    </form>
    <div class="col-7">
        <jsp:include page="menu.jsp"/>
    </div>
</div>

