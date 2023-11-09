<!--  This code is used to display upload files page in data owner module  -->
<%@page import="com.mysql.jdbc.TimeUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.action.Queries"%>
<%@page import="java.security.Signature"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="com.hash.BlocKChainSingHash"%>
<%@page import="java.security.PrivateKey"%>
<%@page import="java.security.KeyPair"%>
<%@page import="java.security.KeyPairGenerator"%>
<%@page import="com.action.encryption"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="java.util.Random"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html">
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
<!-- Display Menu to navigate to other tabs -->
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
        <!--get required attributes from session storage-->
        <%String username=(String)session.getAttribute("username");
         String mskey=(String)session.getAttribute("mskey");
         String email=(String)session.getAttribute("email");
         String id=(String)session.getAttribute("id");      

        String number=request.getParameter("number");
        System.out.println(number);
        String fname=request.getParameter("fname");
        String data=request.getParameter("data");
        String metadata=request.getParameter("metadata");

//enctypt data using encryption method to get cipher data
byte[] bs = Base64.decode(number);
SecretKey sec = new SecretKeySpec(bs, "AES");
long start=System.nanoTime();
System.out.println("start: "+start);
String cipher=new encryption().encrypt(data,sec);
long end=System.nanoTime();
System.out.println("end "+end);
long total=end-start;

Queries.getExecuteUpdate("insert into enc_time values('"+fname+"','"+total+"')");

//BLOCK CHAIN
KeyPairGenerator  keyPairGenerator = KeyPairGenerator.getInstance("RSA");
                      keyPairGenerator.initialize(2048);
    KeyPair           keyPair    = keyPairGenerator.generateKeyPair();
       PrivateKey    privateKey = keyPair.getPrivate();
       
             byte[]  dataBytes  = metadata.getBytes();
     

    //CREATE HASH
    MessageDigest digest    = MessageDigest.getInstance("SHA-256");
    byte[]        hashBytes = digest.digest(dataBytes);

    //ENCODE HASH
    byte[]        hashEncoded = java.util.Base64.getEncoder().encode(hashBytes);
    String        hashEncodedString = new String(hashEncoded);    
 
    //SIGN HASH
    Signature         signature = Signature.getInstance("NONEwithRSA");
                      signature.initSign(privateKey);
                      signature.update(hashBytes);
    byte[]            signatureBytes = signature.sign();

    //ENCODE SIGNATURE
    byte[]            signatureEncodedBytes = java.util.Base64.getEncoder().encode(signatureBytes);
    String            signatureEncodedString = new String(signatureEncodedBytes);


ResultSet r=Queries.getExecuteQuery("select count(*) from blockchain");
int block=1;
while(r.next()){
   int h=r.getInt(1);
   block=block+h;
}
         %>
	
<!-- get input file details like name, and file and generate random key to every file-->
	<table width="1000" border="0">
  <tr>
     <td><img src="images/fileupload.jpg" width="300" height="300"/></td>
	 
	 <td>
	 <table align="center" width="800" style="border:1px solid green;" bgcolor="#FFFFFF">
		 <form name="f2" action="Upload2.jsp" method="post" style="margin-right:  50px">
                       <tr>
		<td height="36" colspan="2" align="center" bgcolor="#979700" class="paragraping2">
                    <span style="color:#FFFFFF"><strong>File Upload Here</strong><strong></strong></span></td>
		</tr>
		
                <tr>
		<td height="47" class="paragraping">Random Number</td>
		<td><input type="text"  name="number" value="<%=number%>"   class="input1" readonly></td>
		</tr>
               
		
                <tr>
		<td height="52" class="paragraping">FileName</td>
		<td><input type="text"  name="fname"  value="<%=fname%>"  class="input1" readonly/></td>
		</tr>
                <tr>
                <td  height="47" class="paragraping">File Plain Data</td>
                <td><label>
                  <textarea name="data" id="textarea" cols="50" rows="10" readonly><%=data%></textarea>
                </label></td>
                
              </tr>  
                   <tr>
                <td  height="47" class="paragraping">File Cipher Data</td>
                <td><label>
                  <textarea name="cipher" id="textarea" cols="50" rows="10" readonly><%=cipher%></textarea>
                </label></td>
                
              </tr>  
                      <tr>
                <td  height="47" class="paragraping">Meta Data</td>
                <td><label>
                  <textarea name="metadata"  cols="50" rows="5" readonly><%=metadata%></textarea>
                </label></td>
                
              </tr>  
                <tr>
		<td height="52" class="paragraping">Block</td>
		<td><input type="text"  name="block"  value="<%=block%>"  class="input1" readonly/></td>
		</tr>
                 <tr>
		<td height="52" class="paragraping">Hash Code</td>
		<td><input type="text" style='width:500px;' name="hashcode"  value="<%=hashEncodedString%>"  class="input1" readonly/></td>
		</tr>
                 <tr>
		<td height="52" class="paragraping">Digital Signature</td>
                <td><textarea name="signature" id="textarea" cols="80" rows="5" readonly><%=signatureEncodedString%></textarea></td>
		</tr>
		<tr>
		<td height="51"></td>
		<td><input type="submit" name="sub" value="Upload" id="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="clear" value="Clear" id="button">
		
		</td>
		</tr>
		
		<tr>
                    <!--testing-->
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

