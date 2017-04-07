<%@page import="sqlCon.ConnectorClass"%>
<%@page import="java.sql.*,java.io.*"%>
<%@ page errorPage="error.jsp" isErrorPage="true" %>

<html>
<head>
<meta http-equiv=Content-Type content=text/html; charset=iso-8859-1 />
<title>Get Image</title>
</head>

<body>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30%">&nbsp;</td>
    <td width="70%">Images Stored By <%=session.getAttribute("uname") %></td>
  </tr>
  
    <%
    //System.out.println("PhotoWall");
    //System.out.println(request.getParameter("Image_c"));
	    int i=1;
	    if((int)session.getAttribute("Image_c")!=0){
	    	
	    	Connection con = ConnectorClass.conn();
	    	String qry="select * from file where user_id="+session.getAttribute("User_ID");
	    	PreparedStatement ps = con.prepareStatement(qry);
	    	ResultSet rs=ps.executeQuery(qry);
	    while(rs.next())
	    {
    %>
  <tr>
    <td>Upload Image </td>
    <td height="200" width="300"><img src=<%=rs.getString(1)%> width="400" height="400"/></td>
  </tr>
  <%
  		}
	 }
    else{
    	%>
    		<jsp:include page="Error.jsp"></jsp:include>
	<%
	 }
	 %>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="Submit" value="Value"></td>
  </tr>
</table>
</body>
</html>
