<%-- 
    Document   : Student_lms_Video
    Created on : May 6, 2014, 10:10:03 AM
    Author     : Administrator
--%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
          
        String s=null;
 String content=new String("");
     Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/student_lms","root","");
    Statement st=con.createStatement();

      ResultSet res=st.executeQuery("Select * from video where Class_Id='1' and Chapter_Id='1'");
      while(res.next())
      {
        content=res.getString("Video_Data");
        out.print(content);
        s=res.getString(3);
      }
      con.close();
     
   
      %>
      
    <video id="custom_video_play" width="400" controls="controls">
        <source src=<%= s%> type="video/mp4">
            <source src="mov_bbb.flv" type="video/flv"> Browser Not Supporting </video>
 
    <script> var myVideo=document.getElementById("custom_video_play"); function makeBig() { myVideo.width=650; } function makeSmall() { myVideo.width=350; } function makeNormal() { myVideo.width=450; }
    </script> <div style="text-align:left"> 
        <button onclick="makeBig()">Adjust: Large Screen</button> <button onclick="makeSmall()">Adjust: Small Screen</button> 
        <button onclick="makeNormal()">Adjust: Normal Screen</button> 
        <p></p> 
    </body> 
   
      
   
      
  
        
        
        
   
</html>
