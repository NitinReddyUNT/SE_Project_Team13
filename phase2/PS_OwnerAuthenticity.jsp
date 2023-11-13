<!--on proxy server authorizing re-encrypt request from owner this page will appear -->
<!--this page displays alert message based on whether the re-encrypt request is sent to CSP or not-->
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.*"%>
  <!--setting up connection with database to update owner authencity request details--> 
          <%
           
          String rid=request.getParameter("id");
          
              try{
	Connection con=Dbconnection.getConnection();
        Statement s=con.createStatement();
            
	Statement st=con.createStatement();
 int i=st.executeUpdate("update request set owner_auth='Pending' where id='"+rid+"'");
 //display alert message based on the request sent to CSP
 if(i>0){%>
 <script type="text/javascript">
     window.alert("Owner authenticity Request Sent to CSP");
     window.location="SP_ViewRequest.jsp";
     </script>
            
 <%}else{
%>
 <script type="text/javascript">
     window.alert("Reqeust sent Failed");
     window.location="SP_ViewRequest.jsp";
     </script>
            
 <%
     }
    }catch(Exception e)
              {
                  out.println(e);
              }%>