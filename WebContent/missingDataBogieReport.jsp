<%@ page import="com.opensymphony.xwork2.ActionContext" %> 
<%@ page import="common.DateUtil" %> 
  <%@ page import="java.util.Date" %> 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

 <%
 String contextpath=request.getContextPath();
String finYr= request.getParameter("financialYear");
%>
<!-- Include jTable script file. -->
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

<birt:viewer id="birtViewer" 
				reportDesign="reports/missing_dashboard_bogie.rptdesign"
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">

<birt:param name="Para_Year" value='<%=finYr%>'></birt:param>

</birt:viewer>


