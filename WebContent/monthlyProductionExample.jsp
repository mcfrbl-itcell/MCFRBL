<html>
<head>
<%String contextpath=request.getContextPath(); %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
  
	//retieve first data set
	var firstDataList=[]; 

	var j=0;
	<c:forEach var="b" items="${firstData}">
	firstDataList[j]={ label: "${b.key}", y: ${b.value}   };
		j++;
	  </c:forEach>
	
	//retieve second data set
		var secondDataList=[]; 

		   var i=0;
		<c:forEach var="a" items="${secondData}">
		secondDataList[i]={ label: "${a.key}", y: ${a.value}   };
			i++;
		  </c:forEach>
	
var chart = new CanvasJS.Chart("chartContainer", {
	exportEnabled: true,
	animationEnabled: true,
	title:{
		text: "Car Parts Sold in Different States"
	},
	subtitles: [{
		text: "Click Legend to Hide or Unhide Data Series"
	}], 
	axisX: {
		title: "States"
	},
	axisY: {
		title: "Oil Filter - Units",
		titleFontColor: "#4F81BC",
		lineColor: "#4F81BC",
		labelFontColor: "#4F81BC",
		tickColor: "#4F81BC"
	},
	axisY2: {
		title: "Clutch - Units",
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
		name: "Oil Filter",
		showInLegend: true,      
		yValueFormatString: "#,##0.# Units",
		dataPoints: firstDataList
	},
	{
		type: "column",
		name: "Clutch",
		axisYType: "secondary",
		showInLegend: true,
		yValueFormatString: "#,##0.# Units",
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

});
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>