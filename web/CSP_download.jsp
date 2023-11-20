<!--  This code is used to display the downloaded files graph in CSP module  -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Safeguarding the Digital World Data Sharing with Proxy Re-Encryption using Blockchain</title>
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
<!-- This part displays menu used to navigate to other tabs from current tab -->
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                 <li><a href="CSPHome.jsp" >HOME</a></li>
                 <li><a href="CSP_ViewALLFIles.jsp">View All FIles</a></li> 
                 <li><a href="CSP_ViewRequest.jsp">View Requests</a></li>
                  <li><a href="CSP_ENCTimeGrpah.jsp">Encryption Time Graph</a></li>
                  <li><a href="CSP_ReENCTimeGrpah.jsp">Re_Encryption Time Graph</a></li>
                  <li><a href="CSP_DecTimeGrpah.jsp">Decryption Time Graph</a></li>
                 <li><a href="CSP_download.jsp" class="current">All Downloads Graph</a></li>
                   <li><a href="CSP_AttackedGrpah.jsp">Attacked File Graph</a></li>
               	 <li><a href="CSP.jsp">Logout</a></li>
                  
                   

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
	
	<br />

	

	<table width="1000" border="0">
  <tr>
      <td align="center">
         
      
      </td>
	 
	 <td>
	 	
	 </td>
  </tr>
            <!-- using iframe to diaplay the graph inside iframe by calling java class -->
            <iframe src="DownloadGraph" width="1000" height="400"></iframe>
</table>



</div> <!-- end of content wrapper -->
<br><br><br>
<div id="templatemo_footer_wrapper">

<div id="templatemo_footer">
	 
        <div class="cleaner"></div>
  </div> 
</div> <!-- end of footer -->

</html>
