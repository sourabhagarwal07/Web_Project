<%-- 
    Document   : A
    Created on : Apr 20, 2016, 12:42:37 PM
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
            <p></p> 
           
            <p>Here You Can Manage The Changes For Different Users And View And Manage The DataBase</p><br>
            <%re=st.executeQuery("Select * From ASSETPOL");%>
            <h3 align="center">Employee Lists Table</h3>
            <table align="center" border="3" bgcolor="rgba('211','211','211','0.63')" class="def"><th>Asset</th><th>Company</th><th>Comments</th><th>Delete</th>
            <%while(re.next())
            {%>
            <tr><td> <%=re.getString(1)%>
            </td><td><%=re.getString(2)%>
            </td><td><%=re.getString(3)%>
            </td><td><input type='button' value="Delete" name='delete'/></td></tr>
            <%}%>
            </table><br>
            
            </form>
            <p align='center'><a href='admin.jsp'><input type='button' value='Back'/></a></p>
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
    

            
