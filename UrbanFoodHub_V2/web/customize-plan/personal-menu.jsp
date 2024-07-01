<%-- 
    Document   : menu
    Created on : May 30, 2024, 11:35:56 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="mealWeekPlan" value="${requestScope.listPersonMealPlans}"/>
<c:set var="sizeListMate" value="${requestScope.sizeListFoods}"/>
<c:set var="checkedPage" value="${requestScope.checkedPage}"/>
<c:set var="listMeal" value="${requestScope.listMeal}"/>
<c:if test="${mealWeekPlan == null}">
    <h6 style="font-weight: bold"><i class="fa-solid fa-calendar-days me-2"></i>Nothing to display</h6>
</c:if>
<c:forEach var="plan" items="${mealWeekPlan}">
    <div style="display: flex; justify-content: space-between; align-items: center">
        <form onsubmit="return confirm('Do you want to change plan name?');" action="update-personal-plan" method="post" style="display: flex; gap: 10px">
            <h3 id="title${plan.id}" style="font-weight: bold"><i class="fa-solid fa-calendar-days me-2"></i>${plan.planName}</h3>
            <input name="planID" type="hidden" value="${plan.id}"/>
            <input name="action" type="hidden" value="update-name"/>
            <input name="newName" style="display: none; outline: none; border-radius: 10px; padding: 10px 20px" id="inputTitle${plan.id}" value="${plan.planName}"/>
            <button onclick="toggleButton('title${plan.id}', 'inputTitle${plan.id}')" type="button" class="btn btn-light" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" data-bs-content="Right popover">
                <i class="fa-solid fa-pen"></i>
            </button>
        </form>
        <nav aria-label="Page navigation example">
            <form onsubmit="return confirm('Do you want to change plan date?');" action="update-personal-plan" method="post" style="display: flex; gap:10px">
                <ul class="pagination" style="margin: 0">
                    <!--<li class="page-item"><a style="color: #808191" class="page-link" href="#"><i class="fa-solid fa-angles-left"></i> Last week</a></li>-->
                    <li id="liStart${plan.id}" class="page-item"><a style="color: #808191" class="page-link" href="#">${plan.startDate}</a></li>
                    
                    <input name="planID" type="hidden" value="${plan.id}"/>
                    <input name="action" type="hidden" value="update-date"/>
                    <input name="startDate" id="dateStart${plan.id}" style="outline: none; display: none" type="date" value="${plan.startDate}"/>
                    <li class="page-item"><a style="color: #808191" class="page-link" href="#">to</a></li>
                    <li id="liEnd${plan.id}" class="page-item"><a style="color: #808191" class="page-link" href="#">${plan.endDate}</a></li>
                    <input name="endDate" id="dateEnd${plan.id}" style="outline: none; display: none" type="date" value="${plan.endDate}"/>
                    <!--<li class="page-item"><a style="color: #808191" class="page-link" href="#">Next week <i class="fa-solid fa-angles-right"></i></a></li>-->
                </ul>
                <button onclick="toggleMultipleButtons([
                        { idElement: 'liStart${plan.id}', idInput: 'dateStart${plan.id}' },
                        { idElement: 'liEnd${plan.id}', idInput: 'dateEnd${plan.id}' },
                        { idElement: null, idInput: 'submitBtn${plan.id}' }
                    ])" 
                    type="button" class="btn btn-light" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" data-bs-content="Right popover">
                    <i class="fa-solid fa-pen"></i> 
                </button>
                <button id="submitBtn${plan.id}" style="display: none;" type="submit" class="btn btn-light" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" data-bs-content="Right popover">
                    <i class="fa-solid fa-floppy-disk"></i>
                </button>
            </form>
        </nav>
        <div style="display: flex; gap: 10px">
            
            <a href="add-to-cart?kind=plan&planID=${plan.id}" style="background-color: red; color: white; border: none; padding: 10px 30px" type="button" class="btn btn-secondary">Add to cart</a>
            <a onclick="return confirm('Do you want to delete plan?');" href="update-personal-plan?action=delete&planID=${plan.id}" type="button" class="btn btn-light"><i class="fa-solid fa-trash"></i></a>
        </div>            
       
    </div>
    <table class="table table-hover" style="margin-top: 20px">
        <thead style="background-color: black; color: white; font-weight: bold;">
            <tr>
                <th style="text-align: center; border-right: 1px solid white; color: red" scope="col">DAY</th>
                <th style="text-align: center; border-right: 1px solid white" scope="col">BREAKFAST</th>
                <th style="text-align: center; border-right: 1px solid white" scope="col">LUNCH</th>
                <th style="text-align: center; border-right: 1px solid white" scope="col">DINNER</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="mealDate" items="${plan.listPlanDetails}" varStatus="status">
                <c:if test="${status.first || mealDate.mealDate != previousMealDate}">
                    <c:set var="previousMealDate" value="${mealDate.mealDate}"/>
                    <tr>
                        <td scope="row" style="display: flex; justify-content: center;">
                            <form method="post" action="update-personal-plan" id="dateForm${mealDate.detailID}" style="display: flex; justify-content: center; align-items: center; height: 80px; width: 80px; border-radius: 100%;
                                 background-color: red">
                                <input name="mealPlanID" type="hidden" value="${mealDate.mealPlanID}"/>
                                <input name="action" type="hidden" value="change-date-meal"/>
                                <input name="oldDate" type="hidden" value="${mealDate.mealDate}"/>
                                <h4 id="title${mealDate.detailID}" style="color: white; font-weight: bold; margin: 0; font-size: 12px;">${mealDate.mealDate}</h4>
                                <input name="newDate" onchange="document.getElementById('dateForm${mealDate.detailID}').submit()" id="dateMealInput${mealDate.detailID}" style="border: none; font-size: 10px; outline: none; display: none" type="date" value="${mealDate.mealDate}"/>
                            </form>
                            <button style="font-size: 10px; background-color: transparent; border: none" onclick="toggleButton('title${mealDate.detailID}', 'dateMealInput${mealDate.detailID}')" type="button" class="btn btn-light" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" data-bs-content="Right popover">
                                <i class="fa-solid fa-pen"></i>
                            </button>
                        </td>
                        <c:forEach var="detail" items="${plan.listPlanDetails}">
                            <c:if test="${detail.mealDate == mealDate.mealDate}">
                                <c:choose>
                                    <c:when test="${detail.mealTime == 1}">
                                        <td id="breakfast-${mealDate.mealDate}">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0"><a style="font-style: none; text-decoration: none; color: inherit" href="home?action=view-food&mealID=${detail.meal.id}" target="target">${detail.meal.mealName}</a></h6>
                                                <span class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
                                                <button 
                                                    type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#updateMealModal${detail.detailID}">
                                                    <i class="fa-solid fa-rotate"></i>
                                                </button>
                                                <div class="modal fade" id="updateMealModal${detail.detailID}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                      <div class="modal-content">
                                                        <div class="modal-header">
                                                          <h1 class="modal-title fs-5" id="exampleModalLabel">Change your breakfast</h1>
                                                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!--Modal breakfast-->
                                                            
                                                            <table class="table table-hover" style="font-size: 10px">
                                                            <thead>
                                                              <tr>
                                                                <th scope="col">#ID</th>
                                                                <th scope="col">Meal</th>
                                                                <th scope="col">Calories</th>
                                                                <th scope="col">Action</th>
                                                              </tr>
                                                            </thead>
                                                            <tbody id="mealTableBody">
                                                                <c:forEach var="mate" items="${listMeal}">
                                                                    <tr>
                                                                        <th scope="row">${mate.id}</th>
                                                                        <td>${mate.name}</td>
                                                                        <td>${mate.nutritionValue}</td>
                                                                        <td><a href="update-personal-plan?action=change-meal&mealID=${mate.id}&detailID=${detail.detailID}"><i class="fa-solid fa-plus"></i></a></td>
                                                                    </tr>
                                                                </c:forEach>
                                                              
                                                            </tbody>
                                                          </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                          <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </div>
                                            </div>
                                        </td>
                                    </c:when>
                                    <c:when test="${detail.mealTime == 2}">
                                        <td id="lunch-${mealDate.mealDate}">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0"><a style="font-style: none; text-decoration: none; color: inherit" href="home?action=view-food&mealID=${detail.meal.id}" target="target">${detail.meal.mealName}</a></h6>
                                                <span class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
                                                <button 
                                                    type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#updateMealLunchModal${detail.detailID}">
                                                    <i class="fa-solid fa-rotate"></i>
                                                </button>
                                                <div class="modal fade" id="updateMealLunchModal${detail.detailID}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                      <div class="modal-content">
                                                        <div class="modal-header">
                                                          <h1 class="modal-title fs-5" id="exampleModalLabel">Change your lunch</h1>
                                                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table class="table table-hover" style="font-size: 10px">
                                                            <thead>
                                                              <tr>
                                                                <th scope="col">#ID</th>
                                                                <th scope="col">Meal</th>
                                                                <th scope="col">Calories</th>
                                                                <th scope="col">Action</th>
                                                              </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="mate" items="${listMeal}">
                                                                    <tr>
                                                                        <th scope="row">${mate.id}</th>
                                                                        <td>${mate.name}</td>
                                                                        <td>${mate.nutritionValue}</td>
                                                                        <td><a href="update-personal-plan?action=change-meal&mealID=${mate.id}&detailID=${detail.detailID}"><i class="fa-solid fa-plus"></i></a></td>
                                                                    </tr>
                                                                </c:forEach>
                                                              
                                                            </tbody>
                                                          </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                          <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </div>
                                            </div>
                                        </td>
                                    </c:when>
                                    <c:when test="${detail.mealTime == 3}">
                                        <td id="dinner-${mealDate.mealDate}">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0"><a style="font-style: none; text-decoration: none; color: inherit" href="home?action=view-food&mealID=${detail.meal.id}" target="target">${detail.meal.mealName}</a></h6>
                                                <span class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
                                                <button 
                                                    type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#updateMealDinnerModal${detail.detailID}">
                                                    <i class="fa-solid fa-rotate"></i>
                                                </button>
                                                <div class="modal fade" id="updateMealDinnerModal${detail.detailID}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                      <div class="modal-content">
                                                        <div class="modal-header">
                                                          <h1 class="modal-title fs-5" id="exampleModalLabel">Change your dinner</h1>
                                                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table class="table table-hover" style="font-size: 10px">
                                                            <thead>
                                                              <tr>
                                                                <th scope="col">#ID</th>
                                                                <th scope="col">Meal</th>
                                                                <th scope="col">Calories</th>
                                                                <th scope="col">Action</th>
                                                              </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="mate" items="${listMeal}">
                                                                    <tr>
                                                                        <th scope="row">${mate.id}</th>
                                                                        <td>${mate.name}</td>
                                                                        <td>${mate.nutritionValue}</td>
                                                                        <td><a href="update-personal-plan?action=change-meal&mealID=${mate.id}&detailID=${detail.detailID}"><i class="fa-solid fa-plus"></i></a></td>
                                                                    </tr>
                                                                </c:forEach>
                                                              
                                                            </tbody>
                                                          </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </div>
                                            </div>
                                        </td>
                                    </c:when>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</c:forEach>
<ul id="pagination" class="pagination justify-content-center pagination-sm" style="padding: 0; margin: 0">
    <li class="page-item ${checkedPage == 1 ? 'disabled' : ''}">
      <a style="color: #808191" class="page-link" href="home?action=customize&page=${checkedPage - 1}&cateID=${selectedCate}" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <c:forEach begin="${1}" end="${((sizeListMate % 2) == 0) ? (sizeListMate / 2) : ((sizeListMate / 2) + 1) }" var="i">

        <li  class="page-item ${i == checkedPage ? 'active' : ''}"><a 

                class="page-link" href="home?action=customize&page=${i}&cateID=${selectedCate}">${i}</a></li>
    </c:forEach>
    <li class="page-item ${checkedPage == (((sizeListMate % 2) == 0) ? (sizeListMate / 2) : ((sizeListMate / 2) + 1)) ? 'disabled' : ''}">
      <a style="color: #808191" class="page-link" href="home?action=customize&page=${checkedPage + 1}&cateID=${selectedCate}">Next</a>
    </li>
</ul>           
    

    

