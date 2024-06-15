<%-- 
    Document   : access-denied
    Created on : May 22, 2024, 12:30:34 PM
    Author     : duyma
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="error" value="${requestScope.error}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>403 Error</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    </head>
    <body>
        <div style="display: flex; justify-content: center; align-items: center; width: 100vw; height: 100vh; flex-direction: column">
            <span style="font-size: 100px; color: orangered" class="material-icons">report_problem</span>
            <h3 style="font-size: 50px;">${error == null ? 'Cannot access' : error}</h3>
            <a href="home" style="padding: 10px 20px; border: none; outline: none; background-color: grey; color: white; border-radius: 20px; text-decoration:none">Back to home</a>
        </div>
        
    </body>
</html>
