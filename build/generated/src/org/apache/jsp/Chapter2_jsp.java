package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Chapter2_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/teachers","root","");
Statement st=con.createStatement();

String sub_value=request.getParameter("sel");


      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\" />\n");
      out.write("<title>Easylearning.guru</title>\n");
      out.write("<link rel=\"canonical\" href=\"http://www.easylearning.guru/\" />\n");
      out.write("<link rel='stylesheet' id='jetpack-subscriptions-css'  href='css/subscriptions.css' type='text/css' media='all' />\n");
      out.write("<link rel='stylesheet' id='jetpack-widgets-css'  href='css/widgets.css' type='text/css' media='all' />\n");
      out.write("<link rel='stylesheet' id='themify-shortcodes-css'  href='css/shortcodes.css' type='text/css' media='all' />\n");
      out.write("<link rel='stylesheet' id='theme-style-css'  href='css/style1.css' type='text/css' media='all' />\n");
      out.write("<link rel='stylesheet' id='themify-media-queries-css'  href='css/media-queries.css' type='text/css' media='all' />\n");
      out.write("<link rel='stylesheet' id='google-fonts-css'  href='css/css.css' type='text/css' media='all' />\n");
      out.write("<link rel='stylesheet' id='pretty-photo-css'  href='css/lightbox.css' type='text/css' media='all' />\n");
      out.write("<link rel='stylesheet' id='themify-builder-style-css'  href='css/themify-builder-style.css' type='text/css' media='all' />\n");
      out.write("<link rel='stylesheet' id='sharedaddy-css'  href='css/sharing.css' type='text/css' media='all' />\n");
      out.write("<script type='text/javascript' src='js/jquery1.js'></script>\n");
      out.write("<script type='text/javascript' src='js/jquery-migrate.min.js'></script>\n");
      out.write("<meta name=\"generator\" content=\"WordPress 3.8.3\" />\n");
      out.write("<link rel='shortlink' href='http://easylearning.guru' />\n");
      out.write("\n");
      out.write("<title>Contact Details</title>\n");
      out.write("\n");
      out.write("<meta property=\"og:site_name\" content=\"easylearning.guru\" />\n");
      out.write("<meta property=\"og:url\" content=\"http://www.easylearning.guru\" />\n");
      out.write("<!-- End Open Graph Tags -->\n");
      out.write("<link rel=\"shortcut icon\" href=\"img/favicon.ico\" type=\"image/x-icon\"/>\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no\">\n");
      out.write("<script>\n");
      out.write("   var a=document.getElementsByName(\"a\");\n");
      out.write("    document.write(a);\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body class=\"home blog skin-default gecko not-ie sidebar-none list-post\">\n");
      out.write("<div id=\"pagewrap\">\n");
      out.write("\t<div id=\"headerwrap\">\n");
      out.write("    \t\t<header id=\"header\" class=\"pagewidth\">        \n");
      out.write("\t\t\t<hgroup>\n");
      out.write("\t\t\t\t<h1><a href=\"easylearning.guru\" title=\"Easylearning.guru\"><img src=\"img/logo.png\" alt=\"Logo\"><!--Your logo here--></a></h1>\t\n");
      out.write("\t\t\t\t<h2 id=\"site-description\">Easylearning.guru.</h2>\n");
      out.write("\t\t\t</hgroup>\n");
      out.write("\t\n");
      out.write("            <nav id=\"main-nav-wrap\">\n");
      out.write("                <a id=\"menu-icon\" class=\"mobile-button\"></a>\n");
      out.write("\t\t\t</nav>\n");
      out.write("            <!-- /main-nav-wrap -->\n");
      out.write("\t\t\t<div id=\"social-wrap\">\t\n");
      out.write("\t\t\t\t<div class=\"social-widget\">\t\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<!-- /.social-widget -->\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<!-- /social-wrap -->\n");
      out.write("\t\n");
      out.write("\t\t</header>\n");
      out.write("\t\t<!-- /#header -->      \t\t\t\t\n");
      out.write("\t</div>\n");
      out.write("\t<!-- /#headerwrap -->\n");
      out.write("\t\n");
      out.write("\t<div id=\"body\" class=\"clearfix\">\t\t\n");
      out.write("<!-- layout -->\n");
      out.write("<div id=\"layout\" class=\"pagewidth clearfix\">\n");
      out.write("\n");
      out.write("\t\t<!-- content -->\n");
      out.write("\t<div id=\"content\">\n");
      out.write("\n");
      out.write("\t<h1 class=\"post-title\"><a href=\"www.easylearning.guru\">Easylearning.guru Contact Details</a></h1>\t\n");
      out.write("<p>&nbsp;</p>\n");
      out.write("<div>\n");
      out.write("\t<form><div id='contact-form-8'><fieldset>\n");
      out.write("\t\t\n");
      out.write("\t\t<legend>Contact Information</legend>\n");
      out.write("\n");
      out.write("                  <table cellpadding=\"10\" cellspacing=\"10\" width=\"80%\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td><a href=\"home.jsp\">Home</a></td> &nbsp; \n");
      out.write("                        <td><a href=\"Performance.jsp\">Performance</a></td> &nbsp;\n");
      out.write("                        <td><a href=\"Notification.jsp\">Notification</a></td> &nbsp;\n");
      out.write("                        <td><a href=\"Assignment.jsp\">Assignment</a></td> &nbsp;\n");
      out.write("                        <td> <a href=\"Chapter.jsp\">Chapters</a></td> &nbsp;\n");
      out.write("                        <td><a href=\"Fourm.jsp\">Fourm</a></td>\n");
      out.write("                </tr>\n");
      out.write("                </table>\n");
      out.write("                <br><br><br>\n");


            ResultSet res=st.executeQuery("Select * from chapter where Subject='Java' ");

      out.write("\n");
      out.write("                        <label></label>\n");
      out.write("                        <br>\n");
      out.write("\n");
      out.write(" There are <label></label> in this Subject\n");
      out.write(" <br>\n");

               
            while(res.next())
                {
 
      out.write("\n");
      out.write("        <a href=\"\">");
      out.print(res.getString(3) );
      out.write("</a>\n");
      out.write(" \n");
      out.write(" ");

                 
                }

      out.write("   \n");
      out.write("                \n");
      out.write("                </table>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <p>&nbsp;</p>\n");
      out.write("\t</fieldset></div></form>\n");
      out.write("\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
