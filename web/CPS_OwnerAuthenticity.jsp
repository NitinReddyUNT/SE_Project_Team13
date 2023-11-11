
<%@page import="com.action.Queries"%>
<%@page import="com.action.Dbconnection"%>
<%@page import="java.sql.*"%>
   
          <%
           
          String oid=request.getParameter("oid");
          String fid=request.getParameter("fid");
          String rid=request.getParameter("rid");
          String fname=request.getParameter("fname");
          
          
          
              try{
	Connection con=Dbconnection.getConnection();
        Statement s=con.createStatement();
            
	Statement st=con.createStatement();
        ResultSet r=Queries.getExecuteQuery("select * from file where id='"+fid+"'and owner='"+oid+"'");
        if(r.next()){
        String url="http://localhost:8084/AFEGUARDING_THE_DIGITAL_WORLD_DATA_SHARING_WITH_PROXY/PS_ReEncFile.jsp?id="+rid+"&fid="+fid+"&fname="+fname+"";    
            
 int i=st.executeUpdate("update request set owner_auth='Verified',check_url='"+url+"' where id='"+rid+"'");
 if(i>0){%>
 <script type="text/javascript">
     window.alert("Owner Verification Successful..!!");
     window.location="CSP_ViewRequest.jsp";
     </script>
            
 <%}else{
%>
 <script type="text/javascript">
     window.alert("Processing Failed");
     window.location="CSP_ViewRequest.jsp";
     </script>
            
 <%
     }
     }else{
%>
 <script type="text/javascript">
     window.alert("Owner Authenticity Failed");
     window.location="CSP_ViewRequest.jsp";
     </script>
            
 <%
}
    }catch(Exception e)
              {
                  out.println(e);
              }%>