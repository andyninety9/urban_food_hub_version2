<%-- 
    Document   : info-page
    Created on : May 28, 2024, 9:20:24 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="listAddresses" value="${requestScope.listAddresses}"/>
<c:set var="listOrder" value="${requestScope.listOrder}"/>
<c:set var="checkedStatus" value="${requestScope.checkedStatus}"/>
<div class="container">
    <h1 class="display-6">#Account Information</h1>
    <div class="row" style=" border: 1px solid black; padding: 20px; border-radius: 10px; margin-bottom: 20px">
        <div class="col-md-6">
        <div style="display: flex; gap: 10px; background-color: #E2DBFF; padding: 15px; border-radius: 10px; margin-bottom: 10px">
            <p style="font-weight: bold; margin: 0" class="h6">Fullname: </p>
            <p style="margin: 0" class="h6">${user.lastname} ${user.firstname}</p>
        </div>
        <div style="display: flex; gap: 10px; background-color: #E2DBFF; padding: 15px; border-radius: 10px; margin-bottom: 10px">
            <p style="font-weight: bold; margin: 0" class="h6">Birthday: </p>
            <p style="margin: 0" class="h6">${user.birthday}</p>
        </div>
        <div style="display: flex; gap: 10px; background-color: #E2DBFF; padding: 15px; border-radius: 10px; margin-bottom: 10px">
            <p style="font-weight: bold; margin: 0" class="h6">Phone: </p>
            <p style="margin: 0" class="h6">${user.phone}</p>
        </div>
        <div style="display: flex; flex-direction: column; gap: 10px; background-color: #E2DBFF; padding: 20px; border-radius: 10px">
            <p style="font-weight: bold; text-align: center" class="h6">Shipping address: </p>
            <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#addNewModal">Add new address</button>
            <div>
                <table class="table table-hover" style="text-align: center; font-size: 12px">
                <thead>
                <tr>
                  <th scope="col">#No</th>
                  <th scope="col">Address</th>
                  <th scope="col">Status</th>
                </tr>
              </thead>
              <tbody>
                  <c:if test="${listAddresses == null}">
                      <tr>
                          <td colspan="3">Do not have any address</td>
                      </tr>
                  </c:if>
                  <c:if test="${listAddresses != null}">
                      <c:set var="i" value="1"/>
                        <c:forEach var="address" items="${listAddresses}">
                            
                            <tr>
                                <th scope="row">${i}</th>
                                <td>
                                    <form action="update-status-address" style="display: flex; gap: 10px; align-items: center">
                                        <button onclick="toggleButton('detail${address.addressID}', 'input${address.addressID}')" class="btn btn-hover" type="button" class="btn btn-light" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" data-bs-content="Right popover">
                                            <i style="font-size: 10px" class="fa-solid fa-pen"></i>
                                        </button>
                                            <input name="action" type="hidden" value="update-detail"/>
                                            <input name="addressID" type="hidden" value="${address.addressID}"/>
                                        
                                        <input name="detail" id="input${address.addressID}" type="text" style="outline: none; border-radius: 10px; padding: 5px 10px; border: none; display: none; font-size: 12px" value="${address.detail}"/>
                                        <p id="detail${address.addressID}" style="font-size: 12px; margin: 0">${address.detail}</p>
                                    </form>
                                    
                                </td>
                                <td>
                                    <!--<span class="badge rounded-pill bg-warning text-dark">Default</span>-->
                                    <c:if test="${address.statusID == 1}">
                                        <a href="update-status-address?action=update-status&addressID=${address.addressID}&status=${address.statusID}">
                                            <span class="badge rounded-pill bg-warning text-dark">Active</span>
                                        </a>
                                    </c:if>
                                    <c:if test="${address.statusID != 1}">
                                        <a href="update-status-address?action=update-status&addressID=${address.addressID}&status=${address.statusID}">
                                            <span class="badge rounded-pill bg-light text-dark">Inactive</span>
                                        </a>
                                        
                                    </c:if>
                                       
                                </td>
                            </tr>
                            <c:set var="i" value="${i = i + 1}"/>
                        </c:forEach>
                  </c:if>
                
                
              </tbody>
            </table>
            </div>
        </div>
        </div>
        <form method="post" action="user-info?action=change-avatar" class="col-md-6" style="display: flex; flex-direction: column; justify-content: center; align-items: center">
            <img src="
                  <c:choose>
                <c:when test="${empty user.avatar}">
                 images/avatar-default.jpg
                </c:when>
                <c:otherwise>
                    ${user.avatar}
                </c:otherwise>
            </c:choose>
                 " alt="alt" style="height: 200px; width: 200px; object-fit: cover;padding: 5px; border: 5px solid #1DC071; border-radius: 100%"/>
            <div class="input-group flex-nowrap" style="width: 50%; margin-top: 10px">
                <span style="font-size: 12px;" class="input-group-text" id="addon-wrapping">Avatar</span>
                <input name="avatar" style="font-size: 12px;" type="text" class="form-control" placeholder="Url image" aria-label="Username" aria-describedby="addon-wrapping">
            </div>
        </form>
    </div>

    <h1 class="display-6">#Order history</h1>
    <p class="h5" style="text-align: center">Recently Orders</p>
    <div>
        <form id="statusOrderForm" action="home" style="display: flex; justify-content: end">
            <input type="hidden" name="action" value="user-info"/>
            <select onchange="document.getElementById('statusOrderForm').submit()" name="statusID" class="form-select form-select-sm" aria-label=".form-select-sm example" style="width: 200px">
                <option ${checkedStatus == '0' ? 'selected':''}>All status</option>
                <option ${checkedStatus == '1' ? 'selected':''} value="1">Pending</option>
                <option ${checkedStatus == '2' ? 'selected':''} value="2">Processing</option>
                <option ${checkedStatus == '3' ? 'selected':''} value="3">Shipping</option>
                <option ${checkedStatus == '4' ? 'selected':''} value="4">Delivered</option>
                <option ${checkedStatus == '5' ? 'selected':''} value="5">Canceled</option>
            </select>
        </form>
        
        <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">#Order</th>
            <th scope="col">Detail</th>
            <th scope="col">Order date</th>
            <th scope="col">Status</th>
          </tr>
        </thead>
        <tbody>
            <c:set var="i" value="1"/>
            <c:forEach var="order" items="${listOrder}">
                
                <tr>
                    <th scope="row">${i}</th>
                    <td>
                        <button style="font-size: 13px" type="button" class="btn btn-lg btn-danger" data-bs-toggle="popover" title="Popover title" data-bs-content="Go to tracking order to view detail">${order.listDetails.size()} items</button>
                    </td>
                    <td>${order.orderDate}</td>
                    <td>
                        <c:if test="${order.statusID == 1}">
                            <span class="badge rounded-pill bg-secondary">Pending</span>
                        </c:if>
                        <c:if test="${order.statusID == 2}">
                            <span class="badge rounded-pill bg-success">Processing</span>
                        </c:if>
                        <c:if test="${order.statusID == 3}">
                            <span class="badge rounded-pill bg-success">Shipping</span>
                        </c:if>
                        <c:if test="${order.statusID == 4}">
                            <span class="badge rounded-pill bg-info">Delivered</span>
                        </c:if>
                        <c:if test="${order.statusID == 5}">
                            <span class="badge rounded-pill bg-danger">Canceled</span>
                        </c:if>
                        
                    </td>
                </tr>
                <c:set var="i" value="${i + 1}"/>
            </c:forEach>
          
        </tbody>
      </table>
    </div>
</div>
<div class="modal fade" id="addNewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Change your breakfast</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form onsubmit="return confirm('Do you want to add new address?');" id="addNewForm" action="update-status-address">
                <input name="action" type="hidden" value="add-new"/>
                <input name="accID" type="hidden" value="${user.accID}"/>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Address detail</span>
                    <input name="detail" type="text" class="form-control" placeholder="Enter address detail" aria-label="addressDetail" aria-describedby="basic-addon1">
                </div>
            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" onclick="document.getElementById('addNewForm').submit()" class="btn btn-primary">Add</button>
        </div>
      </div>
    </div>
  </div>