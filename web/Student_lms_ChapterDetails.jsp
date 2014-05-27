                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
<%--
Created By : Prabhat Jain
It shows Assignments, Videos, test related to that chapter which has student selected 


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="c" class="com.MyConnection" ></jsp:useBean>
<%
    try
    {
     Connection con=c.getConnection();
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/student_lms","root","");

// retriving a chapter name
String chapter_name=request.getParameter("flag2");

// retriving a chapter ID from flag1
int Chapter_ID=Integer.parseInt(request.getParameter("flag1"));

String subject_id=(String)session.getAttribute("subject_id");

 if(session.getAttribute("Student_Name")==null)
         response.sendRedirect("Student_lms_Login.jsp");
session.setAttribute("chapter_id", Chapter_ID);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<title>Easylearning.guru</title>
<link rel="canonical" href="http://www.easylearning.guru/" />
<link rel='stylesheet' id='jetpack-subscriptions-css'  href='css/subscriptions.css' type='text/css' media='all' />
<link rel='stylesheet' id='jetpack-widgets-css'  href='css/widgets.css' type='text/css' media='all' />
<link rel='stylesheet' id='themify-shortcodes-css'  href='css/shortcodes.css' type='text/css' media='all' />
<link rel='stylesheet' id='theme-style-css'  href='css/style1.css' type='text/css' media='all' />
<link rel='stylesheet' id='themify-media-queries-css'  href='css/media-queries.css' type='text/css' media='all' />
<link rel='stylesheet' id='google-fonts-css'  href='css/css.css' type='text/css' media='all' />
<link rel='stylesheet' id='pretty-photo-css'  href='css/lightbox.css' type='text/css' media='all' />
<link rel='stylesheet' id='themify-builder-style-css'  href='css/themify-builder-style.css' type='text/css' media='all' />
<link rel='stylesheet' id='sharedaddy-css'  href='css/sharing.css' type='text/css' media='all' />
<script type='text/javascript' src='js/jquery1.js'></script>
<script type='text/javascript' src='js/jquery-migrate.min.js'></script>
<meta name="generator" content="WordPress 3.8.3" />
<link rel='shortlink' href='http://easylearning.guru' />

<title>Contact Details</title>
<link href="css/video-js.css" rel="stylesheet" type="text/css">
  
<!-- video.js must be in the <head> for older IEs to work. -->
  <script src="js/video.js"></script>

  
<!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
  
<script>
    videojs.options.flash.swf = "video-js.swf";
  </script>
<meta property="og:site_name" content="easylearning.guru" />
<meta property="og:url" content="http://www.easylearning.guru" />
<!-- End Open Graph Tags -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<script>
    
    function check()
    {
       
      window.open("http://localhost:8080/Student/Student_lms_BookSelect.jsp",null,
      "height=200,width=400,status=no,toolbar=no,munbar=no,location=center");
      return false;
      
    }
    
</script>
           
           
</head>
<body class="home blog skin-default gecko not-ie sidebar-none list-post">
<div id="pagewrap">
	<div id="headerwrap">
    		<header id="header" class="pagewidth">        
			<hgroup>
				<h1><a href="easylearning.guru" title="Easylearning.guru"><img src="img/logo.png" alt="Logo"><!--Your logo here--></a></h1>	
				<h2 id="site-description">Easylearning.guru.</h2>
			</hgroup>
	
            <nav id="main-nav-wrap">
                <a id="menu-icon" class="mobile-button"></a>
			</nav>
            <!-- /main-nav-wrap -->
			<div id="social-wrap">	
				<div class="social-widget">	
				</div>
				<!-- /.social-widget -->
			</div>
			<!-- /social-wrap -->
	
		</header>
		<!-- /#header -->      				
	</div>
	<!-- /#headerwrap -->
	
	<div id="body" class="clearfix">		
<!-- layout -->
<div id="layout" class="pagewidth clearfix">

		<!-- content -->
	<div id="content">

	<h1 class="post-title"><a href="www.easylearning.guru">Easylearning.guru Contact Details</a></h1>
          <h3 align="right"><a href="Student_lms_Logout.jsp" align="right">Logout</a></h3>
        

<h3 >Name: <%=session.getAttribute("Student_Name")%></h3>
<p>&nbsp;</p>

<div>
    <form  name="myform"><div id='contact-form-8'><fieldset>
		
                <h3 align="center">Chapter Name : <%= chapter_name %></h3>
                  
                    <font size="4"><b>Books</b><br></font>
                  
                    <br>
                     <table align="center" cellspacing="10" cellpadding="10" width="100%" border="1" >
                        <tr>
                            <th>S.No.</th><th>Chapter Name</th><th>Book Name</th>  <th>Book Description</th><th>Book Type</th> <th>View</th>  
                        </tr>
                         <%
            
           
                        int n=1;
                        String   path=getServletContext().getRealPath("/")+"\\file\\";
                        PreparedStatement ps1=con.prepareStatement("SELECT Book_Id,Book_Name,Description,Book_Type,Name_Url,Chapter_Name from New_Chapter as C join books as B on B.Chapter_Id=C.Chapter_Id where B.Chapter_Id="+Chapter_ID);
                        ResultSet rs2=ps1.executeQuery();
			while(rs2.next())
			{
			%>
                        <tr>
                            <td><%=n%></td>
                            <td><%=rs2.getString("Chapter_Name")%></td>
                            <td><%=rs2.getString("Book_Name")%></td>
                            <td><%=rs2.getString("Description")%></td>
                            <td><%=rs2.getString("Book_Type")%></td>
                            
                            
                            <%
                          if(rs2.getString("Book_Type").equals("File"))
                          {
                              %>
                            <td><a href="Student_lms_BookPDF.jsp?file_name=<%=rs2.getString("Name_Url") %>" >View</a></td>
                             <%
                          }
                        else
                          {
                              %>
                              <td><a href="<%=rs2.getString("Name_Url")%>" target="_blank">View</a></td>
                            <% 
                          }
                            %>
                          
                            
                        </tr>
                        <%
                            n++;
			}
                        
                        %>
                    </table>
                    <br>
                    <br>
                    <br>
                    
                    
                    
                    
                    
                    <font size="4"><b>Videos</b><br></font>
                    <br>
                    <table cellpadding="10" cellspacing="10" width="110%" >
                        <tr align="center" style="border-bottom: 10">
                             <th>S.No.</th><th>Chapter Name</th><th>Video Name</th>  <th>Video Description</th><th>View Video</th>  
                        </tr>
                    <%
                        n=1;
                
                    Statement std=con.createStatement();
                    ResultSet rs=std.executeQuery("SELECT Video_Id,Video_Name,Video_Description,File_Name,Chapter_Name from New_Chapter as C join videos as B on B.Chapter_Id=C.Chapter_Id where B.Chapter_Id="+Chapter_ID);
                    while(rs.next())
			{
                    %>
                   
                         <tr>
                            <td align="center"><%=n%></td>
                            <td align="center"><%=rs.getString("Chapter_Name")%></td>
                            <td align="center"><%=rs.getString("Video_Name")%></td>
                            <td align="center"><%=rs.getString("Video_Description")%></td>
                             
                            <td align="center"><a href="#" >
                                  
                                
                                   
                              <video id="example_video_<%=n %>" class="video-js vjs-default-skin" controls preload="none" width="540" height="250"
      poster="http://video-js.zencoder.com/oceans-clip.png"
      data-setup="{}">
   
                <source src="http://localhost:8080/Teacher_LMS/file/<%=rs.getString("File_Name")%>" type="video/mp4">
  

                <source src="http://localhost:8080/Teacher_LMS/file/<%=rs.getString("File_Name")%>" type='video/webm' />
                            <source src="http://localhost:8080/Teacher_LMS/file/<%=rs.getString("File_Name")%>" type='video/ogg' />
                            <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                            <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
  
                        </video>     
                                </a></td>
                         </tr>
                                <%
                                }
                                %>
                        
                        
                    </table>
                        <br><br><br>
                    <font size="4"><b>Assignments</b></font><br>
                      <br>
                    
                    <table cellspacing="10" cellpadding="10" width="100%" border="1">
		
		<%
                       int a=1;
                        String subject_name=(String)session.getAttribute("subject");
			String as_type=null;
                        int as_id=0;
                        String sql="SELECT DISTINCT T.ASSIGNMENT_ID, T.CHAPTER_ID, N.CHAPTER_NAME, CL.CLASS_NAME, S.SUBJECT_NAME,S.SUBJECT_ID,C.ASSIGNMENT_TYPE,C.FILE_NAME,C.UPLOAD_DATE FROM (((((CHAPTER_Assignment AS T JOIN CREATE_ASSIGNMENT AS C ON T.ASSIGNMENT_ID = C.ASSIGNMENT_ID ) JOIN CHAPTER_ADDED AS CA ON CA.CHAPTER_ID = T.CHAPTER_ID) JOIN NEW_CHAPTER AS N ON N.CHAPTER_ID = CA.CHAPTER_ID)	JOIN SUBJECTS AS S ON CA.SUBJECT_ID = S.SUBJECT_ID)  JOIN CLASS AS CL ON CL.TEACHER_ID = S.TEACHER_ID) WHERE T.Chapter_Id = "+Chapter_ID+" GROUP BY T.ASSIGNMENT_ID";
                        PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs3= ps.executeQuery(sql);
		%>			 					
		<tr><th>S. No.</th><th>Class</th><th>Subject</th><th>Chapter</th>
                    <th>Assignment_type</th><th>Assignment/File Name</th><th>Uploaded Date</th><th>View/Download</th><th>Upload Answer Sheet</th></tr>
		<%
                 while(rs3.next())
                 {
                as_type=rs3.getString("C.ASSIGNMENT_TYPE");
                as_id=rs3.getInt("T.ASSIGNMENT_ID");
                %>
			<tr>
				<td align="center"><%=a %>.</td>
				
				<td align="center"><%=rs3.getString("CL.CLASS_NAME") %></td>
				<td><%=rs3.getString("S.SUBJECT_NAME") %></td>
				<td><%=rs3.getString("N.CHAPTER_NAME") %></td>
                                <td align="center"><%=as_type %></td>
				<td><%=rs3.getString("C.FILE_NAME") %></td>
				<td><%=rs3.getDate("C.UPLOAD_DATE") %></td>
                                <%
                                if(as_type.equals("File"))
                                {
                                %>
                                <td><a href="http://localhost:8080/Teacher_LMS/file/<%=rs3.getString("C.FILE_NAME") %>" download>Download</a></td>
                                <td><a href="Student_lms_UploadAnswerSheet.jsp?f1=<%=as_id %>&f2=<%=rs3.getInt("T.CHAPTER_ID")%>&f3=<%=rs3.getInt("S.SUBJECT_ID")%>" >Upload Answer Sheet</a></td>
                                <%
                                }
                                else
                                {
                                %>
                                 <td><a href="Student_lms_ViewAssignment.jsp?f1=<%=as_id %>&f2=<%=rs3.getInt("T.CHAPTER_ID")%>&f3=<%=rs3.getString("C.FILE_NAME") %>" >Give Assignment</a></td>
                                 <td></td>
                                 <%
                                }
                                    %>
                               
			</tr>
		<%
                                a++;
                }%>
		</table>
                    
                    <br><br><br>  
                    
                    
                    
                    <font size="4"><b>Test</b></font>
                    <br>
                    <table cellpadding="10" cellspacing="10" width="100%" align="center">
                        <tr>
                            <th><label>Test_No</label></th>
                            <th><label>Topic Name</label></th>
                            <th><label>Duration of test</label></th>
                            <th><label>Section contains</label></th>
                        </tr>
                        
            <%
          
            Statement stt=con1.createStatement();
            ResultSet res2=stt.executeQuery("Select * from create_test ct JOIN student_test s ON s.Test_Id=ct.Test_Id where Chapter_Id='"+Chapter_ID+"' ");
               while(res2.next())
            {
                
            %>            
                        <tr>
                            <td><center><%= res2.getInt(1)%></center></td>
                            <td><center><%= res2.getString(2)%></center></td>
                            <td><center><%= res2.getString(3)%></center></td>
                            <td><center><%= res2.getInt(4)%></center></td>
                            <td><center><a href="Student_lms_GiveTest.jsp?flag=<%= res2.getInt(1) %>&flag1=<%= res2.getInt(4)%>&flag2=<%= res2.getString(3)%>" >Give Test</a></center></td>
                        </tr>
                <%
                
            }
                %>        
                    </table>
                    
                    <table cellspacing="3" cellpadding="5" border="1">
		
		<%
                       
			a=1;
			Statement st=con.createStatement();
			ResultSet rs4= st.executeQuery("SELECT DISTINCT T.TEST_ID, T.CHAPTER_ID, C.TEST_NAME,C.No_of_section, N.CHAPTER_NAME, CL.CLASS_NAME, S.SUBJECT_NAME, C.TEST_TIME, C.CREATED_DATE "+
					"FROM (((((	CHAPTER_TEST AS T JOIN CREATE_TEST AS C ON T.TEST_ID = C.TEST_ID ) JOIN CHAPTER_ADDED AS CA ON CA.CHAPTER_ID = T.CHAPTER_ID) "+
					"JOIN NEW_CHAPTER AS N ON N.CHAPTER_ID = CA.CHAPTER_ID)	JOIN SUBJECTS AS S ON CA.SUBJECT_ID = S.SUBJECT_ID) "+ 
					"JOIN CLASS AS CL ON CL.TEACHER_ID = S.TEACHER_ID) WHERE CA.CHAPTER_ID ="+Chapter_ID+"  GROUP BY T.TEST_ID");
		%>			 					
		<tr><th width="5%">S. No.</th><th>Class</th><th>Subject</th><th>Chapter Name</th><th>Test ID</th><th>Test Name</th><th width="7%">Test Duration</th>
		<th>Created Date/Time</th><th>Give Test</th></tr>
		<%while(rs4.next()){%>
			<tr>
				<td align="center"><%=a %>.</td>
				<td align="center"><%=rs4.getString("CL.CLASS_NAME") %></td>
                                <td align="center"><%=rs4.getString("S.SUBJECT_NAME") %></td>
				
				<td><%=rs4.getString("N.CHAPTER_NAME") %></td>
                                <td><%=rs4.getString("T.TEST_ID") %></td>
				<td><%=rs4.getString("C.TEST_NAME") %></td>
				<td align="center"><%=rs4.getTime("C.TEST_TIME") %></td>
				<td align="center"><%=rs4.getDate("C.CREATED_DATE") %>/<%=rs4.getTime("C.CREATED_DATE") %></td>
				
				
					<!-- Onclick goto View test questions -->
				<td align="center"><a href="Student_lms_GiveTest.jsp?flag=<%= rs4.getInt("T.TEST_ID") %>&flag1=<%= rs4.getInt("C.No_of_section")%>&flag2=<%= rs4.getString("C.TEST_TIME")%>" target="_blank">Give Test</a></td>
				
					<!-- Onclick delete test-->
                                       
			</tr>
		<%a++;}
                
    }
  catch(Exception e)
{
out.println(e);
	//if exception occur goto error.jsp page
	
}
                
                %>
		</table>
                    
                <p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
