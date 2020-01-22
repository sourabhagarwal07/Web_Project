<%-- 
    Document   : logout
    Created on : Apr 17, 2016, 5:17:47 PM
    Author     : Sourabh Agarwal
--%>

<html>
    <head>
  
    </head>
    <body>
          <h3>You Have been Successfully Logged Out</h3>
          <%session.invalidate();%>
          <p>Please Wait While You Are Been Redirected.</p> 
          <%response.sendRedirect("adminportal.html");%>
    </body>
</html>
