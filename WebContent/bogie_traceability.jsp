<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
<%@ page import="hibernateConnect.HibernateConfig" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
<html>
<head>
<style>
.error-msg{
   background-color: #FF0000;
}
</style>
<% String contextpath=request.getContextPath();%>

<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
	
	 var bogieNumber=[]; 

		var j=1;
		bogieNumber[0]={ value:null, label: "Select" };
		<c:forEach var="b" items="${bogieNumberList}">
		bogieNumber[j]={ key: "${b.key}", value: "${b.value}"};
			j++;
		    </c:forEach>
		  //end: retrieving axle number for autocomplete

		   $("#assetidDisplay").autocomplete({
	        source: bogieNumber,
	        minLength: 2,
	        focus: function( event, ui ) {
	            $( "#assetidDisplay" ).val( ui.item.value );
	            return false;
	          },
	        select: function (event, ui) {
	            $('#assetidDisplay').val(ui.item.value);
	            $("#assetid").val(ui.item.key);
	          
	        }
	    });
	$( "#buttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/bogieTraceabilityReport.jsp?bogie_asset_id="+$( "#assetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	
	
		
	
	});
	

</script>
</head>
<body>
<div id="errorMessage"></div>
<table>
<tr>
<td>
<b>Traceability of Fiat Bogie</b>
</td>
</tr>
<tr>
<td>
<p>Enter Bogie No: <input hidden ="text" id="assetid" name="assetid"/><input type ="text" id="assetidDisplay" name="assetidDisplay" size=10/></p>
</td>
</tr>
<tr>
<td>
<input type="button" id="buttonId" value="Run Report"/>
</td>

</tr>
</table>
<hr />

<div id="new-pages"></div>
</body>
</html>