
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

String sss1 = "select * from user where username='"+a+"' && password='"+b+"'";
ResultSet rs1=st1.executeQuery(sss1);
if(rs1.next())
{   
    String mskey=rs1.getString("mskey");
if(mskey.equals("waiting")){
    
 %>
<script type="text/javascript">
    window.alert("Your Not Authorized by Trusted Authority");
    window.location="UserLogin.jsp";
    </script>
<%   
    
}else{
    String email=rs1.getString("email");
    String id=rs1.getString("id");
    session.setAttribute("mskey",mskey);
    session.setAttribute("username",a);
    session.setAttribute("id",id);
    session.setAttribute("email",email);
%>
<script type="text/javascript">
    window.alert("User Login Sucess");
    window.location="UserHome.jsp";
    </script>
<%
}
}
else
{
response.sendRedirect("UserLogin.jsp?message=fail");
}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
