<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="top10" value="${requestScope.recommendList}"/>
<c:set var="view" value="${requestScope.view}"/>
<h5 style="text-align: left; background-color: #FAFAFA; padding: 10px">Recommend material</h5>
<div style="display: flex; gap: 1.5rem; overflow-x: scroll">
    
    <c:if test="${top10 != null}">
        <c:forEach var="mate" items="${top10}">
            <div class="col">
            <div class="card" style="width: 250px">
                <div style="padding: 10px; height: 200px">
                    <img style="height: 100%; object-fit: cover; border-radius: 5px" src="
            <c:choose>
                <c:when test="${empty mate.image}">
                 ./images/mate1.jpg
                </c:when>
                <c:otherwise>
                    ${mate.image}
                </c:otherwise>
            </c:choose>
                         " class="card-img-top" alt="image-material">
                </div>
                <div class="card-body">
                <h5 class="card-title" style="color: #1DC071; font-weight: bold; font-size: 13px">${mate.name}</h5>
              <p style="margin: 0; font-size: 12px; font-weight: bold">Price: <a style="">${mate.price}đ</a></p>
              <c:if test="${view == 'material'}">
                  <p style="margin: 0; font-size: 12px; font-weight: bold">Packaging: <a style="">${mate.packagingSpec}</a></p> 
              </c:if>
              <c:if test="${view == 'food'}">
                <p style="margin: 0; font-size: 12px; font-weight: bold">Nutrition: <a style="">${mate.nutritionValue}</a></p> 
              </c:if>
              <p style="margin: 0; font-size: 12px; font-weight: bold">Stock: <a style="">${mate.stock}</a></p>
              <p class="card-text" style="font-size: 10px; height: 30px; overflow: hidden">${mate.desc}</p>
              <div style="display: flex; justify-content: center; gap: 15px">
                <a style="background-color: #4ACD8D; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="add-to-cart?kind=material&mateID=${mate.id}">Add to card</a>
                <a style="background-color: #A992FE; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="#">Buy now</a>
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