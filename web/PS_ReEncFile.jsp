

<%@page import="com.action.Queries"%>  <!--Custom import, likely for SQL query operations or database interaction methods.-->
<%@page import="javax.crypto.spec.SecretKeySpec"%> <!--Import for specifying a cryptographic key's specifications.-->
<%@page import="javax.crypto.SecretKey"%><!--Import for representing and managing secret keys used in cryptographic operations.-->
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%><!--Import for Base64 encoding/decoding, typically used for handling binary data as strings.-->
<%@page import="com.action.encryption"%> <!--Custom import, presumably for handling encryption and decryption tasks.-->
<%@page import="java.sql.ResultSet"%><!--Import for handling the result set returned by SQL queries.-->
<%@page import="java.sql.Statement"%><!--Import for executing static SQL statements and returning their results.-->
<%@page import="com.action.Dbconnection"%><!-- Custom import, likely for establishing and managing database connections.-->
<%@page import="java.sql.Connection"%><!--Import for creating and managing database connections.-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secure Data Sharing using Blockchain Technology</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<style type="text/css"> <!-- this is styling of the page-->
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
                 <li><a href="ServerHome.jsp" >HOME</a></li>
                 <li><a href="SP_ViewRequest.jsp"  class="current">View Request</a></li>
               	 <li><a href="ProxyServer.jsp">logout</a></li>
                  
                   

            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
	<div id="templatemo_banner">
	  <div id="templatemo_banner_content">
        	<div class="header_01">Secure Data Sharing using Blockchain Technology</div>
      </div>	
    
    	<div class="cleaner"></div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_content_wrapper">
	
	<br />

	

	<table width="1000" border="0">
  <tr>
      <td align="center">
         
          <h2>VIEW ALL FILE RE-ENCRYPTION REQUEST</h2>
      </td>
	 
	 <td>
	 	
	 </td>
  </tr>
</table>
        <center>
 <table border="1" width="400">
                      
                    <%
                  
try{
    String id=request.getParameter("id");
    String fid=request.getParameter("fid");
    String fname=request.getParameter("fname");
    
    Connection con=Dbconnection.getConnection();
    Statement st=con.createStatement();
   
    ResultSet rr=st.executeQuery("select * from file where id='"+fid+"'");
    String skey=null;
    String filedata=null;
    if(rr.next()){
         skey=rr.getString("skey");
        filedata=rr.getString("cipher");
    }
    encryption e=new encryption();
   byte[] bs = Base64.decode(skey);
   SecretKey sec = new SecretKeySpec(bs, "AES"); 
   
   
   long start=System.nanoTime();
   String cipher=e.encrypt(filedata,sec);
    long end=System.nanoTime();
    
    long total=end-start;
    
   Queries.getExecuteUpdate("insert into re_enc_time values('"+fname+"','"+total+"')");
            
   int i=Queries.getExecuteUpdate("update request set re_encfile='"+cipher+"',re_enckkey='"+skey+"',u_status='Processed',b_status='Blockchain' where id='"+id+"'");
   if(i>0){
      %>
      <script type="text/javascript">
          window.alert("Re_Encryption Successful \n Sent to blockchain and To User");
          window.location="SP_ViewURLResponse.jsp"
      </script>
      <%
   } else{
 %>
      <script type="text/javascript">
          window.alert("Re_Encryption Failed..!!");
          window.location="SP_ViewURLResponse.jsp"
      </script>
      <%
}
   
}catch(Exception e){
   out.println(e);
}
                    
                    
                    %>
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
le>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
