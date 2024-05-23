<%-- 
    Document   : login-form
    Created on : May 15, 2024, 11:44:54 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="./images/Logo.png" type="image/x-icon">
        <title>Sign-in</title>
        <link rel="stylesheet" href="./css/login-stylesheet.css"/>
       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:set var="cu" value="${cookie.username.value}"/>
        <c:set var="cp" value="${cookie.password.value}"/>
        <c:set var="crem" value="${cookie.rem.value}"/>
        <div class="containter">
            <form class="wrapper" action="login" method="post">
                <h3>Welcome Back!</h3>
                <p>Don't have an account? <a href="register">Sign up</a></p>
                <div class="container-input">
                    <label for="username">Username *</label>
                    <input value="${cu}" required="" placeholder="Enter username" type="text" name="username" id="username"/>
                </div>
                <div class="container-input">
                    <label for="password">Password *</label>
                    <input value="${cp}" required="" placeholder="Enter password" type="password" name="password" id="password"/>
                </div>
                <div class="container-checkbox">
                    <label for="rem">Remember me</label>
                    <input <c:if test="${crem == 'on'}">checked</c:if> type="checkbox" name="rem" id="rem" value="on"/>
                </div>
                <c:set var="account" value="${sessionScope.account}"/>
                <c:if test="${account == null && requestScope.error != null}">
                    <p style="color: red; font-size: 12px" class="error">${requestScope.error}(*)</p>
                </c:if>
                    
                <div class="container-btn">
                    <input class="btn" value="Sign in" type="submit" name="btn-submit" />
                    <a href="home">Back to home</a>
                </div>
            </form>
        </div>
    </body>
</html>
