<%-- 
    Document   : employeep
    Created on : Apr 15, 2016, 2:29:09 PM
    Author     : Sourabh Agarwal
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("Employee-Id");
    String user=request.getParameter("Employee-department");
    String pass=request.getParameter("Employee-password");
    HttpSession sess = request.getSession(); 
    sess.setAttribute("Employee-department", user);
    sess.setAttribute("Employee-password", pass);
    sess.setAttribute("Employee-Id", id);
    String a = null;
    String b= null;
    String c= null;
    String d= null;
    Connection conn;
        ResultSet rs,re,rt,rd;
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
           rs=st.executeQuery("Select * from EMPLOYEE where EMPLOYEE_ID='"+id+"'");
           while(rs.next())
           {
           a=rs.getString(2);
           b=rs.getString(9);
           c=rs.getString(12);
           d=rs.getString(1);
           }
           
         
           if((a.equals(id))&&(b.equals(user))&&(c.equals(pass))){
           
%>
           
            <html>
            <head>
            <title>Employee</title>
            <link href="Itasset.css" type="text/css" rel="stylesheet"/>
            <h1 align='center'>Welcome to The Employee Portal</h1><hr>
            <script type="text/javascript">
             function myFunction() {
             document.getElementById("demo").innerHTML = Math.random();
               }
               function myFunction1() {
             document.getElementById("demo1").innerHTML = Math.random();
               }
            </script>
            </head>
            <body background='6899096-abstract-wallpaper.jpg'>
             <form>
                 <input type="hidden" name="copy_id" value="id"/>
                 <input type="hidden" name="copy_dept" value="user"/>
                 <input type="hidden" name="copy_pass" value="pass"/>
            <marquee class="fef">A Warm Greetings From The Developers</marquee><br>
            <p>Welcome Employee: &nbsp;&nbsp;<b><i><%=d%></i></b></p><br>
            <p>ID:&nbsp;<%=a%></p>
            <p>Here You Can Track the Assets And Request to administrator and perform different Stuffs</p><br>
            <%re=st.executeQuery("Select * From Employee where EMPLOYEE_ID='"+a+"'");%>
            <h3 align="center">Employee Details Table</h3>
            <table align="center" border="3" bgcolor="rgba('211','211','211','0.63')" class="def"><th>Employee Name</th><th>Employee Id</th><th>Employee Email</th><th>Employee Contact</th><th>Employee Superior Id</th><th>Employee Superior</th><th>Employee Organisation</th><th>Employee Building</th><th>Employee Department</th><th>Employee Remarks</th><th>Employee Username</th><th>Employee Position</th><th>Request</th><th>Track</th>
            <%while(re.next())
            {%>
            <tr><td><%=re.getString(1)%>
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
            </td>
            <td><input type="button" value="Request" name="request"</td>
            <td><input type="button" value="Track" name="track"</td></tr>
            <%}%>
            </table><br>
            
            
            
             <%rt=st.executeQuery("Select * From NEW_ASSET where EMPLOYEE_ID='"+a+"'");%>
             <h3 align="center">Employee New Asset Lists Table</h3>
             <table align="center" border="3">
                 <th>Employee ID</th><th>Employee Name</th><th>Asset Type</th><th>Asset Issue Date</th><th>Asset Model</th><th>Asset Quantity</th><th>Prediction</th><th>Prediction %</th>    
             <%while(rt.next())
            {%>
            <tr><td> <%=rt.getString(2)%>
            </td><td><%=rt.getString(1)%>
            </td><td><%=rt.getString(12)%>
            </td><td><%=rt.getString(11)%>
            </td><td><%=rt.getString(13)%>
            </td><td><%=rt.getString(14)%>
            </td><td><input type='button' value="Predict" name='Predict' onclick="myFunction()"/></td>
            <td id="demo"></td></tr>
            <%}%>
             </table><br>
             
             
             
             
             <%rd=st.executeQuery("Select * From OLD_ASSET where EMPLOYEE_ID='"+a+"'");%>
             <h3 align="center">Employee Old Assets Lists Table</h3>
             <table align="center" border="3">
                 <th>Employee ID</th><th>Employee Name</th><th>Asset Type</th><th>Asset Issue Date</th><th>Asset Model ID</th><th>Asset Organisation ID</th><th>Asset Remarks</th><th>Asset Request</th><th>Prediction</th><th>Prediction %</th>    
             <%while(rd.next())
            {%>
            <tr><td> <%=rd.getString(2)%>
            </td><td><%=rd.getString(1)%>
            </td><td><%=rd.getString(12)%>
            </td><td><%=rd.getString(11)%>
            </td><td><%=rd.getString(13)%>
            </td><td><%=rd.getString(14)%>
            </td><td><%=rd.getString(15)%>
            </td><td><%=rd.getString(16)%>    
            </td><td><input type='button' value="Predict" name='Predict' onclick="myFunction1()"/></td>
            <td id="demo1"></td></tr>
            <%}%>
             </table><br>
             
             <h3 align="center">Extra Features</h3> 
             <table align="center" border="3" cellspacing="5px">
             <th>Facebook</th><th>Twitter</th><th>Gmail</th><th>News</th><th>Much More</th>
             <tr><td align="center"><img src="fblogo.png" alt="Facebook" height="50" widht="50"/></td>
                 <td align="center"><img src="twitter logo.jpg" alt="twitter" height="50" width="50"/></td>
                 <td align="center"><img src="googlelogo.png" alt="gmail" height="50" width="50"/></td>
                 <td align="center"><img src="TOI.png" alt="Times Of India" height="50" width="50"/></td>
                 <td rowspan="2" align="center"><select>
                                 <option>Games</option>
                                 <option>Quotes</option>
                                 <option>Hobbies</option>
                                 <option>More..</option>
                             </select></td></tr>
             <tr>
                 <td><a href="https://www.facebook.com/"><input type="button" value="Facebook"/></a></td>
                 <td><a href="https://www.twitter.com/"><input type="button" value="Twitter"/></a></td>
                 <td><a href="https://www.gmail.com/"><input type="button" value="Gmail"/></a></td>
                 <td><a href="https://www.timesofindia.com/"><input type="button" value="Times Of India"/></a></td>
             </tr>
             </table>
            
             </form>
            <p align='center'><a href='ITassetmngt.html'><input type='button' value='Logout' class='fef'/></a></p>
            </body>
            </html>
           <% 
           }
           else
           {
           %>    
           <b>You Have Entered The Wrong Details Please Try Again!!!</b><br>
           CLICK THIS TO GO BACK<br>
           <a href='employeelogin.html'><input type='button' value='Back'/></a>
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
    

