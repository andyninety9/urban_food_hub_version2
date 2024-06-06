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
public class PlanDetail {
    private String detailID;
    private String mealPlanID;
    private Meal meal;
    private String mealTime;
    private Date mealDate;

    public PlanDetail() {
    }

    public PlanDetail(String detailID, String mealPlanID, Meal meal, String mealTime, Date mealDate) {
	this.detailID = detailID;
	this.mealPlanID = mealPlanID;
	this.meal = meal;
	this.mealTime = mealTime;
	this.mealDate = mealDate;
    }

    public String getDetailID() {
	return detailID;
    }

    public void setDetailID(String detailID) {
	this.detailID = detailID;
    }

    public String getMealPlanID() {
	return mealPlanID;
    }

    public void setMealPlanID(String mealPlanID) {
	this.mealPlanID = mealPlanID;
    }

    public Meal getMeal() {
	return meal;
    }

    public void setMeal(Meal meal) {
	this.meal = meal;
    }

    public String getMealTime() {
	return mealTime;
    }

    public void setMealTime(String mealTime) {
	this.mealTime = mealTime;
    }

    public Date getMealDate() {
	return mealDate;
    }

    public void setMealDate(Date mealDate) {
	this.mealDate = mealDate;
    }

    @Override
    public String toString() {
	return "PlanDetail{" + "detailID=" + detailID + ", mealPlanID=" + mealPlanID + ", meal=" + meal + ", mealTime="
		+ mealTime + ", mealDate=" + mealDate + '}';
    }

}
