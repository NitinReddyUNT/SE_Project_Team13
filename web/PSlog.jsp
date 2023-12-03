
<%@page import="java.sql.Statement"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%-- Verify if the login details exist on DB to show success page else display fail screen --%>
<%
String pass=null,uid=null;

String a = request.getParameter("user");
String b= request.getParameter("pass");


try
{
Connection con1 = Dbconnection.getConnection();
Statement st1 = con1.createStatement();

String sss1 = "select * from server where username='"+a+"' && password='"+b+"'";
ResultSet rs1=st1.executeQuery(sss1);
if(rs1.next())
{   
%>
<%-- Popup for success message --%>
<script type="text/javascript">
    window.alert("Authority Login Sucess");
    window.location="ServerHome.jsp";
    </script>
<%
}
else
{
response.sendRedirect("ProxyServer.jsp?message=fail");
}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
