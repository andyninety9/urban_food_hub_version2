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
public class Account {
    private String accID;
    private String firstname;
    private String lastname;
    private Date birthday;
    private String email;
    private String phone;
    private byte[] avatar;
    private int statusID;
    private Date createdDate;

    public Account() {
    }

    public Account(String accID, String firstname, String lastname, Date birthday, String email, String phone,
	    byte[] avatar, int statusID, Date createdDate) {
	this.accID = accID;
	this.firstname = firstname;
	this.lastname = lastname;
	this.birthday = birthday;
	this.email = email;
	this.phone = phone;
	this.avatar = avatar;
	this.statusID = statusID;
	this.createdDate = createdDate;
    }

    public String getAccID() {
	return accID;
    }

    public void setAccID(String accID) {
	this.accID = accID;
    }

    public String getFirstname() {
	return firstname;
    }

    public void setFirstname(String firstname) {
	this.firstname = firstname;
    }

    public String getLastname() {
	return lastname;
    }

    public void setLastname(String lastname) {
	this.lastname = lastname;
    }

    public Date getBirthday() {
	return birthday;
    }

    public void setBirthday(Date birthday) {
	this.birthday = birthday;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getPhone() {
	return phone;
    }

    public void setPhone(String phone) {
	this.phone = phone;
    }

    public byte[] getAvatar() {
	return avatar;
    }

    public void setAvatar(byte[] avatar) {
	this.avatar = avatar;
    }

    public int getStatusID() {
	return statusID;
    }

    public void setStatusID(int statusID) {
	this.statusID = statusID;
    }

    public Date getCreatedDate() {
	return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
    }

    @Override
    public String toString() {
	return "Account{" + "accID=" + accID + ", firstname=" + firstname + ", lastname=" + lastname + ", birthday="
		+ birthday + ", email=" + email + ", phone=" + phone + ", avatar=" + avatar + ", statusID=" + statusID
		+ ", createdDate=" + createdDate + '}';
    }

}
