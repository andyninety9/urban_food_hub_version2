<%-- 
    Document   : navbar
    Created on : May 22, 2024, 2:41:00 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cr" value="${cookie.role.value}" />
<div class="wrapper-navigate" style="font-weight: bold">
    <div class="navigate">
        <a href="#">Materials</a>
        <a href="#">Foods</a>
        <a href="#">Meal Plans</a>
        <a href="faqs">FAQs</a>
        <c:if test="${cr == '1'}">
            <a href="dashboard">Dashboard</a>
        </c:if>
    </div>
</div>
