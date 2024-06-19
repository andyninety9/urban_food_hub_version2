<%-- 
    Document   : modal-add-new-day
    Created on : Jun 19, 2024, 10:38:19 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="plan" value="${requestScope.mealPlan}"/>

<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Choose a day</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form action="update-plan" onsubmit="return confirm('Do you want to create new day plan?')" class="form-floating mb-3" style="display: flex; flex-direction: column; gap: 10px; align-items: center">
            <input type="hidden" name="mealPlanID" value="${plan.id}"/>
            <input type="hidden" name="action" value="add-new-day-plan"/>
            <input name="mealDate" value="" class="form-control" id="mealDate" class="form-control" type="date" />
            <label for="mealDate">Plan Date</label>
            <button type="submit" class="btn btn-primary">Enter</button>
        </form>
      </div>

    </div>
  </div>
</div>