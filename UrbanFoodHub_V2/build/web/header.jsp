<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="user" value="${sessionScope.user}"/>
        <header class="row" style="background-color: #22222C; height: 80px; border-radius: 0">
        <div class="ticker" style="width: 100%"> <div class="title"></div> <div style="background: #22222C" class="news"> <marquee class="news-content"> <p style="margin: 0; color: white; font-size: 10px">**Welcome to Urban Foods Hub Gratis verzending vanaf €100

Fresh, not frozen

Klarna: betaal in 30 dagen

Gratis verzending vanaf €100

Fresh, not frozen

Klarna: betaal in 30 dagen

Gratis verzending vanaf €100

Fresh, not frozen

Klarna: betaal in 30 dagen</p> </marquee> </div> </div>
                <div class="wrapper-logo col-md-3">
                    <img src="./images/Logo.png" alt="logo"/>
                    <a style="color: white" href="home">Urban Food Hub</a>
                </div>
                <div class="wrapper-searchbar col-md-4">
                    <form class="searchbar">
                        <input placeholder="Search materials or plan..." type="text" name="searchbar"/>
                        <button type="submit">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
            
                
                <div class="information col-md-5">
                    <c:if test="${user == null}" >
                        <a href="login">Sign-in</a>
                    </c:if>
                    <c:if test="${user != null}" >
                        <div class="wrapper-info" style="display: flex; align-items: center; cursor: pointer; position: relative">
                            <p style="font-size: 12px; font-weight: bold; margin: 0; color: white" class="name">Hi, ${user.firstname}</p>
                            <div class="outline-avatar" style="border: 2px solid #4ACD8D; border-radius: 100%; padding: 1px; margin-left: 5px;
                                 ">                             
                                <img style="height: 25px; width: 25px; object-fit: cover; border-radius: 100%" src="./images/avatar-default.jpg" alt="avatar"/>
                            </div>
                            <div id="hover-option" style="position: absolute; right: 0; transform: translateY(60%); display: none; z-index: 10 ">
                                <ul style="list-style: none;border: 1px solid #eee; border-radius: 10px; overflow: hidden; padding: 0; margin: 0" class="wrapper-option">
                                    <li style="border: 1px solid #eee; padding: 5px 10px; background-color: white; width: 120px;text-align: center;"><a style="text-decoration: none; font-size: 12px; color: #4B5264; display: inline-block;" href="user-info">Account info</a></li>
                                    <li style="border: 1px solid #eee; padding: 5px 10px; background-color: white; width: 120px;text-align: center;"><a style="text-decoration: none; font-size: 12px; color: #4B5264; display: inline-block;" href="change-password">Change password</a></li>
                                    <li style="border: 1px solid #eee; padding: 5px 10px; background-color: white; width: 120px;text-align: center;"><a style="text-decoration: none; font-size: 12px; color: #4B5264; display: inline-block;" href="update-account">Update account</a></li>
                                    <li style="border: 1px solid #eee; padding: 5px 10px; background-color: white; width: 120px;text-align: center;"><a style="text-decoration: none; font-size: 12px; color: #4B5264; display: inline-block;" href="logout">Log-out</a></li>
                                </ul>
                            </div>
                           
                        </div>
                            <button type="button" class="btn position-relative" style="background-color: transparent; border: none; color: white; margin-left: 10px; margin-right: 10px">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <span style="font-size: 10px" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-warning">
                              10+
                              <span class="visually-hidden">unread messages</span>
                            </span>
                        </button>
                     </c:if>
                </div>
    </header>
