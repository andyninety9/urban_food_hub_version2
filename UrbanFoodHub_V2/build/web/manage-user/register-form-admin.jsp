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
        <title>Register</title>
        <link rel="stylesheet" href="./css/register-stylesheet.css"/>
        <link href="css-dashboard/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:set var="error" value="${requestScope.error}"/>
        <div class="containter">
            <form id="register-form" action="manage-user" class="wrapper" method="post">
                <h3>Create a new user</h3>
                <input type="hidden" name="action" value="create-user"/>
                <!--<p>Already have an account? <a href="login">Sign in</a></p>-->
                <div class="container-input">
                    <label for="username">Username *</label>
                    <input required="" placeholder="Enter username" type="text" name="username" id="username"/>
                    <span style="color: red; font-size: 10px; height: 15px" id="usernameError"></span>
                </div>
                
                <div class="container-input">
                    <label for="password">Password *</label>
                    <input required="" placeholder="Enter password" type="password" name="password" id="password"/>
                    <span style="color: red; font-size: 10px; height: 15px" id="passwordError"></span>
                </div>
                <div class="container-input">
                    <label for="confirmPass">Confirm password *</label>
                    <input required="" placeholder="Confirm your password" type="password" name="confirmPass" id="confirmPass"/>
                    <span style="color: red; font-size: 10px; height: 15px" id="confirmPassError"></span>
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="inputGroupSelect01">Role</label>
                    <select name="role" class="form-select" id="inputGroupSelect01">
                      <option selected>Choose...</option>
                      <option value="1">Admin</option>
                      <option value="2">User</option>
                    </select>
                </div>
                
                <c:if test="${error != null}">
                    <p style="color: red; font-size: 12px" class="error">${error}(*)</p>
                </c:if>
                <div class="container-btn">
                    <input class="btn" value="Create" type="submit" name="btn-submit" />
                    <a href="admin-router?action=manage-user">Back to home</a>
                </div>
            </form>
        </div>
        <!--<script src="./js/test1.js"></script>-->
        <script src="./js/validator.js"></script>
        <script src="./js/handleValidateRegister.js"></script>
    </body>
</html>
