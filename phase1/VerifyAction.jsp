<!--author-anjan-->

<%@page import="java.sql.Statement"%><!--SQL statements are run using this class-->
<%@page import="java.sql.Connection"%><!-- The connection to a database is represented by this class-->
<%@page import="com.action.Dbconnection"%><!-- There are methods in this custom class for establishing a database connection-->
<%@page import="java.sql.ResultSet"%><!--A table of data representing a database result set is represented by this class-->
<%@page import="com.action.Queries"%><!-- Methods for running SQL queries on a database are included in this custom class-->
<%@page contentType="text/html" pageEncoding="UTF-8"%> <!--This Import statement sets the character encoding to UTF-8 and the content type to text/html-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> <!-- This Statement indicates the code as being composed in the XHTML 1.0 Transitional namespace to the browser-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> <!-- this statment specifies the encoding and type of the document for web browsers-->
<title>Secure Data Sharing Using Blockchain Technology</title> <!-- we are listing project title using title tag.-->
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /> <!--here in this we are referring templatemo_style.css class-->
<!-- The browser is informed that the code is CSS code by the type="text/css" property -->
<style type="text/css">
<!--
.style1 {
	color: #00CC00;
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>
<!--start of body tag which contains visible content of webpage--> 
<body>
<div id="templatemo_header_wrapper">
<!--  Free Web Templates by TemplateMo.com  -->
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                  <li><a href="UserHome.jsp">Home</a></li>
                  <li><a href="SearchFile.jsp" class="current">Search File</a></li>
		  <li><a href="UserLogin.jsp">LogOut</a></li>
              
                  
                   

            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper"><!-- start of templatemo banner wrapper-->
	<div id="templatemo_banner">
	  <div id="templatemo_banner_content">
        	<div class="header_01">Secure Data Sharing Using Blockchain Technology</div>
      </div>	
    
    	<div class="cleaner"></div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_content_wrapper">
<br />

       
                    <center>
<%@page import="com.action.Queries"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.*"%>
   
          <%
         // Retrieve the session's ID, email, mskey, and username.
         String username=(String)session.getAttribute("username");
         String mskey=(String)session.getAttribute("mskey");
         String email=(String)session.getAttribute("email");
         String id=(String)session.getAttribute("id");
          // Obtains the filename and ID by looking through the request parameters.
          String fid=request.getParameter("fid");
          String fname=request.getParameter("fname");
          // Access the session attribute to obtain the data to be downloaded.
          String rid=request.getParameter("id");
          // Gets the pkey from the request parameters.
          String pkey=request.getParameter("pkey");
         
          %>
           <center>
                       
          
          
          <%
              try{
        // Attempts to establish a database connection.
	Connection con=Dbconnection.getConnection();
        // To run SQL statements, creates an Statement object.
    	Statement st=con.createStatement();
        // Runs a SQL query in order to retrieve all of the file's data (ID included).
 ResultSet i=st.executeQuery("select * from file where id='"+fid+"'");
 // The file exists if the query returns a row.
 if(i.next()){
          //From the result set, extracts the file data.
          String file_data=i.getString("filedata");
       
        // Assign file data to the current session.
        session.setAttribute("data",file_data);
   
            %>
            <!--Present the file's contents as a table.-->
            <h3>File Data</h3>
  <table border="1" width="400">
                        <tr>
                            <th>File Id</th><td><input type="text" name="id" value="<%=fid%>" required=""></td>
                        </tr>
                        <tr>
                            <th>File Name</th><td><input type="text" name="fname" value="<%=fname%>" required=""></td>
                        </tr>
                         <tr>
                             <th>File Data</th><td><textarea cols="40" rows="10"><%=file_data%></textarea></td>
                        </tr>
                        <tr>
                             <th></th><td><a href="Download.jsp?fid=<%=fid%>&fname=<%=fname%>">Download</a></td>
                        </tr>
  </table>
 <%}else{
//excuted when if there is no file.
Queries.getExecuteUpdate("insert into attacker values(null,'"+username+"','"+fname+"',now())");
%>
 <script type="text/javascript">
     // Show the user an alert message.
     window.alert("Verification Failed...!!");
     window.location="ViewResponse.jsp";
     </script>
            
 <%
     }
    }catch(Exception e)
              {
                //prints the exception
                  out.println(e);
              }%>
              </div> <!-- end of content wrapper -->



</html>

              