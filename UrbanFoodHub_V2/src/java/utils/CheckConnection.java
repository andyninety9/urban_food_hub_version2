/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author duyma
 */
public class CheckConnection {
    public static void main(String[] args) {
	String dbURL = "jdbc:sqlserver://db-urbanfoodhub.c7ye8i8gyk9p.ap-southeast-1.rds.amazonaws.com:1433";
	String username = "admin";
	String password = "admin12345678";

	Connection conn = null;

	try {
	    // Kết nối đến server
	    conn = DriverManager.getConnection(dbURL, username, password);
	    if (conn != null) {
		System.out.println("Connected to the server!");
	    }
	} catch (SQLException e) {
	    System.out.println("Failed to connect to the server!");
	    e.printStackTrace();
	} finally {
	    try {
		if (conn != null) {
		    conn.close();
		    System.out.println("Disconnected from server.");
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
    }

}
