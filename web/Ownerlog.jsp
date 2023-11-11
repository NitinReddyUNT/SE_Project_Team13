
<%@page import="java.sql.ResultSet"%>
<%@page import="com.action.Dbconnection"%> <!-- Import for database connection utility -->
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String pass=null,uid=null;

// Retrieving username and password from the request
String a = request.getParameter("user");
String b= request.getParameter("pass");

try
{
    // Establishing database connection
    Connection con1 = Dbconnection.getConnection();
    Statement st1 = con1.createStatement();

    // SQL query to select user details based on username and password
    String sss1 = "select * from owner where username='"+a+"' && password='"+b+"'";
    ResultSet rs1=st1.executeQuery(sss1);
    if(rs1.next())
    {        
        String mskey=rs1.getString("mkey");
        if(mskey.equals("waiting")){
            // Alert and redirect if user is not authorized
            %>
            <script type="text/javascript">
                window.alert("Your Not Authorized by Trusted Authority");
                window.location="DataOwner.jsp";
            </script>
            <%   
        } else {
            // Retrieving user details from ResultSet
            String id=rs1.getString("id");
            String email=rs1.getString("email");

            // Setting session attributes for the logged-in user
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
        // Redirect with a failure message if authentication fails
        response.sendRedirect("DataOwner.jsp?message=fail");
    }
}
catch(Exception e1)
{
    // Printing the exception message
    out.println(e1.getMessage());
}
%>

