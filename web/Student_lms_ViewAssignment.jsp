<%--
Create By : Prabhat Jain
showing new notifications to the student, student can reply of the notification & page will be redirect to Student_lms_Clicktoreply.jsp

--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="c" class="com.MyConnection" ></jsp:useBean>

 <%--
              flag assigns a Subject ID & flag1 assigns a Chapter ID and flag2 contains Chapter Name
              --%> 

<%
    try
    {
            String Student_Id=(String)session.getAttribute("Student_Id");
            int student_idd=Integer.parseInt(Student_Id); 

            String subject_id=(String)session.getAttribute("subject_id");
            
              
                Connection con=c.getConnection();
              
            int count_question=0;

            int assignment_idd=Integer.parseInt(request.getParameter("f1"));
            int chapter_idd=Integer.parseInt(request.getParameter("f2"));
             String assignment_name=request.getParameter("f3");
            session.setAttribute("assignment_id",assignment_idd);      
             session.setAttribute("assignment_name",assignment_name);   
              if(session.getAttribute("Student_Name")==null)
                    response.sendRedirect("Student_lms_Login.jsp");
              
           
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

<script type="text/javascript">
    function back()
    {
        window.open("Student_lms_ChapterDetails.jsp?flag1=<%=chapter_idd%>&flag2=<%=session.getAttribute("subject")%>","_self");
    }
    
     
    </script>
    <script>
  function preventBack(){
     
      window.history.forward();
  }
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
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
         <h3 align="right"><a href="Student_lms_Logout.jsp" align="right">Logout</a></h3>
        

<h3 >Name: <%=session.getAttribute("Student_Name")%></h3>

<div>
    <form name="myform" action="Student_lms_CheckAssignmentQ.jsp"  method="post"><div id='contact-form-8'><fieldset>
		<table cellspacing="10" cellpadding="10" width="100%" border="1">
		<h3 align="center">Assignment Name:<%=assignment_name %></h3>
               <div id='contact-form-8'><fieldset>
    
     <%
       int i=0;
       int b=0;
        Statement st4=con.createStatement();
        String que_type=null;
        String q="Single Choice";
         ResultSet rs=st4.executeQuery("SELECT Question_Id,Assignment_Question,Question_Type FROM `assignment_questions` where Assignment_Id = "+assignment_idd);
             while(rs.next())
             {
                 b++;
                 count_question=count_question+1;
                i= rs.getInt("Question_Id");
                que_type=rs.getString("Question_Type");
                if(que_type.equals("Multi"))
                    q="Multiple Choice";
                out.println("<h4>Q &nbsp;"+b+" :"+rs.getString("Assignment_Question")+"  ("+q+")</h4>");
        
   %>
   <input type="hidden" name="que_type<%=b%>" value="<%=que_type %>" />
   <input type="hidden" name="que_no<%=b%>" value="<%=i %>" />
   <%
     Statement st3=con.createStatement();
   ResultSet res2=st3.executeQuery("SELECT * FROM `assignment_questions` AS a JOIN assignment_options as o ON a.Question_id = o.Questions_Id WHERE a.Assignment_Id = "+assignment_idd+" AND a.Question_id = "+i);
   int c1=0;
   while(res2.next())
    {
        c1++;
        if(que_type.equals("Multi"))
        {
            %>
           <h5><%=c1 %><input type="checkbox" name="c<%=b %><%=c1 %>" value="<%=res2.getString("Option_Id") %>" /> 
               <%
        }
        else
        {
        %>
        <h5><%=c1 %><input type="radio" name="r<%=b %>" value="<%=res2.getString("Option_Id") %>" />  
        <%
        }
            out.println(res2.getString("Options"));
       
     
    }
    out.print("</h5>");
   
    }   
   
    %>  
    <input type="hidden" name="no_of_que" value="<%=b %>"  />
<input type="submit" name="submit" value="submit"  /> &nbsp; &nbsp;
   
    <input type="button" name="cancel" value="Cancel" onclick="back()" />
       
                   </fieldset></div></form>
		<p>&nbsp;</p>
	</fieldset></div></form>
    </table>
	</div>
	</div>
	</div>
    <%
                con.close();
             }
             catch(Exception e)
             {
                 out.println(e);
             }
    
    %>

    
</body>
</html>

