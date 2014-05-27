<%--
Created By : Prabhat Jain
Insering all the values related to assignment in database

--%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.*" %>
<%
       
      DateFormat df=new SimpleDateFormat("dd-mm-yyyy");
      String formattedDate=df.format(new Date());
    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/student_lms", "root","");
                    

%>



<%
   
String contentType = request.getContentType();
System.out.println("Content type is :: " +contentType);

if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
{
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength) 
{
byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
String saveFile = file.substring(file.indexOf("filename=\"") + 10);
//out.print("FileName:" + saveFile.toString());
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
//out.print("FileName:" + saveFile.toString());
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
//out.print("FileName:" + saveFile.toString());
//out.print(dataBytes);
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
//out.println(boundary);
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
saveFile = "C:\\wamp\\www\\uploaded_file\\" + saveFile;
        
FileOutputStream fileOut = new FileOutputStream(saveFile);

//fileOut.write(dataBytes);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();

PreparedStatement ps=con.prepareStatement("INSERT into video(Video_Id,Video_Name,Chapter_Id,Class_Id) VALUES(?,?,?,?)");
ps.setString(1, null);
ps.setString(2, saveFile);

ps.setInt(3, 1);
ps.setInt(4, 1);
ps.executeUpdate();
out.print("Video upload sucesssfully");
}
%>
