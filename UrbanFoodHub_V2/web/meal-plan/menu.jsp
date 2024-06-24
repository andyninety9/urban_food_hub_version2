<%-- 
    Document   : menu
    Created on : May 30, 2024, 11:35:56 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="mealWeekPlan" value="${requestScope.listMealWeekPlan}"/>
<c:forEach var="plan" items="${mealWeekPlan}">
    <c:if test="${plan.cateID != 'CTM000123'}">
        <div style="display: flex; justify-content: space-between; align-items: center">
        <h3 style="font-weight: bold"><i class="fa-solid fa-calendar-days me-2"></i>${plan.planName}</h3>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <!--<li class="page-item"><a style="color: #808191" class="page-link" href="#"><i class="fa-solid fa-angles-left"></i> Last week</a></li>-->
                <li class="page-item"><a style="color: #808191" class="page-link" href="#">${plan.startDate}</a></li>
                <li class="page-item"><a style="color: #808191" class="page-link" href="#">to</a></li>
                <li class="page-item"><a style="color: #808191" class="page-link" href="#">${plan.endDate}</a></li>
                <!--<li class="page-item"><a style="color: #808191" class="page-link" href="#">Next week <i class="fa-solid fa-angles-right"></i></a></li>-->
            </ul>
        </nav>
        <a href="add-personal-plan?mealPlanID=${plan.mealPlanID}&accID=${user.accID}" style="background-color: red; color: white; border: none; padding: 10px 30px" type="button" class="btn btn-secondary">Add to personal plans</a>
    </div>
    <p style="font-size: 14px; color: #808191; padding: 10px 20px; background-color: #EEE; border-radius: 10px">${plan.desc}</p>
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
                            <div style="display: flex; justify-content: center; align-items: center; height: 80px; width: 80px; border-radius: 100%;
                                 background-color: red">
                                <h4 style="color: white; font-weight: bold; margin: 0; font-size: 12px">${mealDate.mealDate}</h4>
                            </div>
                        </td>
                        <c:forEach var="detail" items="${plan.listPlanDetails}">
                            <c:if test="${detail.mealDate == mealDate.mealDate}">
                                <c:choose>
                                    <c:when test="${detail.mealTime == 1}">
                                        <td id="breakfast-${mealDate.mealDate}">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0"><a style="font-style: none; text-decoration: none; color: inherit" href="home?action=view-food&mealID=${detail.meal.id}" target="target">${detail.meal.mealName}</a></h6>
                                                <span class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
                                            </div>
                                        </td>
                                    </c:when>
                                    <c:when test="${detail.mealTime == 2}">
                                        <td id="lunch-${mealDate.mealDate}">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0"><a style="font-style: none; text-decoration: none; color: inherit" href="home?action=view-food&mealID=${detail.meal.id}" target="target">${detail.meal.mealName}</a></h6>
                                                <span class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
                                            </div>
                                        </td>
                                    </c:when>
                                    <c:when test="${detail.mealTime == 3}">
                                        <td id="dinner-${mealDate.mealDate}">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0"><a style="font-style: none; text-decoration: none; color: inherit" href="home?action=view-food&mealID=${detail.meal.id}" target="target">${detail.meal.mealName}</a></h6>
                                                <span class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
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
    </c:if>
    
</c:forEach>