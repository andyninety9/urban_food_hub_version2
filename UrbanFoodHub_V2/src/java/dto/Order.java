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
public class Order {
    private String orderID;
    private String accID;
    private Date orderDate;
    private int statusID;
    private String deliveryAddID;
    private List<OrderDetail> listDetails;
//	[orderID] [varchar](255) NOT NULL,
//	[accID] [varchar](255) NULL,
//	[orderDate] [date] NULL,
//	[statusID] [int] NULL,
//	[deliveryAddID] [varchar](255) NULL,

    public Order() {
	listDetails = new ArrayList<>();
    }

    public Order(String orderID, String accID, Date orderDate, int statusID, String deliveryAddID,
	    List<OrderDetail> listDetails) {
	this.orderID = orderID;
	this.accID = accID;
	this.orderDate = orderDate;
	this.statusID = statusID;
	this.deliveryAddID = deliveryAddID;
	this.listDetails = listDetails;
    }

    public String getOrderID() {
	return orderID;
    }

    public void setOrderID(String orderID) {
	this.orderID = orderID;
    }

    public String getAccID() {
	return accID;
    }

    public void setAccID(String accID) {
	this.accID = accID;
    }

    public Date getOrderDate() {
	return orderDate;
    }

    public void setOrderDate(Date orderDate) {
	this.orderDate = orderDate;
    }

    public int getStatusID() {
	return statusID;
    }

    public void setStatusID(int statusID) {
	this.statusID = statusID;
    }

    public String getDeliveryAddID() {
	return deliveryAddID;
    }

    public void setDeliveryAddID(String deliveryAddID) {
	this.deliveryAddID = deliveryAddID;
    }

    public List<OrderDetail> getListDetails() {
	return listDetails;
    }

    public void setListDetails(List<OrderDetail> listDetails) {
	this.listDetails = listDetails;
    }

    public void addDetail(OrderDetail od) {
	this.listDetails.add(od);
    }

    @Override
    public String toString() {
	return "Order{" + "orderID=" + orderID + ", accID=" + accID + ", orderDate=" + orderDate + ", statusID="
		+ statusID + ", deliveryAddID=" + deliveryAddID + '}';
    }
}
