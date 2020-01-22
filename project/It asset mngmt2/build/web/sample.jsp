<%-- 
    Document   : sample
    Created on : Mar 21, 2016, 12:29:10 AM
    Author     : Sourabh Agarwal
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Details</title>
    <h1></h1>
        <b>Employee Details:-</b> 
    </head>
    <body>
        <form name="Sample" method="post" action="sample.jsp">
        <p> Name:<input type="text" name="name"/></p>
        <p> Password:<input type="password" name="password"/></p>
        <p align="center"><input type="submit"/></p>
            <% Enumeration e = request.getParameterNames();
            while(e.hasMoreElements())
            {
            String pname = (String)e.nextElement();
            out.println(pname);
            String pvalue = request.getParameter(pname);
            out.println(pvalue);
            }%>
        </form> 
    </body>
</html>
 