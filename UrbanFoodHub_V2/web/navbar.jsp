<%-- 
    Document   : navbar
    Created on : May 22, 2024, 2:41:00 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cr" value="${cookie.role.value}" />
 <div class="wrapper-navigate">
                    <div class="navigate">
                        <a href="#">Material</a>
                        <a href="#">Prepared food</a>
                        <a href="#">Meal Plans</a>
                        <c:if test="${cr == '1'}">
                            <a href="dashboard">Dashboard</a>
                        </c:if>
                    </div>
</div>
