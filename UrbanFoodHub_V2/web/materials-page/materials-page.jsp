<%-- 
    Document   : product-list
    Created on : May 15, 2024, 12:41:37 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="./images/Logo.png" type="image/x-icon">
        <title>Materials</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./css/homepage-stylesheet.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        

    </head>
    <body>
        
        <div class="container">
            
            <jsp:include page="../header.jsp"/>
            <div class="wrapper-body" style="padding: 10px 0">
                <jsp:include page="../navbar.jsp"/>
                
                <%--<jsp:include page="how-it-works.jsp"/>--%>
                <jsp:include page="list-materials-all.jsp"/>
               
            </div>
        </div>
                <jsp:include page="../footer.jsp"/>
        <script src="./js/main.js"></script>
        
       <script>
            const carousel = document.getElementById('carouselExampleIndicators');
            const carouselInstance = new bootstrap.Carousel(carousel);
        </script>
    </body>
</html>
