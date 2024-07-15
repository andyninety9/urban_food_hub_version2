<%-- 
    Document   : reportAccountCancel
    Created on : Jul 15, 2024, 4:54:20 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sortedListTopAccountCancelOrder" value="${requestScope.sortedListTopAccountCancelOrder}"/>

<div style="background-color: #F3F6F9; padding: 20px; border-radius: 10px; width: 100%;">
    <div>
        <h5>Top customers cancel orders</h5>
        <p style="font-size: 13px">Warning accounts monthly</p>
    </div>
    <table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">Account ID</th>
        <th scope="col">Name</th>
        <th scope="col">Phone</th>
        <th scope="col">Number Cancel Orders</th>
        <th scope="col">Action</th>
      </tr>
    </thead>
    <tbody>
        <c:forEach var="acc" items="${sortedListTopAccountCancelOrder}">
            <tr>
                <th scope="row">${acc.key.accID}</th>
                <td>${acc.key.lastname} ${acc.key.firstname}</td>
                <td>${acc.key.phone}</td>
                <td>${acc.value}</td>
                <td>
                    <a href="manage-user?action=update-status&accID=${acc.key.accID}&statusAcc=3">
                        <span class="badge rounded-pill bg-danger">Ban account</span>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
  </table>
</div>

