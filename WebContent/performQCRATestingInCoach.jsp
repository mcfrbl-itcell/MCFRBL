<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  

<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="hibernateConnect.HibernateConfig" %>
<%@page import="model.SubStagesMaster" %>
<html>
<head>
<title></title>
<% String contextpath=request.getContextPath();
String stageID= request.getParameter("stageId");
Session session1=HibernateConfig.getSession();
 Criteria cr1=session1.createCriteria(SubStagesMaster.class);
 cr1.add(Restrictions.eq("substageId", stageID));
 SubStagesMaster subStagesMaster =(SubStagesMaster)cr1.list().get(0);

String previousStage=subStagesMaster.getPreviousstageId();   //return either START or some value. Create option only applicable for where the value is START
String nextStages=subStagesMaster.getNextStageId();
 session1.close();
%>

<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />


<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery.jtable.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>

<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>

<style>

.jtable-input-readonly {
	background-color: lightgray;
}

#overlay{
	/* margin:0px auto;							
	
  display:block; z-index:15;
  width:47px; height:48px;  */
        position: fixed; 
        width: 20%; /* Set your desired with */
        z-index: 2; /* Make sure its above other items. */
        top: 50%;
        left: 50%;
        margin-top: -10%; /* Changes with height. */
        margin-left: -10%; /* Your width divided by 2. */
        /* You will not need the below, its only
           for styling   purposes.*/
        padding: 10px;
        border: 2px solid #555555;
        background-color: #ccc; 
/*        background-color: #4C4CFF; */
}


.hide-calendar .ui-datepicker-calendar {
	display: none;
}
/* button.ui-datepicker-current { display: none; } */
.jtable-child-table-container {
	border: 2px solid blue;
	width: 650px;
}

.no-titlebar .ui-dialog-titlebar {
    display: none;
}

.ui-datepicker .ui-datepicker-title select {
    color: #000;
}

.jtable-input-readonly {
	background-color: lightgray;
}

div.jtable-column-header-container {
	height: auto !important;
}

.col1
{
float:left;
padding: 5px 10px 5px 5px;
width: 45%;
}
.col2
{
float:right;
padding: 5px 5px 5px 10px;
width: 45%;
}


#jtable-create-form {
	
	display: block;
	width: 650px;
	
}

#jtable-edit-form {
	display: block;
	width: 650px;
	
}
#error_msg {
  color: red;
  text-align: center;
  margin: 10px auto;
}

.form_success span {
  width: 80%;
  height: 35px;
  margin: 3px 10%;
  font-size: 1.1em;
  color: green;
}
.form_success input {
  border: 1px solid green;
}

.disable{
   cursor: not-allowed;
   pointer-events: none;
   background-color: #cccccc;
  color: #666666;
}
</style>



<body>
<div id="FurnishingProductionTableContainer"></div>
 <div id="detailDialog" style="height: 200%; width:50%; display:none;z-index: 9;" ></div>
  <div id="qcraDialog" style="height:250px; width:50%; display:none;z-index: 9;" >
  <p><b>INSPECTION CALL MEMO/ QCRA</b></p>
  <p><b>Select Stage for QCRA:&nbsp;&nbsp;</b><select name="stageReference" id="stageReference" onchange="getQCRAData()"></select></p>
  <table border="1">
   <tr>
  <th>Doc No.</th> <td><input type="text" name="docNoQcra" id="docNoQcra" class='validate[required]'/></td>
  <th>Rev No:</th><td><input type="text" name="revNoQcra" id="revNoQcra" /></td>
  <th>Date:</th><td><input type="text" name="dateOfDocQcra" id="dateOfDocQcra" class='validate[required]'/></td>
  </tr>
  <tr>
  <th>Shell No</th> <td><input type="text" name="shellNoQcra" id="shellNoQcra" readonly/></td>
  <th>Furnishing No:</th><td><input type="text" name="furnishingNoQcra" id="furnishingNoQcra" readonly/></td>
  <th>Coach No:</th><td><input type="text" name="coachNoQcra" id="coachNoQcra" class='validate[required]'/></td>
  </tr>
   <tr>
  <th>Date of Testing</th> <td><input type="text" name="dateOfTesting" id="dateOfTesting" class='validate[required]'/></td>
  <th>Shift of Testing</th><td><select name="shiftQcra" id="shiftQcra">
  <option value=""></option>
  <option value="general">General</option>
  <option value="morning">Shift-I</option>
  <option value="evening">Shift-II</option>
  <option value="night">Shift-III</option>
  </select></td>
  <td><b>Booked to:</b></td>
  <td>Railway:&nbsp;&nbsp;<select name="coachDispatchRly" id="coachDispatchRly" onchange="myFunction(this.value)" class='validate[required]'></select>
  <br>
  Division:&nbsp;&nbsp;<select name="coachDispatchDiv" id="coachDispatchDiv" disabled>
  
  </select>
  </td>
  </tr>
  </table>
  <table>
  <tr><th>1. Nature of QC Inspection:</th><td><select name="natureOfQc" id="natureOfQc" class='validate[required]'>
  <option value="">Select</option>
  <option value="Audit">Audit</option>
  <option value="100 %">100 %</option>
  </select></td></tr>
  <tr><th>2. Sub Assembly/ Assembly:</th><td><input type="text" name="assemblyDetail" id="assemblyDetail"/></td></tr>
  <tr><th>3. Components No reference:</th><td><input type="text" name="componentNoReference" id="componentNoReference"/></td></tr>
  <tr><th>4. (i) Whether offered initially/ After Rectification</th><td><input type="text" name="rectification" id="rectification"/></td></tr>
  <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;(i) If rectified, QC Defect Report No:&nbsp;&nbsp;<input type="text" name="defectReportNo" id="defectReportNo"/></td><td>Dated:&nbsp;<input type="text" name="defectReportDate" id="defectReportDate"/></td></tr>
  <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;a- Points no</td><td><input type="text" name="pointNoRectified" id="pointNoRectified"/>&nbsp; rectified</td></tr>
  <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;b- Items of points no</td><td><input type="text" name="itemPointNo" id="itemPointNo"/>&nbsp; replaced</td></tr>
  <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;c- Points no</td><td><input type="text" name="pointNoNotRectified" id="pointNoNotRectified"/>&nbsp; can not be rectified.</td></tr>
   
  <tr><td>Observation Remarks</td><td><textarea name="observationRemark" id="observationRemark"></textarea></td></tr>
  </table>
 
  </div>
</body>
<script>
var shellArray=[];
var record;
		$(document).ready(function() {

			$('#dateOfTesting').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        maxDate: new Date(),
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }
		    });
			$('#defectReportDate').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        maxDate: new Date(),
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }
		    });
			$('#dateOfDocQcra').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        maxDate: new Date(),
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }
		    });      
			
			
			$("#coachDispatchRly").append('<option value="">Select</option>');
			<c:forEach var="a" items="${zoneList}">
			var o = new Option("${a}", "${a}");
			$("#coachDispatchRly").append(o);
	    </c:forEach>
		

		   // end of code for bogie type
				//start: retrieving axle number in dropdown option
			    var bogieNumbers=[]; 

				var j=1;
				bogieNumbers[0]={ Value:null, DisplayText: "Select" };
				<c:forEach var="b" items="${bogieNumberList}">
				bogieNumbers[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
					j++;
				    </c:forEach>
				  //end: retrieving axle number in dropdown option
	
						
	$('#FurnishingProductionTableContainer').jtable({
			
			title : 'Issue QCRA for Coach',
			
			paging:true,
            sorting: true,
            defaultSorting: 'qciTestingDate ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
            
            // create toolbar
            toolbar: {
            	items:[
            		{
            	    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Issue QCRA',
                        click: function () {
  
                        	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to sent for Bogie Shop");
                    	 	 else{
                    	 		//var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								
							//	$('#datepickerCompletion').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
							//	$("#performAction").dialog({
								
								$.ajax({
									url:"stageOptionForQCRA",
									dataType:'json',
									data:{
							          furnishingId:record.furnishingAssetId
										
									},
									type : 'POST',
            						async : false,
								}).done(function( msg ) {
									
									//optionForFurnishingStage= msg.optionFields;
									 var docDate=(msg.docDate).substring(0,10);
                                     var docDateArray=docDate.split("-");
                                     $('#dateOfDocQcra').datepicker("setDate", new Date(docDateArray[0],docDateArray[1]-1,docDateArray[2]));	
									$('#stageReference').append(msg.optionFields);
									$('#docNoQcra').val(msg.docNo);
									$('#revNoQcra').val(msg.revCode);
									
									//$('#dateOfDocQcra').val(msg.docDate);
									$('#shellNoQcra').val(msg.shellNo);
									$('#furnishingNoQcra').val(msg.furnishingNo);
									$('#coachNoQcra').val(msg.coachNo);
									
								}).error(function (msg){
 									
 									alert("Error Fetching Data");
 								})
 								  ;
            					// code for fetch other data based on change function of stageReference
            
            					
								
					// end of stage reference change function and retieving related data			
								
								
                    	 	 	$("#qcraDialog").dialog({
                    	 	 		width: '65%',
                    	 	 		title : 'QCRA for  Shell No ='+search(record.shellAssetId), 
                    	 	 		                	 	 		
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#qcraDialog").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    		
	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
	                            	 		
	                                    	if ($('#docNoQcra').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;
				                                        }
	                                    	if ($('#dateOfDocQcra').validationEngine('validate')) {
	                                        	//alert(!$("#dialog").validationEngine('validate'));
	                                            return false;
	                                        }
	                                    	if ($('#coachNoQcra').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                         if ($('#dateOfTesting').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }	    	   
	                                    	$.ajax({
	                    						url : "saveQCRA",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							furnishingAssetId: record.furnishingAssetId,
	                    							stageReference: $('#stageReference').val(),
	                    							docNoQcra: $('#docNoQcra').val(),
	                    							revNoQcra: $('#revNoQcra').val(),
	                    							dateOfDocQcra: $('#dateOfDocQcra').val(),
	                    							coachNoQcra: $('#coachNoQcra').val(),
	                    							dateOfTesting: $('#dateOfTesting').val(),
	                    							shiftQcra: $('#shiftQcra').val(),
	                    							coachDispatchRly: $('#coachDispatchRly').val(),
	                    							coachDispatchDiv: $('#coachDispatchDiv').val(),  

	                    							natureOfQc: $('#natureOfQc').val(),
	                    							assemblyDetail: $('#assemblyDetail').val(),
	                    							componentNoReference:$('#componentNoReference').val(),
	                    							rectification: $('#rectification').val(),
	                    							defectReportNo:$('#defectReportNo').val(),
	                    							defectReportDate:$('#defectReportDate').val(),
	                    							pointNoRectified:$('#pointNoRectified').val(),
	                    							itemPointNo:$('#itemPointNo').val(),
	                    							pointNoNotRectified:$('#pointNoNotRectified').val(),
	                    							observationRemark:$('#observationRemark').val(),
	                    							
	                    						
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							$('#stageReference').val(''),
	                    							$('#docNoQcra').val(''),
	                    							$('#revNoQcra').val(''),
	                    							$('#dateOfDocQcra').val(''),
	                    							$('#coachNoQcra').val(''),
	                    							$('#dateOfTesting').val(''),
	                    							$('#shiftQcra').val(''),
	                    							$('#coachDispatchRly').val(''),
	                    							$('#coachDispatchDiv').val(''),  

	                    							$('#natureOfQc').val(''),
	                    							$('#assemblyDetail').val(''),
	                    							$('#componentNoReference').val(''),
	                    							$('#rectification').val(''),
	                    							$('#defectReportNo').val(''),
	                    							$('#defectReportDate').val(''),
	                    							$('#pointNoRectified').val(''),
	                    							$('#itemPointNo').val(''),
	                    							$('#pointNoNotRectified').val(''),
	                    							$('#observationRemark').val(''),

	                    							$('#qcraDialog').dialog('close');
	                    							
	                    							$('#FurnishingProductionTableContainer').jtable('load');
	         								  })
	         								.error(function (msg){
	         									//$('#dialog').dialog('close');
	         									alert("Error Fetching Data");
	         								});
	         								  
					                 			    	   return true;
				                                    }
	                                    },
				                        Close: function () {
				                        	
				                                        $(this).dialog('close');
				                                    }
	                                    },
	                    	        modal: true
    	    });
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		    
            			    	   return true;
                    	 		    
                    	 			  
                    	 		  }//ending else               	  
                    	  // ajax call ends here				
    						 
                        }
            			
            		}
            		
            	],
            	
            },
            
            
            
			actions : {
	
 			listAction: 'availableForQCRAFurnishingAction?stageID=<%=stageID%>',
 			
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
				
				shellAssetId: {
					title: 'Shell No',
					width: '20%',
					display:function(data){
 						//var shellNo;
 						var shell={};
 						shell.assetId=data.record.shellAssetId;
 						$.ajax({                    
 							  //url: 'descByshellFromIdinPaintShop', 
 							   url: 'descByshellFromId', 
 							  type: 'post', // performing a POST request
 							  async: false,
							  
 							  dataType: 'json',
 								  data : {
									
 									 shellAssetId: data.record.shellAssetId
 								  	  }									                    
 						})
 								.done(function( msg ) {
 								//	shellNo=msg.shellNo;
 								shell.assetNo=msg.shellNo;
								shellArray.push(shell);
									
 									//return msg.stageName;																			    											
 								  })
 								.error(function (msg){
 									alert("Error Saving Data");
 								})
 								  ;
						
						
 						//return shellNo;
 						return shell.assetNo;
 						},
 						create: false,
 						width : '20%',
 						list: true,
 						edit : false
 					},
 					shellType: {
 						title :'Shell Type',
 						width: '8%',
 						list: true,
 						create: false,
 						edit: false		
 						},		
 						coachType:
						{
						title: 'Coach Type',
						 width : '10%',
						list: true,
						edit : false,
					     create: false 
						},
				furnishingAssetId : {
					title : 'furnishingAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					
		
// 					assemblyStartDate: {
// 							title :'Assembly Start Date',
// 							width: '8%',
// 							inputClass: 'validate[required]',
// 							type: 'date',
//  							displayFormat: 'dd-mm-yy',
// 							display:function(data){
												 
// 								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
// 													}, 
// 							list: true,
// 							create: false,
// 							edit: false
											
// 							},
							vendorAllotted:{
								title :'Alloted Vendor',
								width: '8%',
								
								list: true,
								create: false,
								edit: false
								},
								vendorAllottedDate:
									{
									title :'Alloted Date',
									width: '8%',
									//inputClass: 'validate[required]',
		 							type: 'date',
		 							displayFormat: 'dd-mm-yy',
									display:function(data){
										//alert(data.record.id.hodyCode)	;				 
										return ((data.record.vendorAllottedDate!=null) && (data.record.vendorAllottedDate!="") ) ? moment(data.record.vendorAllottedDate).format('DD-MM-YYYY') : "";
															}, 
														
													
									list: true,
									create: true,
									edit: true
									
									},
					//left bogie display purpose	
							
				bogiePpSideAssetId: {
							title :'PP side Bogie No.',
 					display:function(data){
	 						var bogieNo;
	 						if(data.record.bogiePpSideAssetId!=null)
							{
	 						$.ajax({                    
	 							  url: 'descByBogieId',     
	 							  type: 'post', // performing a POST request
	 							  async: false,
								  
	 							  dataType: 'json',
	 								  data : {
										
	 									 bogieAssetId: data.record.bogiePpSideAssetId
	 								  	  }									                    
	 						})
	 								.done(function( msg ) {
	 									bogieNo=msg.bogieNo;
										
	 									//return msg.stageName;																			    											
	 								  })
	 								.error(function (msg){
	 									alert("Error Saving Data");
	 								})
	 								  ;
							
							}
	 						return bogieNo;
	 						},
							
							
							list:true,
							create: false,
							edit: false
							},
							//left bogie update and create purpose		
					  bogiePpSideAssetId1: {
						title :'PP Side Bogie No.',
						width: '8%',

						options: bogieNumbers,
						list: false,
						create: true,
						edit: true		
						}, 
					//Non PP SIde Bogie display	
						bogieNppSideAssetId: {
							title :'N-PP side Bogie No.',
							list:true,
							display:function(data){
		 						var bogieNo;
		 						if(data.record.bogieNppSideAssetId!=null)
								{
		 						$.ajax({                    
		 							  url: 'descByBogieId',     
		 							  type: 'post', // performing a POST request
		 							  async: false,
									  
		 							  dataType: 'json',
		 								  data : {
											
		 									 bogieAssetId:data.record.bogieNppSideAssetId
		 								  	  }									                    
		 						})
		 								.done(function( msg ) {
		 									bogieNo=msg.bogieNo;
											
		 									//return msg.stageName;																			    											
		 								  })
		 								.error(function (msg){
		 									alert("Error Saving Data");
		 								})
		 								  ;
								}
								
		 						return bogieNo;
		 						},
							create: false,
							edit: false
							},
					//right wheel update and create purpose
 					bogieNppSideAssetId1: {
 					title :'N-PP Side Bogie No.',
						width: '8%',
 			          options: bogieNumbers,
 						list: false,
						create: true,
 						edit: true		
							},

				exitRemarkFurnishing: {
				   title: 'Remark given by Furnishing',
				   width : '10%',
					type : 'textarea',
					edit : false,
					create: false 
				},
								
				
				qciTestingDate:
					{
					title: 'QCI Testing Date',
					width: '5%',
					type:'date',
					display:function(data){
						 
						return ((data.record.qciTestingDate!=null) && (data.record.qciTestingDate!="") ) ? moment(data.record.qciTestingDate).format('DD-MM-YYYY') : "";
											}, 
							
					},
					coachNumber: {
						   title: 'Coach No.',
						   width : '10%',
							
							edit : false,
							create: false 
						},
						
								cctvTestingFlag:
								{
							title: 'CCTV SIP Report',
				            width: '3%',
				            edit: false,
				            create: false,	
				            display: function (data) {
				         var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
				         $img.click(function () {
				        
				        	var wWidth = $(window).width();
							var dWidth = wWidth * 0.9;
							var wheight = $(window).height();
							var dheight = wheight * 0.9;
							var furnishingAssetId=data.record.furnishingAssetId;
							
				var URL="open-cctv-SIP-report?furnishingAssetId="+furnishingAssetId;
								
				var diagtitle="Final SIP Report";
									$( "#detailDialog" ).load( URL ).dialog({
																			title: diagtitle,
																			modal:true,
																			height:dheight, 
																			width: '40%', 
																			}).prev(".ui-dialog-titlebar").css("background","blue");
						
				        	
				         });
				            	
				            	return $img;	
				            }
								},
								
								plumbingTestingFlag:
								{
							title: 'Plumbing SIP Report',
				            width: '3%',
				            edit: false,
				            create: false,	
				            display: function (data) {
				         var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
				         $img.click(function () {
				        
				        	var wWidth = $(window).width();
							var dWidth = wWidth * 0.9;
							var wheight = $(window).height();
							var dheight = wheight * 0.9;
							var furnishingAssetId=data.record.furnishingAssetId;
							
				var URL="open-plumbing-SIP-report?furnishingAssetId="+furnishingAssetId;
								
				var diagtitle="Final SIP Report";
									$( "#detailDialog" ).load( URL ).dialog({
																			title: diagtitle,
																			modal:true,
																			height:dheight, 
																			width: '40%', 
																			}).prev(".ui-dialog-titlebar").css("background","blue");
						
				        	
				         });
				            	
				            	return $img;	
				            }
								},
								
								
								showerTestingFlag:
								{
							title: 'Shower TestingReport',
				            width: '3%',
				            edit: false,
				            create: false,	
				            display: function (data) {
				         var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
				         $img.click(function () {
				        
				        	var wWidth = $(window).width();
							var dWidth = wWidth * 0.9;
							var wheight = $(window).height();
							var dheight = wheight * 0.9;
							var furnishingAssetId=data.record.furnishingAssetId;
							
				var URL="open-showertesting-SIP-report?furnishingAssetId="+furnishingAssetId;
								
				var diagtitle="Shower Testing SIP Report";
									$( "#detailDialog" ).load( URL ).dialog({
																			title: diagtitle,
																			modal:true,
																			height:dheight, 
																			width: '40%', 
																			}).prev(".ui-dialog-titlebar").css("background","blue");
						
				        	
				         });
				            	
				            	return $img;	
				            }
								},
								fibaTestingFlag:
								{
							title: 'Fiba Testing Report',
				            width: '3%',
				            edit: false,
				            create: false,	
				            display: function (data) {
				         var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
				         $img.click(function () {
				        
				        	var wWidth = $(window).width();
							var dWidth = wWidth * 0.9;
							var wheight = $(window).height();
							var dheight = wheight * 0.9;
							var furnishingAssetId=data.record.furnishingAssetId;
							
				var URL="open-fibatesting-SIP-report?furnishingAssetId="+furnishingAssetId;
								
				var diagtitle="Fiba Testing SIP Report";
									$( "#detailDialog" ).load( URL ).dialog({
																			title: diagtitle,
																			modal:true,
																			height:dheight, 
																			width: '40%', 
																			}).prev(".ui-dialog-titlebar").css("background","blue");
						
				        	
				         });
				            	
				            	return $img;	
				            }
								},
								biotankTestingFlag:
								{
								title: 'BioTank Testing Report',
					            width: '3%',
					            edit: false,
					            create: false,	
					            display: function (data) {
					         var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
					         $img.click(function () {
					        
					        	var wWidth = $(window).width();
								var dWidth = wWidth * 0.9;
								var wheight = $(window).height();
								var dheight = wheight * 0.9;
								var furnishingAssetId=data.record.furnishingAssetId;
								
					var URL="open-biotank-SIP-report?furnishingAssetId="+furnishingAssetId;
									
					var diagtitle="Bio Tank Testing SIP Report";
										$( "#detailDialog" ).load( URL ).dialog({
																				title: diagtitle,
																				modal:true,
																				height:dheight, 
																				width: '40%', 
																				}).prev(".ui-dialog-titlebar").css("background","blue");
							
					        	
					         });
					            	
					            	return $img;	
					            }
									},	
									airBrakeTestingFlag:
									{
									title: 'AirBrake Testing Report',
						            width: '3%',
						            edit: false,
						            create: false,	
						            display: function (data) {
						         var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
						         $img.click(function () {
						        
						        	var wWidth = $(window).width();
									var dWidth = wWidth * 0.9;
									var wheight = $(window).height();
									var dheight = wheight * 0.9;
									var furnishingAssetId=data.record.furnishingAssetId;
									
						var URL="open-airbrake-SIP-report?furnishingAssetId="+furnishingAssetId;
										
						var diagtitle="Air Brake Testing SIP Report";
											$( "#detailDialog" ).load( URL ).dialog({
																					title: diagtitle,
																					modal:true,
																					height:dheight, 
																					width: '40%', 
																					}).prev(".ui-dialog-titlebar").css("background","blue");
								
						        	
						         });
						            	
						            	return $img;	
						            }
										},	
												
										cbcTestingFlag:
										{
										title: 'CBC Height Testing Report',
							            width: '3%',
							            edit: false,
							            create: false,	
							            display: function (data) {
							         var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
							         $img.click(function () {
							        
							        	var wWidth = $(window).width();
										var dWidth = wWidth * 0.9;
										var wheight = $(window).height();
										var dheight = wheight * 0.9;
										var furnishingAssetId=data.record.furnishingAssetId;
										
							var URL="open-buffercbcheight-SIP-report?furnishingAssetId="+furnishingAssetId;
											
							var diagtitle="Buffer/CBC Height Testing SIP Report";
												$( "#detailDialog" ).load( URL ).dialog({
																						title: diagtitle,
																						modal:true,
																						height:dheight, 
																						width: '40%', 
																						}).prev(".ui-dialog-titlebar").css("background","blue");
									
							        	
							         });
							            	
							            	return $img;	
							            }
											},					
									
											fireSmokeTestingFlag:
											{
											title: 'Fire-Smoke Testing Report',
								            width: '3%',
								            edit: false,
								            create: false,	
								            display: function (data) {
								         var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
								         $img.click(function () {
								        
								        	var wWidth = $(window).width();
											var dWidth = wWidth * 0.9;
											var wheight = $(window).height();
											var dheight = wheight * 0.9;
											var furnishingAssetId=data.record.furnishingAssetId;
											
								var URL="open-firesomke-SIP-report?furnishingAssetId="+furnishingAssetId;
												
								var diagtitle="Fire, Smoke Detection and Suppression System";
													$( "#detailDialog" ).load( URL ).dialog({
																							title: diagtitle,
																							modal:true,
																							height:dheight, 
																							width: '40%', 
																							}).prev(".ui-dialog-titlebar").css("background","blue");
										
								        	
								         });
								            	
								            	return $img;	
								            }
												},	
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			recordsLoaded: function(event, data) {
	
				 /*  if (prevStage!='START'){
					 
				     $('#FurnishingProductionTableContainer').find('.jtable-toolbar-item.jtable-toolbar-item-add-record').remove();
				  } */
				  
				},
				formCreated: function (event, data) {
					  
				var startDate=(data.record.dispatchDateInQuality).substring(0,10);
				
                    var num = startDate.match(/\d+/g); 
             		var date = new Date(num[0], num[1]-1, num[2]);
				//	 $('[name=expectedExitDate]').datepicker("option","minDate", date)	;	
				//	 $('[name=vendorAllottedDate]').datepicker("option","minDate", date)	;
 				
	
	               	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#FurnishingProductionTableContainer').jtable('load');
	    		},
	    		
 
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			   return data.form.validationEngine('validate');
			             
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			               data.form.validationEngine('hide');
			                data.form.validationEngine('detach');
				},
				recordUpdated:function(event,data)
				{
					srno=0;
					$('#FurnishingProductionTableContainer').jtable('load');
				},
	              
			});
	$('#FurnishingProductionTableContainer').jtable('load');
		});
	
	
	function search(id)
	{
		//alert("am called, id="+id +""+JSON.stringify(shellArray));
		for(var i=0;i<shellArray.length;i++){
			
			if(shellArray[i].assetId==id)
				{
				//alert( shellArray[i].assetNo);
					return shellArray[i].assetNo;
				}
				
			}
		}
	function setMinDate(){
	
		var from = $('#datepickerCompletion').val(); 
		var numbers = from.match(/\d+/g); 
		
		var date = new Date(numbers[2], numbers[1]-1, numbers[0]);
		
		$('#datepickerExit').datepicker('option', 'minDate', date);
	}
	function myFunction(zone)
	{
		
		var zoneValue = $('#coachDispatchRly').val() ;
		if(zoneValue!="")
			
			{
		$("#coachDispatchDiv").removeAttr('disabled');
		//alert(zoneValue);
		 $.ajax({                    
             url: 'getDiv',    
             type: 'post', // performing a POST request
             async: false,
             
             dataType: 'json',
             data : {
             zone: zoneValue,
               }                    
            })
            .done(function( msg ) {
           
            if(msg.divList!=null)
              {
          
            $('#coachDispatchDiv')
                           .find('option')
                           .remove()
                           .end();

            $('#coachDispatchDiv').append(
                    '<option value="">Select</option>');
                        for ( var i = 0; i < msg.divList.length; i++) {
                       
                        $('#coachDispatchDiv').append(
                        '<option value=' + msg.divList[i] + '>'
                        + msg.divList[i]
                        + '</option>');
                       
                        }
              }
           
             })
            .error(function (msg){
            alert("Error Saving Data");
            })
             ;
                     
               
		
		
		
			}
	}
  function getQCRAData()
  {
	  //alert("hi");
	  if($('#stageReference').val()!="")
		{
			//alert("Navin");

			$.ajax({                    
	             url: 'getQCRA',    
	             type: 'post', // performing a POST request
	             async: false,
	             
	             dataType: 'json',
	             data : {
	            	 stage: $('#stageReference').val(),
	                 furnishingId: record.furnishingAssetId,
	               }                    
	            })
	            .done(function( msg ) {
	           
	            	if(msg.qcra!=null)
	            	{
	            		$("#coachDispatchDiv").removeAttr('disabled');


	            		$('#coachDispatchDiv')
                        .find('option')
                        .remove()
                        .end();
                    
                     
                    
                     $('#coachDispatchDiv').append(
                     '<option value=' + msg.dispatchDiv + '>'
                     + msg.dispatchDiv
                     + '</option>');
                    
                    
                         
	            		
	            	var testingDate=(msg.qcra.dateOfTesting).substring(0,10);
	            	var testingDateArray=testingDate.split("-");
	            	var defectrDate=(msg.qcra.defectReportDate).substring(0,10);
	            	var defectrDateArray=defectrDate.split("-");
	            	$('#dateOfTesting').datepicker("setDate", new Date(testingDateArray[0],testingDateArray[1]-1,testingDateArray[2]));	


	            	$('#shiftQcra').val(msg.qcra.shifOfTesting),
	            	$('#coachDispatchRly').val(msg.dispatchRly),
	            	
	            	//$('#').val(msg.dispatchDiv),
	            	//alert(msg.dispatchDiv);
	            	$('#natureOfQc').val(msg.qcra.natureOfQc),
	            	$('#assemblyDetail').val(msg.qcra.assemblyDetail),
	            	$('#componentNoReference').val(msg.qcra.componentNoReference),
	            	$('#defectReportDate').datepicker("setDate", new Date(defectrDateArray[0],defectrDateArray[1]-1,defectrDateArray[2]));	
	            	$('#rectification').val(msg.qcra.rectification),
	            	$('#defectReportNo').val(msg.qcra.defectReportNo),
	            	$('#pointNoRectified').val(msg.pointNoRectified),
	            	$('#itemPointNo').val(msg.itemPointNo),
	            	$('#pointNoNotRectified').val(msg.pointNoNotRectified),              
	            	$('#observationRemark').val(msg.observationRemark);  

	            	}           
	            	else
		            	{
	            		
		            	$('#dateOfTesting').datepicker("setDate", new Date());	


		            	$('#shiftQcra').val(''),
		            	$('#coachDispatchRly').val(''),
		            	$('#coachDispatchDiv').val(''),
		            	//$('#').val(msg.dispatchDiv),
		            	//alert(msg.dispatchDiv);
		            	$('#natureOfQc').val(''),
		            	$('#assemblyDetail').val(''),
		            	$('#componentNoReference').val(''),
		            	$('#defectReportDate').datepicker("setDate", '');	
		            	$('#rectification').val(''),
		            	$('#defectReportNo').val(''),
		            	$('#pointNoRectified').val(''),
		            	$('#itemPointNo').val(''),
		            	$('#pointNoNotRectified').val(''),              
		            	$('#observationRemark').val('');  
	                         
		            	}
	           
	             })
	            .error(function (msg){
	            alert("Error Fetching Data");
	            })
	             ;

}

  }
	</script>