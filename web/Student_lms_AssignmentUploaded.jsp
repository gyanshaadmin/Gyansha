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
<jsp:useBean id="c" class="com.MyConnection" ></jsp:useBean>
<%
       
    
                  
                    Connection con=c.getConnection();
                    
String chapter_id=(String)session.getAttribute("chapter_id");
int chapter_idd=Integer.parseInt(chapter_id);

String assignment_id=(String)session.getAttribute("assignment_id");
int assignment_idd=Integer.parseInt(assignment_id);
String stud_id=(String)session.getAttribute("Student_Id");
 int stud_Idd=Integer.parseInt(stud_id);
 String sub_id=(String)session.getAttribute("subject_id");
 int subject_id=Integer.parseInt(sub_id);
%>



<%
   
 String path=null;
                String saveFile = "";
		String file_name=null;
             String contentType = request.getContentType();
      if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1, contentType.length());
            int pos;
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
         	
           file_name=stud_id+assignment_id+saveFile;
            	//Uploaded Assignment Question File Location
           path=getServletContext().getRealPath("/")+"//file//";
            saveFile = path+  file_name;
            File ff = new File(saveFile);
               	FileOutputStream fileOut = new FileOutputStream(ff);
            	fileOut.write(dataBytes, startPos, (endPos - startPos));
            	fileOut.flush();
            	fileOut.close();
               
                
                 
      }

PreparedStatement ps=con.prepareStatement("INSERT into student_assignment_marks(Assignment_Id,Student_Id,Chapter_Id,Subject_Id,Uploaded_Answer,Credit) VALUES(?,?,?,?,?,?)");
ps.setInt(1, assignment_idd);
ps.setInt(2, stud_Idd);
ps.setInt(3, chapter_idd);
ps.setInt(4, subject_id);
ps.setString(5, file_name);
ps.setString(6,"good");
int n=ps.executeUpdate();
if(n>0)
{
    %>
    <script type="text/javascript">
        alert("Your Answer Sheet Submitted");
        location.replace("Student_lms_ViewChapters.jsp?subject_id="+<%=subject_id%>);
        </script>
    <%


}
else
{
    %>
    <script type="text/javascript">
        alert("Your Answer Sheet Not Submitted");
        location.replace("Student_lms_UploadAnswerSheet?f1="+<%=assignment_idd%>+"&f2="+chapter_idd+"&f3="+<%=subject_id%>);
        </script>
    <% 
}
%>
