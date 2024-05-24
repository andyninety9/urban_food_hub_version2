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
public class Material {
    private String mateSku;
    private String cateName;
    private String mateName;
    private String mateDesc;
    private double price;
    private String packagingSpec;
    private double stock;
    private Date createdDate;
    private byte[] mateImg;
    private int mateStatus;

    public Material() {
    }
//    "SELECT [MateSKU]\n" + "      ,[CateID]\n" + "      ,[MateName]\n" + "      ,[MateDesc]\n"
//		+ "      ,[Price]\n" + "      ,[PackagingSpec]\n" + "      ,[Stock]\n" + "      ,[CreatedDate]\n"
//		+ "      ,[MateImg]\n" + "      ,[MateStatus]\n" + "  FROM [dbo].[Material]";

    public Material(String mateSku, String cateName, String mateName, String mateDesc, double price,
	    String PackagingSpec, double stock, Date createdDate, byte[] mateImg, int mateStatus) {
	this.mateSku = mateSku;
	this.cateName = cateName;
	this.mateName = mateName;
	this.mateDesc = mateDesc;
	this.price = price;
	this.packagingSpec = PackagingSpec;
	this.stock = stock;
	this.createdDate = createdDate;
	this.mateImg = mateImg;
	this.mateStatus = mateStatus;
    }

    public String getMateSku() {
	return mateSku;
    }

    public void setMateSku(String mateSku) {
	this.mateSku = mateSku;
    }

    public String getCateName() {
	return cateName;
    }

    public void setCateName(String cateName) {
	this.cateName = cateName;
    }

    public String getMateName() {
	return mateName;
    }

    public void setMateName(String mateName) {
	this.mateName = mateName;
    }

    public String getMateDesc() {
	return mateDesc;
    }

    public void setMateDesc(String mateDesc) {
	this.mateDesc = mateDesc;
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

    public byte[] getMateImg() {
	return mateImg;
    }

    public void setMateImg(byte[] mateImg) {
	this.mateImg = mateImg;
    }

    public int getMateStatus() {
	return mateStatus;
    }

    public void setMateStatus(int mateStatus) {
	this.mateStatus = mateStatus;
    }

    @Override
    public String toString() {
	return "Material{" + "mateSku=" + mateSku + ", cateID=" + cateName + ", mateName=" + mateName + ", mateDesc="
		+ mateDesc + ", price=" + price + ", PackagingSpec=" + packagingSpec + ", stock=" + stock
		+ ", createdDate=" + createdDate + ", mateImg=" + mateImg + ", mateStatus=" + mateStatus + '}';
    }

}
