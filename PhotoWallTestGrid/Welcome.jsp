<%@page import="java.sql.*"%>
<%@page import="sqlCon.ConnectorClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WELCOME</title>
<style>
* {
  font-family: 'Open Sans', sans-serif;
}
.button-fill {
  text-align: center;
  background: #ccc;
  display: inline-block;
  position: relative;
  text-transform: uppercase;
  margin: 25px;
}
.button-fill.grey {
  background: #445561;
  color: white;
}
.button-fill.orange {
  background: #f26b43;
  color: #fff;
}
.button-fill.orange .button-inside {
  color: #f26b43;
}
.button-fill.orange .button-inside.full {
  border: 1px solid #f26b43;
}
.button-text {
  padding: 0 25px;
  line-height: 56px;
  letter-spacing: .1em;
}
.button-inside {
  width: 0px;
  height: 54px;
  margin: 0;
  float: left;
  position: absolute;
  top: 1px;
  left: 50%;
  line-height: 54px;
  color: #445561;
  background: #fff;
  text-align: center;
  overflow: hidden;
  -webkit-transition: width 0.5s, left 0.5s, margin 0.5s;
  -moz-transition: width 0.5s, left 0.5s, margin 0.5s;
  -o-transition: width 0.5s, left 0.5s, margin 0.5s;
  transition: width 0.5s, left 0.5s, margin 0.5s;
}
.button-inside.full {
  width: 100%;
  left: 0%;
  top: 0;
  margin-right: -50px;
  border: 1px solid #445561;
}
.inside-text {
  text-align: center;
  position: absolute;
  right: 50%;
  letter-spacing: .1em;
  text-transform: uppercase;
  -webkit-transform: translateX(50%);
  -moz-transform: translateX(50%);
  -ms-transform: translateX(50%);
  transform: translateX(50%);
}

</style>
</head>
<body style="background-image:url(./img/background.jpg)">

<%
	if(request.getParameter("Uname")!=null)
	    session.setAttribute("uname",request.getParameter("Uname")); 	
		//System.out.println(uname);
		Connection con = ConnectorClass.conn();
		String qury = "Select id,image_c from user where user=?";
		PreparedStatement ps = con.prepareStatement(qury);
		//System.out.println((String)session.getAttribute("uname"));
		ps.setString(1,(String)session.getAttribute("uname"));
		ResultSet rs =ps.executeQuery();
		if(rs.next())
		{
			session.setAttribute("User_ID",rs.getInt(1));
			session.setAttribute("Image_c",rs.getInt(2));
			
		}
		else{
			response.sendRedirect("Error.jsp");
		}
	%>

<center><h1>WELCOME <%=((String)(session.getAttribute("uname"))).toUpperCase()%> </h1>
<br><br><br>
<a href="PhotoWall.jsp">
  <div class="button-fill grey">
    <div class="button-text">Gallery</div>
    <div class="button-inside">
      <div class="inside-text">&nbspGallery&nbsp</div>
    </div>
  </div></a><a href="UploadImage.jsp">
  <div class="button-fill orange">
    <div class="button-text">Upload</div>
    <div class="button-inside">
      <div class="inside-text">&nbspUpload&nbsp</div>
    </div>
  </div></a>
</center>
<script src='js/jquery.min.js'></script>
<script>
 $(".button-fill").hover(function() {
   $(this).children(".button-inside").addClass('full');
 }, function() {
   $(this).children(".button-inside").removeClass('full');
 });

</script>
</body>
</html>