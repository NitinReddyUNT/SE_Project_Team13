<%@page import="com.action.Queries"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.*"%>
<%
	
	
	int count=0;
	String username=request.getParameter("user");
       
	String password=request.getParameter("pass");
        String dob=request.getParameter("dob");
	String email=request.getParameter("email");
	String gender=request.getParameter("gender");
        String address=request.getParameter("address");
	
        String mobile=request.getParameter("mobile");
	
	
	
	try
	{

Connection con=Dbconnection.getConnection();
Statement st=con.createStatement();
	ResultSet rs=Queries.getExecuteQuery("select count(*) from user where email='"+email+"'");
	if(rs.next())
	{
	 count=rs.getInt(1);
	 if(count==0)
	{
		int i=st.executeUpdate("insert into user values(null,'"+username+"','"+password+"','"+email+"','"+dob+"','"+address+"','"+gender+"','"+mobile+"','waiting')");
		
		if(i==0)
		{
		%>
			<script type="text/javascript">
				window.alert("Resiter Fail..!");
				window.location="Register.jsp";
			</script>
		<%
		}
		else
		{
		%>
			<script type="text/javascript">
				window.alert("New User Register Success..!");
				window.location="Register.jsp";
			</script>
		<%
		}
	}
	else
	{
	%>
			<script type="text/javascript">
				window.alert("User Alredy Exist For This User ID...");
				window.location="Register.jsp";
			</script>
		<%
	}
	}
	}
	catch(Exception e)
	{
	out.println(e);
	}
%>                                                                                                                                                                                                                                                             