<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/aptitude_test", "root","");
    Statement st=con.createStatement();
   %>
<html>
<%
String stud_id=request.getParameter("n1");
String pass=request.getParameter("n2");

      ResultSet res1=st.executeQuery("Select * from student_login where Student_Id='"+stud_id+"'");
      while(res1.next())
      {
          if(pass.equals(res1.getString(3)))
          {
              session.setAttribute("Student_Id",stud_id);
            response.sendRedirect("Main.jsp");
          }
          else
          {
              response.sendRedirect("Login.jsp");
          }
          
      }
   session.setAttribute("Stud_id",stud_id);

%>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
    </body>
</html>
