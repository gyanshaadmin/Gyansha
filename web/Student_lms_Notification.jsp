<%--
Create By : Prabhat Jain
showing new notifications to the student, student can reply of the notification & page will be redirect to Student_lms_Clicktoreply.jsp

--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="c" class="com.MyConnection" ></jsp:useBean>
<%
    try
    {

               
                Connection con=c.getConnection();
                Statement st=con.createStatement();
                ResultSet res=st.executeQuery("Select * from notification");
           
if(session.getAttribute("Student_Id")==null)
	{
		response.sendRedirect("Student_lms_Login.jsp");
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
<p>&nbsp;</p>
<div>
	<form><div id='contact-form-8'><fieldset>
		<table cellspacing="5" cellpadding="5" width="110%" border="1">
		<legend>Notifications</legend>
		<form ><div id='contact-form-8'><fieldset>
		<table cellspacing="5" cellpadding="5" width="110%" border="1">
	
            <table cellpadding="10" cellspacing="10" width="80%">
                    <tr>
                        <td><a href="Student_lms_Home.jsp">Home</a></td> &nbsp; 
                        <td><a href="Student_lms_Performance.jsp">Performance</a></td> &nbsp;
                        <td><a href="Student_lms_Notification.jsp">Notification</a></td> &nbsp;
                        <td> <a href="Student_lms_Select_Subject.jsp">Subjects</a></td> &nbsp;
                        <td><a href="Student_lms_Fourm.jsp">Fourm</a></td>
                </tr>
                </table>
               
                    <br><br><br><br>
                <table cellpadding="10" cellspacing="10" width="100%">
                  
                    <tr>
                        <th><b>Notification Type</b></th>
                        <th>Date</th>
                        <th><b>Notification</b></th>
                       <th>Reply</th>
                    </tr>
             <%

                    // retriving data from Notification table it contains Notification Type,, Notification
          ResultSet res1=st.executeQuery("Select * from notification");
         
          while(res1.next())
                 {
                     out.print(res1.getString(2));
             %>
             <tr>
               
            
                        <td><center><%= res1.getString(2)%></center></td>
                        <td><center><%= res1.getString(3)%></center></td>
                        <td><center><%= res1.getString(4)%></center></td>
                        <%--
                        
                        redirects to Student_lms_Clicktoreply.jsp if students wants to repy of notification 
                        --%>
                        <td><center><a href="Student_lms_Clicktoreply.jsp?flag=<%= res1.getInt(1)%> ">Click To Reply</a></center></td>
                    
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
         
                
                </fieldset></div></form>
		<p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
