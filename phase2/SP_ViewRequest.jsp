
<!--This page is used to see all the rencrypt request from the data  -->
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secure Data Sharing Using Blockchain Technology</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<!--style element is used to style the title of the project-->
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
<!--  The below block is used to display other tabs so that proxy server can navigate  -->
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                 <li><a href="ServerHome.jsp" >HOME</a></li>
                 <li><a href="SP_ViewRequest.jsp"  class="current">View Request</a></li>
                 <li><a href="SP_ViewURLResponse.jsp">View URLs</a></li>
               	 <li><a href="ProxyServer.jsp">logout</a></li>
                  
                   

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
<!--To display table with all the rencrypted request from data owners to the files they uploaded-->
<div id="templatemo_content_wrapper">
	
	<br />

	

	<table width="1000" border="0">
  <tr>
      <td align="center">
         
          <h2>VIEW ALL FILE RE-ENCRYPTION REQUEST</h2>
      </td>
	 
	 <td>
	 	
	 </td>
  </tr>
</table>
        <center>
 <table border="1" width="400">
                        <tr>
                           <th>Owner ID</th> <th>User ID</th> <th>User Name</th><th>File Id</th> <th>File Name</th> <th>Status</th>
                        </tr>
                    <%
 //setting up connection with database to retreive all the request details                 
try{
    Connection con=Dbconnection.getConnection();
    Statement st=con.createStatement();
   
    ResultSet rr=st.executeQuery("select * from request where status='proxy'");
    while(rr.next()){
        String status=rr.getString("status");
        String auth=rr.getString("owner_auth");
        %>
        <tr>
           <td><%=rr.getString("ownerid")%></td>
           <td><%=rr.getString("userid")%></td>
          <td><%=rr.getString("username")%></td>
          <td><%=rr.getString("fid")%></td>
          <td><%=rr.getString("fname")%></td>
          <%if(status.equals("proxy")&&auth.equals("waiting")){%>
          <!--if the re-encrypt request is approved navigate to owner authencity page to display a message-->
          <td><a href="PS_OwnerAuthenticity.jsp?id=<%=rr.getString("id")%>">Owner Authenticity with Cloud</a></td></td>
                <%}else if(auth.equals("Pending")){%>
        <td><font color="red">Request Pending At Cloud Service Provider</font></td>
        <%}else{%>
        <td><font color="red">Request Processed</font></td>
        <%}%>
        </tr>
        
        <%
    }
   
}catch(Exception e){
   out.println(e);
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

