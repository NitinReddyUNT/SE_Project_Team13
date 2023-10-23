/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;


import java.sql.*; // Imports the classes required to establish a database connection and runs SQL queries.

/**
 * Methods for running SQL queries and making database updates are included in this class.
 * @author Anjan
 */
public class Queries {
    // Creates an object called ResultSet to hold the output of a SQL query.
    public static ResultSet rs;
    // Creates an int variable to hold the total number of rows that a SQL update has an impact on.
    public static int i;
    /**
     * This function runs a SQL query and returns the ResultSet object, which holds the query's results.
     * @param query The SQL command to run.
     * @return the ResultSet object, which holds the query's results.
     */
    public static ResultSet getExecuteQuery(String query){
        try{
            // Create a database connection.
        Connection con=Dbconnection.getConnection();
       // To run SQL statements, creates a Statement object.
     Statement st=con.createStatement();
     // Run the SQL query and save the outcome in the object called ResultSet.
     rs=st.executeQuery(query);
        }catch(Exception e){
            // Output the exception's stack trace.
            System.out.println(e);  
        }
        // Return value to the ResultSet object.
        return rs;
    }
    /**
     * The number of rows impacted by the update is returned by this method, which also performs a SQL update.
     * @param query To be executed is the SQL update.
     * @return how many rows are impacted by the change will be returned.
     */
    public static int getExecuteUpdate(String query){
        try{
         // Create a database connection.
        Connection con=Dbconnection.getConnection();
      // To run SQL statements, creates a Statement object. 
     Statement st=con.createStatement();
     // Do the SQL update and assigns the int variable to the number of rows that are impacted.
     i=st.executeUpdate(query);
        }catch(Exception e){
            // Output the exception's stack trace.
            System.out.println(e);  
        }
        // Return number of rows affected by the update.
        return i;
    }
}
