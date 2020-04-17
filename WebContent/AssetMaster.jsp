<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Asset master</title>

<% String contextpath=request.getContextPath();%>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery.jtable.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>
<!-- <script src="js/AssetmasterTablejtable1.js" type="text/javascript"></script> -->

<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>
</head>
<script>
var srno=0;
$(document).ready(function() {
	$("#assetList").append('<option value="All" selected>All</option>');
	<c:forEach var="a" items="${assetTypes}">
	var o = new Option("${a}","${a}" );
	$("#shopList").append(o);
	//retrieve supplier code
	</c:forEach>

	
	$('#AssetmasterTableContainer').jtable({
		title : 'Asset List',
		paging:true,
		animationsEnabled : true,
		sorting: true,
		defaultSorting:'asset_type ASC',
		selecting: true,
		multiSorting: true,
		actions : {
			listAction : 'listAssetAction',
			createAction : 'createAssetAction',
			updateAction : 'updateAssetAction',
			//deleteAction : 'deleteAssetAction'
		},
		

		fields : {
			
			sno:{
				title : 'SNo',
				create: false,
				edit : false,
				width: '3%',
				display: function(data)
				{
					
					srno++;
					return srno;
				}
			},
			
			
			
			asset_subtype : {
				title : 'Coach Type',
				width : '8%',
				list: true,
				create: true,
				key: true
			},
			
		
			asset_type : {
				title : 'Category',
				width : '5%',
				key: true,
				list: true,
				edit : true,
				create: true
				
			},
			asset_subtype_description: {
				title : 'Description',
				width : '8%',
				edit : true,
				list:true
				
			},
			asset_subtype_class : {
				title : 'Class',
				width : '10%',
				edit : true,
				list:true
				
			},
			tare_weight: {
				title : 'Tare Weight (Tones)',
				width : '10%',
				inputClass: 'validate[custom[number]]',
				edit : true,
				list: true
				
			},
			seating_capacity: {
				title : 'Seating Capacity',
				width : '10%',
				inputClass: 'validate[custom[integer]]',
				edit : true,
				list: true
			},
			sleeping_capacity: {
				title : 'Sleeping Capacity',
				width : '12%',
				inputClass: 'validate[custom[integer]]',
				edit : true,
				list: true
			},
			luggage_capacity: {
				title : 'Luggage Capacity',
				width : '12%',
				inputClass: 'validate[custom[integer]]',
				edit : true,
				list: true
			},
			max_length_body: {
				title : 'Length Over Body (MM)',
				width : '12%',
				inputClass: 'validate[custom[number]]',
				edit : true,
				list: true
			},
			max_width_body: {
				title : 'Width Over Body (MM)',
				width : '12%',
				inputClass: 'validate[custom[number]]',
				edit : true,
				list: true
			},
			max_height_rail_level: {
				title : 'Height Rail Level (MM)',
				width : '12%',
				inputClass: 'validate[custom[number]]',
				edit : true,
				list: true
			},
	},
	loadingRecords: function(event,data)
	{
		srno=0;
	},
	formCreated: function (event, data) {
		data.form.validationEngine();
	},
	recordDeleted: function(event,data)
	{
		srno=0;
		$('#AssetmasterTableContainer').jtable('load');
	},
	recordUpdated:function(event,data)
	{
		srno=0;
		$('#AssetmasterTableContainer').jtable('load');
	},

		//Validate form when it is being submitted
	formSubmitting: function (event, data) {
    return data.form.validationEngine('validate');
             
            },
    
	//Dispose validation logic when form is closed
	formClosed: function (event, data) {
               data.form.validationEngine('hide');
               data.form.validationEngine('detach');
	}

		
	});
	
	//$('#AssetmasterTableContainer').jtable('load');
	$('#LoadRecordsButton').click(function (e) {
        e.preventDefault(); 
	$('#AssetmasterTableContainer').jtable('load', {assetCategory: $('#assetList').val()   });
	});
	$('#LoadRecordsButton').click();

}); 


</script>
<body>
  <div class="filtering">
 	<form>
        <b>Select Asset Type</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="assetList" ></select>&nbsp;&nbsp;&nbsp;
		<button type="submit" id="LoadRecordsButton">Load records</button>
		 </form>
	</div>
	<div
		style="width: 98%; margin-right: 1%; margin-left: 1%; text-align: center;">
		
		<div id="AssetmasterTableContainer"></div>
	</div>
</body>
</html>