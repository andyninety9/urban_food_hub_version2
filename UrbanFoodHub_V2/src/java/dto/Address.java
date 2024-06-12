/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dto;

/**
 *
 * @author duyma
 */
public class Address {
    private String addressID;
    private String detail;
    private String accID;
    private int statusID;

    public Address() {
    }

    public Address(String addressID, String detail, String accID, int statusID) {
	this.addressID = addressID;
	this.detail = detail;
	this.accID = accID;
	this.statusID = statusID;
    }

    public String getAddressID() {
	return addressID;
    }

    public void setAddressID(String addressID) {
	this.addressID = addressID;
    }

    public String getDetail() {
	return detail;
    }

    public void setDetail(String detail) {
	this.detail = detail;
    }

    public String getAccID() {
	return accID;
    }

    public void setAccID(String accID) {
	this.accID = accID;
    }

    public int getStatusID() {
	return statusID;
    }

    public void setStatusID(int statusID) {
	this.statusID = statusID;
    }

    @Override
    public String toString() {
	return "Address{" + "addressID=" + addressID + ", detail=" + detail + ", accID=" + accID + ", statusID="
		+ statusID + '}';
    }

}
