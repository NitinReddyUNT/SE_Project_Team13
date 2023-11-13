<!--This page is used to display all the files cipher data in a tabular format -->

<%@page import="java.sql.ResultSet"%>
<%@page import="com.action.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secure Data Sharing Using Blockchain Technology</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<!--Style element is used to style the title of the project-->
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
<!--  The below block is used to display other tabs so that TA can navigate -->
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                  <li><a href="TAHome.jsp">Home</a></li>
                 <li><a href="TA_viewOwners.jsp">View Owners</a></li>
                  <li><a href="TA_ViewIUsers.jsp">View Users</a></li>
                    <li><a href="TA_ViewCipher.jsp" class="current">View CipherText</a></li>
		 <li><a href="TA.jsp">LogOut</a></li>
              
                  
                   

            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<!--This block is used to display the title of the project-->
<div id="templatemo_banner_wrapper">
	<div id="templatemo_banner">
	  <div id="templatemo_banner_content">
        	<div class="header_01">Secure Data Sharing Using Blockchain Technology</div>
      </div>	
    
    	<div class="cleaner"></div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_content_wrapper">
	
	<br />

	
<!--To display table with all the encrypted file data-->
	<table width="1000" border="0">
  <tr>
      <td align="center">
         
          <h2>VIEW ALL PROXY SERVER SUBMITTED DATA</h2>
      </td>
  </tr>
        </table>
        <center>
        <table border="1">
            <tr>
                <th>Sr.No</th> <th>File Owner ID</th><th>UserName</th> <th>File ID</th>
                <th>FileName</th><th>Owner Authentication</th><th>User Request status</th>
                <th>Re-Encrypted Files</th>
            </tr>
            <!-- To retrieve all the re-encrypted file details from database -->
           <%try{
               ResultSet r=Queries.getExecuteQuery("select * from request where b_status='Blockchain'");
               int i=0;
               while(r.next()){
               i=i+1;
                 %>
                 <tr>
                     <td><%=i%></td>
                     <td><%=r.getString("ownerid")%></td>
                   
                     <td><%=r.getString("username")%></td>
                     <td><%=r.getString("fid")%></td>
                     <td><%=r.getString("fname")%></td>
                     <td><%=r.getString("owner_auth")%></td>
                     <td><%=r.getString("u_status")%></td>
                     <td><textarea cols="50" rows="10"><%=r.getString("re_encfile")%></textarea></td>
                 </tr>
                 
                 <%
               }
               
           }catch(Exception e){
               System.out.println(e);
}%>
            
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
