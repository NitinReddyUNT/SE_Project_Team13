
<%@page import="java.sql.Statement"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
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
      	 <ul>
                 <li><a href="CSPHome.jsp"  class="current">HOME</a></li>
                 <li><a href="CSP_ViewALLFIles.jsp">View All FIles</a></li> 
                 <li><a href="CSP_ViewRequest.jsp">View Requests</a></li>
                 <li><a href="CSP_ENCTimeGrpah.jsp">Encryption Time Graph</a></li>
                 <li><a href="CSP_ReENCTimeGrpah.jsp">Re_Encryption Time Graph</a></li>
                 <li><a href="CSP_DecTimeGrpah.jsp">Decryption Time Graph</a></li>
                 <li><a href="CSP_download.jsp">All Downloads Graph</a></li>
                 <li><a href="CSP_AttackedGrpah.jsp">Attacked File Graph</a></li>
               	 <li><a href="CSP.jsp">logout</a></li>
                   

            </ul>  
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div>
<div id="templatemo_content_wrapper">
	
	<br />
       
<center>
<h3>VIEW ALL FILES</h3>

	<table width="1000" border="0">
   <%@page import="com.action.Queries"%>
<%@page import="java.sql.ResultSet"%>
<center>
      <table border="1" width="400">
                        <tr>
                           <th>Owner ID</th><th>File Id</th> <th>File Name</th> <th>Status</th>
                        </tr>
                    <%
//                 
try{
    Connection con=Dbconnection.getConnection();
    Statement st=con.createStatement();
   
    ResultSet rr=st.executeQuery("select * from request where status='proxy' and owner_auth='Pending'");
    while(rr.next()){
        String status=rr.getString("status");
        String auth=rr.getString("owner_auth");
        %>
        <tr>
           <td><%=rr.getString("ownerid")%></td>
             <td><%=rr.getString("fid")%></td>
          <td><%=rr.getString("fname")%></td>
          <%if(auth.equals("Pending")){%>
          
          <td><a href="CPS_OwnerAuthenticity.jsp?oid=<%=rr.getString("ownerid")%>&fid=<%=rr.getString("fid")%>&rid=<%=rr.getString("id")%>&fname=<%=rr.getString("fname")%>">Owner Authenticity verify</a></td></td>
           <%}else{%>
        <td><font color="red"><%=rr.getString("check_url")%></font></td>
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

     
            





<!-- end of header -->
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

