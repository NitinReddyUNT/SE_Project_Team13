/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import org.junit.Test;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import org.mockito.Mockito;
import static org.junit.Assert.assertEquals;



public class TestUserlog_jsp {

    @Test
    public void owner_login_pass_test() throws ServletException, IOException {
        Userlog_jsp userlog = new Userlog_jsp();
        HttpServletRequest request; 
        HttpServletResponse response;
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        Mockito.when(request.getMethod()).thenReturn("GET");
        Mockito.when(request.getParameter("user")).thenReturn("testuser");
        Mockito.when(request.getParameter("pass")).thenReturn("123");
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        Mockito.when(response.getWriter()).thenReturn(writer);

        userlog.service(request, response);
        writer.flush();
        String responseString = stringWriter.getBuffer().toString().trim();
        
        assertEquals("Login Success", responseString);
    }
    
    @Test
    public void owner_login_fail_test_wrong_credentials() throws ServletException, IOException {
        Userlog_jsp userlog = new Userlog_jsp();
        HttpServletRequest request; 
        HttpServletResponse response;
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        Mockito.when(request.getMethod()).thenReturn("GET");
        Mockito.when(request.getParameter("user")).thenReturn("Test");
        Mockito.when(request.getParameter("pass")).thenReturn("Test");
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        Mockito.when(response.getWriter()).thenReturn(writer);

        userlog.service(request, response);
        writer.flush();
        String responseString = stringWriter.getBuffer().toString().trim();
        
        assertEquals("Login Fail", responseString);
    }
    
}

