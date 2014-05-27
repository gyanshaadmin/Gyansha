<%--
Created By: Prabhat Jain
This JSp showing chapter Name, chapter Number, description
Student can select chapter and directs page to Student_lms_QuerySubmission.jsp
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="c" class="com.MyConnection" ></jsp:useBean>
<%

Connection con=c.getConnection();
Statement st=con.createStatement();
String subject_id =request.getParameter("subject_id");
session.setAttribute("subject_id", subject_id);

String subject="";
Statement st2=con.createStatement();
ResultSet res=st2.executeQuery("Select Subject_name from subjects where Subject_Id="+subject_id);
 if(session.getAttribute("Student_Name")==null)
         response.sendRedirect("Student_lms_Login.jsp");
 
while(res.next())
{
  subject=res.getString("Subject_name");
  session.setAttribute("subject",subject );
}
       
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

<meta property="og:site_name" content="easylearning.guru" />
<meta property="og:url" content="http://www.easylearning.guru" />
<!-- End Open Graph Tags -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">

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


<div>
	<form><div id='contact-form-8'><fieldset>
		
                    <h3 align="center">Subject Name : <%= subject %></h3>
                  
                    
                    
                    <table cellspacing="5" cellpadding="5" width="110%" border="1">
		<tr>
			<th>S.No.</th><th>Class</th><th>Subject</th><th>Chapter Id</th><th>Chapter_Name</th><th>Description</th>
		</tr>
		<% int a=1;%>
		<%ResultSet rs2=st.executeQuery("SELECT DISTINCT N.CHAPTER_ID,N.CHAPTER_NAME,N.DESCRIPTIONS,CL.CLASS_NAME,S.SUBJECT_NAME FROM ((("+
						"NEW_CHAPTER AS N JOIN CHAPTER_ADDED AS C ON N.CHAPTER_ID = C.CHAPTER_ID) JOIN subjects AS S ON S.subject_id = c.subject_id)"+
						"JOIN class AS cl ON cl.teacher_id = s.teacher_id)"+
						"WHERE  S.SUBJECT_ID='"+subject_id+"'");
		while(rs2.next()){%>
		<tr>
			<td align="center"><%=a %>.</td>
			<td align="center"><%=rs2.getString("CL.CLASS_NAME")%></td>
			<td><%=rs2.getString("S.SUBJECT_NAME")%></td>
			<td><%=rs2.getString("N.CHAPTER_ID")%></td>
                        <td><center><a href="Student_lms_ChapterDetails.jsp?flag1=<%=rs2.getString("N.CHAPTER_ID")%>&flag2=<%=rs2.getString("N.CHAPTER_NAME")%> "><%=rs2.getString("N.CHAPTER_NAME")%></a></center></td>
			<td align="center"><%=rs2.getString("N.DESCRIPTIONS")%></td>
			
		</tr>
		<%a++;}%>
		</table>
                    
            
                <p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
