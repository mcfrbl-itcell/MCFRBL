<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String contextpath=request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="<%=contextpath %>/js/ckeditor/ckeditor.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=contextpath %>/js/ckeditor/adapters/jquery.js"></script>
 <script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script> 
 <script>
$(document).ready(function() {
	 //$("#example").ckeditor();
	
	 CKEDITOR.replace( 'example' );
});

</script>
</head>

<body>
<div id="TextEditor" style="height:150%; width:200%; display:none;">
 		<form>
				<textarea name="example" id="example" class="example" rows="5" cols="47">
				</textarea>
               <!--  <button onclick="myFunction()">Click me</button> -->
		</form>
</div>
</body>
</html>