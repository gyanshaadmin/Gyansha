
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/assignment","root","");
Statement st=con.createStatement();
String chapter_name=request.getParameter("flag");
String subject=(String)session.getAttribute("subject");

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
		
                    <font size="6"><legend>Chapter Name : <%= chapter_name %></legend></font>
                    <br><br><br>
                   
                    <b>Videos</b><br>
                    
                    
                    
                    <b>Assignments</b><br>
                       <%
                       ResultSet res=st.executeQuery("Select * from assignment where Subject='"+subject+"'");
                       %>
                           <table cellpadding="10" cellspacing="10" width="80%">
                               <tr align="center" style="border-bottom: 10"> 
                                   <th>Assignment Type</th>  
                                   <th>Date</th>
                                   <th>Download Assignment File</th>
                                   <th>Upload Answer Sheet</th>
                               </tr>
                        <% 
                               while(res.next())
                       {
                           %>      
                           <tr>
                               <td><center><label><%= res.getString(3) %></label></center></td>
                               <td><center><label><%= res.getString(4)%></label></center></td>
                               <td><center><a href="Download.jsp?file=<%= res.getString(4)%>">Download Here</a></center></td>
                               <td><center><a href="">upload file</a></center></td>
                           </tr>
                           <br>
                           
                           <%
                       }
                       
                       
                       %> 
                    </table> 
                           
                    <b>Test</b>
                    
                    
                    
                    
                    
                    
                <p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
