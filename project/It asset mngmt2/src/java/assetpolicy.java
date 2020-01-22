/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
@WebServlet(urlPatterns = {"/assetpolicy"})
public class assetpolicy extends HttpServlet {

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
        String Ename=request.getParameter("Feedback-Asset");
        String Eid=request.getParameter("Feedback-company");
        String Eemail=request.getParameter("asset-comment");
       
        
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
           int i= st.executeUpdate("Insert into ASSETPOL values('"+Ename+"','"+Eid+"','"+Eemail+"')");
            
            if(i>0)
            {
            out.println("<html><head><h1 align='center'><b><i>Database-Storage</i></b></h1>");
            out.println("<link href='Itasset.css' type='text/css' rel='stylesheet'/>");
            out.println("</head>");
            out.println("<body align='center' background='6899096-abstract-wallpaper.jpg'><h3>Thank You For Your Valuable FeedBack</h3><br>");
            out.println("The Data We Have Recieved Are Following:-");
            Enumeration e = request.getParameterNames();
            out.println("<table border=3 align='center'><th>Attributes</th><th>VALUES</th>");
            while(e.hasMoreElements())
            {
            String pname = (String)e.nextElement();
            out.println("<tr><td>"+pname+"</td> ");
            String pvalue = request.getParameter(pname);
            out.println("<td>"+pvalue+"</td></tr>");
            }
            out.println("</table>");
            out.println("<br>");
            out.println("Please Click This Button To Go Back");
            out.println("<a href='ITassetmngt.html'><input type='button' value='Back'/></a>");
            out.println("</body></html>");
            out.close();
            }
            else{
            out.println("Error Occured");
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
