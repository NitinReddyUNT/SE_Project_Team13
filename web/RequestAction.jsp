<!--author-anjan-->
<%@page import="com.action.Dbconnection"%><!-- There are methods in this custom class for establishing a database connection-->
<%@page import="java.sql.*"%> <!--This import statement imports all classes and interfaces that are required to interact with a database using JDBC-->
   
          <%
         // Retrieve the session's ID, email, mskey, and username.
         String username=(String)session.getAttribute("username");
         String mskey=(String)session.getAttribute("mskey");
         String email=(String)session.getAttribute("email");
         String id=(String)session.getAttribute("id");
          // Obtains the filename and ID by looking through the request parameters.
          String fid=request.getParameter("fid");
          String fname=request.getParameter("fname");
          // get the owner from the request parameters
          String owner=request.getParameter("owner");
          
          
          
          
              try{
        // Attempts to establish a database connection.
	Connection con=Dbconnection.getConnection();
        // To run SQL statements, creates an Statement object.
        Statement s=con.createStatement();
	Statement st=con.createStatement();
 //This inserts a new row into 'request' table.
 int i=st.executeUpdate("insert into request values(null,'"+owner+"','"+id+"','"+username+"','"+fid+"','"+fname+"','waiting','waiting','waiting','waiting','waiting','waiting','waiting')");
// Below If blocks checks whether a row was successfully inserted into a database. 
if(i>0){%>
 <script type="text/javascript">
     // Display an alert message as popup on the user screen
     window.alert("Reqeust sent Successfully");
     window.location="SearchFile.jsp";
     </script>
            
 <%}else{
%>
 <script type="text/javascript">
     // Display an error message as popup on the user screen
     window.alert("Reqeust sent Failed");
     window.location="SearchFile.jsp";
     </script>
            
 <%
     }
    }catch(Exception e)
              {
               //prints exception
                  out.println(e);
              }%>