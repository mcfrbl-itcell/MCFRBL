<html>
<head>
<%String contextpath=request.getContextPath(); %>
<%@ taglib prefix="s" uri="/struts-tags"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/canvasjs.min.js"></script>
<script>

$(document).ready(function() {
  
	//retieve first data set
	var firstDataList=[];
	var firstDataList2=[]; 
	var firstYr="${str5}";
	var secondYr="${str4}";
  	var j=0;
	
	<c:forEach var="b" items="${firstData}">
	firstDataList[j]={ label: "${b.key}", y: ${ b.value}   };
		j++;
	  </c:forEach>
	//firstdata2
	var k=0;
	<c:forEach var="d" items="${firstData2}">
	firstDataList2[k]={ label: "${d.key}", y: ${ d.value}   };
		k++;
	  </c:forEach>
	
	//retieve second data set
		var secondDataList=[]; 

		   var i=0;
		<c:forEach var="a" items="${secondData}">
		secondDataList[i]={ label: "${a.key}", y: ${ a.value}   };
			i++;
		  </c:forEach>
		  
		//retieve second data set2
			var secondDataList2=[]; 

			   var l=0;
			<c:forEach var="m" items="${secondData2}">
			secondDataList2[l]={ label: "${m.key}", y: ${ m.value}   };
				l++;
			  </c:forEach>
	
var chart = new CanvasJS.Chart("chartContainer1", {
	exportEnabled: true,
	animationEnabled: true,
	 height:300,
	 width:500,
	title:{
		text: "QUARTERLY REPORT "+firstYr
	},
	subtitles: [{
		text: "Produced/Dispatched"
	}], 
	axisX: {
		interval:1,
		labelAngle:-45,
		title: "QUARTERS"
	},
	axisY: {
		title: "PRODUCTION-UNITS",
		titleFontColor: "#4F81BC",
		lineColor: "#4F81BC",
		labelFontColor: "#4F81BC",
		tickColor: "#4F81BC"
	},
	axisY2: {
		title: "DISPATCHED-UNITS",
		titleFontColor: "#C0504E",
		lineColor: "#C0504E",
		labelFontColor: "#C0504E",
		tickColor: "#C0504E"
	},
	toolTip: {
		shared: true
	},
	legend: {
		cursor: "pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "column",
		name: "",
		showInLegend: false,      
		yValueFormatString: "",
		dataPoints: firstDataList
	},
	{
		type: "column",
		name: "",
		axisYType: "secondary",
		showInLegend: false,
		yValueFormatString: "",
		dataPoints: secondDataList
	}]
});
chart.render();

function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else {
		e.dataSeries.visible = true;
	}
	e.chart.render();
}


var chart2 = new CanvasJS.Chart("chartContainer2", {
	exportEnabled: true,
	animationEnabled: true,
	height:300,
	 width:500,
	title:{
		text: "QUARTERLY REPORT "+secondYr
	},
	subtitles: [{
		text: "Produced/Dispatched"
	}], 
	axisX: {
		labelAngle:-45,
		interval:1,
		title: "QUARTERS"
	},
	axisY: {
		title: "PRODUCTION-UNITS",
		titleFontColor: "#4F81BC",
		lineColor: "#4F81BC",
		labelFontColor: "#4F81BC",
		tickColor: "#4F81BC"
	},
	axisY2: {
		title: "DISPATCHED-UNITS",
		titleFontColor: "#C0504E",
		lineColor: "#C0504E",
		labelFontColor: "#C0504E",
		tickColor: "#C0504E"
	},
	toolTip: {
		shared: true
	},
	legend: {
		cursor: "pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "column",
		name: "",
		showInLegend: false,      
		yValueFormatString: "",
		dataPoints: firstDataList2
	},
	{
		type: "column",
		name: "",
		axisYType: "secondary",
		showInLegend: false,
		yValueFormatString: "",
		dataPoints: secondDataList2
	}]
});
chart2.render();

function toggleDataSeries(e2) {
	if (typeof (e2.dataSeries.visible) === "undefined" || e2.dataSeries.visible) {
		e2.dataSeries.visible = false;
	} else {
		e2.dataSeries.visible = true;
	}
	e2.chart2.render();
}


});
</script>
</head>
<body>
<h3 align="center"><b>Shell Produced viz-a-viz Dispatched monthly in last 2 Financial Year</b></h3>
<table>
<tr height="30%">
	<td id="chartContainer1" style="width: 48%;"></td>
	<td width='4%'></td>
	<td id="chartContainer2" style="width: 48%;"></td>
</tr>
</table>

</body>
</html>