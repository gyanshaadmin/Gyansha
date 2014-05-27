<%-- 
    Document   : Logout
    Created on : Apr 21, 2014, 3:19:06 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
     String s=(String)session.getAttribute("Stud_Id");
       session.invalidate();
       response.sendRedirect("Login.jsp");
       
       %>
    </body>
</html>
