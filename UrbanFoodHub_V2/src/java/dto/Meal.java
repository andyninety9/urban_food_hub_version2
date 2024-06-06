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
public class Meal extends Product {
    private String nutritionValue;
    private String shelfLife;
    private String preparationTime;
    private int stock;
    private Date createdDate;
    private List<MealDetail> listMaterials;

    public Meal() {
	listMaterials = new ArrayList<>();
    }

    public Meal(String mealID, String cateName, String mealName, String mealDesc, String nutritionValue,
	    String shelfLife, String preparationTime, double price, int stock, Date createdDate, String mealImg,
	    int statusID, List<MealDetail> listMaterials) {
	super(mealID, mealName, cateName, mealDesc, mealImg, price, statusID);
	this.nutritionValue = nutritionValue;
	this.shelfLife = shelfLife;
	this.preparationTime = preparationTime;
	this.stock = stock;
	this.createdDate = createdDate;
//	this.statusID = statusID;
	this.listMaterials = listMaterials;
    }

    public String getMealID() {
	return id;
    }

    public void setMealID(String mealID) {
	id = mealID;
    }

    public String getCateName() {
	return category;
    }

    public void setCateName(String cateName) {
	category = cateName;
    }

    public String getMealName() {
	return name;
    }

    public void setMealName(String mealName) {
	name = mealName;
    }

    public String getMealDesc() {
	return desc;
    }

    public void setMealDesc(String mealDesc) {
	desc = mealDesc;
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

    public String getMealImg() {
	return image;
    }

    public void setMealImg(String mealImg) {
	image = mealImg;
    }

    public int getStatusID() {
	return status;
    }

    public void setStatusID(int statusID) {
	status = statusID;
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
	return "Meal{" + "nutritionValue=" + nutritionValue + ", shelfLife=" + shelfLife + ", preparationTime="
		+ preparationTime + ", stock=" + stock + ", createdDate=" + createdDate + ", listMaterials="
		+ listMaterials + '}';
    }

}
