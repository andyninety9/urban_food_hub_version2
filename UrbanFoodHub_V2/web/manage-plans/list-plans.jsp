<%-- 
    Document   : list-plans
    Created on : Jun 18, 2024, 7:10:52 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="listMealPlan" value="${requestScope.listMealPlan}"/>
<c:set var="listCate" value="${requestScope.listCate}"/>
<div>
    <div style="display: flex; justify-content: space-between">
        <h5>All meal plans</h5>
        <div>
            <select class="form-select" aria-label="Default select example">
                <option selected>Category</option>
                <c:forEach var="cate" items="${listCate}">
                    <option value="1">${cate.cateName}</option>
                </c:forEach>
            </select>
        </div>     
        <div class="input-group mb-3" style="width: 30%">
            <button class="btn btn-outline-secondary" type="button" id="button-addon1">Search</button>
            <input type="text" class="form-control" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
        </div>
    </div>
    <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Plan</th>
            <th scope="col">Description</th>
            <th scope="col">Begin Date</th>
            <th scope="col">End Date</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
            
          </tr>
        </thead>
        <tbody>
            <c:forEach var="plan" items="${listMealPlan}">
                <tr>
                    <th scope="row">${plan.id}</th>
                    <td>${plan.name}</td>
                    <td>${plan.desc}</td>
                    <td>${plan.startDate}</td>
                    <td>${plan.endDate}</td>
                    <td>
                        <form action="#" id="changeStatusCate" class="form-check form-switch">
                                        <input onchange=""
                                            <c:if test="${plan.status == 1}">checked</c:if>
                                            name="status" class="form-check-input" type="checkbox" role="switch"
                                            id="flexSwitchCheckDefault_${category.cateID}" value="1" >
                                        <input type="hidden" name="cateID" value=""/>
                                        <label class="form-check-label" for="flexSwitchCheckDefault_"></label>
                        </form>
                    </td>
                    <td>
                        <a href="admin-router?action=update-plan&planID=${plan.id}" type="button" class="btn btn-primary">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
