<%@page contentType="text/html" pageEncoding="UTF-8"%><!--sets the JSP page's content type and page encoding.-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><!--declares the HTML page's document type.-->
<html xmlns="http://www.w3.org/1999/xhtml"><!--the HTML element is opened.-->
<head><!--opens the head element-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!--determines the HTML page's character set and content type.-->
<title>Secure Data Sharing Using Blockchain Technology</title><!--establishes the HTML page's title.-->
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /><!--Links to the HTML page's CSS stylesheet.-->

<style type="text/css">
<!--
.style1 {
	color: #00CC00;
	font-weight: bold;
	font-size: 16px;
}
-->
</style><!--end css style block-->
</head><!--close head element-->
<body><!--open body element-->
<div id="templatemo_header_wrapper"><!--open div element with id-->
<!--  Free Web Templates by TemplateMo.com  -->
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div><!--add div element with id-->
            <ul><!--open unorderd list element-->
                 <li><a href="index.html">HOME</a></li><!--adds a link to the index.html page in the list item element.-->
                 <li><a href="DataOwner.jsp" class="current">Data Owner</a></li><!--Adds a list item element with a reference to the current class and a link to the DataOwner.jsp page.-->
                  <li><a href="UserLogin.jsp">Data User</a></li><!--a link to the UserLogin.jsp page is added as a list item element.-->
                  <li><a href="TA.jsp">Trusted Authority</a></li><!--Links a list item's element to the TA.jsp page.-->
                    <li><a href="ProxyServer.jsp">Proxy Server</a></li><!--establishes a link to the ProxyServer.jsp page in the list item element of the list.-->
                    <li><a href="CSP.jsp" class="current">CSP</a></li><!--Inserts a list item element that links to the current class and CSP.jsp page.-->
                  
                   

            </ul>//closes unordered list    	
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
     <td><img src="images/userlogin.jpg" width="300" height="300"/></td>
	 
	 <td>
	 <table align="center" width="400" style="border:1px solid green;" bgcolor="#FFFFFF">
		<form name="f" action="Ownerlog.jsp" method="post" onSubmit="return valid();"><!-- Actions into ownerlog.jsp-->
		<tr>
		<td height="36" colspan="2" align="center" bgcolor="#979700" class="paragraping2">
                    <span style="color:#FFFFFF"><strong>Owner Login Here</strong><strong></strong></span></td>
		</tr>
		<tr>
		<td height="52" class="paragraping">USERNAME:</td><!-- Text data tag -->
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
