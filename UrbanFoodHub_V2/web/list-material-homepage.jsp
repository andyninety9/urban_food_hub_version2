<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="top10" value="${requestScope.listTop10}"/>
<div style="display: flex; gap: 1.5rem; overflow-x: scroll">
    <c:if test="${top10 != null}">
        <c:forEach var="mate" items="${top10}">
            <div class="col">
            <div class="card" style="width: 250px">
                <div style="padding: 10px; height: 200px">
                    <img style="height: 100%; object-fit: cover; border-radius: 5px" src="
            <c:choose>
                <c:when test="${empty mate.mateImg}">
                 ./images/mate1.jpg
                </c:when>
                <c:otherwise>
                    ${mate.mateImg}
                </c:otherwise>
            </c:choose>
                         " class="card-img-top" alt="image-material">
                </div>
                <div class="card-body">
                <h5 class="card-title" style="color: #1DC071; font-weight: bold; font-size: 13px">${mate.mateName}</h5>
              <p style="margin: 0; font-size: 12px; font-weight: bold">Price: <a style="">${mate.price}đ</a></p>
              <p style="margin: 0; font-size: 12px; font-weight: bold">Packaging: <a style="">${mate.packagingSpec}</a></p>
              <p style="margin: 0; font-size: 12px; font-weight: bold">Stock: <a style="">${mate.stock}đ</a></p>
              <p class="card-text" style="font-size: 10px; height: 30px; overflow: hidden">${mate.mateDesc}</p>
              <div style="display: flex; justify-content: center; gap: 15px">
                <a style="background-color: #4ACD8D; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="add-to-cart?kind=material&productID=${mate.id}">Add to card</a>
                <a style="background-color: #A992FE; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="home?action=view-material&mateID=${mate.id}">View</a>
              </div>
              
            </div>
            </div>
        </div>
        </c:forEach>
    </c:if>
    <c:if test="${top10 == null}">
        <!--<h5 class="card-title">Nothing</h5>-->
    </c:if>
                    




</div>