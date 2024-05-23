/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dto;

/**
 *
 * @author duyma
 */
public class User {
    private String accID;
    private String username;
    private String password;
    private int roleID;

    public User() {

    }

    public User(String accID, String username, String password, int roleID) {
	this.accID = accID;
	this.username = username;
	this.password = password;
	this.roleID = roleID;
    }

    public int getRoleID() {
	return roleID;
    }

    public void setRoleID(int roleID) {
	this.roleID = roleID;
    }

    public String getAccID() {
	return accID;
    }

    public void setAccID(String accID) {
	this.accID = accID;
    }

    public String getUsername() {
	return username;
    }

    public void setUsername(String username) {
	this.username = username;
    }

    public String getPassword() {
	return password;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    @Override
    public String toString() {
	return "User{" + "accID=" + accID + ", username=" + username + ", password=" + password + '}';
    }

}
