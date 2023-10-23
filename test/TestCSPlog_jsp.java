/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import javax.servlet.ServletException;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import org.mockito.Mockito;


public class TestCSPlog_jsp {

    @Test
    public void csp_login_pass_test() throws ServletException, IOException {
        CSPlog_jsp csplog = new CSPlog_jsp();
        HttpServletRequest request; 
        HttpServletResponse response;
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        Mockito.when(request.getMethod()).thenReturn("GET");
        Mockito.when(request.getParameter("user")).thenReturn("csp");
        Mockito.when(request.getParameter("pass")).thenReturn("csp");
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        Mockito.when(response.getWriter()).thenReturn(writer);

        csplog.service(request, response);
        writer.flush();
        String responseString = stringWriter.getBuffer().toString().trim();
        
        assertEquals("Login Success", responseString);
    }
    
    @Test
    public void csp_login_fail_test_wrong_credentials() throws ServletException, IOException {
        CSPlog_jsp csplog = new CSPlog_jsp();
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

        csplog.service(request, response);
        writer.flush();
        String responseString = stringWriter.getBuffer().toString().trim();
        
        assertEquals("Login Fail", responseString);
    }
    
}

