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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="containter">
            <form onsubmit="return confirm('Are your sure to change password?')" id="register-form" class="wrapper needs-validation" novalidate action="change-password" method="post">
                <h3>Change password</h3>
                <!--<p>Don't have an account? <a href="register-form.jsp">Sign up</a></p>-->
                <div class="container-input">
                    <label for="oldpass">Old password *</label>
                    <input class="form-control" required="" placeholder="Enter your old password" type="password" name="oldpass" id="oldpass"/>
                    <div class="invalid-feedback" style="font-size: 10px;">
                        Please enter old password!
                    </div>
                </div>
                <div class="container-input">
                    <label for="password">New password *</label>
                    <input class="form-control" required="" placeholder="Create new password" type="password" name="newpass" id="password"/>
                    <div class="invalid-feedback" style="font-size: 10px;">
                        Please enter new password!
                    </div>
                </div>
                <div class="container-input">
                    <label for="confirm-pass">Confirm new password *</label>
                    <input required="" placeholder="Re-enter new password" type="password" name="cfnewpass" id="confirm-pass"/>
                    
                    <p style="color: red; height: 10px; margin-top: 5px" id="message"></p>
                </div>

                <c:set var="account" value="${sessionScope.account}"/>
                <c:if test="${requestScope.error != null}">
                    <p style="color: red; font-size: 10px" class="error">${requestScope.error}(*)</p>
                </c:if>
                <div class="container-btn">
                    <input class="btn" value="Change password" type="submit" name="btn-submit" />
                    <a href="home">Back to home</a>
                </div>
            </form>
        </div>
                <script src="./js/handleCheckConfirmPassword.js"></script>
                <script>
                    (function () {
                        'use strict'

                        // Fetch all the forms we want to apply custom Bootstrap validation styles to
                        var forms = document.querySelectorAll('.needs-validation')

                        // Loop over them and prevent submission
                        Array.prototype.slice.call(forms)
                          .forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                              if (!form.checkValidity()) {
                                event.preventDefault()
                                event.stopPropagation()
                              }

                              form.classList.add('was-validated')
                            }, false)
                          })
                    })()
                </script>
                
    </body>
</html>
