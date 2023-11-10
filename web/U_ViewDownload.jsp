<!--This tab is used to display all the files downloaded by Data user in Data user module-->
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.action.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secure Data Sharing Using Blockchain Technology</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<!--style element used for styling the title of the project-->
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
<!-- This part displays menu used to navigate to other tabs from Upload Files tab -->
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                  <li><a href="UserHome.jsp">Home</a></li>
                  <li><a href="SearchFile.jsp">Search File</a></li>
                  <li><a href="ViewResponse.jsp">View Response</a></li>
                  <li><a href="U_ViewDownload.jsp" class="current">Download</a></li>
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
    <!--getting logged in user details from session storage-->
	 <%String username=(String)session.getAttribute("username");
         String mskey=(String)session.getAttribute("mskey");
         String email=(String)session.getAttribute("email");
         String id=(String)session.getAttribute("id");
         
         %>
	<br />
        <!--display downloaded files in tabular format-->
        <center>
         <h2>View All Downloads</h2> 
                    <center>
                        <table border="1" width="400">
                        <tr>
                            <th>Sr.No</th> <th>File Name</th> <th>Download Date</th>
                        </tr>
                    <%
       //setting up connection with database to retrieve files           
try{
    Connection con=Dbconnection.getConnection();
    Statement st=con.createStatement();
   
    ResultSet rr=st.executeQuery("select * from download where userid='"+id+"'");
    int i=1;
   
    while(rr.next()){
        i=i+1;
        %>
        <tr>
            <td><%=i%></td>
        
          <td><%=rr.getString("filename")%></td>
          <td><%=rr.getString("date")%></td>
            </tr>
        
        <%
    }   
}catch(Exception e){
   out.println(e);
}                                     
                    %>
                    </table>
                    
                    </center>
        </center>
</div> <!-- end of content wrapper -->
</html>
