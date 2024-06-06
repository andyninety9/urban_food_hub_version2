<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="paginationListMaterials" value="${requestScope.paginationListMaterials}"/>
<c:set var="allCategory" value="${requestScope.lisCateMaterial}"/>
<c:set var="selectedCate" value="${requestScope.selectedCate}"/>
<c:set var="sizeListMate" value="${requestScope.sizeListMate}"/>
<c:set var="checkedPage" value="${requestScope.checkedPage}"/>
<div style="display: flex; flex-direction: column; justify-content: center; align-items: center; ">
<h1 style="">INGREDIENTS</h1>
<div style="height: 10px; width: 5%;background-color: #4acd8e"></div>
<form id="categoryForm" action="home" style="display: flex; justify-content: end; width: 100%; align-items: center; gap: 1rem">
    <input type="hidden" name="action" value="materials"/>

    <ul id="pagination" class="pagination justify-content-center pagination-sm" style="padding: 0; margin: 0">
        <li class="page-item ${checkedPage == 1 ? 'disabled' : ''}">
          <a style="color: #808191" class="page-link" href="home?action=materials&page=${checkedPage - 1}&cateID=${selectedCate}" tabindex="-1" aria-disabled="true">Previous</a>
        </li>
        <c:forEach begin="${1}" end="${((sizeListMate % 12) == 0) ? (sizeListMate / 12) : ((sizeListMate / 12) + 1) }" var="i">

            <li  class="page-item ${i == checkedPage ? 'active' : ''}"><a 

                    class="page-link" href="home?action=materials&page=${i}&cateID=${selectedCate}">${i}</a></li>
        </c:forEach>
        <li class="page-item ${checkedPage == (((sizeListMate % 12) == 0) ? (sizeListMate / 12) : ((sizeListMate / 12) + 1)) ? 'disabled' : ''}">
          <a style="color: #808191" class="page-link" href="home?action=materials&page=${checkedPage + 1}&cateID=${selectedCate}">Next</a>
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
<div style="display: flex; gap: 1.5rem; flex-wrap: wrap; margin-top: 20px">
    <c:if test="${paginationListMaterials != null}">
        <c:forEach var="meal" items="${paginationListMaterials}">
            <div class="col" style="display: flex; justify-content: center">
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
                <h5 class="card-title" style="color: #1DC071; font-weight: bold; font-size: 13px">${meal.mateName}</h5>
              <p style="margin: 0; font-size: 12px; font-weight: bold">Price: <a style="">${meal.price}đ</a></p>
              <p style="margin: 0; font-size: 12px; font-weight: bold">Package: <a style="">${meal.packagingSpec}</a></p>
              <p style="margin: 0; font-size: 12px; font-weight: bold">Stock: <a style="">${meal.stock}</a></p>
              <p class="card-text" style="font-size: 10px; height: 30px; overflow: hidden">${meal.mateDesc}</p>
              <div style="display: flex; justify-content: center; gap: 15px">
                <a style="background-color: #4ACD8D; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="add-to-cart?kind=material&mateID=${meal.mateSku}">Add to card</a>
                <a style="background-color: #A992FE; font-size: 12px; color: white; padding: 10px 15px; text-decoration: none; border-radius: 10px" href="#">More</a>
              </div>
              
            </div>
            </div>
        </div>
        </c:forEach>
    </c:if>
    <c:if test="${paginationListMaterials == null}">
        <!--<h5 class="card-title">Nothing</h5>-->
    </c:if>
                    




</div>
</div>