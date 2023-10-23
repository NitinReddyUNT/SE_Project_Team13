/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action;

import java.sql.Connection; //this class is used for establishing database connection
import java.sql.DriverManager; //this class is used to manage database drivers and connections.

/**
 *
 * @author Anjan
 */
public class Dbconnection {
   /**
    * This function provides a connection to the database.
    * @return 
    */
    public static Connection getConnection() {
        Connection con = null;
        try {
            // Loads the MySQL JDBC driver.
            Class.forName("com.mysql.jdbc.Driver");
            // Establish a database connection.
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proxy", "root", "root");
        } catch (Exception ex) {
            // Display the exception's stack trace.
            ex.printStackTrace();
        }
        return con;
    }
}

