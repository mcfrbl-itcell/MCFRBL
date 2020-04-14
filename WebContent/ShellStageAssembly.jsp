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
    var shellNumbers=[]; 
    var shellNumbers1=[]; 
    var shellNumbers2=[]; 
    var shellNumbers3=[]; 

	var j=1;
	shellNumbers[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${shellnoStageOneList}">
	shellNumbers[j]={ key: "${b.key}", value: "${b.value}"};
		j++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete
	  
	   $("#assetidDisplay").autocomplete({ 
        source: shellNumbers,
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
	  //1
	  
	$( "#buttonId" ).click(function(){
		 $('input').attr('required', true);  
	
		var url="<%=contextpath %>/shellStage1SIPReport.jsp?shellAssetId="+$( "#assetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	
	//2
	var h=1;
	shellNumbers1[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${shellnoStageTwoList}">
	shellNumbers1[h]={ key: "${b.key}", value: "${b.value}"};
		h++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete
	  
	   $("#assetidDisplay1").autocomplete({ 
        source: shellNumbers1,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#assetidDisplay1" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#assetidDisplay1').val(ui.item.value);
            $("#assetid1").val(ui.item.key);
        }
    });
	
      $( "#buttonId1" ).click(function(){
		 $('input').attr('required', true);  
		var url="<%=contextpath %>/shellStage2SIPReport.jsp?shellAssetId="+$( "#assetid1" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	//3
	

	var k=1;
	shellNumbers2[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${shellnoStageThreeList}">
	shellNumbers2[k]={ key: "${b.key}", value: "${b.value}"};
		k++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete
	  
	   $("#assetidDisplay2").autocomplete({ 
        source: shellNumbers2,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#assetidDisplay2" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#assetidDisplay2').val(ui.item.value);
            $("#assetid2").val(ui.item.key);
        }
    });
	
	$( "#buttonId2" ).click(function(){
		 $('input').attr('required', true);  
		
		
		var url="<%=contextpath %>/shellStage3SIPReport.jsp?shellAssetId="+$( "#assetid2" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	//4

   

	var l=1;
	shellNumbers3[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${shellnoStageFourList}">
	shellNumbers3[l]={ key: "${b.key}", value: "${b.value}"};
		l++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete
	  
	   $("#assetidDisplay3").autocomplete({ 
        source: shellNumbers3,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#assetidDisplay3" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#assetidDisplay3').val(ui.item.value);
            $("#assetid3").val(ui.item.key);
        }
    });
	
	
	$( "#buttonId3" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/shellStage4SIPReport.jsp?shellAssetId="+$( "#assetid3" ).val();
		 $( "#new-pages" ).load(url);
		
	});

});
</script>
</head>
<body>

<div id="errorMessage"></div>
<table>
<tr>
<td align="center"><b>SIP REPORT for Stage1</b></td>
<td align="center"><b>SIP REPORT for Stage2</b></td>
<td align="center"><b>SIP REPORT for Stage3</b></td>
<td align="center"><b>SIP REPORT for Stage4</b></td>
</tr>
<tr>
<td align="center">
<input type ="hidden" id="assetid" name="assetid"/>&nbsp;
<input type ="text" size="15%" placeholder="Enter Shell No" id="assetidDisplay" name="assetidDisplay"/>&nbsp;
<td align="center">
<input type ="hidden" id="assetid1" name="assetid1"/>
<input type ="text" size="15%" placeholder="Enter Shell No" id="assetidDisplay1" name="assetidDisplay1"/>
</td>
<td align="center">
<input type ="hidden" id="assetid2" name="assetid2"/>
<input type ="text" size="15%" placeholder="Enter Shell No" id="assetidDisplay2" name="assetidDisplay2"/>
</td>
<td align="center">
<input type ="hidden" id="assetid3" name="assetid3"/>
<input type ="text" size="15%" placeholder="Enter Shell No" id="assetidDisplay3" name="assetidDisplay3"/>
</td>
</tr>
<tr>
<td align="center"><input type="button" id="buttonId" value="Run Report"/></td>
<td align="center"><input type="button" id="buttonId1" value="Run Report"/></td>
<td align="center"><input type="button" id="buttonId2" value="Run Report"/></td>
<td align="center"><input type="button" id="buttonId3" value="Run Report"/></td>
</tr>
</table>
<div id="new-pages"></div>
</body>
</html>