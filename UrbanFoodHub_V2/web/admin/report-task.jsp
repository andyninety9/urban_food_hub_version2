<%-- 
    Document   : report-task
    Created on : Jun 12, 2024, 1:32:23 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="waitingConfirm" value="${requestScope.waitingConfirm}"/>
<c:set var="waitingShip" value="${requestScope.waitingShip}"/>
<c:set var="countCancelOrderToday" value="${requestScope.countCancelOrderToday}"/>
<c:set var="deliveredOrder" value="${requestScope.deliveredOrder}"/>
<c:set var="report" value="${requestScope.report}"/>
<%--<c:set var="onlineUsers" value="${applicationScope.onlineUser}" />--%>

<div style="background-color: #F3F6F9; padding: 20px; border-radius: 10px; width: 100%;">
    <div>
        <h5>List tasks today</h5>
        <p style="font-size: 13px">Report task you have to do</p>
    </div>
    <ul style="list-style: none; display: flex; gap: 5px; flex-wrap: wrap; padding: 0; justify-content: space-between">
        <li style="width: 150px; display: flex; flex-direction: column; align-items: center; background-color: #F1FBF7; border-radius: 10px; justify-content: center; padding: 10px">
            <h6>${waitingConfirm}</h6>
            <p style="margin: 0; font-size: 14px">Waiting confirm</p>
        </li>
        <li style="width: 150px; display: flex; flex-direction: column; align-items: center; background-color: #F1FBF7; border-radius: 10px; justify-content: center; padding: 10px">
            <h6>${waitingShip}</h6>
            <p style="margin: 0; font-size: 14px">Waiting ship</p>
        </li>
        <li style="width: 150px; display: flex; flex-direction: column; align-items: center; background-color: #F1FBF7; border-radius: 10px; justify-content: center; padding: 10px">
            <h6>${countCancelOrderToday}</h6>
            <p style="margin: 0; font-size: 14px">Cancel orders</p>
        </li>
        <li style="width: 150px; display: flex; flex-direction: column; align-items: center; background-color: #F1FBF7; border-radius: 10px; justify-content: center; padding: 10px">
            <h6>${deliveredOrder}</h6>
            <p style="margin: 0; font-size: 14px">Delivered orders</p>
        </li>
        <li style="width: 150px; display: flex; flex-direction: column; align-items: center; background-color: #F1FBF7; border-radius: 10px; justify-content: center; padding: 10px">
            <h6>0</h6>
            <p style="margin: 0; font-size: 14px">Visited</p>
        </li>
        <li style="width: 150px; display: flex; flex-direction: column; align-items: center; background-color: #F1FBF7; border-radius: 10px; justify-content: center; padding: 10px">
            <h6>${report.noProductRuningOut}</h6>
            <p style="margin: 0; font-size: 14px">Product running out</p>
        </li>
        <li style="width: 150px; display: flex; flex-direction: column; align-items: center; background-color: #F1FBF7; border-radius: 10px; justify-content: center; padding: 10px">
            <h6>${report.noProductOutStock}</h6>
            <p style="margin: 0; font-size: 14px">Product out stock</p>
        </li>
        <li style="width: 150px; display: flex; flex-direction: column; align-items: center; background-color: #F1FBF7; border-radius: 10px; justify-content: center; padding: 10px">
            <h6>${report.noNewOrderToday}</h6>
            <p style="margin: 0; font-size: 14px">New order today</p>
        </li>
    </ul>
</div>
