<%-- 
    Document   : CA
    Created on : Apr 20, 2016, 12:42:16 PM
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
            <p>Welcome Administrator: &nbsp;&nbsp;<b><i><%=b%></i></b></p><br>
            <p>ID:&nbsp;<%=a%></p>
            <p>Here You Can Manage The Changes For Different Users And View And Manage The DataBase</p><br>
            <%rg=st.executeQuery("Select * From Asset_Register");%>  
             <h3 align="center">Company Assets Lists Table</h3>
             <table align="center" border="3">
                 <th>Asset</th><th>Model</th><th>Quantity</th>
                  <%while(rg.next())
            {%>
            <tr><td> <%=rg.getString(2)%>
            </td><td><%=rg.getString(3)%>
            </td><td><%=rg.getString(1)%>
            </td></tr>
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
    

            

