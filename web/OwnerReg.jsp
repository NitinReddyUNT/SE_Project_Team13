<!--This page is used to display whether owner registration is successful or not-->
<%@page import="com.action.Queries"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.*"%>
<!--Getting owner details to search for owner in database-->
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
//Setting up connection with database to insert data owner report
Connection con=Dbconnection.getConnection();
Statement st=con.createStatement();
	ResultSet rs=Queries.getExecuteQuery("select count(*) from owner where email='"+email+"'");
	if(rs.next())
	{
	 count=rs.getInt(1);
	 if(count==0)
	{
		int i=st.executeUpdate("insert into owner values(null,'"+username+"','"+password+"','"+email+"','"+dob+"','"+address+"','"+gender+"','"+mobile+"','waiting')");
		
		if(i==0)
		{
                    //If no record is inserted, display registration failed 
		%>
			<script type="text/javascript">
				window.alert("Owner Resiter Fail..!");
				window.location="OwnerRegister.jsp";
			</script>
		<%
		}
		else
		{
//If a record is inserted, display registration successful
		%>
			<script type="text/javascript">
				window.alert("New Owner Register Success..!");
				window.location="OwnerRegister.jsp";
			</script>
		<%
		}
	}
	else
	{
//If the owner is a duplicate display owner is already exists
	%>
			<script type="text/javascript">
				window.alert("Onwer Alredy Exist For This User ID...");
				window.location="OwnerRegister.jsp";
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