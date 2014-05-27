<%--
Created By : Prabhat Jain
Submit Notification to the server and response will be show ,when Admin upload the answer to the database
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<jsp:useBean id="c" class="com.MyConnection" ></jsp:useBean>
<%
    try
    {
    int a=0 ;
                
                Connection con=c.getConnection();
                Statement st=con.createStatement();
                
         
String Student_Id=(String)session.getAttribute("Student_Id");
int Notification_Id=Integer.parseInt(request.getParameter("Notification_Id"));
String query=request.getParameter("n1");
String stud_id=(String)request.getParameter("Student_Id");
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
		<legend>Contact Information</legend>
		<p>&nbsp;</p>
	
                
                  <%
   String n2=request.getParameter("n2");
                String n1=request.getParameter("n1");
                   PreparedStatement ps=con.prepareStatement("INSERT into student_query_submission VALUES(?,?,?,?)");
         ps.setString(1, Student_Id);
         ps.setString(2, n2);
         ps.setString(3, n1);
         ps.setString(4,"");
         ps.executeUpdate();
       
         
         %> 
               
<%		ResultSet res=st.executeQuery("Select * from notification where Notificaton_Id='"+Notification_Id+"'");
                while(res.next())
                {
%>  
              <br><br>
              <font size="5">Notification Type :</font>    <label><%=res.getString(2)%></label>
                <br><br>
                <font size="5">Date :</font>      <label><%= res.getString(3)%></a></label> 
                <br><br>
                <font size="5">Notification :</font>  &nbsp;&nbsp;  <label><%= res.getString(4)%></label>
                <br><br>
                <font size="5">Your Query :</font> &nbsp; &nbsp;<label><%= n1 %></label>
                <br><br>
                
  <%  }
                %>
                <font size="5">Answer :</font> &nbsp; &nbsp;
              
                <%
                String Answer=null;
                ResultSet res1=st.executeQuery("Select * from student_query_submission where Student_Id='"+Student_Id+"'");
                while(res1.next())
                {
                    Answer=res1.getString(4);
                }    
                    if(Answer.equals(""))
                    {
                       
   %>              
                            <textarea rows="5" cols="20" style="alignment-adjust:auto " readonly="true">
                The answer will be posted after sometime
             

                </textarea>
                    <%
                    }
               
                     }
catch(Exception e)
{
	System.out.println(e);
	//if exception occur goto error.jsp page
	
}
                    %>
       
  
                
                     
           </fieldset></div></form>
	</div>
                    
	</div>
	</div>
                    <br><br>
                    <center><a href="Student_lms_Home.jsp">Home</a> | <a href="Student_lms_Notification.jsp">Notification</a></center>  
</body>
</html>
