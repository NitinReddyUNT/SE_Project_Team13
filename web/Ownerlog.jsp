
<%@page import="java.sql.ResultSet"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String pass=null,uid=null;

String a = request.getParameter("user");
String b= request.getParameter("pass");


try
{
Connection con1 = Dbconnection.getConnection();
Statement st1 = con1.createStatement();

String sss1 = "select * from owner where username='"+a+"' && password='"+b+"'";
ResultSet rs1=st1.executeQuery(sss1);
if(rs1.next())
{        
String mskey=rs1.getString("mkey");
if(mskey.equals("waiting")){
    
 %>
<script type="text/javascript">
    window.alert("Your Not Authorized by Trusted Authority");
    window.location="DataOwner.jsp";
    </script>
<%   
    
}else{
    String id=rs1.getString("id");
    String email=rs1.getString("email");

    session.setAttribute("mskey",mskey);
    session.setAttribute("username",a);
    session.setAttribute("email",email);
     session.setAttribute("id",id);
%>
<script type="text/javascript">
    window.alert("Owner Login Sucess");
    window.location="OwnerHome.jsp";
    </script>
<%
}
}
else
{
response.sendRedirect("DataOwner.jsp?message=fail");
}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
