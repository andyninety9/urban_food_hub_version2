<%-- 
    Document   : list-manage-order
    Created on : Jun 11, 2024, 10:12:16 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="listOrder" value="${requestScope.listOrder}"/>
<c:set var="listAccounts" value="${requestScope.listAccounts}"/>
<c:set var="currentPage" value="${requestScope.statusID}"/>
<link rel="stylesheet" href="css-dashboard/manage-order-stylesheet.css"/>

<div class="container">
    <h5 class="title">View orders</h5>
    <div class="wrapper-nav">
        <ul class="wrapper-option">
            <li class="option${currentPage == 0 ? '-active' : ''}"><a style="color: black" href="admin-router?action=manage-order&statusID=0">All</a></li>
            <li class="option${currentPage == 1 ? '-active' : ''}"><a style="color: black" href="admin-router?action=manage-order&statusID=1">Pending</a></li>
            <li class="option${currentPage == 2 ? '-active' : ''}"><a style="color: black" href="admin-router?action=manage-order&statusID=2">Processing</a></li>
            <li class="option${currentPage == 3 ? '-active' : ''}"><a style="color: black" href="admin-router?action=manage-order&statusID=3">Shipping</a></li>
            <li class="option${currentPage == 4 ? '-active' : ''}"><a style="color: black" href="admin-router?action=manage-order&statusID=4">Delivered</a></li>
            <li class="option${currentPage == 5 ? '-active' : ''}"><a style="color: black" href="admin-router?action=manage-order&statusID=5">Canceled</a></li>
        </ul>
    </div>
    <div class="wrapper-search" style="display: flex; justify-content: space-between; align-items: center">
        <h6>${fn:length(listOrder)} orders</h6>
        
        <form action="admin-router" class="filter" style="display: flex; gap: 10px; align-items: center">
            <input name="action" value="manage-order" type="hidden"/>
            <input style="outline: none; border: 1px solid #eee; background-color: transparent; border-radius: 20px; padding: 0 10px; height: 40px; font-size: 14px" name="fromDate" type="date"/>
            <p style="margin: 0;">to</p>
            <input style="outline: none; border: 1px solid #eee; background-color: transparent; border-radius: 20px; padding: 0 10px; height: 40px; font-size: 14px" name="toDate" type="date"/>
            <input style="outline: none; border: none; border-radius: 20px; padding: 5px 10px; font-size: 14px; background-color: #4ACD8D; color: white" type="submit" value="Apply"/>
        </form>
        <form action="admin-router" class="input-group mb-3" style="width: 40%; height: 40px">
            <input type="hidden" name="action" value="manage-order"/>
            <span class="input-group-text" id="basic-addon1">
                <select name="selectSearch" style="border: none; outline: none; background-color: transparent" class="search-options form-select-sm" aria-label="Default select example">
                    <option value="all" selected="">Choose search option</option>
                    <option value="orderID">Order number</option>
                </select>
            </span>
            <input name="keyword" style="font-size: 14px" type="text" class="form-control" placeholder="Search orders" aria-label="Username" aria-describedby="basic-addon1">
        </form>
    </div>
    
    <div class="wrapper-list-order">
        <div class="header-list row" >
            <p class="col-md-3">Order</p>
            <p class="col-md-3">Total</p>
            <p class="col-md-3">Status</p>
            <p class="col-md-3">Action</p>
        </div>
        <div class="body-list">
            
            <c:forEach var="order" items="${listOrder}">
            <c:set var="total" value="0"/>
            <div class="order-detail">
                <div class="header-detail">
                    <div class="buyer-info">
                      
                        <c:forEach var="acc" items="${listAccounts}">
                            <c:if test="${acc.accID == order.accID}">
                                <img class="buyer-img" src="images/avatar-default.jpg" alt="alt"/>
                                <p class="buyer-name">${acc.firstname} ${acc.lastname}</p>
                            </c:if>
                        </c:forEach>
                        
                    </div>
                    <p style="font-size: 14px">Order date: ${order.orderDate}</p>
                    <p style="font-size: 16px;">Order number: #${order.orderID}</p>
                 
                </div>
                
                <div class="body-detail row">
                    
                    <div class="product-info col-md-3">
                        <div style="display: flex; flex-direction: column; gap: 5px;">
                        
                        <c:forEach var="detail" items="${order.listDetails}">
                        <c:set var="total" value="${total + detail.unitPrice * detail.quantity}"/>
                            <c:choose>
                                <c:when test="${empty detail.product.image}">
                                    <c:set var="imagePath" value="./images/mate1.jpg"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="imagePath" value="${detail.product.image}"/>
                                </c:otherwise>
                            </c:choose>
                            <div style="display: flex; gap: 5px">
                            
                                <img style="width: 50px; height: 50px; object-fit: cover; border: 1px solid #eee;" src="${imagePath}" alt="alt"/>
                                
                                <div style="width: 100%" class="product-right">
                                    <div>
                                        <c:if test="${order.statusID == 1}">
                                            <span style="font-size: 8px" class="badge rounded-pill bg-secondary">Pending</span>
                                        </c:if>
                                        <c:if test="${order.statusID == 2}">
                                            <span style="font-size: 8px" class="badge rounded-pill bg-secondary">Preparing</span>
                                        </c:if>
                                        <c:if test="${order.statusID == 3}">
                                            <span style="font-size: 8px" class="badge rounded-pill bg-secondary">Shipping</span>
                                        </c:if>
                                        <c:if test="${order.statusID == 4}">
                                            <span style="font-size: 8px" class="badge rounded-pill bg-secondary">Delivered</span>
                                        </c:if>
                                        <c:if test="${order.statusID == 5}">
                                            <span style="font-size: 8px" class="badge rounded-pill bg-danger">Canceled</span>
                                        </c:if>
                                        
                                    </div>

                                    <p>${detail.product.name}</p>
                                </div>
                                <p style="color: black; font-size: 14px;">x${detail.quantity}</p>
                            </div>
                        
                        
                        </c:forEach>
                        </div>
                    </div>
                    
                    <p class="price-order col-md-3"><fmt:formatNumber value="${total}" pattern="#,###" />đ</p>
                    
                    <c:if test="${order.statusID == 1}">
                        <p class="price-order col-md-3">Pending</p>
                        <a href="manage-order?action=process-order&orderID=${order.orderID}&statusID=2" style="padding: 5px 10px; font-size: 14px; display: flex; justify-content: center; align-items: center; height: 40px; width: 200px" class="btn btn-outline-primary col-md-3">Confirm order</a>
                    </c:if>
                    <c:if test="${order.statusID == 2}">
                        <p class="price-order col-md-3">Preparing</p>
                        <a href="manage-order?action=process-order&orderID=${order.orderID}&statusID=3" style="padding: 5px 10px; font-size: 14px; display: flex; justify-content: center; align-items: center; height: 40px; width: 200px" class="btn btn-outline-success col-md-3">Ship order</a>
                    </c:if>
                    <c:if test="${order.statusID == 3}">
                        <p class="price-order col-md-3">Shipping</p>
                        <a href="manage-order?action=process-order&orderID=${order.orderID}&statusID=4" style="padding: 5px 10px; font-size: 14px; display: flex; justify-content: center; align-items: center; height: 40px; width: 200px" class="btn btn-outline-info col-md-3">Confirm delivered</a>
                    </c:if>
                    <c:if test="${order.statusID == 4}">
                        <p class="price-order col-md-3">Delivered</p>
                        <!--<a href="#" style="padding: 5px 10px; font-size: 14px; display: flex; justify-content: center; align-items: center; height: 40px; width: 200px" class="btn btn-outline-secondary col-md-3">Cancel order</a>-->
                    </c:if>
                    <c:if test="${order.statusID == 5}">
                        <p class="price-order col-md-3">Canceled</p>
                    </c:if>
                    
                    
                </div>
                
            </div>
                                
            </c:forEach>
        </div>
    </div>
</div>
