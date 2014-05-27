<%-- 
Create By : Prabhat Jain
It is used to validate the user
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="c" class="com.MyConnection" ></jsp:useBean>
<!DOCTYPE html>
 
<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <body> 
<%
    try
    {
        String email_id=request.getParameter("n1");
        String pass=request.getParameter("n2");
        Connection con=c.getConnection();
        Statement st=con.createStatement();
        boolean flag=false;
      ResultSet res1=st.executeQuery("Select * from student_login where email_id='"+email_id+"' and Student_Password='"+pass+"'");
      while(res1.next())
      {
          
          
      
          if(pass.equals(res1.getString(3)) && email_id.equals(res1.getString(4)))
          {
              session.setAttribute("Student_Id",res1.getString(1));
              session.setAttribute("Student_Name",res1.getString(2));
              flag=true;
          }
      }
      if(flag==true)
      {
           response.sendRedirect("Student_lms_Home.jsp");
      }
       else
        {
              //if user invalid, redirects to login page
           %>
           <script type="text/javascript">
                  alert('Your User Name and Password is not correct');
                   location.replace("Student_lms_Login.jsp");
             </script>
                  <%
             
          }
          
      
    }
    catch(SQLException e)
    {
       %>
           <script type="text/javascript">
                  alert('<%=e%>');
                   location.replace("Student_lms_Login.jsp");
             </script>
                  <%
    }
     catch(Exception e2)
    {
       %>
           <script type="text/javascript">
                  alert('<%=e2%>');
                   location.replace("Student_lms_Login.jsp");
             </script>
                  <%
    }

%>    
   
  
    
    </body>
</html>
