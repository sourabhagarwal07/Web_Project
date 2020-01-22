


<%-- 
    Document   : test
    Created on : Mar 28, 2016, 9:26:27 PM
    Author     : Sourabh Agarwal
--%>

<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Jsp</title>
    </head>
    <body align="center">
        <h1>Hello World!</h1>
        <h2>IP Address:
        <%
            out.println(request.getRemoteAddr());
        %>
        </h2>
        
    </body>
</html>
