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
    var FurnishingNumbers=[]; 
  
	var i=1;
	FurnishingNumbers[0]={ value:'', label: "Select" };
	<c:forEach var="b" items="${furnList}">
	FurnishingNumbers[i]={ key: "${b.key}", value: "${b.value}"};
		i++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#furnNoDisplay").autocomplete({
        source: FurnishingNumbers,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#FurnishingNumbers" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#FurnishingNumbers').val(ui.item.value);
            $("#furnishingAssetId").val(ui.item.key);
        }
    });
	  
	  
	$( "#buttonId" ).click(function(){
		
		// $('input').attr('required', true);  
		if( $('#furnishingAssetId').val()=='')
			{
			
			 $('#errorMessage').html("<p style='color:red';>Furnishing No required</p>");
			 return false;
			}
		
		else
			{
			
			$('#errorMessage').html("");
						//return true;
			}
		
		if( $('#testingType').val()=='')
		{
			
		 $('#errorMessage').html("<p style='color:red';>Testing Type required</p>");
		 return false;
		}
	else
		{
		//alert($('#testingType').val());
		$('#errorMessage').html("");
		
		}
	
		var url="<%=contextpath%>/electricSIPReport.jsp?furnishingAssetId="+$( "#furnishingAssetId" ).val();
		url= url+"&testingType="+encodeURIComponent($("#testingType" ).val())+"&coachType="+$( "#coachType" ).val();
		//alert(url);
		 $('#new-pages').load(url);
		
	});//end of Cctv
	
		
	
});
function setTestingType()
{
var furnishingId=$('#furnishingAssetId').val();
$.ajax({
	url: "SetTestingTypeInElectricTest",     
	  type: "POST",// performing a POST request
	  dataType:"json", 
	  data : {
		  furnishingAssetId: $('#furnishingAssetId').val()
	  },
	  async: false,
	  success: function (data) {
		  if(data.testingTypes!=null)
          {
//        

$('#coachType').val(data.coachType)
        $('#testingType')
                       .find('option')
                       .remove()
                       .end();
                   
                    for ( var i = 0; i < data.testingTypes.length; i++) {
                    	 optionText = data.testingTypes[i]; 
                         optionValue = data.testingTypes[i];
                        // $('#testingType').append('<option value='+optionText+'>'+optionText+'</option>');
                           $('#testingType').append(new Option(optionText, optionValue));

                         
                    }
                   
       
       
          } 
	  },
	  error: function (data)
	  {
		  alert("Error Retrieving Data");  
	  },
	
});
}
</script>
</head>
<body>
<div id="errorMessage"></div>
<p><input type="hidden" id="coachType"/>
<p><input type ="hidden" id="furnishingAssetId" name="furnishingAssetId"/> 
<input type ="text" id="furnNoDisplay" name="furnNoDisplay" size=10 placeholder="furnishing no" onblur="setTestingType()"/>&nbsp;&nbsp;&nbsp;&nbsp;
<select id="testingType">
</select>
&nbsp;&nbsp;&nbsp;
<input type="button" id="buttonId" value="Run Report" />
</p>
<hr />
<div id="new-pages"></div>
</body>
</html>