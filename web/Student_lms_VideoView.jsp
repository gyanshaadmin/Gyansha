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
        
        
  <script type="text/javascript">

    function setupVideo() {
       // You will probably get your video name differently
       var videoName = "http://localhost:8080/WebApplication1/a.mp4";

       // Get all of the uri's we support
       var indexOfExtension = videoName.lastIndexOf(".");
       //window.alert("found index of extension " + indexOfExtension);
       var extension = videoName.substr(indexOfExtension, videoName.length - indexOfExtension);
       //window.alert("extension is " + extension);
       var ogguri = encodeURI(videoName.replace(extension, ".ogv"));
       var webmuri = encodeURI(videoName.replace(extension, ".webm"));
       var mp4uri = encodeURI(videoName.replace(extension, ".mp4"));
       //window.alert(" URI is " + webmuri);


       // Get the video element
       var v = document.getElementById("media");
       //window.alert(" media is " + v);

       // Test for support
       if (v.canPlayType("video/ogg")) {
            v.setAttribute("src", ogguri);
           window.alert("can play ogg");
       }
       else if (v.canPlayType("video/webm")) {
           v.setAttribute("src", webmuri);
          window.alert("can play webm");
       }
       else if (v.canPlayType("video/mp4")) {
           v.setAttribute("src", mp4uri);
           //window.alert("can play mp4");
       }
       else {
           window.alert("Can't play anything");
       }

      v.load();
      v.play();
  }
      </script>
    </head>
    <body onload="setupVideo();">
       <%
         String chapter_id=(String)request.getParameter("flag");
         int chapter_idd=Integer.parseInt(chapter_id);
         
         String class_id=(String)request.getParameter("flag1");
         int class_idd=Integer.parseInt(class_id);
         
          String s=null;  
     Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/student_lms","root","");
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("Select * from video where Chapter_Id='"+chapter_idd+"' and Class_Id='"+class_idd+"'");
   while(res.next())
   {
       s=res.getString(2);
   }
   
      
  
      %>
      
    <video id="custom_video_play" width="400" controls="controls" >
        <source src="vedios/<%=s%>" type="video/mp4" style="alignment-adjust: central" >
            <source src="mov_bbb.flv" type="video/flv" > Browser Not Supporting </video>
 
    <script> var myVideo=document.getElementById("custom_video_play"); 
        function makeBig()
        { 
            myVideo.width=850;
        } 
        function makeSmall()
        { 
            myVideo.width=350; 
        } 
        function makeNormal() 
        {
            myVideo.width=450; 
        }
    </script> <div style="text-align:left"> 
        <button onclick="makeBig()">Adjust: Large Screen</button> <button onclick="makeSmall()">Adjust: Small Screen</button> 
        <button onclick="makeNormal()">Adjust: Normal Screen</button> 
        <p></p> 
    </body> 
   
      
   
      
  
        
        
        
   
</html>
