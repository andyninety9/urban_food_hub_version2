/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author duyma
 */
public class ReportUser {
    private String orderId;
    private Date orderDate;
    private String orderStatus;
    private Double totalValue;
    private String accountId;
    private String fullName;
    private String email;
    private String phone;
    private List<Product> orderItems;

    public ReportUser() {
	orderItems = new ArrayList<>();
    }

    public ReportUser(String orderId, Date orderDate, String orderStatus, Double totalValue, String accountId,
	    String fullName, String email, String phone, List<Product> orderItems) {
	this.orderId = orderId;
	this.orderDate = orderDate;
	this.orderStatus = orderStatus;
	this.totalValue = totalValue;
	this.accountId = accountId;
	this.fullName = fullName;
	this.email = email;
	this.phone = phone;
	this.orderItems = orderItems;
    }

    public String getOrderId() {
	return orderId;
    }

    public void setOrderId(String orderId) {
	this.orderId = orderId;
    }

    public Date getOrderDate() {
	return orderDate;
    }

    public void setOrderDate(Date orderDate) {
	this.orderDate = orderDate;
    }

    public String getOrderStatus() {
	return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
	this.orderStatus = orderStatus;
    }

    public Double getTotalValue() {
	return totalValue;
    }

    public void setTotalValue(Double totalValue) {
	this.totalValue = totalValue;
    }

    public String getAccountId() {
	return accountId;
    }

    public void setAccountId(String accountId) {
	this.accountId = accountId;
    }

    public String getFullName() {
	return fullName;
    }

    public void setFullName(String fullName) {
	this.fullName = fullName;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getPhone() {
	return phone;
    }

    public void setPhone(String phone) {
	this.phone = phone;
    }

    public List<Product> getOrderItems() {
	return orderItems;
    }

    public void setOrderItems(List<Product> orderItems) {
	this.orderItems = orderItems;
    }

    public void addListOrderItem(Product p) {
	this.orderItems.add(p);
    }

    @Override
    public String toString() {
	return "ReportUser{" + "orderId=" + orderId + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus
		+ ", totalValue=" + totalValue + ", accountId=" + accountId + ", fullName=" + fullName + ", email="
		+ email + ", phone=" + phone + ", orderItems=" + orderItems + '}';
    }

}
