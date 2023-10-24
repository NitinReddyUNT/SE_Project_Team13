
<!-- Import Statements-->
<!--author-anjan-->
<%@page import="java.sql.Statement"%> <!--SQL statements are run using this class-->
<%@page import="java.sql.Connection"%><!-- The connection to a database is represented by this class-->
<%@page import="com.action.Dbconnection"%><!-- There are methods in this custom class for establishing a database connection-->
<%@page import="java.sql.ResultSet"%> <!--A table of data representing a database result set is represented by this class-->
<%@page import="com.action.Queries"%><!-- Methods for running SQL queries on a database are included in this custom class-->
<%@page contentType="text/html" pageEncoding="UTF-8"%><!-- This sets the JSP page's content type to text/html and uses UTF-8 character encoding-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> <!-- This Statement indicates the code as being composed in the XHTML 1.0 Transitional namespace to the browser-->
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
<!--start of body tag which contains visible content of webpage--> 
<body>
<div id="templatemo_header_wrapper">
<!--  Free Web Templates by TemplateMo.com  -->
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                  <li><a href="index.html">Home</a></li>
                  <li><a href="SearchFile.jsp" class="current">Search File</a></li>
		  <li><a href="UserLogin.jsp">LogOut</a></li>
              
                  
                   

            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper"> <!-- start of templatemo banner wrapper-->
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
         <!--This Section is used to display the fileid,filename.-->
         <h3>Searched Result</h3> 
                    <center>
                    <table border="1"  width="400">
                        <tr>
                            <th>File Id:</th> <th>File Name</th> <th>Action</th>
                        </tr>
                    <%
                    String keyword=request.getParameter("keyword");
                   
try{
    // Creates a database connection.
    Connection con=Dbconnection.getConnection();
    // To run SQL statements, we are creating a Statement object.
    Statement st=con.createStatement();
   // Runs a SQL query to pick all files whose filename contains the user-inputted keyword.
  ResultSet r=Queries.getExecuteQuery("select * from file where filename like'%"+keyword+"%'");
  //Continues iterating through the query's results.
  while(r.next()){
     // Obtain the file's ID.
    String fid=r.getString("id");  
    // Runs a SQL query to retrieve all of the file's data associated with the given ID.
    ResultSet rr=st.executeQuery("select * from file where id='"+fid+"'");
    // Repeats the process with the query's results.
    while(rr.next()){
        %>
        <tr>
            
            <td><%=fid%></td><td><%=rr.getString("filename")%></td><td><a href="VerifyAction.jsp?fid=<%=rr.getString("id")%>&fname=<%=rr.getString("filename")%>">Download</a></td>
        </tr>
        
        <%
    }
    
  }
    
    
    
}catch(Exception e){
   //prints the exception
   out.println(e);
}
                    
                    
                    %>
                    </table>
                    
                    </center>
        </center>

</div> <!-- end of content wrapper -->

<div id="templatemo_footer_wrapper">

<div id="templatemo_footer">
	 
        <div class="cleaner"></div>
  </div> 
</div> <!-- end of footer -->
<body>
</html>

</html>
