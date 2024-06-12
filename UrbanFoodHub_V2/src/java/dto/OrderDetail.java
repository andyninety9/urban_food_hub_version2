/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dto;

/**
 *
 * @author duyma
 */
public class OrderDetail {
    private String oDetailID;
    private String orderID;
//    private String productID;
    private Product product;
    private int quantity;
    private double unitPrice;
    private int typeID;

//[oDetailID] [varchar](255) NOT NULL,
//	[orderID] [varchar](255) NULL,
//	[productID] [varchar](255) NULL,
//	[quantity] [int] NULL,
//	[unitPrice] [decimal](10, 2) NULL,
//	[typeID] [int] NULL,

    public OrderDetail() {

    }

    public OrderDetail(String oDetailID, String orderID, Product product, int quantity, double unitPrice, int typeID) {
	this.oDetailID = oDetailID;
	this.orderID = orderID;
	this.product = product;
	this.quantity = quantity;
	this.unitPrice = unitPrice;
	this.typeID = typeID;
    }

    public String getoDetailID() {
	return oDetailID;
    }

    public void setoDetailID(String oDetailID) {
	this.oDetailID = oDetailID;
    }

    public String getOrderID() {
	return orderID;
    }

    public void setOrderID(String orderID) {
	this.orderID = orderID;
    }

    public Product getProduct() {
	return product;
    }

    public void setProduct(Product product) {
	this.product = product;
    }

    public int getQuantity() {
	return quantity;
    }

    public void setQuantity(int quantity) {
	this.quantity = quantity;
    }

    public double getUnitPrice() {
	return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
	this.unitPrice = unitPrice;
    }

    public int getTypeID() {
	return typeID;
    }

    public void setTypeID(int typeID) {
	this.typeID = typeID;
    }

    @Override
    public String toString() {
	return "OrderDetail{" + "oDetailID=" + oDetailID + ", orderID=" + orderID + ", product=" + product
		+ ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", typeID=" + typeID + '}';
    }

}
