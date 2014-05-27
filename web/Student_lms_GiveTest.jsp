<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.*" %>

<%  
int mins=60;
int secs=0;
        

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/student_lms","root","");
            Statement st=con.createStatement();
           
// retriving the test_ID of the test            
String test_id=(String)request.getParameter("flag");
int test_idd=Integer.parseInt(test_id);
// set the value of test_id in session
session.setAttribute("test_idd","1");

// retriving the number of sections contains a test
String no_of_sections=(String)request.getParameter("flag1");
//set the number of sections in session
session.setAttribute("no_of_section",no_of_sections);
// retriving the duration of test
String time=(String)request.getParameter("flag2");

int section_no=1;

String Question_Type="Single value";
Random rand=new Random();
int r=0;
// count is used for displaying question numbering
 int count=1;
 int i=0;
 // correct variable is used to correct answer, if user clicked on correct answer, the value of correct variablle will increment 1
 int correct=0;
 int rowss=0;    
 int total_rows;
 // qno variable is used to how may question in this test
 int qno=0;
%>
 
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
<body onload="back();" class="home blog skin-default gecko not-ie sidebar-none list-post">
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
	<form  action="Student_lms_DisplayQuestion.jsp" name="forma"><div id='contact-form-8'><fieldset>
		<table cellspacing="5" cellpadding="5" width="110%" border="1">
	
           
                <%
         
         int rows_count=0;
      
         ResultSet res=st.executeQuery("Select * from questions where Test_Id='"+test_idd+"' and Section_No='"+section_no+"' ");
      
         while(res.next())
                {
                    rows_count=rows_count+1;
                
                }
         
   // Total rows contained in variable total_rows      
total_rows=rows_count;


            // a[] array contains the no of question in section=1
         int a[]=new int[rows_count];
         
        
         ResultSet ress=st.executeQuery("Select * from questions where Test_Id='"+test_idd+"' and Section_No='"+section_no+"'");
            for(int j=0;j<a.length;j++)
            {
            while(ress.next())
            {
                // question ID are adding in array
                    a[j]=ress.getInt(1);
                    //out.print(a[j]);
                   
                break;
            }
            }
            // generate random number from an array a[]
           
           // int random_value=a[rand.nextInt(a.length)];

         //  out.print(random_value);
        // random function to generate random number betwwen 1 to total_rows wher Test_Id='test_idd''

     
         %>
            <h1>Online Aptitude</h1>
            
        
            Your test Timing is : &nbsp;<%= time %> &nbsp;hr<br>
            Test Contains &nbsp; <%= no_of_sections %> &nbsp; sections<br><br><br>
            <input type="hidden" name="mins" value=<%= "60"%> > 
            <input type="hidden" name="secs" value=<%= "1"%> >
            <input type="hidden" name="count" value=<%=count %> >
            <input type="hidden" name="correct" value=<%=correct%> >
            <input type="submit" name="submit" value="Next" >
            <input type="hidden" name="random_value" value=<% %> >
            <input type="hidden" name="qno" value=<%= qno %> >
            <input type="hidden" name="section_no" value=<%= section_no %>  >       
            <input type="hidden" name="total_rows" value=<%= total_rows %> >
            <input type="hidden" name="Question_Type" value=<%= Question_Type %>
                  
      
                
                </fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
