<%-- 
    Document   : E
    Created on : Apr 19, 2016, 6:01:16 PM
    Author     : Sourabh Agarwal
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String id=request.getParameter("Administrator-Id");
    Connection conn;
    String a=null;
    String b=null;
    String c=null;
        ResultSet rs,re,rt,rd,rg;
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
           rs=st.executeQuery("Select * from ADMINISTRATOR where ADMIN_ID='"+id+"'");
           while(rs.next())
           {
           a=rs.getString(2);
           b=rs.getString(11);
           c=rs.getString(12);
           }%>
<html>
            <head>
            <title>Administrator</title>
            <link href="Itasset.css" type="text/css" rel="stylesheet"/>
            <h1 align='center'>Welcome to The Administrative Portal</h1><hr>
            </head>
            <body background='6899096-abstract-wallpaper.jpg'>
            <form>
           
            <marquee class="fef">A Warm Greetings From The Developers</marquee><br>
            <p>Date:&nbsp;&nbsp;<%=(new java.util.Date()).toLocaleString()%></p>
            <p>Administrator Here You can manage all your employees and have a llok at how many number of employees are working under you</p>
            <p>Here You Can Manage The Changes For Different Users And View And Manage The DataBase</p><br>
            <%re=st.executeQuery("Select * From Employee");%>
            <h3 align="center">Employee Lists Table</h3>
            <table align="center" border="3" bgcolor="rgba('211','211','211','0.63')" class="def"><th>Employee Name</th><th>Employee Id</th><th>Employee Email</th><th>Employee Contact</th><th>Employee Superior Id</th><th>Employee Superior</th><th>Employee Organisation</th><th>Employee Building</th><th>Employee Department</th><th>Employee Remarks</th><th>Employee Username</th><th>Employee Position</th><th>Delete</th>
            <%while(re.next())
            {%>
            <tr><td> <%=re.getString(1)%>
            </td><td><%=re.getString(2)%>
            </td><td><%=re.getString(3)%>
            </td><td><%=re.getString(4)%>
            </td><td><%=re.getString(5)%>
            </td><td><%=re.getString(6)%>
            </td><td><%=re.getString(7)%>
            </td><td><%=re.getString(8)%>
            </td><td><%=re.getString(9)%>
            </td><td><%=re.getString(10)%>
            </td><td><%=re.getString(11)%>
            </td><td><%=re.getString(13)%>    
            </td><td><input type='button' value="Delete" name='delete'/></td></tr>
            <%}%>
            </table><br>
            
            <p align='center'><a href="admin.jsp"><input type='button' value='Back'/></a></p>
            </form>
            </body>
            </html>
           <% 
           
          
           }
           catch(Exception e)
           {
            out.println(e);
           }
        finally 
        {
        out.close();
        }
        
    %>
    

            
