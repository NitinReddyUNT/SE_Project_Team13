

<%@page contentType="text/html" pageEncoding="UTF-8"%> <!--This Import statement sets the character encoding to UTF-8 and the content type to text/html-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> <!-- This Statement indicates the code as being composed in the XHTML 1.0 Transitional namespace to the browser-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> <!-- this statment specifies the encoding and type of the document for web browsers-->
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
                 <li><a href="OwnerHome.jsp"  class="current">HOME</a></li>
                 <li><a href="Upload.jsp">Upload</a></li>
                 <li><a href="DO_ViewFiles.jsp">View Files</a></li>
		 <li><a href="DataOwner.jsp">logout</a></li>
                 
                  
                   

            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper"><!-- start of templatemo banner wrapper-->
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
     <td></td>
         <!--Retrieve the session's ID, email, mskey, and username.-->
	 <%String username=(String)session.getAttribute("username");
         String mskey=(String)session.getAttribute("mskey");
         String email=(String)session.getAttribute("email");
         String id=(String)session.getAttribute("id");
         
         %>
	 <td>
	 <table align="center" width="400" style="border:1px solid green;" bgcolor="#FFFFFF">
             <!--When the form is submitted, the valid() function is called. Prior to the form data being sent to the Adminlog.jsp page, this function can be used to validate it.-->
		<form name="f" action="Adminlog.jsp" method="post" onSubmit="return valid();">
		<tr>
		<td height="36" colspan="2" align="center" bgcolor="#979700" class="paragraping2">
                    <!-- displays Welcome with Username-->
                    <span style="color:#FFFFFF"><strong> WelCome : <%=username%> </strong><strong></strong></span></td>
		</tr>
		
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
