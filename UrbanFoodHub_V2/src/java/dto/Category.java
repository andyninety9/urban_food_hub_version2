/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dto;

/**
 *
 * @author duyma
 */
public class Category {
    private String cateID;
    private String cateName;
    private String cateImg;
    private int cateStatus;

    public Category() {
    }

    public Category(String cateID, String cateName, String cateImg, int cateStatus) {
	this.cateID = cateID;
	this.cateName = cateName;
	this.cateImg = cateImg;
	this.cateStatus = cateStatus;
    }

    public String getCateID() {
	return cateID;
    }

    public void setCateID(String cateID) {
	this.cateID = cateID;
    }

    public String getCateName() {
	return cateName;
    }

    public void setCateName(String cateName) {
	this.cateName = cateName;
    }

    public String getCateImg() {
	return cateImg;
    }

    public void setCateImg(String cateImg) {
	this.cateImg = cateImg;
    }

    public int getCateStatus() {
	return cateStatus;
    }

    public void setCateStatus(int cateStatus) {
	this.cateStatus = cateStatus;
    }

}
