<%@page import="java.sql.*,java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
<meta http-equiv=Content-Type content=text/html; charset=iso-8859-1 />
<title>Get Image</title>
</head>
<body>
<%
    InputStream sImage;
	response.setContentType("image/");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","iamthe1");
		Statement stmt = con.createStatement();
	//	System.out.println("Loader");
		//System.out.println(request.getParameter("imageid")+"     "+request.getParameter("User_ID"));
		String qry="select * from file where ID="+request.getParameter("imageid")+" and user_ID="+session.getAttribute("User_ID");
		ResultSet rs=stmt.executeQuery(qry);
		
		if(rs.next())
		{
			  byte[] bytearray = new byte[1048576];
			  response.setContentLength(bytearray.length);
			  int size=0;
			  sImage = rs.getBinaryStream(1);
			  //response.reset();
			  OutputStream os=response.getOutputStream();
			  while((size=sImage.read(bytearray))!= -1)
			  {
			      os.write(bytearray,0,size);
			  }
			  os.flush();
			  os.close();
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	%>
</body>
</html>