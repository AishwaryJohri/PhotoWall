<!DOCTYPE html>
<html>
<head>
<title>Upload</title>
<style>
box-sizing: border-box;
</style>
</head>
<body background-color=black>
<div style="width:100%">
  <div style="background-color:orange; width:100%">
     <center> <h1>UPLOAD</h1></center>
  </div>
  <div style="background-color:#aaa; height:550px;width:50%;float:left;">
      <iframe name=frame width=100% height=100% src="img/imageIcon.png"></iframe>
  </div>
  
  <div style="background-color:#aaa; height:550px;width:49%;float:right;">
      <center>
      <form action=Uploading.jsp enctype="multipart/form-data" method=post>
      		<table border=0px>
      			<tr>
      			<td>Select Image:</td>
      			<td><input type=file name=imagefile></td>
      			</tr>	
   
      			<tr>
      			<td><a href="LoadImage.jsp" target=frame><button value=Preview Style="width:100px;" >Preview</button></a> </td>
      			<td><input type="submit" value=Upload></td>
      			</tr>	
      		</table>
      	</form>
      </center>
  </div>
  <div style="background-color:orange;clear:both;">
  <center>
      Copyright © Year of the Beast
  </center>
  </div>
</div>
</body>
</html>