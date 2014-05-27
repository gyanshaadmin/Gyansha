<%--
Create By : Prabhat Jain
reply To Notification
after submitting query -- redirects to Query Submission Student_lms_QuerySubmission.jsp file
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="c" class="com.MyConnection" ></jsp:useBean>
<%
    try
    {
    int a=0 ;
                
                Connection con=c.getConnection();
                Statement st=con.createStatement();
                
         
session.getAttribute("Student_Id");
int Notification_Id=1 ;
String flag=(String)request.getParameter("flag");
int flagg=Integer.parseInt(flag);
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
<script>
    /* confirmatiom msg for student, wants to submit query  */
    function check()
    {
       if(document.myform.n1.value=="")
       {
           window.confirm("Are you sure to submit query without written");
           return false;
       }
      
    }
    function cancel()
    {
           window.open("Notification.jsp","_self");
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
<p>&nbsp;</p>
<div>
    <form onsubmit="return check();" name="myform" action="Student_lms_QuerySubmission.jsp "><div id='contact-form-8'><fieldset>
                <input type="hidden" name="Notification_Id" value=<%= Notification_Id%> >
		<legend>Reply to Notification</legend>
                
<%		// getting notification ID using flag
                // select notification
                ResultSet res=st.executeQuery("Select * from notification where Notificaton_Id='"+flagg+"'");
                while(res.next())
                {
%>  
              <br><br>
                <label><%=res.getString(2)%></label>
                <br><br>
                <label><%= res.getString(3)%></a></label>
                <br>
  
                <br>
                <input type="hidden" name="n2" value=<%= res.getString(4)%>>
       
  <%  }
                 }
catch(Exception e)
{
	System.out.println(e);
	//if exception occur goto error.jsp page
	
}
  %>              
             Reply :<br>
               <textarea rows="5" cols="10" name="n1"></textarea>
                    
               <br><br>
               <input type="submit" name="submit" value="Submit"> &nbsp;
               <input type="reset" name="cancel" value="Cancel" onclick="cancel();">
               <p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
        
</body>
</html>
