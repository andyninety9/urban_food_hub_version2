<%-- 
    Document   : list-user
    Created on : Jun 12, 2024, 4:12:23 PM
    Author     : duyma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="listAccounts" value="${requestScope.listAccounts}"/>
<c:set var="listReportUsers" value="${requestScope.listReportUsers}"/>


<div>
    <h5>All users</h5>
    <div style="display: flex; justify-content: space-between">
        <div class="input-group mb-3" style="width: 30%">
            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Search</button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
            <input type="text" class="form-control" aria-label="Text input with dropdown button" placeholder="Search urer by ID, Name">
        </div>
        <div>
            <button type="button" class="btn btn-success">Create new user</button>
        </div>
    </div>
    <p style="font-size: 13px; font-style: italic; color: red">${requestScope.error}</p>
    <table class="table table-hover table-striped">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Tel</th>
            <th scope="col">Total orders</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${listAccounts}">
                <tr>
                    <td>${user.accID}</td>
                    <td>${user.lastname} ${user.firstname}</td>
                    <td>${user.phone}</td>
                    <td>
                        <c:set var="totalOrder" value="0"/>
                        <c:forEach var="entry" items="${listReportUsers}">
                            <c:if test="${entry.accountId == user.accID}">
                                <c:set var="totalOrder" value="${totalOrder + entry.totalValue}"/>
                            </c:if>
                        </c:forEach>
                        <fmt:formatNumber value="${totalOrder}" pattern="#,###" />đ
                    </td>
                    <td>
                        <div style="display: flex; gap: 10px; justify-content: center">
                            <a href="manage-user?action=update-status&accID=${user.accID}">
                                <c:if test="${user.statusID == 1}">
                                    <span class="badge rounded-pill bg-success">Active</span>
                                </c:if>
                                <c:if test="${user.statusID == 2}">
                                    <span class="badge rounded-pill bg-warning">Frozen</span>
                                </c:if>
                                <c:if test="${user.statusID == 3}">
                                    <span class="badge rounded-pill bg-danger">Inactive</span>
                                </c:if>
                            
                            </a>
                            <a style="padding: 5px 10px; font-size: 13px; background-color: blue; color: white" href="manage-user?action=reset-password&accID=${user.accID}">Reset password</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
