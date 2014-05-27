<%--
Create By : Prabhat Jain
To Display Score of the student


--%>



<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>

<%
String student_id=(String)session.getAttribute("Stud_id");
String test_id=(String)session.getAttribute("test_id");
int test_idd=Integer.parseInt(test_id);
int student_idd=Integer.parseInt(student_id);  
String rows=(String)session.getAttribute("rows");
int rowss=Integer.parseInt(rows);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/aptitude_test","root","");
            Statement st=con.createStatement();

String userans=null;
int marks_count=0;
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

<title>Score Card</title>

<meta property="og:site_name" content="easylearning.guru" />
<meta property="og:url" content="http://www.easylearning.guru" />
<!-- End Open Graph Tags -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
 <script>
         function back()
         {
    window.history(0);
         }
        </script>
</head>
<body class="home blog skin-default gecko not-ie sidebar-none list-post" onload="back();">
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
		
		<legend>Score Card</legend>
<center>
      <br><br><br><br> 
<%      
        for(int i=1;i<rowss;i++)
            {
                // retrive user answer from databse and check with correct answer
            ResultSet res3=st.executeQuery("Select *  from stud_checkd_option where Test_Id='"+test_idd+"' and Student_Id='"+student_idd+"' and Question_Id='"+i+"'");
            while(res3.next())
                 {
               userans=res3.getString(2);
                //out.print(userans);      
                 }
                
             ResultSet res2=st.executeQuery("Select Options from options where Question_Id='"+i+"' and Answer='1' and Test_Id='"+test_idd+"' "  );
             while(res2.next())
                  {  
                
          if(userans.equals(res2.getString(1)))
                   {
                        marks_count=marks_count+5 ;
                    }
     
                  }             
            }
            // count total rows where test_Id="test_idd"
        ResultSet res4=st.executeQuery("Select * from questions where Test_Id='"+test_idd+"'");
            int row_count=0;
            while(res4.next())
              {
              row_count++;
              }
              // out.print("<br>number of rows"+row_count);
//row_count contains a total number of rows
           //we multiplied total rows by question weightage  
int rowsss=row_count*5;

 //response.sendRedirect("test6.jsp?marks_count="+marks_count+"&row_count="+rows+"");
    %> 
    
    
    <%-- 
    marks_count contains marks obtained by student
    rowsss contains total marks of the student
    
    --%>
    <font size="5">You have scored  <%=marks_count%>  / <%=rowsss%>
 
  
          
<br><br><br>            
      <table cellpadding="5" cellspacing="5">
           <tr>
                      
            <td><a href="AnswerSheet.jsp">Answer Sheet</a></font></td>
                            
         </tr>
                    
      </table>
    </center>
            

                
                     
                <p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
