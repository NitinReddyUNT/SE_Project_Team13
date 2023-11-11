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
      		<div id="templatemo_menu_left"></div>
            <!-- Navigation menu -->
            <ul>
                <li><a href="OwnerHome.jsp">HOME</a></li>
                <li><a href="Upload.jsp">Upload</a></li>
                <li><a href="DO_ViewFiles.jsp">View Files</a></li>
                <li><a href="DO_ViewRequest.jsp"  class="current">View Request</a></li>
                <li><a href="DataOwner.jsp">logout</a></li>
            </ul>
		</div> <!-- end of menu -->
    </div>  <!-- end of header -->
</div>
<div id="templatemo_content_wrapper">
	
	<br />
    <% 
        // Retrieving user information from the session
        String username=(String)session.getAttribute("username");
        String mskey=(String)session.getAttribute("mskey");
        String email=(String)session.getAttribute("email");
        String id=(String)session.getAttribute("id");
    %>
    <center>
        <h3>View All Request</h3>

        <table width="1000" border="0">
            <%@page import="com.action.Queries"%>
            <%@page import="java.sql.ResultSet"%>
            <center>
                <table border="1" width="400">
                    <tr>
                        <!-- Table header -->
                        <th>User ID</th><th>File Id</th> <th>File Name</th> <th>Status</th>
                    </tr>
                    <%
                    try{
                        // Database connection and statement creation
                        Connection con=Dbconnection.getConnection();
                        Statement st=con.createStatement();
   
                        // Fetching requests from the database for the current owner
                        ResultSet rr=st.executeQuery("select * from request where ownerid='"+id+"'");
                        
                        // Loop through the result set and display request information
                        while(rr.next()){
                            String status=rr.getString("status");
                            String u_status=rr.getString("u_status");
                    %>
                    <tr>
                        <!-- Displaying request details -->
                        <td><%=rr.getString("userid")%></td>
                        <td><%=rr.getString("fid")%></td>
                        <td><%=rr.getString("fname")%></td>
                        <% 
                            // Checking the status to determine the appropriate action
                            if(status.equals("waiting")){%>
                                <td><a href="DO_ReEncRequest.jsp?id=<%=rr.getString("id")%>">Send Re-Encrypt Request</a></td></td>
                            <%}else if(status.equals("proxy")&&u_status.equals("waiting")){%>
                                <td><font color="red">Request Pending At Proxy</font></td>
                            <%}else{%>
                                <td>Re-Encryption Request Processed</td>
                            <%}%>
                    </tr>
                    <%
                        }
                    }catch(Exception e){
                        // Print the exception details
                        out.println(e);
                    }
                    %>
                </table>
            </center>
        </table>
        
        <script type='text/javascript'>
            // JavaScript function to load file content into a textarea
            function loadFileAsText() {
                var fileToLoad = document.getElementById("file").files[0];

                var fileReader = new FileReader();
                fileReader.onload = function(fileLoadedEvent) {
                    var textFromFileLoaded = fileLoadedEvent.target.result;
                    document.getElementById("textarea").value = textFromFileLoaded;
                };
                fileReader.readAsText(fileToLoad, "UTF-8");
            }
        </script>
    </center>
</html>
