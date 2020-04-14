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
	//start: retrieving axle number for auto complete
    var FurnishingNumbers1=[]; 

	var i=1;
	FurnishingNumbers1[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${cctvList}">
	FurnishingNumbers1[i]={ key: "${b.key}", value: "${b.value}"};
		i++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#CctvassetidDisplay").autocomplete({
        source: FurnishingNumbers1,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#CctvassetidDisplay" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#CctvassetidDisplay').val(ui.item.value);
            $("#Cctvassetid").val(ui.item.key);
        }
    });
	  
	  
	$( "#CctvbuttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/cctvSIPReport.jsp?furnishingAssetId="+$( "#Cctvassetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});//end of Cctv
	
	var FurnishingNumbers2=[]; 

	var j=1;
	FurnishingNumbers2[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${ShowerTestList}">
	FurnishingNumbers2[j]={ key: "${b.key}", value: "${b.value}"};
		j++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#ShowerTestassetidDisplay").autocomplete({
        source: FurnishingNumbers2,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#ShowerTestassetidDisplay" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#ShowerTestassetidDisplay').val(ui.item.value);
            $("#ShowerTestassetid").val(ui.item.key);
        }
    });
	  
	  
	$( "#ShowerTestbuttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/showerTestingSIPReport.jsp?furnishingAssetId="+$( "#ShowerTestassetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	
	var FurnishingNumbers3=[]; 

	var k=1;
	FurnishingNumbers3[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${PlumbingTestList}">
	FurnishingNumbers3[k]={ key: "${b.key}", value: "${b.value}"};
		k++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#PlumbingTestassetidDisplay").autocomplete({
        source: FurnishingNumbers3,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#PlumbingTestassetidDisplay" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#PlumbingTestassetidDisplay').val(ui.item.value);
            $("#PlumbingTestassetid").val(ui.item.key);
        }
    });
	  
	  
	$( "#PlumbingTestbuttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/plumbingSIPReport.jsp?furnishingAssetId="+$( "#PlumbingTestassetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	
	var FurnishingNumbers4=[]; 

	var l=1;
	FurnishingNumbers4[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${BiotankTestList}">
	FurnishingNumbers4[l]={ key: "${b.key}", value: "${b.value}"};
		l++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#BiotankTestassetidDisplay").autocomplete({
        source: FurnishingNumbers4,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#BiotankTestassetidDisplay" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#BiotankTestassetidDisplay').val(ui.item.value);
            $("#BiotankTestassetid").val(ui.item.key);
        }
    });
	  
	  
	$( "#BiotankTestbuttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/biotankTestingSIPReport.jsp?furnishingAssetId="+$( "#BiotankTestassetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	var FurnishingNumbers5=[]; 

	var m=1;
	FurnishingNumbers5[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${BiotankTestList}">
	FurnishingNumbers5[m]={ key: "${b.key}", value: "${b.value}"};
		m++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#AirBrakeTestassetidDisplay").autocomplete({
        source: FurnishingNumbers5,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#AirBrakeTestassetidDisplay" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#AirBrakeTestassetidDisplay').val(ui.item.value);
            $("#AirBrakeTestassetid").val(ui.item.key);
        }
    });
	  
	  
	$( "#AirBrakeTestbuttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/airBrakeSIPReport.jsp?furnishingAssetId="+$( "#AirBrakeTestassetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	

	
	var FurnishingNumbers6=[]; 

	var n=1;
	FurnishingNumbers6[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${FibaTestList}">
	FurnishingNumbers6[n]={ key: "${b.key}", value: "${b.value}"};
		n++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#FibaTestassetidDisplay").autocomplete({
        source: FurnishingNumbers6,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#FibaTestassetidDisplay" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#FibaTestassetidDisplay').val(ui.item.value);
            $("#FibaTestassetid").val(ui.item.key);
        }
    });
	  
	  
	$( "#FibaTestbuttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/fibaTestingSIPReport.jsp?furnishingAssetId="+$( "#FibaTestassetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	
	var FurnishingNumbers7=[]; 

	var o=1;
	FurnishingNumbers7[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${CbcHeightList}">
	FurnishingNumbers7[o]={ key: "${b.key}", value: "${b.value}"};
		o++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#CbcTestassetidDisplay").autocomplete({
        source: FurnishingNumbers7,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#CbcTestassetidDisplay" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#CbcTestassetidDisplay').val(ui.item.value);
            $("#CbcTestassetid").val(ui.item.key);
           
        }
    });
	  
	  
	$( "#CbcTestbuttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/buffercbcHeightSIPReport.jsp?furnishingAssetId="+$( "#CbcTestassetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	

	var FurnishingNumbers8=[]; 

	var p=1;
	FurnishingNumbers7[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${CbcHeightList}">
	FurnishingNumbers7[p]={ key: "${b.key}", value: "${b.value}"};
		p++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#FireTestassetidDisplay").autocomplete({
        source: FurnishingNumbers8,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#FireTestassetidDisplay" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#FireTestassetidDisplay').val(ui.item.value);
            $("#FireTestassetid").val(ui.item.key);
           
        }
    });
	  
	  
	$( "#FireTestbuttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		var url="<%=contextpath %>/fireSmokeSIPReport.jsp?furnishingAssetId="+$( "#FireTestassetid" ).val();
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
<b>CCTV Testing</b>
</td>
<td>
<b>Shower Testing</b>
</td>
<td>
<b>Plumbing Testing</b>
</td>
<td>
<b>Biotank Testing</b>
</td>
<td>
<b>Airbrake Testing</b>
</td>
<td>
<b>Fiba Testing</b>
</td>
<td>
<b> Buffer CBC height</b>
</td>
<td>
<b>Fire Smoke Detection</b>
</td>
</tr>
<tr>
<td><p><input type ="hidden" id="Cctvassetid" name="Cctvassetid"/> <input type ="text" id="CctvassetidDisplay" name="CctvassetidDisplay" size=10 placeholder="furnishing no."/></p></td>
<td><p><input type ="hidden" id="ShowerTestassetid" name="ShowerTestassetid"/> <input type ="text" id="ShowerTestassetidDisplay" name="ShowerTestassetidDisplay" size=10 placeholder="furnishing no."/></p></td>
<td><p><input type ="hidden" id="PlumbingTestassetid" name="PlumbingTestassetid"/> <input type ="text" id="PlumbingTestassetidDisplay" name="PlumbingTestassetidDisplay" size=10 placeholder="furnishing no."/></p></td>
<td><p><input type ="hidden" id="BiotankTestassetid" name="BiotankTestassetid"/> <input type ="text" id="BiotankTestassetidDisplay" name="BiotankTestassetidDisplay" size=10 placeholder="furnishing no."/></p></td>
<td><p><input type ="hidden" id="AirBrakeTestassetid" name="AirBrakeTestassetid"/> <input type ="text" id="AirBrakeTestassetidDisplay" name="AirBrakeTestassetidDisplay" size=10 placeholder="furnishing no."/></p></td>
<td><p><input type ="hidden" id="FibaTestassetid" name="FibaTestassetid"/> <input type ="text" id="FibaTestassetidDisplay" name="FibaTestassetidDisplay" size=10 placeholder="furnishing no."/></p></td>
<td><p><input type ="hidden" id="CbcTestassetid" name="CbcTestassetid"/> <input type ="text" id="CbcTestassetidDisplay" name="CbcTestassetidDisplay" size=10 placeholder="furnishing no."/></p></td>
<td><p><input type ="hidden" id="FireTestassetid" name="FireTestassetid"/> <input type ="text" id="FireTestassetidDisplay" name="FireTestassetidDisplay" size=10 placeholder="furnishing no."/></p></td>
</tr>
<tr>
<td><input type="button" id="CctvbuttonId" value="Run Report" /></td>
<td><input type="button" id="ShowerTestbuttonId" value="Run Report" /></td>
<td><input type="button" id="PlumbingTestbuttonId" value="Run Report" /></td>
<td><input type="button" id="BiotankTestbuttonId" value="Run Report" /></td>
<td><input type="button" id="AirBrakeTestbuttonId" value="Run Report"/></td>
<td><input type="button" id="FibaTestbuttonId" value="Run Report" /></td>
<td><input type="button" id="CbcTestbuttonId" value="Run Report"/></td>
<td><input type="button" id="FireTestbuttonId" value="Run Report"/></td>
</tr>
<tr>
<td align=center>
</td>
<td align=center>
</td>
<td align=center>
</td>
<td align=center>
</td>
<td align=center>
</td>
<td align=center>
</td>
<td align=center>
</td>
<td align=center>
</td>
</tr>
</table>
<hr />

<div id="new-pages"></div>
</body>
</html>