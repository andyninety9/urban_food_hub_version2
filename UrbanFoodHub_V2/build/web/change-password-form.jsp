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
        <title>Change password</title>
        <link rel="stylesheet" href="./css/changePassword-stylesheet.css"/>
       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="containter">
            <form id="register-form" class="wrapper" action="change-password" method="post">
                <h3>Change password</h3>
                <!--<p>Don't have an account? <a href="register-form.jsp">Sign up</a></p>-->
                <div class="container-input">
                    <label for="oldpass">Old password *</label>
                    <input required="" placeholder="Enter your old password" type="password" name="oldpass" id="oldpass"/>
                </div>
                <div class="container-input">
                    <label for="password">New password *</label>
                    <input required="" placeholder="Create new password" type="password" name="newpass" id="password"/>
                </div>
                <div class="container-input">
                    <label for="confirm-pass">Confirm new password *</label>
                    <input required="" placeholder="Re-enter new password" type="password" name="cfnewpass" id="confirm-pass"/>
                    
                    <p style="color: red; height: 15px;" id="message"></p>
                </div>

                <c:set var="account" value="${sessionScope.account}"/>
                <c:if test="${requestScope.error != null}">
                    <p style="color: red; font-size: 12px" class="error">${requestScope.error}(*)</p>
                </c:if>
                <div class="container-btn">
                    <input class="btn" value="Change password" type="submit" name="btn-submit" />
                    <a href="home">Back to home</a>
                </div>
            </form>
        </div>
                <script src="./js/handleCheckConfirmPassword.js"></script>
    </body>
</html>
