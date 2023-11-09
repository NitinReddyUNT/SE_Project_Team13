<%@page import="java.sql.Statement"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%
// Declarations for variables (currently unused)
String pass = null, uid = null;

// Extract user input (username and password) from  the request parameters
String a = request.getParameter("user");
String b = request.getParameter("pass");

try {
    // Establish a connection to the database using the Dbconnection class
    Connection con1 = Dbconnection.getConnection();
    
    // Create a statement for executing SQL queries
    Statement st1 = con1.createStatement();

    // Construct SQL query to validate user credentials
    String sss1 = "select * from user where username='" + a + "' && password='" + b + "'";
    
    // Execute the query
    ResultSet rs1 = st1.executeQuery(sss1);

    // Check if user authentication is successful
    if (rs1.next()) {
        // Retrieve user details from the result set
        String mskey = rs1.getString("mskey");
        String email = rs1.getString("email");
        String id = rs1.getString("id");

        // Store user information in session attributes for later use
        session.setAttribute("mskey", mskey);
        session.setAttribute("username", a);
        session.setAttribute("id", id);
        session.setAttribute("email", email);
%>
        <!-- Display a JavaScript alert upon successful login -->
        <script type="text/javascript">
            window.alert("User Login Success");

            // Redirect the user to the UserHome.jsp page after successful login
            window.location = "UserHome.jsp";
        </script>
<%
    } else {
        // Redirect the user to the login page with a failure message if authentication fails
        response.sendRedirect("UserLogin.jsp?message=fail");
    }
} catch (Exception e1) {
    // Handle any exceptions and print the message
    out.println(e1.getMessage());
}
%>