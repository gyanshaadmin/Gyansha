
<%--
Create By : prabhat jain
    User can review the questions after submitting the questions

--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.*" %>

<%
String test_id=(String)session.getAttribute("test_idd");
String student_id=(String)session.getAttribute("Student_Id");
String rows=(String)session.getAttribute("rows");
String no_of_section=(String)session.getAttribute("no_of_section");
int no_of_sectionn=Integer.parseInt(no_of_section);
String section_no=(String)request.getParameter("section_no");
String Question_type=(String)request.getParameter("Question_Type");
int test_idd=Integer.parseInt(test_id);
int section_num=Integer.parseInt(section_no);
//String rand=request.getParameter("random_value");
String count=(String)request.getParameter("count");
String qno=(String)request.getParameter("qno");
//int random_value=Integer.parseInt(rand);
int student_idd=Integer.parseInt(student_id); 
//out.print(random_value);
String checkvalue="null";
String cvalue=request.getParameter("c1");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/student_lms","root","");
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
    /* Confirmation dialog box for student  */
        function submitques() {
    var ask = window.confirm("Are you sure you want to Submit ?");
    if (ask) {
        window.alert("successfully Submitted.");
 
        

    }
}
  /* Stop print screen button */
window.addEventListener("keyup",kPress,false);
function kPress(e)
{ 
var c=e.keyCode||e.charCode; 
if (c==44)
{
 alert("print screen");

  body.hide();
}}


        /* Avoid Using Keyboard */
document.onkeydown = function(ev) {
  var a;
   ev = window.event;
   if (typeof ev == "undefined") {
     alert("PLEASE DON'T USE KEYBORD");
          }
       a = ev.keyCode;
        alert("PLEASE DON'T USE KEYBORD");
              return false;
         }
       document.onkeyup = function(ev) {
           var charCode;
        if (typeof ev == "undefined") {
         ev = window.event;
         alert("PLEASE DON'T USE KEYBORD");
           } else {
          alert("PLEASE DON'T USE KEYBORD");
           }
         return false;
       }
        </script>
       
<style type="text/css" media="print">
.noprint {
display: none;
}
</style> 


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
    <form name="myform" onsubmit="return submitques();" action="ScoreCard.jsp"><div id='contact-form-8'><fieldset>
		
		<legend>Review Questions</legend>

                <% 
for(int k=1;k<=no_of_sectionn;k++)
{
%>
<font size="5">Section : <%=k %></font><br><br>
<%

String b[]=new String[10];            
            //retriving random values from databseand stored in b[] array
            ResultSet rand=st.executeQuery("SELECT * FROM student_random_number AS r JOIN map_studid_testid AS m ON r.Student_Id = m.Student_Id WHERE r.Student_Id = '"+student_idd+"' AND r.Section_No = '"+section_num+"'");
            
                for(int j=1;j<b.length;j++)
                {
                    while(rand.next())
                        {
                        //out.print(rand.getString(2)+"<br>");
                          b[j]=rand.getString(2);
                        
                break;
                        }
                 }
            // retriving random value from array 
           for(int i=1;i<b.length;i++)
               {
                   // Choose question acording to random value and test_id                                                                      
           %>
           Q<%= i%>
           <%
                   ResultSet res=st.executeQuery("Select * from questions where Question_Id='"+b[i]+"' and Test_Id='"+test_idd+"' and Section_no='"+k+"'");
                    while(res.next())
                        {
                        out.print(res.getString(2)+"<br>");
                        }
                    // retrive user checked values in exam
                   ResultSet res2=st.executeQuery("SELECT * FROM student_answer AS s JOIN map_studid_testid m ON m.Student_Id = s.Student_Id  WHERE s.Student_Id = '"+101+"' AND s.Question_Id = '"+b[i]+"'");
                    while(res2.next())
                        {
                        out.print(res2.getString(2)+"<br>");
                       // checkvalue=res2.getString(2);
                        }
    
                    ResultSet res1=st.executeQuery("SELECT * FROM `test_options` AS toption INNER JOIN questions q ON q.Question_Id = toption.Question_Id JOIN map_studid_testid m ON m.Test_Id = q.Test_Id WHERE q.Question_Id = '"+b[i]+"' AND q.Test_Id = '"+test_idd+"'");
                    while(res1.next())
                        {
                            // If checked value equals with correct answer, checkbox is checked otherwise unchecked
                            if(checkvalue.equals(res1.getString(3)))
                                {
%>
<input type="checkbox" name="c1" value="" checked="true"  readonly="true">

                
<%                                 out.print(res1.getString(2));
                                   // out.print("<br>");
                    
                                }
                              else
                                {
%>
<input type="checkbox" name="c1" value="" readonly="true">                            
                
<%
                             //  out.print(res1.getString(2));
                             //  out.print("<br>");
                                 
                                }
      //PreparedStatement ps=con.prepareStatement("UPDATE stud_checkd_option SET Click='"+res1.getString(2)+"' where Question_Id='"+i+"");
         // ps.executeUpdate();
             out.print("<br>");
                         } 
                    
               }                   
   }  //End of for loop
%>
<br><br>
<input type="submit" name="submit" value="Submit">

    

                <p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
