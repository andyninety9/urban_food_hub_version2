<%-- 
    Document   : menu
    Created on : May 30, 2024, 11:35:56 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="plan" value="${requestScope.mealPlan}"/>
<c:set var="listMeal" value="${requestScope.listMeal}"/>
<div style="padding: 20px; border: 1px solid #eee; border-radius: 10px; background-color: #C5B6FE">
    <div>
        <h5 style="text-align: center">Edit detail</h5>
        <button type="button" <c:if test="${plan.listPlanDetails.size() >= 15}">disabled</c:if> class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
            Add new day plan
        </button>
    </div>
    <jsp:include page="modal-add-new-day.jsp"/>
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
                        <td style="display: flex; justify-content: center; height: 100px">
                            <form method="post" action="update-plan" id="dateForm${mealDate.detailID}" style="display: flex; justify-content: center; align-items: center; height: 70px; width: 70px; border-radius: 100%;
                                 background-color: red; font-size: 10px">
                                <input name="mealPlanID" type="hidden" value="${mealDate.mealPlanID}"/>
                                <input name="planID" type="hidden" value="${plan.id}"/>
                                <input name="action" type="hidden" value="change-date-meal"/>
                                <input name="oldDate" type="hidden" value="${mealDate.mealDate}"/>
                                <h4 id="title${mealDate.detailID}" style="color: white; font-weight: bold; margin: 0; font-size: 10px;">${mealDate.mealDate}</h4>
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
                                        <td id="breakfast-${mealDate.mealDate}" style="height: 100px">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0">${detail.meal.mealName}</h6>
                                                <span style="font-size: 9px" class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
                                                <button style="font-size: 10px"
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
                                                                        <td><a href="update-plan?action=change-meal&detailID=${detail.detailID}&mealID=${mate.id}&planID=${plan.id}"><i class="fa-solid fa-plus"></i></a></td>
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
                                    <c:when test="${detail.mealTime == 2}">
                                        <td id="lunch-${mealDate.mealDate}">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0">${detail.meal.mealName}</h6>
                                                <span style="font-size: 9px" class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
                                                <button style="font-size: 10px"
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
                                                                        <td><a href="update-plan?action=change-meal&detailID=${detail.detailID}&mealID=${mate.id}&planID=${plan.id}"><i class="fa-solid fa-plus"></i></a></td>
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
                                                <h6 style="color: #171725; font-weight: bold; margin: 0">${detail.meal.mealName}</h6>
                                                <span style="font-size: 9px" class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
                                                <button style="font-size: 10px"
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
                                                                        <td><a href="update-plan?action=change-meal&detailID=${detail.detailID}&mealID=${mate.id}&planID=${plan.id}"><i class="fa-solid fa-plus"></i></a></td>
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
</div>
