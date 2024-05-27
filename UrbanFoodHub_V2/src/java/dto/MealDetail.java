/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dto;

/**
 *
 * @author duyma
 */
public class MealDetail {
    private String detailID;
    private String mealID;
    private String materialID;
    private double quantity;
    private String unitMaterial;

    public MealDetail() {
    }

    public MealDetail(String detailID, String mealID, String materialID, double quantity, String unitMaterial) {
	this.detailID = detailID;
	this.mealID = mealID;
	this.materialID = materialID;
	this.quantity = quantity;
	this.unitMaterial = unitMaterial;
    }

    public String getDetailID() {
	return detailID;
    }

    public void setDetailID(String detailID) {
	this.detailID = detailID;
    }

    public String getMealID() {
	return mealID;
    }

    public void setMealID(String mealID) {
	this.mealID = mealID;
    }

    public String getMaterialID() {
	return materialID;
    }

    public void setMaterialID(String materialID) {
	this.materialID = materialID;
    }

    public double getQuantity() {
	return quantity;
    }

    public void setQuantity(double quantity) {
	this.quantity = quantity;
    }

    public String getUnitMaterial() {
	return unitMaterial;
    }

    public void setUnitMaterial(String unitMaterial) {
	this.unitMaterial = unitMaterial;
    }

    @Override
    public String toString() {
	return "MealDetail{" + "detailID=" + detailID + ", mealID=" + mealID + ", materialID=" + materialID
		+ ", quantity=" + quantity + ", unitMaterial=" + unitMaterial + '}';
    }

}
