<!--author-anjan-->
<%@page import="com.action.Queries"%><!-- Methods for running SQL queries on a database are included in this custom class-->
<%@page import="java.io.PrintWriter"%> <!--This statement calls the PrintWriter class-->
<%@page contentType="text/html" pageEncoding="UTF-8"%><!--This Import statement sets the character encoding to UTF-8 and the content type to text/html-->
<%
 // Retrieves the session's ID, email, mskey, and username.   
 String username=(String)session.getAttribute("username");
         String mskey=(String)session.getAttribute("mskey");
         String email=(String)session.getAttribute("email");
         String id=(String)session.getAttribute("id");
         
// Obtains the filename and ID by looking through the request parameters.
String fid=request.getParameter("fid");
String fname=request.getParameter("fname");
// Access the session attribute to obtain the data to be downloaded.
String data=(String)session.getAttribute("data");
// To keep track of the download, adding a record to the download table.
Queries.getExecuteUpdate("insert into download values(null,'"+id+"','"+username+"','"+fname+"',now())");

// Indicates that the response is an attachment by setting the Content-Disposition header.
response.setHeader("Content-Disposition", "attachment;filename=\"" + fname + "\"");
// Sends the information to the web browser.
out.write(data);

%>

