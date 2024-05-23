/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author duyma
 */
public class MyLibs {
    public static Connection makeConnection() throws Exception {
	Connection cn = null;
	String IP = "localhost";
	String instanceName = "DUYMA\\SQLEXPRESS_DUYMA";
	String port = "1433";
	String uid = "sa";
	String pwd = "12345";
	String db = "URBAN_FOOD_HUB_V2";
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port + ";databasename=" + db + ";user="
		+ uid + ";password=" + pwd;
	Class.forName(driver);
	cn = DriverManager.getConnection(url);
	return cn;
    }

    public static String generateID(String prefix) {
	String tmp = Integer.toString(Math.abs((int) System.currentTimeMillis() % (int) (1000000 * Math.random())));
	String result = "" + prefix;
	for (int i = 0; i < 6 - tmp.length(); i++) {
	    result += '0';
	}
	result += tmp;
	return result;
    }

    public static boolean validateEmail(String email) {
	String regex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
	if (!email.matches(regex)) {
	    System.out.println(">>Ensure following email format");
	    return false;
	}
	return true;
    }

    public static boolean validatePhone(String phone) {
	String regex = "^[0-9]+$";
	if (phone.length() < 10 || !phone.matches(regex)) {
	    System.out.println(">>Ensure that the phone number is at least 10 number and contain only number");
	    return false;
	}
	return true;
    }

}
