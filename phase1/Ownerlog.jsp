<%@page import="java.sql.ResultSet"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
// Defining variables
String pass=null,uid=null;

// Retrieving username and password from the form
String a = request.getParameter("user");
String b= request.getParameter("pass");

// Establishing database connection
try
{
  Connection con1 = Dbconnection.getConnection();
  Statement st1 = con1.createStatement();

  // Creating SQL query to retrieve owner data
  String sss1 = "select * from owner where username='"+a+"' && password='"+b+"'";

  // Executing SQL query and storing the result in a ResultSet object
  ResultSet rs1=st1.executeQuery(sss1);

  // Checking if the username and password match any records in the database
  if(rs1.next())
  {
    // Retrieving owner ID and email address from the ResultSet object
    String id=rs1.getString("id");
    String email=rs1.getString("email");

    // Storing owner ID, email address, and username in the session object
    session.setAttribute("username",a);
    session.setAttribute("email",email);
    session.setAttribute("id",id);

    // Displaying success message and redirecting to OwnerHome.jsp page
%>
<script type="text/javascript">
  window.alert("Owner Login Sucess");
  window.location="OwnerHome.jsp";
</script>
<%
  }
  else
  {
    // Displaying error message and redirecting to DataOwner.jsp page
    response.sendRedirect("DataOwner.jsp?message=fail");
  }
}

// Handling any exceptions that may occur
catch(Exception e1)
{
  // Printing the exception message to the console
  out.println(e1.getMessage());
}
%>