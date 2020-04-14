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
	
	 var shellNumbersExtrFinal=[]; 

		var j=1;
		shellNumbersExtrFinal[0]={ value:null, label: "Select" };
		<c:forEach var="b" items="${paintNumberListExtrFinal}">
		shellNumbersExtrFinal[j]={ key: "${b.key}", value: "${b.value}"};
			j++;
		    </c:forEach>
		  //end: retrieving axle number for autocomplete

		   $("#assetidDisplayExtrFinal").autocomplete({
	        source: shellNumbersExtrFinal,
	        minLength: 2,
	        focus: function( event, ui ) {
	            $( "#assetidDisplayExtrFinal" ).val( ui.item.value );
	            return false;
	          },
	        select: function (event, ui) {
	            $('#assetidDisplayExtrFinal').val(ui.item.value);
	            $("#assetidExtrFinal").val(ui.item.key);
	          
	        }
	    });
	$( "#buttonIdExtrFinal" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/extrPaintFinalInspectionReport.jsp?paint_asset_id="+$( "#assetidExtrFinal" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	
	 var shellNumbersExtrSip=[]; 

		var j=1;
		shellNumbersExtrSip[0]={ value:null, label: "Select" };
		<c:forEach var="b" items="${paintNumberListExtrSip}">
		shellNumbersExtrSip[j]={ key: "${b.key}", value: "${b.value}"};
			j++;
		    </c:forEach>
		  //end: retrieving axle number for autocomplete

		   $("#assetidDisplayExtrSip").autocomplete({
	        source: shellNumbersExtrSip,
	        minLength: 2,
	        focus: function( event, ui ) {
	            $( "#assetidDisplayExtrSip" ).val( ui.item.value );
	            return false;
	          },
	        select: function (event, ui) {
	            $('#assetidDisplayExtrSip').val(ui.item.value);
	            $("#assetidExtrSip").val(ui.item.key);
	           
	        }
	    });
		    
	$( "#buttonIdExtrSip" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/extrPaintSipReport.jsp?paint_asset_id="+$( "#assetidExtrSip" ).val();
		 $( "#new-pages" ).load(url);
	});
	
	 var shellNumbersIntrFinal=[]; 

		var j=1;
		shellNumbersIntrFinal[0]={ value:null, label: "Select" };
		<c:forEach var="b" items="${paintNumberListIntrFinal}">
		shellNumbersIntrFinal[j]={ key: "${b.key}", value: "${b.value}"};
			j++;
		    </c:forEach>
		  //end: retrieving axle number for autocomplete

		   $("#assetidDisplayIntrFinal").autocomplete({
	        source: shellNumbersIntrFinal,
	        minLength: 2,
	        focus: function( event, ui ) {
	            $( "#assetidDisplayIntrFinal" ).val( ui.item.value );
	            return false;
	          },
	        select: function (event, ui) {
	            $('#assetidDisplayIntrFinal').val(ui.item.value);
	            $("#assetidIntrFinal").val(ui.item.key);
	            
	        }
	    });
	
	$( "#buttonIdIntrFinal" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/intrPaintFinalInspectionReport.jsp?paint_asset_id="+$( "#assetidIntrFinal" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	 var shellNumbersIntrSip=[]; 

		var j=1;
		shellNumbersIntrSip[0]={ value:null, label: "Select" };
		<c:forEach var="b" items="${paintNumberListIntrSip}">
		shellNumbersIntrSip[j]={ key: "${b.key}", value: "${b.value}"};
			j++;
		    </c:forEach>
		  //end: retrieving axle number for autocomplete

		   $("#assetidDisplayIntrSip").autocomplete({
	        source: shellNumbersIntrSip,
	        minLength: 2,
	        focus: function( event, ui ) {
	            $( "#assetidDisplayIntrSip" ).val( ui.item.value );
	            return false;
	          },
	        select: function (event, ui) {
	            $('#assetidDisplayIntrSip').val(ui.item.value);
	            $("#assetidIntrSip").val(ui.item.key);
	          
	        }
	    });
	
	$( "#buttonIdIntrSip" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/intrPaintSipReport.jsp?paint_asset_id="+$( "#assetidIntrSip" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	
});

</script>
</head>
<body>
<div id="errorMessage"></div>
<table>
<tr>
<td align=center>
<b>Exterior Paint SIP</b>
</td>
<td align=center>
<b>Exterior Paint Final</b>
</td>
<td align=center>
<b>Interior Paint SIP</b>
</td>
<td align=center>
<b>Interior Paint Final</b>
</td>
</tr>
<tr>
<td>
<p>Enter Shell No: <input hidden ="text" id="assetidExtrSip" name="assetidExtrSip"/><input type ="text" id="assetidDisplayExtrSip" name="assetidDisplayExtrSip" size=10/></p>
</td>
<td>

<p>Enter Shell No: <input hidden ="text" id="assetidExtrFinal" name="assetidExtrFinal"/><input type ="text" id="assetidDisplayExtrFinal" name="assetidDisplayExtrFinal" size=10/></p>
</td>
<td>
<p>Enter Shell No: <input hidden ="text" id="assetidIntrSip" name="assetidIntrSip"/><input type ="text" id="assetidDisplayIntrSip" name="assetidDisplayIntrSip" size=10/></p>
</td>
<td>
<p>Enter Shell No: <input hidden ="text" id="assetidIntrFinal" name="assetidIntrFinal"/><input type ="text" id="assetidDisplayIntrFinal" name="assetidDisplayIntrFinal" size=10/></p>
</td>
</tr>
<tr>
<td align=center>
<input type="button" id="buttonIdExtrSip" value="Run Report"/>
</td>
<td align=center>

<input type="button" id="buttonIdExtrFinal" value="Run Report"/>
</td>
<td align=center>
<input type="button" id="buttonIdIntrSip" value="Run Report"/>
</td>
<td align=center>
<input type="button" id="buttonIdIntrFinal" value="Run Report"/>
</td>
</tr>
</table>
<hr />

<div id="new-pages"></div>
</body>
</html>