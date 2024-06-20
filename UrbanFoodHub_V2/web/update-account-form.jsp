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
        <title>Update Account</title>
        <link rel="stylesheet" href="./css/login-stylesheet.css"/>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:set var="account" value="${sessionScope.user}"/>
        <div class="containter">
            <form id="update-form" class="wrapper" action="update-account" method="post" >
                <h3>Update your information</h3>
                <div class="container-input">
                    <label for="firstname">Firstname</label>
                    <input value="${account.firstname}" placeholder="Enter your firstname" type="text" name="firstname" id="firstname"/>
                    <span style="color: red; font-size: 10px; height: 15px" id="firstnameError"></span>
                </div>
                <div class="container-input">
                    <label for="lastname">Lastname</label>
                    <input value="${account.lastname}" placeholder="Enter your lastname" type="text" name="lastname" id="lastname"/>
                     <span style="color: red; font-size: 10px; height: 15px" id="lastnameError"></span>
                </div>
                <div class="container-input">
                    <label for="email">Email</label>
                    <input value="${account.email}" placeholder="Enter your email" type="text" name="email" id="email"/>
                    <span style="color: red; font-size: 10px; height: 15px" id="emailError"></span>
                </div>
                
                <div class="container-input">
                    <label for="phone">Phone number</label>
                    <input value="${account.phone}" placeholder="Enter your phone" type="text" name="phone" id="phone"/>
                    <span style="color: red; font-size: 10px; height: 15px" id="phoneError"></span>
                </div>
                
                <div class="container-input">
                    <label for="dob">Birthday</label>
                    <input value="${account.birthday}" type="date" name="dob" id="dob"/>
                </div>
<!--                <div class="container-input">
                    <label for="avatar">Avatar</label>
                    <input type="file" name="avatar" id="avatar"/>
                </div>-->
<!--                <div class="container-checkbox">
                    <label for="rem">Remember me</label>
                    <input type="checkbox" name="rem" id="rem" value="on"/>
                </div>-->
                <c:set var="account" value="${sessionScope.account}"/>
                <c:if test="${requestScope.error != null}">
                    <p style="color: red; font-size: 10px; height: 15px;" class="error">${requestScope.error}(*)</p>
                </c:if>
                    <p></p>
                <div class="container-btn">
                    <input class="btn" value="Update" type="submit" name="btn-submit" />
                    <a href="home">Back to home</a>
                </div>
            </form>
        </div>
                <script src="./js/validator.js"></script>
                <script src="./js/handleValidateUpdateAcount.js"></script>
    </body>
</html>
