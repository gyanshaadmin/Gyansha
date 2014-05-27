<%--
Create By : Prabhat Jain
Displays Performance of the student

--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="c" class="com.MyConnection" scope="session" /> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%
        try
        {

Connection con=c.getConnection();

String stud_id=(String)session.getAttribute("Student_Id");
if(stud_id==null)
         response.sendRedirect("Student_lms_Login.jsp");
int stud_idd=Integer.parseInt(stud_id);
 
%>
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
<p>&nbsp;</p>
<div>
	<form><div id='contact-form-8'><fieldset>
		
		<legend>Assignment</legend>

            <table cellpadding="10" cellspacing="10" width="80%">
                    <tr>
                        <td><a href="Student_lms_Home.jsp">Home</a></td> &nbsp; 
                        <td><a href="Student_lms_Performance.jsp">Performance</a></td> &nbsp;
                        <td><a href="Student_lms_Notification.jsp">Notification</a></td> &nbsp;
                        <td> <a href="Student_lms_Select_Subject.jsp">Subjects</a></td> &nbsp;
                        <td><a href="Student_lms_Fourm.jsp">Fourm</a></td>
                </tr>
                </table>
                  <br><h3 align="center">Test </h3>
                <table cellpadding="10" cellspacing="10" width="110%" border="1">
                    <tr>
                        <th>Subject Name</th>
                        <th>Type Of Test</th>
                        <th>Chapter Name</th>
                        <th>Submitted Date</th>
                        <th>Credit</th>
                       
                    </tr>   
                </table>
                <br><h3 align="center">Assignment</h3>
                <table cellpadding="10" cellspacing="10" width="110%" border="1">
                    <tr>
                         <th>S. No.</th>
                          <th>Subject Name</th>
                         <th>Chapter Name</th>
                        <th>Type Of Assignment</th>
                         <th>Assignment Name</th>
                        <th>Submitted Date</th>
                        <th>Credit</th>
                       
                    </tr>    
                    
 <%
int i=1;
            PreparedStatement ps=con.prepareStatement("select S.Subject_Name,C.Chapter_Name,A.File_Name,A.Assignment_Type,M.Date,M.Marks_Id,M.Total_Marks,M.Obtained_Marks,M.Credit from (((student_assignment_marks as M join subjects as S on M.Subject_Id=S.Subject_Id) join new_chapter AS C on C.Chapter_Id=M.Chapter_Id) join create_assignment as A on M.Assignment_Id=A.Assignment_Id) where M.Student_Id=? order by Date DESC");
            ps.setInt(1, stud_idd);
            ResultSet res=ps.executeQuery();
            while(res.next())
            {
 %>                   
                    
                      <tr>
                          <td><label><center><%=i++ %></center></label></td>
                            <td><label><center><%= res.getString("S.Subject_Name")%></center></label></td>
                        <td><label><center><%= res.getString("C.Chapter_Name")%></center></label></td>
                        <td><label><center><%=res.getString("A.Assignment_Type") %></center></label></td>
                         <td><label><center><%= res.getString("A.File_Name")%></center></label></td>
                        <td><label><center><%= res.getString("M.Date")%></center></label></td>
                        <%
                        if(res.getString("A.Assignment_Type").equals("Enter"))
                        {
                        %>
                        <td><label><center><%= res.getString("M.Obtained_Marks")%>/<%= res.getString("M.Total_Marks")%></center></label></td>
                        <%
                        }
                        else
                        {
                        %>
                         <td><label><center><%= res.getString("M.Credit")%></center></label></td>
                         <%
                        }
                         %>
                    </tr>
 <%
            }
        }
        
catch(Exception e)
{
	System.out.println(e);
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
