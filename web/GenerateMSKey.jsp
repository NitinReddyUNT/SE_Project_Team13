<!--This file is used to generate Membership key for every newly registered data owner-->
<!--This webpage gets executed in Trusted Authority View owners tab when TA clicks on Generate-->
<%@page import="java.util.Random"%>
<%@page import="java.security.KeyPairGenerator"%>
<%@page import="java.security.PublicKey"%>
<%@page import="java.security.PrivateKey"%>
<%@page import="java.security.KeyPair"%>
<%@page import="com.action.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String email=(String)session.getAttribute("email");
String id=request.getParameter("id");
//generating random MS key using Random function
try{
  Random r=new Random();
  int ii=r.nextInt(100000-900)+6000;
    String sql="update owner set mkey='"+ii+"' where id='"+id+"'";
    int i=Queries.getExecuteUpdate(sql);
    if(i>0){
     response.sendRedirect("TA_viewOwners.jsp?msg=success") ; 
    }else{
        response.sendRedirect("TA_viewOwners.jsp?msg=failed") ;
    }    
}catch(Exception e){
  out.println(e);  
}

%>