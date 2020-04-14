<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<% String contextpath=request.getContextPath();%>
<script src="<%=contextpath%>/js/jquery-1.8.2.js" type="text/javascript"></script>
<script>
$(document).ready(function() {

	$( "#mybutton" ).click(function(){
		
		var financialYear=$("#finYr").val();
		var url="<%=contextpath %>/missingDataWheelReport.jsp?financialYear=";
		url= url+financialYear;
	 $( "#new-pages" ).load(url);
	});


	
});
</script>
</head>
<body>
<%
Calendar cal=Calendar.getInstance();
int year=cal.get(Calendar.YEAR);
int month=cal.get(Calendar.YEAR);
if(month>=3)
{
	year=year-1;
}
%>
<p><b>Select Financial Year:&nbsp;&nbsp; </b><select name="finYr" id="finYr">
<option value="">Select</option>
  
  <option value="<%=year-2%>-<%=year-1%>"><%=year-2%>-<%=year-1%></option>
  <option value="<%=year-1%>-<%=year%>"><%=year-1%>-<%=year%></option>
  <option value="<%=year%>-<%=year+1%>"><%=year%>-<%=year+1%></option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="mybutton" value="Run Report" ></p>
<hr>
<div id="new-pages"></div>
</body>
</html>