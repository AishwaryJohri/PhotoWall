<%@page import="sqlCon.ConnectorClass"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>


<%
        final String UPLOAD_DIRECTORY = "D:/apache-tomcat-8.0.28/webapps/PhotoWallTestGrid/img/image_data/";
  	
        //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request))
        {
            try 
            {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts)
                {
                	
                    if(!item.isFormField())
                    {              
                        String name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                       
                        Connection con = ConnectorClass.conn();
                        
                        String storage_path ="img/image_data/"+name;
                        
            	    	String qry="insert into file values('"+storage_path+"',"+(int)session.getAttribute("User_ID")+")";
            	    	
            	    	//System.out.println(UPLOAD_DIRECTORY + "/" + name);
            	    	
            	    	PreparedStatement ps = con.prepareStatement(qry);
            	    	//ps.setString(1,UPLOAD_DIRECTORY + File.separator + name);
            	    	//ps.setInt(2,(int)session.getAttribute("User_ID"));
            	    	ps.executeUpdate(qry);
            	    	
            	        qry="update user set image_c="+((int)session.getAttribute("Image_c")+1)+" where id="+(int)session.getAttribute("User_ID");
            	    	ps = con.prepareStatement(qry);
            	    	//ps.setInt(1,(int)session.getAttribute("Image_c")+1);
            	    	//ps.setInt(2,(int)session.getAttribute("User_ID"));
            	    	ps.executeUpdate(qry);
            	    	session.setAttribute("Image_c",(int)session.getAttribute("Image_c")+1);
                    }
                }
           
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully...Check in "+UPLOAD_DIRECTORY);
            } catch (Exception ex) 
            {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
         
        }
        else
        {
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
    
        request.getRequestDispatcher("/result.jsp").forward(request, response);
  

%>
