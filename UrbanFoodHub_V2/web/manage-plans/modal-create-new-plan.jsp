<%-- 
    Document   : modal-create-new-plan
    Created on : Jun 19, 2024, 4:18:44 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="listCate" value="${requestScope.listCate}"/>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Create new plan</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form id="create-newplan-form" onsubmit="return confirm('Do you want to update plan information?')" action="update-plan" class="col-6 col-md-4 col-sm-12" style="padding: 20px; display: flex; flex-direction: column; justify-content: space-between; width: 100%">
            <input type="hidden" name="action" value="create-meal-plan"/>
     
            <div class="form-floating mb-3">
                <input required="" name="planName" value="" type="text" class="form-control" id="planName" placeholder="Enter plan's name">
                <label for="planName">Plan name</label>
            </div>
            <div class="form-floating mb-3">
                <textarea name="planDesc" class="form-control" placeholder="Leave a description here" id="planDesc" style="height: 150px; resize: none"></textarea>
                <label for="planDesc">Description</label>
            </div>
            <div class="form-floating mb-3">
                <select id="select-cate" required="" name="planCate" class="form-select" aria-label="Default select example">
                    <option value="" selected>Category</option>
                    <c:forEach var="cate" items="${listCate}">
                        <option value="${cate.cateID}">${cate.cateName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-floating mb-3">
                <input required="" name="startDate" value="" class="form-control" id="startDate" class="form-control" type="date" />
                <label for="startDate">Begin date</label>
            </div>
            <div class="form-floating mb-3">
                <input required="" name="endDate" value="" class="form-control" id="endDate" class="form-control" type="date" />
                <label for="endDate">End date</label>
            </div>
            <div class="form-floating mb-3" >
                <button type="submit" class="btn btn-outline-secondary" style="width: 100%;">Create</button>
            </div>
        </form>
      </div>
     
    </div>
  </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("create-newplan-form");
    const select = document.getElementById("select-cate");

    form.addEventListener("submit", function(event) {
        if (select.value === "") {
            event.preventDefault();
            alert("Please select a category.");
            select.focus();
        }
    });
});
</script>
