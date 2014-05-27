<%--
Create By : Prabhat Jain
This Jsp is used for checking the user checked ansewer is correct or not 



--%>
<%@page import="java.io.StringReader"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.*" %>
<%@page import="org.apache.commons.lang3.ArrayUtils" %>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/student_lms","root","");
            Statement st=con.createStatement();

Random rand=new Random();
%>
<!DOCTYPE html>
<%
String section_no=(String)request.getParameter("section_no");
int section_num=Integer.parseInt(section_no); 

String student_id=(String)session.getAttribute("Student_Id");
int student_idd=Integer.parseInt(student_id);

String test_id=(String)session.getAttribute("test_idd");
int test_idd=Integer.parseInt(test_id);



String randd=request.getParameter("random_value");
int random_value=Integer.parseInt(randd);

String count=(String)request.getParameter("count");
int countt=Integer.parseInt(count);
countt=countt+1;

String qno=(String)request.getParameter("qno");
int qnum=Integer.parseInt(qno);
qnum=qnum+1;

int correct=Integer.parseInt(request.getParameter("correct"));

String radio=request.getParameter("r1");
String aa=null;
int x=0,y=0;

String mins=request.getParameter("mins");
String secs=request.getParameter("secs");

String no_of_section=(String)session.getAttribute("no_of_section");
int no_of_sectionn=Integer.parseInt(no_of_section);


int total_rows_in_section=0;

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
    
<%  
  
       ResultSet res2=st.executeQuery("SELECT * FROM test_options AS t JOIN questions q JOIN map_studid_testid m ON q.Question_Id = t.Question_Id WHERE Correct_Ans = '1' AND Section_No = '"+section_num+"' AND q.Test_Id = m.Test_Id AND q.Question_Id = '"+random_value+"' AND m.Test_Id='"+test_idd+"'");
       while(res2.next())
         {  
            //out.print(res2.getString(1)+"<br>");
           //aa contains the correct answer
              aa=res2.getString(3);
            out.print("correct answer="+aa+"<br>");
          }
            
       //radio string contains the value of checked answer

            //out.print(radio);
       // Insert the user answer into user answer table 
   PreparedStatement ps=con.prepareStatement("INSERT INTO `student_answer` ( `Student_Id` , `user_answer` , `Question_Id`) (SELECT '"+student_idd+"', '"+radio+"', '"+random_value+"' FROM questions AS q JOIN map_studid_testid m WHERE q.Test_Id = m.Test_Id='"+test_idd+"' and q.section_No='"+section_num+"'and q.Question_Id='"+random_value+"' )");
    ps.executeUpdate();
         
         
    
      
      
      // Check useranswer with correct If true... increment in correct
     
       if(aa.equals(radio))
        {
             x=correct+1;
            out.print("successfully inserted");
      
        %>
       <input type="hidden" name="random_value" value="random_value">
       <%
    
     }
     else
     {
        x=correct;
         
           %>
           <input type="hidden" name="random_value" value="random_value">
           <%
        
     }
            ResultSet res=st.executeQuery("Select * from questions where Test_Id='"+test_idd+"' and Section_No='"+section_no+"' ");
                while(res.next())
                {
                   total_rows_in_section=total_rows_in_section+1;
                 
                }
           out.print("t"+total_rows_in_section);

    Integer string[]=new Integer[total_rows_in_section];             
        if(qnum==1)
        {
    ResultSet res3=st.executeQuery("SELECT * FROM questions where Section_No='"+section_num+"' and Test_Id='"+test_idd+"' ");
      for(int i=0;i<string.length;i++)
            {
                while(res3.next())
                    {
                       string[i]=res3.getInt(1);
                        out.print(string[i]);
                        break;
                    }
            }
        
       string=(Integer[])ArrayUtils.removeElement(string, random_value);
            for(int i=0;i<string.length;i++)
            {
                random_value=(string[rand.nextInt(string.length)]);
            out.print(random_value);
            }
                
        }
        
                if(qnum==total_rows_in_section)
         {
             section_num=section_num+1;
             countt=1;
         }
         
     if(no_of_sectionn==section_num &&qnum==total_rows_in_section)
     {
         response.sendRedirect("Student_lms_ReviewQuestion.jsp");
     }
     
      // redirects to DislyQuestion.jsp with values(correcr,new random num, minutes and time)
    response.sendRedirect("Student_lms_DisplayQuestion.jsp?correct="+x+"&random_value="+random_value+"&mins="+mins+"&secs="+secs+"&count="+countt+"&qno="+qnum+"&section_no="+section_num+" ");    
       // response.sendRedirect("Student_lms_Section.jsp?section_num="+section_num+" ");
          
    %>
    
 
     
    </body>
</html>
