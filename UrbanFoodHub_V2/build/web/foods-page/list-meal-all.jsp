<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="paginationListMeal" value="${requestScope.paginationListMeal}"/>
<c:set var="allCategory" value="${requestScope.listCateFood}"/>
<c:set var="selectedCate" value="${requestScope.selectedCate}"/>
<c:set var="sizeListFoods" value="${requestScope.sizeListFoods}"/>
<c:set var="checkedPage" value="${requestScope.checkedPage}"/>
<c:set var="error" value="${sessionScope.error}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="display: flex; flex-direction: column; justify-content: center; align-items: center; ">
<h1 style="">READY TO EAT</h1>
<div style="height: 10px; width: 5%;background-color: #4acd8e"></div>
<form id="categoryForm" action="home" style="display: flex; justify-content: end; width: 100%; align-items: center; gap: 1rem">
    <input type="hidden" name="action" value="foods"/>

    <ul id="pagination" class="pagination justify-content-center pagination-sm" style="padding: 0; margin: 0">
        <li class="page-item ${checkedPage == 1 ? 'disabled' : ''}">
          <a style="color: #808191" class="page-link" href="home?action=foods&page=${checkedPage - 1}&cateID=${selectedCate}" tabindex="-1" aria-disabled="true">Previous</a>
        </li>
        <c:forEach begin="${1}" end="${((sizeListFoods % 12) == 0) ? (sizeListFoods / 12) : ((sizeListFoods / 12) + 1) }" var="i">

            <li  class="page-item ${i == checkedPage ? 'active' : ''}"><a 

                    class="page-link" href="home?action=foods&page=${i}&cateID=${selectedCate}">${i}</a></li>
        </c:forEach>
        <li class="page-item ${checkedPage == (((sizeListMate % 12) == 0) ? (sizeListMate / 12) : ((sizeListMate / 12) + 1)) ? 'disabled' : ''}">
          <a style="color: #808191" class="page-link" href="home?action=foods&page=${checkedPage + 1}&cateID=${selectedCate}">Next</a>
        </li>
    </ul>                  
    <select name="cateID" onchange="document.getElementById('categoryForm').submit()" id="select-category" class="form-select-sm" aria-label="Default select example" style=" color: #75757D; border-radius: 20px; outline: none; padding: 10px 20px">
                <option value="all">All</option>
                <c:if test="${allCategory != null}" >
                    <c:forEach var="category" items="${allCategory}" >
                        <option 
                            <c:if test="${selectedCate == category.cateID}">
                                selected
                            </c:if>
                            value="${category.cateID}">${category.cateName}</option>
                    </c:forEach>
                </c:if>
    </select>
</form>
<div style="display: flex; gap: 1.5rem; flex-wrap: wrap; margin-top: 20px; ">
    <c:if test="${paginationListMeal != null}">
        <c:forEach var="meal" items="${paginationListMeal}">
            <c:if test="${meal.status != 2}">
                
                <div class="col" style="display: flex; justify-content: center;">
                   
                <div class="card" style="width: 250px">
                    <div style="padding: 10px; height: 200px">
                        <img style="height: 100%; object-fit: cover; border-radius: 5px; position: relative" src="
                <c:choose>
                    <c:when test="${empty meal.image}">
                     ./images/mate1.jpg
                    </c:when>
                    <c:otherwise>
                        ${meal.image}
                    </c:otherwise>
                </c:choose>
                             " class="card-img-top" alt="image-material">
                         <c:if test="${not empty meal.listMaterials}">
                        <span class="badge rounded-pill bg-warning text-dark" style="position: absolute; top: 0; right: 0; z-index: 1000; transform: translate(-15px, 15px);font-size: 8px">Available order material</span>
                    </c:if>
                    <c:if test="${empty meal.listMaterials}">
                        <span class="badge rounded-pill bg-secondary" style="position: absolute; top: 0; right: 0; z-index: 1000; transform: translate(-15px, 15px); font-size: 8px">Not available order material</span>
                    </c:if>
                </div>
                    <div class="card-body" style="display: flex; flex-direction: column; gap: 0.5rem">
                        <div style="display: flex; justify-content: space-between">
                            <h5 class="card-title" style=" font-weight: bold; font-size: 14px">${meal.mealName}</h5>
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

                    <p style="margin: 0; font-size: 12px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                        <a style="text-decoration: none; color: inherit;">${meal.nutritionValue}</a>
                    </p>

                    <p class="card-text" style="font-size: 10px; height: 30px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">${meal.mealDesc}</p>

                <div style="display: flex; justify-content: center; gap: 15px">
                    <a style="background-color: #4ACD8D; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="add-to-cart?kind=food&productID=${meal.mealID}">Add to card</a>
                    <a style="background-color: #A992FE; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="home?action=view-food&mealID=${meal.mealID}">View</a>
                </div>

                </div>
                </div>
            </div>
            </c:if>
            
        </c:forEach>
    </c:if>
    <c:if test="${paginationListMeal == null}">
        <h5 class="card-title">Nothing</h5>
    </c:if>
                    




</div>
</div>