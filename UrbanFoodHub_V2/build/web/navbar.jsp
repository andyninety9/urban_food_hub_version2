<%-- 
    Document   : navbar
    Created on : May 22, 2024, 2:41:00 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cr" value="${sessionScope.role}" />
<c:set var="currentPage" value="${requestScope.currentPage}"/>
<c:set var="user" value="${sessionScope.user}"/>

<c:set var="homeStyle" value="" />
<c:if test="${currentPage == 'home'}">
    <c:set var="homeStyle" value="background-color: #4acd8e48; border-radius: 5px;" />
</c:if>
<c:if test="${currentPage == 'materials'}">
    <c:set var="materialsStyle" value="background-color: #4acd8e48; border-radius: 5px;" />
</c:if>

<c:set var="foodsStyle" value="" />
<c:if test="${currentPage == 'foods'}">
    <c:set var="foodsStyle" value="background-color: #4acd8e48; border-radius: 5px;" />
</c:if>

<c:set var="mealPlansStyle" value="" />
<c:if test="${currentPage == 'plans'}">
    <c:set var="mealPlansStyle" value="background-color: #4acd8e48; border-radius: 5px;" />
</c:if>

<c:set var="faqsStyle" value="" />
<c:if test="${currentPage == 'faqs'}">
    <c:set var="faqsStyle" value="background-color: #4acd8e48; border-radius: 5px;" />
</c:if>
<c:set var="customizeStyle" value="" />
<c:if test="${currentPage == 'faqs'}">
    <c:set var="customizeStyle" value="background-color: #4acd8e48; border-radius: 5px;" />
</c:if>

<c:set var="dashboardStyle" value="" />
<c:if test="${currentPage == 'dashboard'}">
    <c:set var="dashboardStyle" value="background-color: #4acd8e48; border-radius: 5px;" />
</c:if>

<div class="wrapper-navigate" style="font-weight: bold">
    <div class="navigate">
        <a href="home" style="${homeStyle}">Home</a>
        <a href="home?action=materials" style="${materialsStyle}">Materials</a>
        <a href="home?action=foods" style="${foodsStyle}">Foods</a>
        <a href="home?action=plans" style="${mealPlansStyle}">Meal Plans</a>
        <a href="home?action=faqs" style="${faqsStyle}">FAQs</a>
        <c:if test="${cr == '1'}">
            <a href="dashboard" style="${dashboardStyle}">Dashboard</a>
            
        </c:if>
        <c:if test="${cr == '2'}">   
            <a href="home?action=customize" style="width: 200px; background: #4acd8e; color: white; border-radius: 10px; ${customizeStyle}">Customize Plans</a>
        </c:if>
        </div>
</div>
