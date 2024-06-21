<%-- 
    Document   : material-result
    Created on : Jun 21, 2024, 10:34:52 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="paginationListMaterials" value="${requestScope.listMaterials}"/>
<div>
    

<h1 style="">Material</h1>
<div style="height: 10px; width: 5%;background-color: #4acd8e"></div>
<h6 style="font-size: 13px; color: gray">Materials has ${paginationListMaterials.size()} results</h6>
<div style="display: flex; gap: 1.5rem; flex-wrap: wrap; margin-top: 20px;">
    <c:if test="${paginationListMaterials != null}">
        <c:forEach var="meal" items="${paginationListMaterials}">
            <c:if test="${meal.status != 2}">
                 <div class="col" style="display: flex; justify-content: start">
            <div class="card" style="width: 250px">
                <div style="padding: 10px; height: 200px">
                    <img style="height: 100%; object-fit: cover; border-radius: 5px" src="
            <c:choose>
                <c:when test="${empty meal.mateImg}">
                 ./images/mate1.jpg
                </c:when>
                <c:otherwise>
                    ${meal.mateImg}
                </c:otherwise>
            </c:choose>
                         " class="card-img-top" alt="image-material">
                </div>
                <div class="card-body">
                    <div style="display: flex; justify-content: space-between">
                        <h5 class="card-title" style=" font-weight: bold; font-size: 13px">${meal.mateName}</h5>
                        <c:if test="${meal.stock < 100}">
                                <span style="height: 22px" class="badge rounded-pill bg-warning text-dark">Stock: ${meal.stock}</span>
                            </c:if>
                            <c:if test="${meal.stock >= 100}">
                                <span style="height: 22px" class="badge rounded-pill bg-success"> Stock: ${meal.stock}</span>
                            </c:if>
                    </div>
                
                          <div style="display: flex; gap: 10px">
                        <c:if test="${meal.status == 1}">
                                <span style="height: 22px" class="badge rounded-pill bg-secondary">Available</span>
                            </c:if>
                        <c:if test="${meal.status == 3}">
                                <span style="height: 22px" class="badge rounded-pill bg-warning">Not available</span>
                        </c:if>
                        <p style="margin: 0; font-size: 12px; font-weight: bold"><a style="color: #1DC071; font-size: 18px"><fmt:formatNumber value="${meal.price}" pattern="#,###" />đ</a></p>
                    </div>
                  
              <p style="margin: 0; font-size: 12px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" >Package: <a style="">${meal.packagingSpec}</a></p>
              <!--<p style="margin: 0; font-size: 12px; font-weight: bold">Stock: <a style="">${meal.stock}</a></p>-->
              <p class="card-text" style="font-size: 10px; height: 30px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">${meal.mateDesc}</p>
              <div style="display: flex; justify-content: center; gap: 15px">
                <a style="background-color: #4ACD8D; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="add-to-cart?kind=material&productID=${meal.mateSku}">Add to card</a>
                <a style="background-color: #A992FE; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="home?action=view-material&mateID=${meal.mateSku}">View</a>
              </div>
              
            </div>
            </div>
        </div>
            </c:if>
           
        </c:forEach>
    </c:if>
    <c:if test="${paginationListMaterials == null}">
        <h5 class="card-title">Nothing</h5>
    </c:if>
</div>