<%-- 
    Document   : find
    Created on : Apr 11, 2016, 12:13:24 AM
    Author     : Sourabh Agarwal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<%  String id=request.getParameter("Employee-Id");
    String a = null;
    String b = null;
    String c = null;
    String d = null;
    String e = null;
    String f = null;
    String g = null;
    String h = null;
    String i = null;
    String j = null;
   
   
    Connection conn;
        ResultSet rs,re;
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
           rs=st.executeQuery("Select * from EMPLOYEE where EMPLOYEE_ID='"+id+"'");%>
            <h3 align="center">Employee Lists Table</h3>
            <table align="center" border="3" class="def"><th>Employee Name</th><th>Employee Id</th><th>Employee Email</th><th>Employee Contact</th><th>Employee Superior Id</th><th>Employee Superior</th><th>Employee Organisation</th><th>Employee Building</th><th>Employee Department</th><th>Employee Remarks</th><th>Employee Username</th><th>Employee Position</th><th>Delete</th>
            <%while(rs.next())
            {%>
            <tr><td><%=rs.getString(1)%>
            </td><td><%=rs.getString(2)%>
            </td><td><%=rs.getString(3)%>
            </td><td><%=rs.getString(4)%>
            </td><td><%=rs.getString(5)%>
            </td><td><%=rs.getString(6)%>
            </td><td><%=rs.getString(7)%>
            </td><td><%=rs.getString(8)%>
            </td><td><%=rs.getString(9)%>
            </td><td><%=rs.getString(10)%>
            </td><td><%=rs.getString(11)%>
            </td><td><%=rs.getString(13)%>    
            </td></tr>");
            <%}%>
            </table><br>
             </form>
            <p align='center'><a href='ITassetmngt.html'><input type='button' value='Logout' class='fef'/></a></p>
            </body>
            </html>
           <% 
           }
           catch(Exception e1)
           {
            out.println(e1);
           }
        finally 
        {
        out.close();
        }
        
   %>
    

           %>
<!DOCTYPE html>

