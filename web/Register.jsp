<!--This page is used to allow users to register in data user module by giving their details-->

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
<!--  The below block is used to display other tabs so that user can navigate -->
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                   <li><a href="index.html">HOME</a></li>
                 <li><a href="DataOwner.jsp">Data Owner</a></li>
                  <li><a href="UserLogin.jsp" class="current">Data User</a></li>
                  <li><a href="TA.jsp">Trusted Authority</a></li>
                    <li><a href="ProxyServer.jsp">Proxy Server</a></li>
                    <li><a href="CSP.jsp" class="current">CSP</a></li>
                  
                  
                   

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

	

	<table width="1000" border="0">
  <tr>
      <!-- To ask for user details like username, password, dob for registration -->
     <td><img src="images/register.jpg" width="400" height="300"/></td>
	 
	 <td>
	 <table align="center" width="400"  height="500" style="border:1px solid green;" bgcolor="#FFFFFF">
		<form name="f" action="UserReg.jsp" method="post" onSubmit="return valid();">
		<tr>
		<td height="36" colspan="2" align="center" bgcolor="#979700" class="paragraping2"><span style="color:#FFFFFF"><strong>User Register Here</strong><strong></strong></span></td>
		</tr>
		<tr>
		<td height="52" class="paragraping">USERNAME:</td>
		<td><input type="text" name="user"  class="input1" required></td>
		</tr>
		<tr>
		<td height="47" class="paragraping">PASSWORD:</td>
		<td><input type="password" name="pass" class="input1" minlenght="8" required></td>
		</tr>
                    <tr>
		<td height="47" class="paragraping">Date Of Birth</td>
		<td><input type="date" name="dob" class="input1" required></td>
		</tr>
                    
                    <tr>
		<td height="47" class="paragraping">Email Id</td>
		<td><input type="text" name="email" class="input1" required></td>
		</tr>
                    <tr>
		<td height="47" class="paragraping">Gender</td>
                <td><select name="gender" >
                        <option value="Male">Male</option>
                        <option value="FeMale">FeMale</option>
                        <option value="Others">Others</option>
                    </select></td>
		</tr>
                    <tr>
		<td height="47" class="paragraping">Address</td>
		<td><input type="text" name="address" class="input1" required></td>
		</tr>
                    <tr>
		<td height="47" class="paragraping">Mobile Number</td>
		<td><input type="text" name="mobile" class="input1" required></td>
		</tr>
                    
		<tr>
		<td height="51"></td>
		<td><input type="submit" name="sub" value="Submit" id="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="clear" value="Clear" id="button">
		
		</td>
		</tr>
		<!-- To display hyperlink to login page so that user can login if he already have an account-->
		<tr>
                    <tr>
		<td height="47" class="paragraping">Already Have An Account</td>
                <td><a href='UserLogin.jsp'>Login</a></td>
		</tr>
                    <!-- If login credentials are wrong display invalid credentials-->
         <td class="paragraping" colspan="2" align="center"><font size="2"><b><%
							String message=request.getParameter("message");
							if(message!=null && message.equalsIgnoreCase("fail"))
							{
								out.println("<font color='red'><blink>Invalid Username and Password</blink></font>");
							}
						%></b></font></td>
         </tr>
		</form>
		</table>	
	 </td>
  </tr>
</table>



</div> <!-- end of content wrapper -->


</html>

