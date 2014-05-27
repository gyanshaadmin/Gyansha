<%-- 
Create By : Prabhat jain
Display Question according to random number generated 

--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.*" %>

<%
String test_id=(String)session.getAttribute("test_idd");
String student_id=(String)session.getAttribute("Student_Id");

String no_of_section=(String)session.getAttribute("no_of_section");
String section_no=(String)request.getParameter("section_no");
String Question_type=(String)request.getParameter("Question_Type");

int section_num=Integer.parseInt(section_no);
String rand=request.getParameter("random_value");
String count=(String)request.getParameter("count");
String qno=(String)request.getParameter("qno");
int random_value=Integer.parseInt(rand);

out.print(random_value);

int qnum=Integer.parseInt(qno);
int correct=Integer.parseInt(request.getParameter("correct"));
int student_idd=Integer.parseInt(student_id); 
int test_idd=Integer.parseInt(test_id);
int countt=Integer.parseInt(count);
//out.print(rowss);
//out.print(correct);
//out.print(student_idd);
//out.print(test_idd);
 
int last_question_id=0;       
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/student_lms","root","");
            Statement st=con.createStatement();            
%>

<%  
String mins=(String)request.getParameter("mins");
String secs=(String)request.getParameter("secs");
//out.print("mins"+mins);
//out.print("secs"+secs);
Timer t=new Timer();
int check=0;
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

<title>Questions</title>

<meta property="og:site_name" content="easylearning.guru" />
<meta property="og:url" content="http://www.easylearning.guru" />
<!-- End Open Graph Tags -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<script>
  /*  validation function  */
    function check()
    {
        if(document.myform.r1.value=false)
        {
             alert("Please Select One of these options");
            return false;
        }
        return true;
    }
    
    
</script>
<script>  
/*  Timer   */
var mins = <%=mins%>; // write mins to javascript  
var secs = <%=secs%>; // write secs to javascript  

function timer()  
{  
// tic tac  
if( --secs == -1 )  
{  
secs = 59;  
--mins;  
}  
  
// leading zero? formatting  
if( secs < 10 ) secs = "0" + secs;               
if( mins < 10 ) mins = "0" + parseInt( mins, 10 );  
  
// display  
document.myform.mins.value = mins;   
document.myform.secs.value = secs;  

// continue? 

if( secs == 0 && mins == 0 ) // time over  
{ 

window.open("timeout.jsp");
}  
else // call timer() recursively every 1000 ms == 1 sec  
{  
window.setTimeout( "timer()", 1000 );  
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
   
        
            <form name="myform" onsubmit="return check();" method="post" action="Student_lms_CheckAnswer.jsp" > 
               <pre>                                                                       Time remaining: <input readonly type="text" name="mins" style="border:0px solid black;text-align:right">:<input type="text" name="secs" size="1" style="border:0px solid black" readonly>  
               </pre>
               
                <font size="5">Section : &nbsp; <%= section_num %></font><br><br>    
<% 
            // Inserting random values in random_number table
                PreparedStatement ps=con.prepareStatement("INSERT into student_random_number VALUES(?,?,?,?)");
                    ps.setString(1, null);
                    ps.setInt(2,random_value);
                    ps.setInt(3, student_idd);
                    ps.setInt(4, section_num);
                    ps.executeUpdate();
                   
  %>              
    Q <%=countt%>
  <%        // Select question according to random number and test id 
            ResultSet res=st.executeQuery("Select * from questions where Question_Id='"+random_value+"' and Test_Id='"+test_idd+"'and Section_No='"+section_num+"' ");
            
                    while(res.next())
                    {
                    out.print(res.getString(2)+"<br><br>");
                    } 
                   // select options
            ResultSet res1=st.executeQuery("SELECT * FROM `questions` AS q JOIN test_options toption ON q.Question_Id = toption.Question_Id WHERE q.Test_Id = '"+test_idd+"' AND q.Section_No = '"+section_num+"' AND q.Question_Id ='"+random_value+"'  ");
                    while(res1.next())
                    {
                     out.print(res1.getString(8));
%>
     
<input type="radio" name="r1" value="<%= res1.getString(8)%>"  align="center"><br>
<%
                  }
%>
<br><br>
<%
       //radio string contains the value of checked answer
       String radio=request.getParameter("r1");
            //out.print(radio);
                
       
       // we are checking , Is it last question or not
             
 %>
                <input type="submit" name="submit" value="Save & Next">
         
        <input type="hidden" name="random_value" value=<%= random_value %>     >
        <input type="hidden" name="correct" value=<%= correct %> >
        <input type="hidden" name="count" value=<%= countt %> >               
        <input type="hidden" name="qno" value=<%= qnum %> >
        <input type="hidden" name="section_no" value=<%=section_num%> >
       
 
        <p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
 <script>  
<!--  
timer(); // call timer() after page is loaded  
//-->  
</script>  
         
</body>
</html>
