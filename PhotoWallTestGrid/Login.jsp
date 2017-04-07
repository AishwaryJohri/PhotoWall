<%@page import="sqlCon.ConnectorClass"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%	
		String uname=(String)session.getAttribute("uname");
		//System.out.println(uname);
		Connection con = ConnectorClass.conn();
		String qury = "Select id,image_c from user where user=?";
		PreparedStatement ps = con.prepareStatement(qury);
		ps.setString(1,uname);
		ResultSet rs =ps.executeQuery();
		if(rs.next())
		{
			//System.out.println("Login");
			//System.out.println(rs.getInt(1));
			//System.out.println(rs.getInt(2));
			
			//session.setAttribute("uname",uname);
			session.setAttribute("User_ID",rs.getInt(1));
			session.setAttribute("Image_c",rs.getInt(2));
			
		}
		else{
			response.sendRedirect("Error.jsp");
		}
	%>
</body>
</html>