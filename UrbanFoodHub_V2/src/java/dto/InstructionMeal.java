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
public class InstructionMeal {
    private String instID;
    private String mealID;
    private String instrName;
    private String instrDesc;
    private Date createdDate;

    public InstructionMeal() {
    }

    public InstructionMeal(String instID, String mealID, String instrName, String instrDesc, Date createdDate) {
	this.instID = instID;
	this.mealID = mealID;
	this.instrName = instrName;
	this.instrDesc = instrDesc;
	this.createdDate = createdDate;
    }

    public String getInstID() {
	return instID;
    }

    public void setInstID(String instID) {
	this.instID = instID;
    }

    public String getMealID() {
	return mealID;
    }

    public void setMealID(String mealID) {
	this.mealID = mealID;
    }

    public String getInstrName() {
	return instrName;
    }

    public void setInstrName(String instrName) {
	this.instrName = instrName;
    }

    public String getInstrDesc() {
	return instrDesc;
    }

    public void setInstrDesc(String instrDesc) {
	this.instrDesc = instrDesc;
    }

    public Date getCreatedDate() {
	return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
    }

    @Override
    public String toString() {
	return "InstructionMeal{" + "instID=" + instID + ", mealID=" + mealID + ", instrName=" + instrName
		+ ", instrDesc=" + instrDesc + ", createdDate=" + createdDate + '}';
    }

}
