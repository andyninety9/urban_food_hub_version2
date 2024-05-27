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
public class Meal {
    private String mealID;
    private String cateName;
    private String mealName;
    private String mealDesc;
    private String nutritionValue;
    private String shelfLife;
    private String preparationTime;
    private double price;
    private int stock;
    private Date createdDate;
    private byte[] mealImg;
    private int statusID;
    private List<MealDetail> listMaterials;

    public Meal() {
	listMaterials = new ArrayList<>();
    }

    public Meal(String mealID, String cateName, String mealName, String mealDesc, String nutritionValue,
	    String shelfLife, String preparationTime, double price, int stock, Date createdDate, byte[] mealImg,
	    int statusID, List<MealDetail> listMaterials) {
	this.mealID = mealID;
	this.cateName = cateName;
	this.mealName = mealName;
	this.mealDesc = mealDesc;
	this.nutritionValue = nutritionValue;
	this.shelfLife = shelfLife;
	this.preparationTime = preparationTime;
	this.price = price;
	this.stock = stock;
	this.createdDate = createdDate;
	this.mealImg = mealImg;
	this.statusID = statusID;
	this.listMaterials = listMaterials;
    }

    public String getMealID() {
	return mealID;
    }

    public void setMealID(String mealID) {
	this.mealID = mealID;
    }

    public String getCateName() {
	return cateName;
    }

    public void setCateName(String cateName) {
	this.cateName = cateName;
    }

    public String getMealName() {
	return mealName;
    }

    public void setMealName(String mealName) {
	this.mealName = mealName;
    }

    public String getMealDesc() {
	return mealDesc;
    }

    public void setMealDesc(String mealDesc) {
	this.mealDesc = mealDesc;
    }

    public String getNutritionValue() {
	return nutritionValue;
    }

    public void setNutritionValue(String nutritionValue) {
	this.nutritionValue = nutritionValue;
    }

    public String getShelfLife() {
	return shelfLife;
    }

    public void setShelfLife(String shelfLife) {
	this.shelfLife = shelfLife;
    }

    public String getPreparationTime() {
	return preparationTime;
    }

    public void setPreparationTime(String preparationTime) {
	this.preparationTime = preparationTime;
    }

    public double getPrice() {
	return price;
    }

    public void setPrice(double price) {
	this.price = price;
    }

    public int getStock() {
	return stock;
    }

    public void setStock(int stock) {
	this.stock = stock;
    }

    public Date getCreatedDate() {
	return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
    }

    public byte[] getMealImg() {
	return mealImg;
    }

    public void setMealImg(byte[] mealImg) {
	this.mealImg = mealImg;
    }

    public int getStatusID() {
	return statusID;
    }

    public void setStatusID(int statusID) {
	this.statusID = statusID;
    }

    public void addMealDetail(MealDetail m) {
	this.listMaterials.add(m);
    }

    public List<MealDetail> getListMaterials() {
	return listMaterials;
    }

    public void setListMaterials(List<MealDetail> listMaterials) {
	this.listMaterials = listMaterials;
    }

    @Override
    public String toString() {
	return "Meal{" + "mealID=" + mealID + ", cateName=" + cateName + ", mealName=" + mealName + ", mealDesc="
		+ mealDesc + ", nutritionValue=" + nutritionValue + ", shelfLife=" + shelfLife + ", preparationTime="
		+ preparationTime + ", price=" + price + ", stock=" + stock + ", createdDate=" + createdDate
		+ ", mealImg=" + mealImg + ", statusID=" + statusID + '}';
    }

}
