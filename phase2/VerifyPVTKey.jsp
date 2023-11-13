<!--author-anjan-->

<%@page import="com.action.decryption"%> <!--the statement call decryption class-->
<%@page import="java.sql.Statement"%><!--SQL statements are run using this class-->
<%@page import="java.sql.Connection"%><!-- The connection to a database is represented by this class-->
<%@page import="com.action.Dbconnection"%><!-- There are methods in this custom class for establishing a database connection-->
<%@page import="java.sql.ResultSet"%><!--A table of data representing a database result set is represented by this class-->
<%@page import="com.action.Queries"%><!-- Methods for running SQL queries on a database are included in this custom class-->
<%@page contentType="text/html" pageEncoding="UTF-8"%><!--This Import statement sets the character encoding to UTF-8 and the content type to text/html-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- This Statement indicates the code as being composed in the XHTML 1.0 Transitional namespace to the browser-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!-- this statment specifies the encoding and type of the document for web browsers-->
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
<body>
<div id="templatemo_header_wrapper">
<!--  Free Web Templates by TemplateMo.com  -->
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                  <li><a href="UserHome.jsp">Home</a></li>
                  <li><a href="SearchFile.jsp">Search File</a></li>
                  <li><a href="ViewResponse.jsp" class="current">View Response</a></li>
                  <li><a href="U_ViewDownload.jsp">Download</a></li>
		  <li><a href="UserLogin.jsp">LogOut</a></li>
              
                  
                   

            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
	<div id="templatemo_banner">
	  <div id="templatemo_banner_content">
        	<div class="header_01">Secure Data Sharing Using Blockchain Technology</div>
      </div>	
    
    	<div class="cleaner"></div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_content_wrapper">
         <!--Retrieve the session's ID, email, mskey, and username.-->
	 <%String username=(String)session.getAttribute("username");
         String mskey=(String)session.getAttribute("mskey");
         String email=(String)session.getAttribute("email");
         String id=(String)session.getAttribute("id");
         
         %>
	<br />

        <center>
         <h3>VERIFY KEY</h3> 
                    <center>
                        
                        
                    <%
            String rid=request.getParameter("id");    
            // Obtains the filename and ID by looking through the request parameters.
            String fid=request.getParameter("fid");
            String fname=request.getParameter("fname");

   %>
   <!-- Calls Verify Action.JSP FILE -->
   <form action="VerifyAction.jsp" method="post">
       <table border="1" width="400">
           <tr>
               <th>File Id</th><td><input type="text" name="fid" value="<%=fid%>" readonly=""/></td>
           </tr>
           <tr>
               <th></th><td><input type="hidden" name="rid" value="<%=rid%>" readonly=""/></td>
           </tr>
           <tr>
               <th>File Name</th><td><input type="text" name="fname" value="<%=fname%>" readonly=""/></td>
           </tr>
           <tr>
               <th>Private Key</th><td><input type="text" name="pkey" required=""/></td>
           </tr>
            <tr>
               <th></th><td><input type="submit" value="Verify"/>
                   <input type="reset" value="Reset"/></td>
           </tr>
       
                    </table>
   </form>       
               
        </center>

</div> <!-- end of content wrapper -->



</html>
