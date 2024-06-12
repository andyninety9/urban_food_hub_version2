<%-- 
    Document   : list-product-cart
    Created on : Jun 8, 2024, 11:44:15 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="cart" value="${sessionScope.listCart}"/>
<c:set var="listAddresses" value="${requestScope.listAddresses}"/>
<c:set var="cartSize" value="${fn:length(listCart)}" />
<c:set var="error" value="${requestScope.error}"/>
<div style="display: flex; gap: 1.5rem; color: #4ACD8D; align-items: center">
    <p style="font-weight: bold; margin: 0" class="h4">Urban Food Hub</p>
    <div style="width: 2px; height: 30px; background-color: #4ACD8D"></div>
    <p style=" margin: 0" class="h4">Cart</p>
</div>
<div>
    <c:if test="${error != null}">
        <p style="text-align: center; font-style: italic; font-size: 10px">${error}</p>
    </c:if>
    <table class="table" style="text-align: center">
        <thead>
          <tr>
            <th scope="col"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
            <th scope="col" colspan="4">Product</th>
            <th scope="col">Unit price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
           <c:set var="total" value="0"/>
           <c:if test="${cartSize <= 0}">
               <tr>
                   <td colspan="9">
                       <p>
                           Nothing in cart
                       </p>   
                   </td>
               </tr>
           </c:if>
           <c:if test="${cartSize > 0}">
                <c:forEach var="entry" items="${cart}">
                    <c:set var="total" value="${total + (entry.key.price * entry.value)}"/>
                    <c:set var="totalItem" value="${(entry.key.price * entry.value)}"/>
                     <tr>
                         <td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
                         <td style="width: 40%" colspan="4">
                             <div class="row">
                                 <div class="col-md-4">
                                     <img style="height: 70px; width: 70px; object-fit: cover" src="
                                         <c:choose>
                                             <c:when test="${empty entry.key.image}">
                                              ./images/mate1.jpg
                                             </c:when>
                                             <c:otherwise>
                                                 ${entry.key.image}
                                             </c:otherwise>
                                         </c:choose>
                                          " alt="alt"/>
                                 </div>
                                 <div  class="col-md-8" style="display: flex; flex-direction: column; align-items: flex-start">
                                     <p style="margin: 0; font-size: 14px; font-weight: bold">${entry.key.name}</p>
                                     <span style="font-size: 10px" class="badge bg-warning text-dark">500Kcal</span>
                                     <p style="font-size: 10px; text-align: left">${entry.key.desc}</p>
                                 </div>
                             </div>
                         </td>
                         <td>
                             <div style="display: flex; gap: 5px; justify-content: center">
                                 <p style="margin: 0; font-size: 14px; font-weight: bold"><fmt:formatNumber value="${entry.key.price}" pattern="#,###" /></p>
                                 <p style="margin: 0; font-size: 14px; font-weight: bold">đ</p>
                             </div>
                         </td>
                         <td>
                              <ul id="pagination" class="pagination justify-content-center pagination-sm" style="padding: 0; margin: 0">
                                 <li class="page-item">
                                   <a style="color: #808191" class="page-link" href="edit-cart?action=decrease&productID=${entry.key.id}" tabindex="-1" aria-disabled="true"><i class="fa-solid fa-minus"></i></a>
                                 </li>
                                 <li class="page-item disabled"><a style="color: #808191" class="page-link" href="#" tabindex="-1" aria-disabled="true">${entry.value}</a></li>
                                 <li class="page-item">
                                   <a style="color: #808191" class="page-link" href="edit-cart?action=increase&productID=${entry.key.id}"><i class="fa-solid fa-plus"></i></a>
                                 </li>
                             </ul>              
                         </td>
                         <td>    
                             <div style="display: flex; gap: 5px; justify-content: center; color: #4ACD8E">
                                 <p style="margin: 0; font-size: 14px; font-weight: bold"><fmt:formatNumber value="${totalItem}" pattern="#,###" /></p>
                                 <p style="margin: 0; font-size: 14px; font-weight: bold">đ</p>
                             </div>
                         </td>
                         <td>
                             <div style="display: flex; gap: 5px; justify-content: center; color: #4ACD8E">
                                 <a href="edit-cart?action=delete&productID=${entry.key.id}" style="margin: 0; font-size: 14px; font-weight: bold">Delete</a>
                             </div>
                         </td>
                     </tr>

                </c:forEach>
           </c:if>
         
        </tbody>
    </table>
           <div style="display: flex; flex-direction: column; gap: 1.5rem; align-items: center" class="checkout__wrapper">
        <table class="table" style="text-align: center">
            <tbody>
                <tr>
                    <td>
                        <div style="display: flex; gap: 5px; align-items: center">
                            <input style="margin: 0" class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                            <p style="font-size: 14px; margin: 0">Check all(1)</p>
                        </div>
                    </td>
                    <td>
                        <div class="" style="display: flex; gap: 5px; justify-content: end">
                            <p style="font-size: 14px; margin: 0">Total(${cartSize} items): </p>
                            <p style="margin: 0; font-size: 18px; font-weight: bold"><fmt:formatNumber value="${total}" pattern="#,###" /></p>
                            <p style="margin: 0; font-size: 14px; font-weight: bold">đ</p>
                        </div>
                    </td>
                    <td>
                        <button id="btnToggleCheckout" onclick="handleOpen('addressDelevery')" type="button" class="btn btn-warning">Continue</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <form action="check-out" id="addressDelevery" style="width: 30%; border: 1px solid #eee; display: none; padding: 20px; border-radius: 10px; display: flex; flex-direction: column; align-items: center;gap: 10px">
            <h4 style="text-align: center; font-weight: bold">Delivery Information</h4>
            <input type="hidden" name="action" value="check-out"/>
            <div class="input-group mb-3" style="font-size: 14px">
                <span class="input-group-text" id="basic-addon1">Name</span>
                <input value="${user.firstname}" type="text" disabled="" class="form-control"  aria-label="Username" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3" style="font-size: 14px">
                <span class="input-group-text" id="basic-addon1">Phone</span>
                <input value="${user.phone}" type="text" disabled="" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
            </div>
<!--            <button data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="font-size: 10px; background-color: transparent; border: none; color: #4ACD8E; margin-bottom: 10px" type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="Open address book">
                <i class="fa-solid fa-book me-2"></i>Get from address book
            </button>-->
            <div class="input-group">
                <span class="input-group-text">Address</span>
                <select required="" name="addressID" style="outline: none;">
                    <option selected="">Choose address</option>
                    <c:forEach var="address" items="${listAddresses}" >
                        <option value="${address.addressID}">${address.detail}</option>
                    </c:forEach>
                </select>
            </div>
<button type="submit" class="btn btn-outline-warning">Checkout</button>
        </form>
    </div>
</div>
            <script>
                function handleOpen(btn){
                    const button = document.getElementById(btn);
                    if(button.style.display === 'none'){
                        button.style.display = '';
                    }else{
                        button.style.display = 'none';
                    }
                }
            </script>