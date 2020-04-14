var srno=0;
$(document).ready(function() {
	
	$('#AssetmasterTableContainer').jtable({
		title : 'Coach List',
		paging:true,
		animationsEnabled : true,
		sorting: true,
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
				title : 'Tare Weight',
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
				title : 'Sleaping Capacity',
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
				title : 'Length Over Body',
				width : '12%',
				inputClass: 'validate[custom[integer]]',
				edit : true,
				list: true
			},
			max_width_body: {
				title : 'Width Over Body',
				width : '12%',
				inputClass: 'validate[custom[integer]]',
				edit : true,
				list: true
			},
			max_height_rail_level: {
				title : 'Height Rail Level',
				width : '12%',
				inputClass: 'validate[custom[integer]]',
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
	
	$('#AssetmasterTableContainer').jtable('load');

}); 
