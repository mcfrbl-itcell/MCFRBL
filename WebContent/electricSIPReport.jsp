<%@ page import="com.opensymphony.xwork2.ActionContext" %> 
<%@ page import="common.DateUtil" %> 
  <%@ page import="java.util.Date" %> 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

 <%
 String contextpath=request.getContextPath();
Integer furnishingAssetId= Integer.parseInt(request.getParameter("furnishingAssetId"));
String testingType=request.getParameter("testingType");
String coachType=request.getParameter("coachType");

%>
<!-- Include jTable script file. -->
<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script> 
<script src="<%=contextpath %>/js/jquery-ui-1.11.4.custom/jquery-ui.js" type="text/javascript"></script> 


<script>
$(document).ready(function() {
	//alert("resetting height");
	var width=$(window).width();
 	var height= $(window).height();
 	
    $('iframe').css('height', height * 1.0);
    $('iframe').css('width', width * 0.98);
    //alert("height:"+height+"  width:"+width);
    
});
</script>
<% 
if(testingType.equals("Current Details Testing"))
{
%>
<birt:viewer id="birtViewer" 
				reportDesign="reports/current_details.rptdesign"
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">

<birt:param name="furnishing_asset_id" value='<%=furnishingAssetId%>'></birt:param>
</birt:viewer>
<%}
else if(testingType.equals("Safety Testing"))
{
%>
<birt:viewer id="birtViewer" 
				reportDesign="reports/safety_para_test.rptdesign"
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">

<birt:param name="furnishing_asset_id" value='<%=furnishingAssetId%>'></birt:param>
</birt:viewer>

<%}
else if(testingType.equals("Battery Testing"))
{
%>
<birt:viewer id="birtViewer" 
				reportDesign="reports/battery_testing.rptdesign"
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">

<birt:param name="furnishing_asset_id" value='<%=furnishingAssetId%>'></birt:param>
</birt:viewer>
<%}
else
{
%>

<birt:viewer id="birtViewer" 
				reportDesign="reports/electrical_test.rptdesign"
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">

<birt:param name="furnAssetId" value='<%=furnishingAssetId%>'></birt:param>
<birt:param name="testingType" value='<%=testingType%>'></birt:param>
<birt:param name="coachType" value='<%=coachType%>'></birt:param>
</birt:viewer>
<%} %>

