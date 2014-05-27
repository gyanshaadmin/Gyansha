<%-- 
    Document   : Student_lms_CheckAssignmentQ
    Created on : May 2, 2014, 1:09:36 PM
    Author     : Administrator
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="c" class="com.MyConnection" ></jsp:useBean>
<!DOCTYPE html>

    
    <%
             try
             {
                 
            
            int assignment_idd=(Integer)session.getAttribute("assignment_id");
            
            String Student_Id=(String)session.getAttribute("Student_Id");
            int student_idd=Integer.parseInt(Student_Id);  
            int count_question=Integer.parseInt(request.getParameter("no_of_que"));
             session.setAttribute("no_of_que",count_question);
       
              String s2="";
              int n=0;
                Connection con=c.getConnection();
                 PreparedStatement ps2=con.prepareStatement("select * from Assignment_Questions join Assignment_Options on Question_Id=Questions_Id where Assignment_Id=? and Correct_Ans=?");
                         ps2.setInt(1,assignment_idd);
                         ps2.setInt(2,1);
                         ResultSet rs=ps2.executeQuery();
                         while(rs.next())
                         {
                           if(s2.equals(""))
                           {
                               s2=rs.getString("Option_Id");
                               n=rs.getInt("Question_Id");
                           }
                           else
                           {
                               if(n==rs.getInt("Question_Id"))
                                    s2=s2+"/"+rs.getString("Option_Id");
                               else
                                  s2=s2+" "+rs.getString("Option_Id");
                               n=rs.getInt("Question_Id");
                            }
                         }
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
<script type="text/javascript">

	//when click on Finish button goto Display_Test.jsp page for display all test	
	
        function finish()
	{			
		var c=confirm("Are you want to finish without seeing answersheet?");
		if(c==true)
		{
			
			location.replace("Student_lms_ViewChapters.jsp?subject_id=<%=session.getAttribute("subject_id") %>");
			return true;
		}
		else
			return false;		
	}
         function answer()
	{			
			location.replace("Student_lms_AssignmentSolution.jsp?f1=<%= assignment_idd %>&f2=<%=(Integer)session.getAttribute("chapter_id") %>");
				
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
<h2>Assignment Id: <%=assignment_idd %></h2>
<div>
	<form><div id='contact-form-8'><fieldset>
                   
                 <center> 
                    <table cellspacing="5" cellpadding="5" width="110%" border="1">
	
             
    <%-- 
    marks_count contains marks obtained by student
    rowsss contains total marks of the student
    
    --%>
  
      <%  
          
            int que_id=0;
            String que_type=null;
            String r=null,c1=null;
            int check=0;
            String check2="";
         String s="";
        for(int i=1;i<=count_question;i++)
        {
           
           que_id=Integer.parseInt(request.getParameter("que_no"+i));
           
            que_type=request.getParameter("que_type"+i);
            if(que_type.equals("Single"))
            {
               r=request.getParameter("r"+i);
               if(r!=null)
               {  
                   if(s.equals(""))
                     s=r;  
                   else
                    s=s+" "+r;
                  
               }
               else
               {
                   if(s.equals(""))
                       s="na";
                   else
                   s=s+" na";
               }
            }
            else
            {
                check2="";
                boolean flag=false;
                for(int j=1;j<=4;j++)
                {
                    c1=request.getParameter("c"+i+""+j);
                    if(c1!=null)
                    {
                       flag=true;
                       if(check2.equals(""))
                           check2=c1;
                       else
                        check2=check2+"/"+c1;
                    }
                
                    
                  
                }
               
               
                  if(flag==false)
                {
                    if(s.equals(""))
                       s="na";
                   else
                        s=s+" na";
                
                }
                  else
                  {
                       if(s.equals(""))
                            s=check2;  
                        else
                       s=s+" "+check2;
                  }
            }
      
        } 
        String as_ans[]=s2.split(" ");
        String user_ans[]=s.split(" ");
        //out.println(s2);
         //out.println("<br>");
         //out.println(s);
        int d=0;
        for(int k=0;k<user_ans.length;k++)
        {
            if(user_ans[k].equals(as_ans[k]))
               d++; 
        }
        int total_marks=0;
        int count=d;
         count=count*4;
        total_marks=count_question*4;
        session.setAttribute("user_answer", s);
         session.setAttribute("count_total",""+count+"/"+total_marks);
        %>
        <font size="5">You have scored  <%= count%>  / <%= total_marks %>
         <br>
         <br>
         </br>
         
     
               <%
        
        
        PreparedStatement ps=con.prepareStatement("INSERT into assignment_student_answer(Student_Id,Assignment_Id,User_Answer) VALUES(?,?,?)");
                         ps.setInt(1,student_idd);
                         ps.setInt(2,assignment_idd);
                        
                         ps.setString(3,s);
                         ps.executeUpdate();
                         
                         
       int chapter_idd=(Integer)session.getAttribute("chapter_id");
String subject_id=(String)session.getAttribute("subject_id");                  
  PreparedStatement ps3=con.prepareStatement("INSERT into  student_assignment_marks(Student_Id,Subject_Id,Chapter_Id,Assignment_Id,Total_Marks,Obtained_Marks) VALUES(?,?,?,?,?,?)");
  ps3.setInt(1, student_idd);
  ps3.setString(2, subject_id);
  ps3.setInt(3, chapter_idd);
  ps3.setInt(4, assignment_idd);
  ps3.setInt(5, total_marks);
  ps3.setInt(6, count);
  ps3.executeUpdate();
  
  
        
      %>
      
         
               <p class='contact-submit'>
                   <input type="button" name='t7' id='g8-name' class='name' value="Answer Sheet"  class='pushbutton-wide' onclick="answer()"/>&nbsp;&nbsp;
                        <input type="button" name='t6' id='g8-name' class='name' value="Finish"  class='pushbutton-wide' onclick="finish()"/>
		</p>
      
     <%
     
     con.close();
             }
             catch(Exception e)
             {
                 out.println(e);
             }
     
     %>
      
     
   </center>
            

                </fieldset></div></form>
		<p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>