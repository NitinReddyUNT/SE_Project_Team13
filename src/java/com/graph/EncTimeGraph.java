/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.graph;

import com.action.Queries;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author GKV
 */
public class EncTimeGraph extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         OutputStream out = response.getOutputStream();
    	   DefaultCategoryDataset bar_chart_servlet = new DefaultCategoryDataset(); 
        try{
           
               String q="select * from enc_time";
               ResultSet r=Queries.getExecuteQuery(q);
               while(r.next()){
                String name=r.getString("name");
                   
                  
                     int c=r.getInt("count"); 
                     
                     bar_chart_servlet.addValue(c, "", name); 
                   }
            
            
        }catch(Exception e){
            System.out.println(e);
        }
        JFreeChart BarChartObject=ChartFactory.createBarChart("Files Encryption Time Graph","","Time(NS)",bar_chart_servlet,PlotOrientation.VERTICAL,true,true,false); 
                response.setContentType("image/png");
                ChartUtilities.writeChartAsPNG(out, BarChartObject, 1000, 400);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
