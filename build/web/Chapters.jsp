
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/teachers","root","");
Statement st=con.createStatement();


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
  
function check()
   {
var selected_index = myform.elements["country"].selectedIndex;
 
if(selected_index > 0)
{
   var selected_option_value = myform.elements["country"].options[selected_index].value;
        var selected_option_text = myform.elements["country"].options[selected_index].text;
   
   
}
else
{
   alert('Please select a country from the drop down list');
}
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
    <form name="myform" action="Chapter2.jsp"><div id='contact-form-8'><fieldset>
		
		<legend>Contact Information</legend>

                  <table cellpadding="10" cellspacing="10" width="80%">
                    <tr>
                        <td><a href="home.jsp">Home</a></td> &nbsp; 
                        <td><a href="Performance.jsp">Performance</a></td> &nbsp;
                        <td><a href="Notification.jsp">Notification</a></td> &nbsp;
                        <td><a href="Assignment.jsp">Assignment</a></td> &nbsp;
                        <td> <a href="Chapter.jsp">Chapters</a></td> &nbsp;
                        <td><a href="Fourm.jsp">Fourm</a></td>
                </tr>
                </table>
                <br><br><br>
                <font size="">   Select  Subject : </font>
                    <select onchange="check();" size="1" id="slt_country" name="country">
<option value=""> - Select - </option>

   
                  
<%

ResultSet res=st.executeQuery("Select * from chapter");

while(res.next())
{
%>                    
<option value="<%= res.getString(6)%>"><%= res.getString(6)%></option>
            

                       
 <%
 
}

 %>                       
                        
  <%
  String select_option_value=request.getParameter("selected_option_value");
 

  %>                    </select>
                
                <input type="submit" name="submit" value="Submit">     
                <p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
