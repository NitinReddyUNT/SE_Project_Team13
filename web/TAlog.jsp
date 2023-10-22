
<%@page import="java.sql.Statement"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%
String pass=null,uid=null;

String a = request.getParameter("user");
String b= request.getParameter("pass");


try
{
Connection con1 = Dbconnection.getConnection();
Statement st1 = con1.createStatement();

String sss1 = "select * from ta where username='"+a+"' && password='"+b+"'";
ResultSet rs1=st1.executeQuery(sss1);
if(rs1.next())
{   
%>
<script type="text/javascript">
    window.alert("Authority Login Sucess");
    window.location="TAHome.jsp";
    </script>
<%
}
else
{
response.sendRedirect("TA.jsp?message=fail");
}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
