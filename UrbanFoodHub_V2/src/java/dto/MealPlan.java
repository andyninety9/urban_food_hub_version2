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
public class MealPlan extends Product {
    private Date startDate;
    private Date endDate;
    private List<PlanDetail> listPlanDetails;

    public MealPlan() {
	this.listPlanDetails = new ArrayList<>();
	this.startDate = new Date(System.currentTimeMillis());
	this.endDate = new Date(System.currentTimeMillis());
    }

    public MealPlan(String mealPlanID, String ownerID, String cateID, String planName, String planDesc, Date startDate,
	    Date endDate, String planImg, int statusID, List<PlanDetail> listPlanDetails, double price) {
	super(mealPlanID, planName, cateID, planDesc, planImg, price, statusID);
	this.startDate = startDate;
	this.endDate = endDate;
	this.listPlanDetails = listPlanDetails;
    }

    public String getMealPlanID() {
	return id;
    }

    public void setMealPlanID(String mealPlanID) {
	id = mealPlanID;
    }

//    public String getOwnerID() {
//	return ownerID;
//    }

//    public void setOwnerID(String ownerID) {
//	this.ownerID = ownerID;
//    }

    public String getCateID() {
	return category;
    }

    public void setCateID(String cateID) {
	category = cateID;
    }

    public String getPlanName() {
	return name;
    }

    public void setPlanName(String planName) {
	name = planName;
    }

    public String getPlanDesc() {
	return desc;
    }

    public void setPlanDesc(String planDesc) {
	desc = planDesc;
    }

    public Date getStartDate() {
	return startDate;
    }

    public void setStartDate(Date startDate) {
	this.startDate = startDate;
    }

    public Date getEndDate() {
	return endDate;
    }

    public void setEndDate(Date endDate) {
	this.endDate = endDate;
    }

    public String getPlanImg() {
	return image;
    }

    public void setPlanImg(String planImg) {
	image = planImg;
    }

    public int getStatusID() {
	return status;
    }

    public void setStatusID(int statusID) {
	status = statusID;
    }

    public List<PlanDetail> getListPlanDetails() {
	return listPlanDetails;
    }

    public void setListPlanDetails(List<PlanDetail> listPlanDetails) {
	this.listPlanDetails = listPlanDetails;
    }

    public void addDetail(PlanDetail e) {
	this.listPlanDetails.add(e);
    }

    @Override
    public String toString() {
	return "MealPlan{" + "name=" + name + "startDate=" + startDate + ", endDate=" + endDate + ", listPlanDetails="
		+ listPlanDetails + '}';
    }

}
