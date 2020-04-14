<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Asset master</title>
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<% String contextpath=request.getContextPath();%>
 <script src="<%=contextpath %>/js/ckeditor/ckeditor.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery.jtable.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>


<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>
</head>
<body>
	<div
		style="width: 98%; margin-right: 1%; margin-left: 1%; text-align: center;">
		
		<div id="AssetmasterTableContainer"></div>
	</div>
	<div id="addWarranty" style="display:none;z-index:9;">
 		<form name="warrantyForm" id="warrantyForm">
				<textarea name="warranty" id="warranty" class="warranty" rows="5" cols="47">
				</textarea>
		</form>	
 </div>
  <div id="addSpecialFeatures" style="display:none;z-index:9;">
 		<form name="specialFeaturesForm" id="specialFeaturesForm">
				<textarea name="specialFeatures" id="specialFeatures" class="specialFeatures" rows="5" cols="47">
				</textarea>
		</form>	
 </div>     
	
</body>
<script>
function DestroyCKEditorInstances(example)
{
    if (CKEDITOR.instances[example])
    {
        CKEDITOR.instances[example].destroy();
    }
}
var srno=0;
$(document).ready(function() {
	
	$('#AssetmasterTableContainer').jtable({
		title : 'Coach List',
		paging:true,
		selecting: true, //Enable selecting
        multiselect: false, 
        multiSorting: true,
		 // create toolbar
        toolbar: {
        	items:[
                   //first toolbar
        		{
        			icon: '<%=contextpath%>/images/rs_out.png',
                    text: 'Warranty',
                    click: function () {
                    	 var $selectedRows = $('#AssetmasterTableContainer').jtable('selectedRows');
                	 	 if ($selectedRows.length<1)
                		 alert("Please select a row for which you want to add Warranty Clause");
                	 	 else{
                	 		var record;
                	 		$selectedRows.each(function () {
                                record = $(this).data('record');
                                });
                  		  //show data
                           	$.ajax({
           						url : "showExistingDataWarrantySpecialFeatures",  //action-name as defined in struts.xml  //abhi ye bhi kam nahi huwa hai
           						dataType: 'json', 
           						data : {
           							coachType: record.asset_subtype,             					
           						},
           						
           						type : 'POST',
           						async : false,
                   	 		})
           						.done(function( msg ) {
           							if(msg.coachWarrantySplFeatures!=null)
           								{
           							$('#warranty').val(msg.coachWarrantySplFeatures.warranty);				
           								}
     							  })
     							.error(function (msg){
     								//$('#dialog').dialog('close');
     								alert("Error Fetching Warranty Data");
     							})
     							  ;
                   	 		

 // end of code
   								
                	 	$("#addWarranty").dialog({
                	 	 		title : 'Add Warranty clause for Coach type  '+record.asset_subtype ,
                	 	 		width:'60%',
                	 	 		height:($(window).height()-50),
                			    modal: true,
                			    position: [0,28],
                		        create: function (event) { $(event.target).parent().css('position', 'fixed');},
                		        open:function(event) {
                    		     CKEDITOR.replace('warranty',{language: 'html',height:200,width:800, allowedContent: true});
                    		     }, 

                         		                  			   
                	 	 		close: function (e, u) {
                	 	 			DestroyCKEditorInstances('warranty');
          	 		              
          	 		          	$("#addWarranty").validationEngine('hideAll');
          	 		         $('#addWarranty').find('form[name="warrantyForm"]')[0].reset();
          	 		          },
            	 		 	
   	 							buttons: {
                                    Submit: {
                                       text: "Submit",
                                        id: "my-button-submit",
                                        click:function () {
                                    	var c=confirm("Do you want to submit data!!");
                                    	if(c==false){return false;}
                                    	
                                    	//alert(CKEDITOR.instances.example.getData()) ;  // retieve value of ckeditor
                                    	//alert(CKEDITOR.instances['example'].getData());// another way to retieve data
                                    	  	   
                                    	$.ajax({
                    						url : "saveWarranty",  //action-name as defined in struts.xml
                    						dataType: 'json', 
                    						data : {
                    							coachType: record.asset_subtype,
                    							warrantyHTML: CKEDITOR.instances.warranty.getData(),
                    						},
                    						
                    						type : 'POST',
                    						async : false,
                            	 		})
                    						.done(function( msg ) {
                    							
                    							$('#warranty').val(''),
                    							
                    							$('#addWarranty').dialog('close'),
                    							
                    							$('#AssetmasterTableContainer').jtable('load');
         								  })
         								.error(function (msg){
         									
         									alert("Error Fetching Data");
         								})
         								  ;
   				                 			    	   return true;
   			                                    }
                                    },
   			                        Close: function () {
   			                        	/* $('#shellCheckListSip').find('form[name="form2"]')[0].reset();*/ 
   			                                        $(this).dialog('close');
   			                                     DestroyCKEditorInstances('warranty');
   			          	 		              
   			            	 		          	$("#addWarranty").validationEngine('hideAll');
   			            	 		         $('#addWarranty').find('form[name="warrantyForm"]')[0].reset();
   			                                    }
                                    },
                    	        modal: true
   	    });
                	 		
   								            			    	   return true;
                	 		    
                	 			  
                	 		  }//ending else               	  
                	  // ajax call ends here				
   						 
                    }
                      

            	    	
        		},
        		// end of first toolbar

                //second toolbar
        		{
        			icon: '<%=contextpath%>/images/rs_out.png',
                    text: 'Add Special Features',
                    click: function () {
                    	 var $selectedRows = $('#AssetmasterTableContainer').jtable('selectedRows');
                	 	 if ($selectedRows.length<1)
                		 alert("Please select a row for which you want to add Special Features Clause");
                	 	 else{
                	 		var record;
                	 		$selectedRows.each(function () {
                                record = $(this).data('record');
                                });
                	 		$.ajax({
           						url : "showExistingDataWarrantySpecialFeatures",  //action-name as defined in struts.xml  //abhi ye bhi kam nahi huwa hai
           						dataType: 'json', 
           						data : {
           							coachType: record.asset_subtype,             					
           						},
           						
           						type : 'POST',
           						async : false,
                   	 		})
           						.done(function( msg ) {
           							if(msg.coachWarrantySplFeatures!=null)
           								{
           							$('#specialFeatures').val(msg.coachWarrantySplFeatures.specialFeatures);				
           								}
     							  })
     							.error(function (msg){
     								//$('#dialog').dialog('close');
     								alert("Error Fetching Warranty Data");
     							})
     							  ;
   								
                	 	$("#addSpecialFeatures").dialog({
                	 	 		title : 'Add Special Features for Coach type  '+record.asset_subtype ,
                	 	 		width:'60%',
                	 	 		height:($(window).height()-50),
                			    modal: true,
                			    position: [0,28],
                		        create: function (event) { $(event.target).parent().css('position', 'fixed');},
                		        open:function(event) {
                    		     CKEDITOR.replace('specialFeatures',{language: 'html',height:300,width:800, allowedContent: true});
                    		     },              			   
                	 	 		close: function (e, u) {
                	 	 			DestroyCKEditorInstances('specialFeatures');
          	 		              
          	 		          	$("#addSpecialFeatures").validationEngine('hideAll');
          	 		         $('#addSpecialFeatures').find('form[name="specialFeaturesForm"]')[0].reset();
          	 		          },
            	 		 	
   	 							buttons: {
                                    Submit: {
                                       text: "Submit",
                                        id: "my-button-submit",
                                        click:function () {
                                    	var c=confirm("Do you want to submit data!!");
                                    	if(c==false){return false;}
                                    	
                                    	//alert(CKEDITOR.instances.example.getData()) ;  // retieve value of ckeditor
                                    	//alert(CKEDITOR.instances['example'].getData());// another way to retieve data
                                    	  	   
                                    	$.ajax({
                    						url : "saveSpecialFeatures",  //action-name as defined in struts.xml
                    						dataType: 'json', 
                    						data : {
                    							coachType: record.asset_subtype,
                    							specialFeatureHTML: CKEDITOR.instances.specialFeatures.getData(),
                    						},
                    						
                    						type : 'POST',
                    						async : false,
                            	 		})
                    						.done(function( msg ) {
                    							
                    							$('#specialFeatures').val(''),
                    							
                    							$('#addSpecialFeatures').dialog('close'),
                    							
                    							$('#AssetmasterTableContainer').jtable('load');
         								  })
         								.error(function (msg){
         									
         									alert("Error Fetching Data");
         								})
         								  ;
   				                 			    	   return true;
   			                                    }
                                    },
   			                        Close: function () {
   			                        	/* $('#shellCheckListSip').find('form[name="form2"]')[0].reset();*/ 
   			                                        $(this).dialog('close');
   			                                     DestroyCKEditorInstances('specialFeatures');
   			          	 		              
   			            	 		          	$("#addSpecialFeatures").validationEngine('hideAll');
   			            	 		         $('#addSpecialFeatures').find('form[name="specialFeaturesForm"]')[0].reset();
   			     			                                        
   			                                    }
                                    },
                    	        modal: true
   	    });
                	 		
   								            			    	   return true;
                	 		    
                	 			  
                	 		  }//ending else               	  
                	  // ajax call ends here				
   						 
                    }
                      

            	    	
        		},
        		
        	],
        	
        },
    
		
		actions : {
			listAction : 'listCoachAssetAction',
			
		},
		fields : {
			
			sno:{
				title : 'SNo',
				create: false,
				edit : false,
				width: '5%',
				display: function(data)
				{
					
					srno++;
					return srno;
				}
			},
			
			
			
			asset_subtype : {
				title : 'Coach Type',
				width : '10%',
				list: true,
				create: true,
				key: true
			},
			
		
			asset_type : {
				title : 'Category',
				width : '10%',
				key: true,
				list: false,
				edit : true,
				create: true
				
			},
			
			asset_subtype_description: {
				title : 'Description',
				width : '20%',
				edit : true,
				list:true
				
			},
			asset_subtype_class : {
				title : 'Class',
				
				edit : true,
				list:true
				
			},
			
			tare_weight: {
				title : 'Tare Weight',
				width : '15%',
				inputClass: 'validate[custom[number]]',
				edit : true,
				list: true
				
			},
			seating_capacity: {
				title : 'Seating Capacity',
				width : '15%',
				inputClass: 'validate[custom[integer]]',
				edit : true,
				list: true
			},
			sleeping_capacity: {
				title : 'Sleaping Capacity',
				width : '15%',
				inputClass: 'validate[custom[integer]]',
				edit : true,
				list: true
			},
			luggage_capacity: {
				title : 'Luggage Capacity',
				width : '15%',
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


</script>
</html>