
<%@page import="java.io.*" %>
<%    
   int BUFFER_SIZE=4096;
   // getServletContext().getRealPath("") 
  String filepath = getServletContext().getRealPath("")  +File.separator + "Doc1.docx";   
   
  File file=new File(filepath);
  int length=0;
  ServletOutputStream outstream=response.getOutputStream();
  ServletContext context=getServletConfig().getServletContext();
  String mimetype=context.getMimeType(filepath);
  if(mimetype==null)
  {
  mimetype="application/octet-stream";
  
  }
  
  response.setContentType(mimetype);
  response.setContentLength((int)file.length());
  String filename=(new File(filepath)).getName();
  
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  byte[] byteBuffer=new byte[BUFFER_SIZE];
  
  DataInputStream in=new DataInputStream(new FileInputStream(file));
  
  while ((in != null) && ((length = in.read(byteBuffer)) != -1))
    {
        outstream.write(byteBuffer,0,length);
    } 
   
%>  