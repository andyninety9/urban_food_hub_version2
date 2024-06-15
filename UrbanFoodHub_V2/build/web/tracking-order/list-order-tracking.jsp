<%-- 
    Document   : list-order-tracking
    Created on : Jun 10, 2024, 6:12:41 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="listOrder" value="${requestScope.listOrder}"/>
<c:set var="listAddresses" value="${requestScope.listAddresses}"/>
<c:set var="currentStatusOrder" value="${requestScope.currentStatusOrder}"/>
<c:set var="error" value="${requestScope.error}"/>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
    <div class="header">
        <ul class="wrapper__nav">
            <li><a class="wrapper__nav-option${currentStatusOrder == 0 ? '-active' : ''}" href="home?action=tracking-order">All</a></li>
            <li><a class="wrapper__nav-option${currentStatusOrder == 1 ? '-active' : ''}" href="home?action=tracking-order&statusID=1">Pending</a></li>
            <li><a class="wrapper__nav-option${currentStatusOrder == 2 ? '-active' : ''}" href="home?action=tracking-order&statusID=2">Processing</a></li>
            <li><a class="wrapper__nav-option${currentStatusOrder == 3 ? '-active' : ''}" href="home?action=tracking-order&statusID=3">Shipping</a></li>
            <li><a class="wrapper__nav-option${currentStatusOrder == 4 ? '-active' : ''}" href="home?action=tracking-order&statusID=4">Delivered</a></li>
            <li><a class="wrapper__nav-option${currentStatusOrder == 5 ? '-active' : ''}" href="home?action=tracking-order&statusID=5">Canceled</a></li>
        </ul>
    </div>
    <c:if test="${listOrder == null || fn:length(listOrder) == 0}">
                <p>Do not have any orders</p>
    </c:if>
    <c:if test="${error != null}">
            <p style="font-size: 10px; color: red; font-style: italic; text-align: center">${error}</p>
    </c:if>
    
    <c:forEach var="order" items="${listOrder}">
        <c:set var="total" value="0"/>
        
        <div class="order-card">
            <div class="top-card">
                
                <h6 style="color: #4ACD8E">#Order number: ${order.orderID}</h6>
                <c:if test="${order.statusID == 1}">
                    <div class="status-order">Pending</div>
                </c:if>
                <c:if test="${order.statusID == 2}">
                    <div style="background-color: #0D6EFD" class="status-order">Processing</div>
                </c:if>
                <c:if test="${order.statusID == 3}">
                    <div style="background-color: #198754" class="status-order">Shipping</div>
                </c:if>
                <c:if test="${order.statusID == 4}">
                    <div style="background-color: #0DCAF0" class="status-order">Delivered</div>
                </c:if>
                <c:if test="${order.statusID == 5}">
                    <div style="background-color: #DC3545" class="status-order">Canceled</div>
                </c:if>
            </div>
            <div style="border: 1px solid #A2A2A8"></div>
            
            <c:forEach var="detail" items="${order.listDetails}">
                <c:set var="total" value="${total + detail.unitPrice * detail.quantity}"/>
                <div class="body-card">
                    <img class="img" src="<c:choose>
                    <c:when test="${empty detail.product.image}">
                     ./images/mate1.jpg
                    </c:when>
                    <c:otherwise>
                        ${detail.product.image}
                    </c:otherwise>
                </c:choose>" alt="alt"/>
                    <div class="body-content">
                        <h6 class="product-name">${detail.product.name}</h6>
                        <p style="color: gray" class="product-type">Product type: ${detail.typeID}</p>
                        <p class="product-quantity">x${detail.quantity}</p>
                        <a class="btn-view-product" href="home?action=view-${detail.typeID == 1 ? 'material' : 'food'}&${detail.typeID == 1 ? 'mateID' : 'mealID'}=${detail.product.id}"><i class="fa-regular fa-eye me-2"></i>View product</a>
                    </div>
                    <p class="product-price"><fmt:formatNumber value="${detail.unitPrice}" pattern="#,###" />đ</p>
                </div>
            </c:forEach>
            
            <div style="border: 1px solid #A2A2A8"></div>
            <div class="footer-card">
                <div class="footer-card-left">
                    <h6 style="font-weight: bold" class="order-date">Order date: ${order.orderDate}</h6>
                    <c:forEach var="address" items="${listAddresses}">
                        <c:if test="${address.addressID == order.deliveryAddID}">
                            <h6 style="font-weight: bold" class="order-date">Delivery address: ${address.detail}</h6>
                        </c:if>
                    </c:forEach>
                    
                </div>
                
                <h6 class="total"><i class="fa-solid fa-money-bill me-2"></i>Total order: <p><fmt:formatNumber value="${total}" pattern="#,###" />đ</p></h6>
            </div>
            <c:if test="${order.statusID == 1}">
                <a href="manage-order?action=cancel-order&orderID=${order.orderID}" type="button" class="btn btn-danger">Cancel order</a>
            </c:if>
            <c:if test="${order.statusID == 2}">
                <div class="progress">
                     <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 33%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                     
                </div>
            </c:if>
            <c:if test="${order.statusID == 3}">
                <div class="progress">
                     <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 66%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </c:if>
            <c:if test="${order.statusID == 4}">
                <div class="progress">
                     <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 100%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                     
                </div>
            </c:if>
        </div>
    </c:forEach>
</div>

