/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.*;
import java.util.*;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sourabh Agarwal
 */
@WebServlet(urlPatterns = {"/Administrator"})
public class Administrator extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Ename=request.getParameter("Administrator-Name");
        String Eid=request.getParameter("Administrator-Id");
        String Eemail=request.getParameter("Administrator-Email");
        String Econtact=request.getParameter("Administrator-contact");
        String Esupid=request.getParameter("Administrator-superior-ID");
        String Eorganisation=request.getParameter("Administrator-organisation");
        String Ebuilding=request.getParameter("Administrator-building");
        String Edept=request.getParameter("Administrator-department");
        String Esup=request.getParameter("Administrator-superior");
        String Euname=request.getParameter("Admin-username");
        String Epass=request.getParameter("Admin-password");
        String Erpass=request.getParameter("Admin-repassword");
        String Eposition=request.getParameter("Admin-position");
        String Eremarks=request.getParameter("Administrator-Remarks");
        String site=new String("ITassetmngt.html");
        
           //Auto Refresh
Connection conn;
ResultSet rs;
try {
Class.forName("oracle.jdbc.driver.OracleDriver");       //JDBC Connection
} 
catch (ClassNotFoundException ex) 
{
ex.printStackTrace();
}
        try {
            conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system", "sourabh007");
            Statement st=conn.createStatement(); 
           int i= st.executeUpdate("Insert into Administrator values('"+Ename+"','"+Eid+"','"+Eemail+"','"+Econtact+"','"+Esupid+"','"+Esup+"','"+Eorganisation+"','"+Ebuilding+"','"+Edept+"','"+Eremarks+"','"+Euname+"','"+Epass+"','"+Eposition+"')");
            if(i>0)
            {
            out.println("<html><head><h1 align='center'><b><i>Database-Storage</i></b></h1><hr>");
            out.println("<link href=\"Itasset.css\" type=\"text/css\" rel=\"stylesheet\"/>");
            out.println("</head>");
            out.println("<body align='center' background='6899096-abstract-wallpaper.jpg'><b><i>You Have Been SuccessFully Registered</i></b><br>");
            out.println("<b>The Data We Have Recieved Are Following:-</b>");
            Enumeration e = request.getParameterNames();
            out.println("<table border=3 align='center'><th><b>Attributes</b></th><th><b>VALUES</b></th>");
            while(e.hasMoreElements())
            {
            String pname = (String)e.nextElement();
            out.println("<tr><td><b><i>"+pname+"</i></b></td> ");
            String pvalue = request.getParameter(pname);
            out.println("<td><b>"+pvalue+"</b></td></tr>");
            }
            out.println("</table>");
            out.println("<br>CLICK THIS BUTTON TO GO BACK<a href='adminportal.html'><input type='button' value='Back'/></a></body></html>");
            out.close();
            }
            else{
            out.println("Error Occured Try Again");
            }
           
            
        } 
        
        catch(SQLException e){
            e.printStackTrace();
                    }
        finally {
            out.close();
        }
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
