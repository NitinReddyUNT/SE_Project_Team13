<%@page contentType="text/html" pageEncoding="UTF-8"%> <!-- JSP directive setting content type and encoding -->
<!DOCTYPE html> <!-- Document type declaration for XHTML 1.0 Transitional -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> <!-- Specifies character encoding for the HTML document -->
<title>Secure Data sharing using Blockchain Technology</title> <!-- Title of the webpage -->
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /> <!-- Link to the external stylesheet -->

</head>
<body>
<div id="templatemo_header_wrapper">
  <div id="templatemo_header">
    <div id="templatemo_menu">
            <ul> <!-- Start of navigation menu -->
                 <li><a href="index.html" class="current">HOME</a></li> <!-- Navigation link, current page indicated by class -->
                 <!-- ... Other menu items ... -->
            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
	<div id="templatemo_banner">
	  <div id="templatemo_banner_content">
        	<div class="header_01">Secure Data sharing using Blockchain Technology</div> <!-- Main heading or banner text -->
      </div>	
    	<div class="cleaner"></div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_content_wrapper">
	
	<table width="1000" border="0">
  <tr>
     <td><img src="images/userlogin.jpg" width="300" height="300" alt="User Login Image"/></td> <!-- Image in content, with alt text -->
	 
	 <td>
	 <table align="center" width="400" style="border:1px solid green;" bgcolor="#FFFFFF">
		<form name="f" action="Ownerlog.jsp" method="post" onSubmit="return valid();"> <!-- Form with validation on submit -->
		<tr>
		<td height="36" colspan="2" align="center" bgcolor="#979700" class="paragraping2">
                    <span style="color:#FFFFFF"><strong>Owner Login Here</strong></span></td> <!-- Login form heading -->
		</tr>
		<tr>
		<td class="paragraping">USERNAME:</td> <!-- Username field label -->
		<td><input type="text" name="user" class="input1"></td> <!-- Text input for username -->
		</tr>
		<tr>
		<td class="paragraping">PASSWORD:</td> <!-- Password field label -->
		<td><input type="password" name="pass" class="input1"></td> <!-- Password input field -->
		</tr>
		<!-- ... Additional form fields and buttons ... -->
		</form>
		</table>	
	 </td>
  </tr>
</table>

</div> <!-- end of content wrapper -->

<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
        <div class="cleaner"></div>
  </div> 
</div> <!-- end of footer -->

</html>
