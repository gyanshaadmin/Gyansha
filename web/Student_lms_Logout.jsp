<%-- 
    Document   : Logout
    Created on : Apr 21, 2014, 3:19:06 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% try { %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <script type="text/javascript">
           alert("Succesfully logout");
           <% session.invalidate(); %>
               location.replace("Student_lms_Login.jsp");
       </script>
       <script>
           window.history(0);
       </script>
    </head>
    <body onload="back();">
   
    
    </body>
</html>
<%
}
catch(Exception e)
{
    System.out.print(e);
}


%>
