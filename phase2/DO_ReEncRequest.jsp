<%@page import="com.action.Dbconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@page import="java.util.Random"%>

<%
    // Get the 'id' parameter from the request
    String id=request.getParameter("id");

    try
    {
        // Establish a database connection using Dbconnection class
        Connection con=Dbconnection.getConnection();
        
        // Create a statement for executing SQL queries
        Statement st=con.createStatement();
        
        // Execute an SQL update query to set the status to 'proxy' for the specified 'id'
        int i=st.executeUpdate("update request set status='proxy' where id='"+id+"'");
        
        // Check if the update was successful
        if(i>0)
        {
         %>
         <!-- JavaScript alert for success and redirect to DO_ViewRequest.jsp -->
         <script type="text/javascript">
             window.alert("Re-Encryption Request Sent to Proxy Server");
             window.location="DO_ViewRequest.jsp";
         </script>
         <%
        } else {
         %>
         <!-- JavaScript alert for failure and redirect to DO_ViewRequest.jsp -->
         <script type="text/javascript">
             window.alert("Re-Encryption Request Sending Failed");
             window.location="DO_ViewRequest.jsp";
         </script>
         <%
        }
    } catch (Exception ex) {
        // Print the stack trace in case of an exception
        ex.printStackTrace();
    }
%>
