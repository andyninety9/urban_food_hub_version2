<%-- 
    Document   : report-task
    Created on : Jun 12, 2024, 1:32:23 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="income" value="${requestScope.report.incomeMonthly}"/>
<c:set var="incomePrevious" value="${requestScope.report.incomePrevious}"/>


<div style="<c:if test="${(income - incomePrevious) < 0}" >background-color: #FFAAA5;</c:if> <c:if test="${(income - incomePrevious) > 0}" >background-color: #1DC071;</c:if> padding: 20px; border-radius: 10px; width: 100%;">
    <div>
        <h5 style="text-align: center; color: white; font-weight: bold; font-size: 28px">Total income</h5>
        <p style="font-size: 18px;color: #4B5264; text-align: center; font-weight: bold">This month 
            <c:if test="${(income - incomePrevious) < 0}" >
                <i style="color: #EB5757" class="fa-solid fa-arrow-down"></i>
                <a style="color: #EB5757"><fmt:formatNumber value="${income-incomePrevious}" pattern="#,###" /> VND</a> 
            </c:if>
            <c:if test="${(income - incomePrevious) > 0}" >
                <i class="fa-solid fa-arrow-up"></i>
                <a style="color: #6F49FD"><fmt:formatNumber value="${income-incomePrevious}" pattern="#,###" /> VND</a> 
            </c:if>
        Previous month
        </p>
            
    </div>
    <h1 style="text-align: center; color: white; font-weight: bold; font-size: 100px"><fmt:formatNumber value="${income}" pattern="#,###" /> VND</h1>
    
</div>
