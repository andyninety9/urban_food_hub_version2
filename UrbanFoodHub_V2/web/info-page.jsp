<%-- 
    Document   : info-page
    Created on : May 28, 2024, 9:20:24 AM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${sessionScope.user}"/>
<div class="container">
    <h1 class="display-6">#Account Information</h1>
    <div class="row" style=" border: 1px solid black; padding: 20px; border-radius: 10px; margin-bottom: 20px">
        <div class="col-md-6">
        <div style="display: flex; gap: 10px;">
            <p style="font-weight: bold" class="h6">Fullname: </p>
        <p class="h6">${user.lastname} ${user.firstname}</p>
        </div>
        <div style="display: flex; gap: 10px">
            <p style="font-weight: bold" class="h6">Birthday: </p>
            <p class="h6">${user.birthday}</p>
        </div>
        <div style="display: flex; gap: 10px">
            <p style="font-weight: bold" class="h6">Phone: </p>
            <p class="h6">${user.phone}</p>
        </div>
        <div style="display: flex; flex-direction: column; gap: 10px">
            <p style="font-weight: bold" class="h6">Shipping address: </p>
            <div>
                <table class="table table-hover" style="height: 200px; overflow-y: scroll">
                <thead>
                <tr>
                  <th scope="col">#No</th>
                  <th scope="col">Address</th>
                  <th scope="col">Status</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Khu công nghệ cao, trường đại học FPTU <i class="fa-solid fa-pen"></i></td>
                  <td>
                      <span class="badge rounded-pill bg-warning text-dark">Default</span>
                  </td>
                </tr>
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

    <h1 class="display-6">#Tracking Order</h1>
    <p class="h5" style="text-align: center">Recently Orders</p>
    <div>
        <div style="display: flex; justify-content: end">
            <select class="form-select form-select-sm" aria-label=".form-select-sm example" style="width: 200px">
                <option selected>Sort by status</option>
                <option value="1">Pending</option>
                <option value="2">Shipping</option>
                <option value="3">Success</option>
            </select>
        </div>
        
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
          <tr>
            <th scope="row">1</th>
            <td>Bữa ăn sáng</td>
            <td>28-05-2024</td>
            <td>
                <span class="badge rounded-pill bg-success">Success</span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
</div>
