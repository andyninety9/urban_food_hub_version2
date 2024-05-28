<%-- 
    Document   : newjsp
    Created on : May 26, 2024, 5:08:58 PM
    Author     : duyma
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-4">
    <div class="table-responsive">
        <h6 style="text-align: center">List of material included</h6>
        <table class="table table-primary">
            <thead>
              <tr style="font-size: 14px">
                <th scope="col"></th>
                <th scope="col">#</th>
                <th scope="col">Material</th>
                <th scope="col">Quantity</th>
                <th scope="col">Unit</th>
              </tr>
            </thead>
            <tbody>
                <c:forEach var="detail" items="${mealDetails}">
                    <tr style="font-size: 10px;">
                        <td>
                            <a href="delete-material-meal?detailID=${detail.detailID}&mealID=${detail.mealID}"><i class="fa-solid fa-trash"></i></a>
                        </td>
                        <th scope="row">${detail.detailID}</th>
                        
                        <c:forEach var="material" items="${listMaterial}">
                            <c:if test="${material.mateSku == detail.materialID}">
                                <td>${material.mateName}</td>
                            </c:if>
                        </c:forEach>
                      
                        <td>
                            <form action="edit-material-in-meal" id="editQuantity" style="display: flex; align-items: center;">
                                <input name="action" type="hidden" value="quantity"/>
                                <input name="detailID" type="hidden" value="${detail.detailID}"/>
                                <input name="mealID" type="hidden" value="${detail.mealID}"/>
                                <p id="quantity_${detail.detailID}" style="margin: 0; margin-right: 5px;">${detail.quantity}</p>
                                <input name="quantity" id="newQuantity_${detail.detailID}" type="text" value="${detail.quantity}" style="display: none; height: 30px; width: 70px; border-radius: 15px; outline: none; font-size: 10px; padding: 0 10px"/>
                                <button onclick="popup('quantity_${detail.detailID}', 'newQuantity_${detail.detailID}')" id="btnOpenQuantity" type="button" class="btn btn-sm" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit">
                                    <i style="color: #757575; font-size: 10px;" class="fa-solid fa-pen"></i>
                                </button>
                            </form>
                        </td>
             
                        <td>
                            <form action="edit-material-in-meal" id="editUnit" style="display: flex; align-items: center;">
                                <input name="action" type="hidden" value="unit"/>
                                <input name="detailID" type="hidden" value="${detail.detailID}"/>
                                <input name="mealID" type="hidden" value="${detail.mealID}"/>
                                <p id="unit_${detail.detailID}" style="margin: 0; width: 70px; margin-right: 5px;">${detail.unitMaterial}</p>
                                <input name="unit" id="newUnit_${detail.detailID}" type="text" value="${detail.unitMaterial}" style="display: none; height: 30px; width: 100px; border-radius: 15px; outline: none; font-size: 10px; padding: 0 10px"/>
                                <button onclick="popup('unit_${detail.detailID}', 'newUnit_${detail.detailID}')" id="btnOpenUnit" type="button" class="btn btn-sm" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit">
                                    <i style="color: #757575; font-size: 10px;" class="fa-solid fa-pen"></i>
                                </button>
                            </form>
                        </td>

                    </tr>
                    <tr>

                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<script>
    function popup(nameId, inputId) {
        const tagName = document.getElementById(nameId);
        const tagNewName = document.getElementById(inputId);
        if (tagName.style.display === "none") {
            tagName.style.display = "block";
            tagNewName.style.display = "none";
        } else {
            tagName.style.display = "none";
            tagNewName.style.display = "block";
        }
    }
</script>
