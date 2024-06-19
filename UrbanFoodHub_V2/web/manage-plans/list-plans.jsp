<%-- 
    Document   : list-plans
    Created on : Jun 18, 2024, 7:10:52 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="listMealPlan" value="${requestScope.listMealPlan}"/>
<c:set var="listCate" value="${requestScope.listCate}"/>
<c:set var="checkedCate" value="${requestScope.checkedCate}"/>
<c:set var="checkedPage" value="${requestScope.checkedPage}"/>
<c:set var="sizeList" value="${requestScope.sizeList}"/>
<div>
    <div style="display: flex; justify-content: space-between; align-items: center">
        <h5 style="margin: 0">All meal plans</h5>
        <form id="cate-plan-form" action="admin-router">
            <input type="hidden" name="action" value="manage-plans"/>
            <select onchange="document.getElementById('cate-plan-form').submit()" name="cateID" class="form-select" aria-label="Default select example">
                <option ${checkedCate == 'all' ? 'selected' : ''} value="all">All</option>
                <c:forEach var="cate" items="${listCate}">
                    <option ${checkedCate == cate.cateID ? 'selected' : ''} value="${cate.cateID}">${cate.cateName}</option>
                </c:forEach>
            </select>
        </form>     
        
        <form action="admin-router" class="input-group mb-3" style="width: 30%">
            <input type="hidden" name="action" value="manage-plans"/>
            <button class="btn btn-outline-secondary" type="submit" id="button-addon1">Search</button>
            <input name="keyword" type="text" class="form-control" placeholder="Search name, id, description..." aria-label="Example text with button addon" aria-describedby="button-addon1">
        </form>
    </div>
    <div style="display: flex; justify-content: end; align-items: center">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Create new plan
        </button>
    </div>
    <jsp:include page="modal-create-new-plan.jsp"/>
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
                    <td>
                        <span class="d-inline-block text-truncate" style="max-width: 300px;">${plan.desc}</span>
                    </td>
                    <td>${plan.startDate}</td>
                    <td>${plan.endDate}</td>
                    <td>
                        <form onsubmit="return confirm('Do you want to hide this plan?')" action="update-plan" id="changeStatusPlan_${plan.id}" class="form-check form-switch">
                                        <input onchange="document.getElementById('changeStatusPlan_${plan.id}').submit()"
                                            <c:if test="${plan.status == 1}">checked</c:if>
                                            name="status" class="form-check-input" type="checkbox" role="switch"
                                            id="flexSwitchCheckDefault_${category.cateID}" value="1" >
                                        <input type="hidden" name="mealPlanID" value="${plan.id}"/>
                                        <input type="hidden" name="action" value="change-status"/>
                                        
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
    <div style="display: flex; justify-content: end">
       <ul id="pagination" class="pagination justify-content-center pagination-sm" style="padding: 0; margin: 0">
               <li class="page-item ${checkedPage == 1 ? 'disabled' : ''}">
                 <a style="color: #808191" class="page-link" href="admin-router?action=manage-plans&page=${checkedPage - 1}" tabindex="-1" aria-disabled="true">Previous</a>
               </li>
               <c:forEach begin="${1}" end="${((sizeList % 10) == 0) ? (sizeList / 10) : ((sizeList / 10) + 1) }" var="i">

                   <li  class="page-item ${i == checkedPage ? 'active' : ''}"><a 

                           class="page-link" href="admin-router?action=manage-plans&page=${i}">${i}</a></li>
               </c:forEach>
               <li class="page-item ${checkedPage == (((sizeList % 10) == 0) ? (sizeList / 10) : ((sizeList / 10) + 1)) ? 'disabled' : ''}">
                 <a style="color: #808191" class="page-link" href="admin-router?action=manage-plans&page=${checkedPage + 1}">Next</a>
               </li>
       </ul>                  
   </div>
</div>
