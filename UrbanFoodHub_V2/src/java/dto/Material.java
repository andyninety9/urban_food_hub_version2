/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dto;

import java.sql.Date;

/**
 *
 * @author duyma
 */
public class Material extends Product {
    private String packagingSpec;
    private double stock;
    private Date createdDate;

    public Material() {
    }

    public Material(String mateSku, String cateName, String mateName, String mateDesc, double price,
	    String PackagingSpec, double stock, Date createdDate, String mateImg, int mateStatus) {
	super(mateSku, mateName, cateName, mateDesc, mateImg, price, mateStatus);
	this.packagingSpec = PackagingSpec;
	this.stock = stock;
//	this.mateStatus = mateStatus;
	this.createdDate = createdDate;
    }

    public String getMateSku() {
	return id;
    }

    public void setMateSku(String mateSku) {
	id = mateSku;
    }

    public String getCateName() {
	return category;
    }

    public void setCateName(String cateName) {
	category = cateName;
    }

    public String getMateName() {
	return name;
    }

    public void setMateName(String mateName) {
	name = mateName;
    }

    public String getMateDesc() {
	return desc;
    }

    public void setMateDesc(String mateDesc) {
	desc = mateDesc;
    }

    public double getPrice() {
	return price;
    }

    public void setPrice(double price) {
	this.price = price;
    }

    public String getPackagingSpec() {
	return packagingSpec;
    }

    public void setPackagingSpec(String PackagingSpec) {
	this.packagingSpec = PackagingSpec;
    }

    public double getStock() {
	return stock;
    }

    public void setStock(double stock) {
	this.stock = stock;
    }

    public Date getCreatedDate() {
	return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
    }

    public String getMateImg() {
	return image;
    }

    public void setMateImg(String mateImg) {
	image = mateImg;
    }

    public int getMateStatus() {
	return status;
    }

    public void setMateStatus(int mateStatus) {
	status = mateStatus;
    }

    @Override
    public String toString() {
	return "Material{" + "packagingSpec=" + packagingSpec + ", stock=" + stock + ", createdDate=" + createdDate
		+ '}';
    }

}
