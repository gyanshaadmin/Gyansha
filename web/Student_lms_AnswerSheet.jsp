<%-- 
Created By : Prabhat Jain
Answer Sheet for student provided by Teacher 
--%>



<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>

<%
String student_id=(String)session.getAttribute("Stud_id");
String test_id=(String)session.getAttribute("test_id");
String rows=(String)session.getAttribute("rows");
int rowss=Integer.parseInt(rows);
int test_idd=Integer.parseInt(test_id);
int student_idd=Integer.parseInt(student_id);  
out.print(test_idd);
out.print(student_idd);
out.print(rowss);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/aptitude_test","root","");
            Statement st=con.createStatement();
            
           
            
            
String checkvalue=null,correctans=null,userans=null;
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
      <form name="myform"><div id='contact-form-8'><fieldset>
		
		<legend>Answer Sheet</legend>
               <%
String a[]=new String[50];
            
            // Retriving random numbers from Database which are generated when Student was giving exam
            ResultSet rand=st.executeQuery("Select * from random_number where Student_Id='"+student_idd+"' and Test_Id='"+test_idd+"'");
            
                for(int j=1;j<=a.length;j++)
                {
                    while(rand.next())
                        {
                    
                            a[j]=rand.getString(2);
                break;
                        }
                 }
            
           for(int i=1;i<a.length;i++)
               {  
                        
%>
        Q<%= i%> )
<%
                   
                   
                   //  Display answer checked by Student
                    ResultSet res3=st.executeQuery("Select *  from stud_checkd_option where Test_Id='"+test_idd+"' and Student_Id='"+student_idd+"' and Question_Id='"+a[i]+"'");
                    while(res3.next())
                       {
                       // out.print(res3.getString(2)+"<br>");
                            userans=res3.getString(2);
                        }
                // Selecting option
                    ResultSet res4=st.executeQuery("Select Options from options where Question_Id='"+a[i]+"' and Answer='1'and Test_Id='"+test_idd+"' "  );
                    while(res4.next())
                        {  
         //out.print(res2.getString(1)+"<br>");
         //aa contains the correct answer
                    correctans=res4.getString(1);
                        }
                // Display question acc to random number
                 ResultSet res=st.executeQuery("Select *  from questions where Question_Id='"+a[i]+"' and Test_Id='"+test_idd+"'");

                    while(res.next())
                    {
                    out.print(res.getString(2)+"<br>");

                    }
               
                    
                    ResultSet res1=st.executeQuery("Select * from options where Question_Id='"+a[i]+"' and Test_Id='"+test_idd+"' ");
                    while(res1.next())
                    {
%>
                    
<%             // Inserting right tick image in front of correct anserr
                 if(correctans.equals(res1.getString(2)))
                        {
 %>                        <img src="yes1.png" height="20px" width="20px">
                           <label><%=res1.getString(2)%></label>                    
<%                         //out.print("<br>");
                            // Checking user anser with correct answer and inserting image
                                     if(userans.equals(res1.getString(2)))
                                      {
%>                            
                                        <img src="yes.png" height="20px" width="20px">
<%                                     }
                         }
                 else 
                            { 
            
   %>         
                           <img src="no.png" height="20px" width="20px"> 
                           <label><%=res1.getString(2)%></label>                    
 <%                if(userans.equals(res1.getString(2)))
                          {
%>                          
                            <img src="yes.png" height="20px" width="20px">
<%                        }

                            } 
%>
            <br><br>
            <%
   }}



%>        

                <p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
