<%-- 
    Document   : admin
    Created on : Apr 6, 2016, 3:02:50 AM
    Author     : Sourabh Agarwal
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("Administrator-Id");
    String user=request.getParameter("username");
    String pass=request.getParameter("password");
    String a = null;
    String b= null;
    String c= null;
    
      session = request.getSession(true);
      session.setAttribute("username",user);
      session.setAttribute("password",pass);
      Date createTime = new Date(session.getCreationTime());
      Date lastAccessTime = new Date(session.getLastAccessedTime());

    Connection conn;
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
           }
           if((a.equals(id))&&(b.equals(user))&&(c.equals(pass))){
           
%>
           
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
            <h3 align="center">Administrative Actions And Tasks</h3>
            <table border="3" align="center">
                <th>Employee</th><th>Old Assets</th><th>New Assets</th><th>Company Assets</th><th>Asset FeedBack</th><th>Feedback</th>
                <tr><td><a href="E.jsp"><input type="button" value="Employee"/></a></td>
                <td><a href="O.jsp"><input type="button" value="Old Assets"/></a></td>
                <td><a href="N.jsp"><input type="button" value="New Assets"/></a></td>
                <td><a href="CA.jsp"><input type="button" value="Company Assets"/></a></td>
                <td><a href="A.jsp"><input type="button" value="Asset Feedback"/></a></td>
                <td><a href="CF.jsp"><input type="button" value="Feedback"/></a></td></tr>
            </table>
            
       
             </form>
            <p align='center'><a href='logout.jsp'><input type='button' value='Logout' class='fef'/></a></p>
            </body>
            </html>
           <% 
           }
           else
           {
           %>    
           <b>You Have Entered The Wrong Details Please Try Again!!!</b><br>
           CLICK THIS TO GO BACK<br>
           <a href='adminportal.html'><input type='button' value='Back'/></a>
           <%
           }
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
    
