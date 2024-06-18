<%-- 
    Document   : menu
    Created on : May 30, 2024, 11:35:56 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="plan" value="${requestScope.mealPlan}"/>
<div style="padding: 20px; border: 1px solid #eee; border-radius: 10px; background-color: #C5B6FE">
    <h5 style="text-align: center">Edit detail</h5>
    <table class="table table-hover" style="margin-top: 20px; font-size: 13px">
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
                    <tr style="font-size: 12px">
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
                                                <h6 style="color: #171725; font-weight: bold; margin: 0">${detail.meal.mealName}</h6>
                                                <span class="badge bg-warning text-dark">${detail.meal.nutritionValue}</span>
                                            </div>
                                        </td>
                                    </c:when>
                                    <c:when test="${detail.mealTime == 2}">
                                        <td id="lunch-${mealDate.mealDate}">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0">${detail.meal.mealName}</h6>
                                                <span class="badge bg-warning text-dark">550 Kcal</span>
                                            </div>
                                        </td>
                                    </c:when>
                                    <c:when test="${detail.mealTime == 3}">
                                        <td id="dinner-${mealDate.mealDate}">
                                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                                <h6 style="color: #171725; font-weight: bold; margin: 0">${detail.meal.mealName}</h6>
                                                <span class="badge bg-warning text-dark">550 Kcal</span>
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
