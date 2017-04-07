<%@page import="sqlCon.ConnectorClass"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@ page errorPage="error.jsp" isErrorPage="true" %>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>Grid Loading and Hover Effect | Demo 2</title>
		<meta name="description" content="Grid Loading and Hover Effect: Recreating Samsung's grid loading effect" />
		<meta name="keywords" content="grid loading, swipe, effect, slide, masonry, web design, tutorial" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body>
	
		<%
    //System.out.println("PhotoWall");
    //System.out.println(request.getParameter("Image_c"));
	    int i=1;
	    if((int)session.getAttribute("Image_c")!=0){
	    	
	    	Connection con = ConnectorClass.conn();
	    	String qry="select * from file where user_id="+session.getAttribute("User_ID");
	    	PreparedStatement ps = con.prepareStatement(qry);
	    	ResultSet rs=ps.executeQuery(qry);
    %>
	
		<div class="container">
			<!-- Top Navigation -->
			
			<header class="codrops-header">
				<h1>Welcome To ur Gallery<span>Wall Of Memeories</span></h1>	
				<nav class="codrops-demos">
					<a class="current-demo" href=#>All Images</a>
					<a href=#>Tagged Images</a>
					<a href=#>Liked Images<a>
				</nav>
			</header>
			<section class="grid-wrap">
				<ul class="grid swipe-down" id="grid">
					<li class="title-box">
						<h2>Memory Wall of <span style="color:red"><%=session.getAttribute("uname")%></span></h2>
					</li>
					<%    
	while(rs.next())
	    {
					%>
					<li><a href="#"><img src=<%=rs.getString(1)%> height="400px" width="380px" alt="" /><h3>Default Title</h3></a></li>
					<%
  		}
		%>
		  </ul>
		<%
	 }
    else{
    	%>
    		<jsp:include page="Error.jsp"></jsp:include>
	<%
	 }
	 %>
				
			</section>
	<!--		<section class="related">
				<p>If you enjoyed this demo you might also like:</p>
				<a href="http://tympanus.net/Development/ThumbnailGridAnimations/">
					<img src="http://tympanus.net/codrops/wp-content/uploads/2013/10/ThumbnailGridAnimations1-300x162.jpg" />
					<h3>Animations for Thumbnail Grids</h3>
				</a>
				<a href="http://tympanus.net/Development/GridLoadingEffects/">
					<img src="http://tympanus.net/codrops/wp-content/uploads/2013/07/GridLoadingEffects-300x162.png" />
					<h3>Grid Loading Effects</h3>
				</a>
			</section>
			 -->
		</div>
		<script src="js/masonry.pkgd.min.js"></script>
		<script src="js/imagesloaded.pkgd.min.js"></script>
		<script src="js/classie.js"></script>
		<script src="js/colorfinder-1.1.js"></script>
		<script src="js/gridScrollFx.js"></script>
		<script>
			new GridScrollFx( document.getElementById( 'grid' ), {
				viewportFactor : 0.4
			} );
		</script>
	</body>
</html>