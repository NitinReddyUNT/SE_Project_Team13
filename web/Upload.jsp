<!--  This code is used to display upload files page in data owner module  -->
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.util.Random"%>
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
<!-- This part displays menu used to navigate to other tabs from Upload Files tab -->
<div id="templatemo_header_wrapper">
  <div id="templatemo_header">
    <div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                   <li><a href="OwnerHome.jsp">HOME</a></li>
                 <li><a href="Upload.jsp"  class="current">Upload</a></li>
                 <li><a href="DO_ViewFiles.jsp">View Files</a></li>                 
                 <li><a href="DO_ViewRequest.jsp">View Request</a></li>
		 <li><a href="DataOwner.jsp">logout</a></li>
            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div>
<div id="templatemo_content_wrapper">
	
	<br />
        <!--getting logged in owner detail using session storage-->
        <%String username=(String)session.getAttribute("username");
         String mskey=(String)session.getAttribute("mskey");
         String email=(String)session.getAttribute("email");
         String id=(String)session.getAttribute("id");
         
//Using a key generator to create unique key for every file upload
 KeyGenerator keygen=KeyGenerator.getInstance("AES");
           keygen.init(128);
           SecretKey s=keygen.generateKey();
           //converting secret keyto string
           byte[] b=s.getEncoded();//encoding secret key
           String skey=Base64.encode(b);

         %>
	
<!--This block is used to display a table to take input file details-->
	<table width="1000" border="0">
  <tr>
     <td><img src="images/fileupload.jpg" width="300" height="300"/></td>
	 
	 <td>
	 <table align="center" width="500" style="border:1px solid green;" bgcolor="#FFFFFF">
                 <form name="f2" action="Upload1.jsp" method="post" style="margin-right:  50px">
		 <!--<form name="f2" action="Upload2.jsp" method="post" style="margin-right:  50px">-->
                       <tr>
		<td height="36" colspan="2" align="center" bgcolor="#979700" class="paragraping2">
                    <span style="color:#FFFFFF"><strong> File Upload Here</strong><strong></strong></span></td>
		</tr>
              
    <tr>
		<td height="47" class="paragraping">Random Number</td>
		<td><input type="text"    name="number" value="<%=skey%>"   class="input1" readonly></td>
    </tr>		                

		<tr>
		<td height="47" class="paragraping">Choose File</td>
		<td><input type="file"  id="file" name="file"  onchange="loadFileAsText()"  class="input1" required></td>
		</tr>
                <tr>
		<td height="52" class="paragraping">FileName</td>
		<td><input type="text"  name="fname"  placeholder="filename.txt"  class="input1" required/></td>
		</tr>
                   <tr>
                <td  height="47" class="paragraping">File Data</td>
                <td><label>
                  <textarea name="data" id="textarea" cols="50" rows="10"></textarea>
                </label></td>
                
              </tr>  
                      <tr>
                <td  height="47" class="paragraping">About File</td>
                <td><label>
                  <textarea name="metadata"  cols="50" rows="5" placeholder="Write somethig about file" required></textarea>
                </label></td>
                
              </tr>  
		<tr>
		<td height="51"></td>
		<td><input type="submit" name="sub" value="Upload" id="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="clear" value="Clear" id="button">
		
		</td>
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



<!--To display the file contents in text area element so that user can view it before uploading using file reader API-->
<script type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
                
                //var filename = fileToLoad.files.item[0].name;
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
               
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
</html>

