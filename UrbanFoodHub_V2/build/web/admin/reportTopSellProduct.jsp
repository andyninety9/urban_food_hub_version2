<%-- 
    Document   : reportAccountCancel
    Created on : Jul 15, 2024, 4:54:20 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="sortedListTopSellProduct" value="${requestScope.sortedListTopSellProduct}"/>

<div style="background-color: #D2F2E3; padding: 20px; border-radius: 10px; width: 100%; max-height: 500px; overflow-y: scroll">
    <div>
        <h5>Top best seller products</h5>
        <p style="font-size: 18px"><i class="fa-solid fa-ranking-star"></i></p>
    </div>
    <table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">Product ID</th>
        <th scope="col">Image</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">No Orders</th>

      </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${sortedListTopSellProduct}">
            <tr>
                <th scope="row">${product.key.id}</th>
                <th>
                    <img style="height: 50px; width: 50px; object-fit: cover" src="
                        <c:choose>
                            <c:when test="${empty product.key.image}">
                             ./images/mate1.jpg
                            </c:when>
                            <c:otherwise>
                                ${product.key.image}
                            </c:otherwise>
                        </c:choose>
                         " alt="alt"/>
                </th>
                <td>${product.key.name}</td>
                <td><fmt:formatNumber value="${product.key.price}" pattern="#,###" />đ</td>
                <td>${product.value}</td>
               
            </tr>
        </c:forEach>
    </tbody>
  </table>
</div>

