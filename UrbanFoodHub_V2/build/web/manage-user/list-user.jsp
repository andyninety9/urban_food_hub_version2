<%-- 
    Document   : list-user
    Created on : Jun 12, 2024, 4:12:23 PM
    Author     : duyma
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="listAccounts" value="${requestScope.listAccounts}"/>
<c:set var="listReportUsers" value="${requestScope.listReportUsers}"/>
<c:set var="listUsers" value="${requestScope.listUsers}"/>
<c:set var="sizeListUser" value="${requestScope.sizeListUser}"/>
<c:set var="checkedPage" value="${requestScope.checkedPage}"/>
<%
    // Lấy ngày hiện tại
    Calendar cal = Calendar.getInstance();
    Date today = cal.getTime();

    // Lùi ngày lại 
    cal.add(Calendar.DAY_OF_YEAR, -3);
    java.util.Date lastWeek = cal.getTime();

    // Đưa các ngày này vào request scope để sử dụng trong JSTL
    request.setAttribute("today", today);
    request.setAttribute("lastWeek", lastWeek);
%>

<div>
    <h5>All users</h5>
    <div style="display: flex; justify-content: space-between">
        <form action="admin-router" class="input-group mb-3" style="width: 30%">
            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Search</button>
            <input type="hidden" name="action" value="manage-user"/>
            <select name="optionSearch" class="dropdown-menu">
                <option value="0"><a class="dropdown-item" href="#">All</a></option>
                <option value="1"><a class="dropdown-item" href="#">Account id</a></option>
                <option value="2"><a class="dropdown-item" href="#">Account name</a></option>
                <option value="3"><a class="dropdown-item" href="#">Username</a></option>
                <option value="4"><a class="dropdown-item" href="#">Phone</a></option>
                <option value="5"><a class="dropdown-item" href="#">Email</a></option>
            </select>
            <input name="keyword" type="text" class="form-control" aria-label="Text input with dropdown button" placeholder="Search urer by ID, name...">
        </form>
        <div>
            <a href="admin-router?action=create-account" type="button" class="btn btn-success">Create new user</a>
        </div>
    </div>
    <p style="font-size: 13px; font-style: italic; color: red">${requestScope.error}</p>
    <table class="table table-hover table-striped" style="text-align: center; cursor: pointer">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Username</th>
            <th scope="col">Tel</th>
            <th scope="col">Email</th>
            <th scope="col">Birthday</th>
            <th scope="col">Total orders</th>
            <th scope="col">Created Date</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody style="font-size: 14px">
            <c:forEach var="user" items="${listAccounts}">
                <tr>
                    <th>
                        ${user.accID}
                    </th>
                    <td>${user.lastname} ${user.firstname}</td>
                    <td>
                        <c:forEach var="entry1" items="${listUsers}">
                            <c:if test="${entry1.accID == user.accID}">
                                <div style="display: flex; justify-content: center; align-items: center; gap: 5px">
                                    <c:if test="${entry1.roleID == 1}" >
                                        <span style="font-size: 8px" class="badge rounded-pill bg-danger me-2">Admin</span>
                                    </c:if>
                                    <p style="display: inline; margin: 0">${entry1.username}</p>
                                </div>
                                
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${user.phone != null ? user.phone : 'unknown'}</td>
                    <td>${user.email != null ? user.email : 'unknown'}</td>
                    <td>${(user.birthday != null) ? user.birthday : 'unknown'}</td>
                    <td style="font-weight: bold; color: #1DC071;">
                        <c:set var="totalOrder" value="0"/>
                        <c:forEach var="entry" items="${listReportUsers}">
                            <c:if test="${entry.accountId == user.accID}">
                                <c:set var="totalOrder" value="${totalOrder + entry.totalValue}"/>
                            </c:if>
                        </c:forEach>
                        <fmt:formatNumber value="${totalOrder}" pattern="#,###" />đ
                    </td>
                    <td>
                        <c:if test="${user.createdDate != null && user.createdDate.time >= lastWeek.time}">
                            <div style="display: flex; gap: 5px; align-items: center; justify-content: center">
                                <p style="margin: 0">${user.createdDate}</p> 
                                <span class="badge rounded-pill bg-info text-dark" style="font-size: 8px">New user</span>
                            </div>
                            
                        </c:if>
                        <c:if test="${user.createdDate != null && user.createdDate.time < lastWeek.time}">
                            ${user.createdDate}
                        </c:if>
                    </td>
                    <td>
                        <div style="display: flex; gap: 10px; justify-content: center">
                            <c:forEach var="entry1" items="${listUsers}">
                                <c:if test="${entry1.accID == user.accID}">
                                    <div style="display: flex; justify-content: center; align-items: center; gap: 5px">
                                        <c:if test="${entry1.roleID == 2}" >
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
                                        </c:if>
                                    </div>

                                </c:if>
                            </c:forEach>
                            
                            <a style="padding: 5px 10px; font-size: 13px; background-color: blue; color: white; border-radius: 10px; margin-left: auto" href="manage-user?action=reset-password&accID=${user.accID}">Reset password</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div style="display: flex; justify-content: end">
        <ul id="pagination" class="pagination justify-content-center pagination-sm" style="padding: 0; margin: 0">
                <li class="page-item ${checkedPage == 1 ? 'disabled' : ''}">
                  <a style="color: #808191" class="page-link" href="admin-router?action=manage-user&page=${checkedPage - 1}" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <c:forEach begin="${1}" end="${((sizeListUser % 10) == 0) ? (sizeListUser / 10) : ((sizeListUser / 10) + 1) }" var="i">

                    <li  class="page-item ${i == checkedPage ? 'active' : ''}"><a 

                            class="page-link" href="admin-router?action=manage-user&page=${i}">${i}</a></li>
                </c:forEach>
                <li class="page-item ${checkedPage == (((sizeListUser % 10) == 0) ? (sizeListUser / 10) : ((sizeListUser / 10) + 1)) ? 'disabled' : ''}">
                  <a style="color: #808191" class="page-link" href="admin-router?action=manage-user&page=${checkedPage + 1}">Next</a>
                </li>
        </ul>                  
    </div>
</div>
