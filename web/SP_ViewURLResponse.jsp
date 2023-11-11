

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> <!-- @author sumuk reddy -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secure Data Sharing using Blockchain Technology</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

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
                 <li><a href="ServerHome.jsp" >HOME</a></li>
                 <li><a href="SP_ViewRequest.jsp" >View Request</a></li>
                 <li><a href="SP_ViewURLResponse.jsp"  class="current">View URLs</a></li>
               	 <li><a href="ProxyServer.jsp">logout</a></li>
                  
                   

            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
	<div id="templatemo_banner">
	  <div id="templatemo_banner_content">
        	<div class="header_01">Secure Data Sharing using Blockchain Technology</div>
      </div>	
    
    	<div class="cleaner"></div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_content_wrapper">
	
	<br />

	

	<table width="1000" border="0">
  <tr>
      <td align="center">
         
          <h2>VIEW ALL CLOUD URLs</h2>
      </td>
	 
	 <td>
	 	
	 </td>
  </tr>
</table>
        <center>
 <table border="1" width="400"> <!-- starting of table -->
                        <tr>
 <th>Owner ID</th> <th>User ID</th> <th>User Name</th><th>File Id</th> <th>File Name</th> <th>Owner Authenticity</th><th>URL</th>
                        </tr>
                    <%
                  
try{
    Connection con=Dbconnection.getConnection(); //exceptional handling
    Statement st=con.createStatement();
   
    ResultSet rr=st.executeQuery("select * from request where status='proxy' AND owner_auth='Verified'");
    while(rr.next()){
      
        String auth=rr.getString("owner_auth");
        %>
        <tr>
           <td><%=rr.getString("ownerid")%></td>
           <td><%=rr.getString("userid")%></td>
          <td><%=rr.getString("username")%></td>
          <td><%=rr.getString("fid")%></td>
          <td><%=rr.getString("fname")%></td>
         <td><%=auth%></td>
         <td><a href="<%=rr.getString("check_url")%>"><%=rr.getString("check_url")%></a></td>
         
        </tr>
        
        <%
    }
   
}catch(Exception e){
   out.println(e); // printing
}
                    
                    
                    %>
                    </table>
        </center>

</div> <!-- end of content wrapper -->
<br><br><br>
<div id="templatemo_footer_wrapper">

<div id="templatemo_footer">
	 
        <div class="cleaner"></div>
  </div> 
</div> <!-- end of footer -->

</html>


</html>
