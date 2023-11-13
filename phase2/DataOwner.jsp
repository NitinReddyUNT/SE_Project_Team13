<%@page contentType="text/html" pageEncoding="UTF-8"%> <!-- JSP directive setting content type and encoding -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> <!-- Specifies character encoding for the HTML document -->
<title>Secure Data sharing using Blockchain Technology</title> <!-- Title of the webpage -->
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /> <!-- Link to the external stylesheet -->

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
                 <li><a href="index.html">HOME</a></li>
                 <li><a href="DataOwner.jsp" class="current">Data Owner</a></li>
                  <li><a href="UserLogin.jsp">Data User</a></li>
                    <li><a href="TA.jsp">Trusted Authority</a></li>
                    <li><a href="ProxyServer.jsp">Proxy Server</a></li>
                    <li><a href="CSP.jsp">CSP</a></li>
                  
                   

            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
	<div id="templatemo_banner">
	  <div id="templatemo_banner_content">
        	<div class="header_01">Secure Data sharing using Blockchain Technology</div>
      </div>	
    
    	<div class="cleaner"></div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_content_wrapper">
	
	<br />

	

	<table width="1000" border="0">
  <tr>
     <td><img src="images/userlogin.jpg" width="300" height="300"/></td>
	 
	 <td>
	 <table align="center" width="400" style="border:1px solid green;" bgcolor="#FFFFFF">
		<form name="f" action="Ownerlog.jsp" method="post" onSubmit="return valid();">
		<tr>
		<td height="36" colspan="2" align="center" bgcolor="#979700" class="paragraping2">
                    <span style="color:#FFFFFF"><strong>Owner Login Here</strong><strong></strong></span></td>
		</tr>
		<tr>
		<td height="52" class="paragraping">USERNAME:</td>
		<td><input type="text" name="user"  class="input1"></td>
		</tr>
		<tr>
		<td height="47" class="paragraping">PASSWORD:</td>
		<td><input type="password" name="pass" class="input1"></td>
		</tr>
                    
		<tr>
		<td height="51"></td>
		<td><input type="submit" name="sub" value="Login" id="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="clear" value="Clear" id="button">
		
		</td>
		</tr>
	<tr>
		<td height="47" class="paragraping">Don't Have An Account</td>
                <td><a href='OwnerRegister.jsp'>Register</a></td>
		</tr>
                    	
		<tr>
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
<br><br><br>
<div id="templatemo_footer_wrapper">

<div id="templatemo_footer">
	 
        <div class="cleaner"></div>
  </div> 
</div> <!-- end of footer -->

</html>
