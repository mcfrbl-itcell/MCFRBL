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
</style>





<style>
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

 
</body>
<script>
var shellArray=[];
		$(document).ready(function() {
			
			 var first = new Option("select", null );
				
				$("#coachType").append(first);
				
				<c:forEach var="a" items="${coachType}">
				
				var o = new Option("${a}", "${a}");
			
				$(o).html("${a}");
				$("#coachType").append(o);
				
				
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
			
			
			
// for date picker in dialog box
		 $('#dateOfTesting').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }

		    }).datepicker("setDate", new Date()); 
				 
	$('#FurnishingProductionTableContainer').jtable({
			
			title : 'Quality Shop Production',
			
			paging:true,
            sorting: true,
            defaultSorting: 'receiptDateAtQuality ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      //Create toolbat
             toolbar: {
                items: [

                            	            	
                         	
        // next toolbar for CBC Height Check
		 {
	icon: '<%=contextpath%>/images/rs_out.png',
   text: 'AIR BRAKE TEST',
   click: function () {
   	
   	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
	 	 if ($selectedRows.length<1)
		 alert("Please select a row for which you want to Captured BUFFER CBC Testing");
	
	 	 else{
	 		var record;
	 		$selectedRows.each(function () {
               record = $(this).data('record');
               });
	 	
	 		// ajax call to show bogie pp end and other details
	 	$.ajax({
				url : "showBogieAndShellDetails",  //action-name as defined in struts.xml
				dataType: 'json', 
				data : {
					furnishingAssetId: record.furnishingAssetId,
					             					
				},
				
				type : 'POST',
				async : false,
		})
				.done(function( msg ) {
					
					$('#docNoAirbrake').val(msg.docNoAirbrake),
					
					$('#bogiePPMakeforAirBrake').val(msg.bogiePPMake),
					$('#bogiePPNoforAirBrake').val(msg.bogiePPSideNo),
					$('#bogieNPPMakeforAirBrake').val(msg.bogieNPPMake),
					$('#bogieNPPNoforAirBrake').val(msg.bogieNPPSideNo),
					$('#cbcPPMakeforAirBrake').val(msg.cbcPPMakeforAirBrake),
					$('#cbcPPNoforAirBrake').val(msg.cbcPPNoforAirBrake),
					$('#cbcNPPMakeforAirBrake').val(msg.cbcNPPMakeforAirBrake),
					$('#cbcNPPNoforAirBrake').val(msg.cbcNPPNoforAirBrake),
					$('#bufferMake').val(msg.bufferMake),
					$('#bufferNo').val(msg.bufferNo),
					$('#brakePanelMake').val(msg.brakePanelMake),
					$('#brakePanelNo').val(msg.brakePanelNo),
					$('#distributorValveMake').val(msg.distributorValveMake),
					$('#distributorValveNo').val(msg.distributorValveNo),
					$('#pullBoxMake').val(msg.pullBoxMake),
					$('#pullBoxNo').val(msg.pullBoxNo),
					$('#handBrakeMake').val(msg.handBrakeMake),
					$('#handBrakeNo').val(msg.handBrakeNo),
					$('#shellNo4').val(msg.shellNo),
					$('#shellType4').val(msg.shellType),
					$('#furnishingNo4').val(msg.furnishingNo); 
					})
			.error(function (msg){
				//$('#dialog').dialog('close');
				alert("Error Fetching Coach Details Data");
			})
			  ;
			
	 		//end of code
	 		
	 		
	 		
	 		if(record.airBrakeTestingFlag==1)
	 			{
	 		var cfm=confirm("Data for AIR BRAKE TESTING is already updated. Do you want to verify data?");
       	if(cfm==false){return false;}	
       	$("#dateOfAirbrake").val('');
       	
       	//yaha se code dekhana hai
       	$.ajax({
				url : "showExistingDataInAirbrakeTesting",  //action-name as defined in struts.xml
				dataType: 'json', 
				data : {
					furnishingAssetId: record.furnishingAssetId,	             					
				},
				
				type : 'POST',
				async : false,
	 		})
				.done(function( msg ) {
					if(msg.airbrakeTestingTransaction!=null)
						{
					$('#docNoAirbrake').val(msg.airbrakeTestingTransaction.docNoAirbrake);
				
				   var dateOfAirbrakeTesting=(msg.airbrakeTestingTransaction.dateOfAirbrake).substring(0,10);
             
             
             var  dateAirbrakeArray = dateOfAirbrakeTesting.match(/\d+/g); 
     		
                  var dateBuffercbcheightTesting = new Date(dateAirbrakeArray[0], dateAirbrakeArray[1]-1, dateAirbrakeArray[2]);
					$("#dateOfAirbrake").datepicker("setDate", dateBuffercbcheightTesting);
					
					$('#shiftAirbrake').val(msg.airbrakeTestingTransaction.shiftAirbrake);
					
					$('#preTextLockCoach').val(msg.airbrakeTestingTransaction.supplierName);
					$('#preTextConformityBrakeMount').val(msg.airbrakeTestingTransaction.pressureOfNitrogenObservation);
					$('#preTextVerifyAllBrake').val(msg.airbrakeTestingTransaction.preTextVerifyAllBrake);
					$('#preTextVerifyPositionCockes').val(msg.airbrakeTestingTransaction.preTextVerifyPositionCockes);
					$('#preTextOpenedCockes103').val(msg.airbrakeTestingTransaction.preTextOpenedCockes103);
					$('#preTextOpenedCockes104_1').val(msg.airbrakeTestingTransaction.preTextOpenedCockes104_1);
					$('#preTextOpenedCockes104_2').val(msg.airbrakeTestingTransaction.preTextOpenedCockes104_2);
					$('#preTextEmergencyCock').val(msg.airbrakeTestingTransaction.preTextEmergencyCock);
					$('#preTextDistributorValve').val(msg.airbrakeTestingTransaction.preTextDistributorValve);
					
					$('#preTextBrakeCylinder').val(msg.airbrakeTestingTransaction.preTextBrakeCylinder);
					$('#preTextFitmentAuxiliaryReservoir').val(msg.airbrakeTestingTransaction.preTextFitmentAuxiliaryReservoir);
					$('#reservoirChargingGeneratorCoaches').val(msg.airbrakeTestingTransaction.reservoirChargingGeneratorCoaches);
					$('#reservoirChargingBrakePipePressure').val(msg.airbrakeTestingTransaction.reservoirChargingBrakePipePressure);
					
					$('#reservoirChargingChargingTime').val(msg.airbrakeTestingTransaction.reservoirChargingChargingTime);
					$('#reservoirChargingControlPressure').val(msg.airbrakeTestingTransaction.reservoirChargingControlPressure);
					

					$('#sealingTestInterruptCharging').val(msg.airbrakeTestingTransaction.sealingTestInterruptCharging);
					$('#sealingTestOpenCocks').val(msg.airbrakeTestingTransaction.sealingTestOpenCocks);
					$('#fullBrakeApplicationReducePressure').val(msg.airbrakeTestingTransaction.fullBrakeApplicationReducePressure);
					$('#fullBrakeApplicationEmergencyApplication').val(msg.airbrakeTestingTransaction.fullBrakeApplicationEmergencyApplication);
					
					$('#fullBrakeApplicationMaxPressure').val(msg.airbrakeTestingTransaction.fullBrakeApplicationMaxPressure);
					$('#fullBrakeApplicationAllBrake').val(msg.airbrakeTestingTransaction.fullBrakeApplicationAllBrake);
					$('#releaseFullBrakeFillBP').val(msg.airbrakeTestingTransaction.releaseFullBrakeFillBP);
					$('#emergencyApplicationReduceBrakePressure').val(msg.airbrakeTestingTransaction.emergencyApplicationReduceBrakePressure);
					$('#emergencyApplicationAcceleratorRespond').val(msg.airbrakeTestingTransaction.emergencyApplicationAcceleratorRespond);
					$('#emergencyApplicationChargingTime').val(msg.airbrakeTestingTransaction.emergencyApplicationChargingTime);
					$('#emergencyApplicationMaxBCPressure').val(msg.airbrakeTestingTransaction.emergencyApplicationMaxBCPressure);
					$('#emergencyApplicationAllBrake').val(msg.airbrakeTestingTransaction.emergencyApplicationAllBrake);
					
					$('#releaseEmergencyBrakeFillBP').val(msg.airbrakeTestingTransaction.releaseEmergencyBrakeFillBP);
					$('#releaseEmergencyBrakePressureDropTime').val(msg.airbrakeTestingTransaction.releaseEmergencyBrakePressureDropTime);
					$('#releaseEmergencyBrakeBrakeCylinderRelease').val(msg.airbrakeTestingTransaction.releaseEmergencyBrakeBrakeCylinderRelease);
					$('#graduatedBrakeApplication').val(msg.airbrakeTestingTransaction.graduatedBrakeApplication);
					$('#pressureGovernorChargeFeedingPipe').val(msg.airbrakeTestingTransaction.pressureGovernorChargeFeedingPipe);
					$('#pressureGovernorExhaustFeedingPipe').val(msg.airbrakeTestingTransaction.pressureGovernorExhaustFeedingPipe);
					$('#sealingTestFeed').val(msg.airbrakeTestingTransaction.sealingTestFeed);
					$('#normalServiceFeedMaxPressure').val(msg.airbrakeTestingTransaction.normalServiceFeedMaxPressure);
					$('#controlIndicatingDeviceActualFullBrake').val(msg.airbrakeTestingTransaction.controlIndicatingDeviceActualFullBrake);
					$('#controlIndicatingDeviceCockPosition4_1').val(msg.airbrakeTestingTransaction.controlIndicatingDeviceCockPosition4_1);
					$('#controlIndicatingDeviceCockPosition4_2').val(msg.airbrakeTestingTransaction.controlIndicatingDeviceCockPosition4_2);
					$('#controlIndicatingDeviceCockPosition41_42').val(msg.airbrakeTestingTransaction.controlIndicatingDeviceCockPosition41_42);
					$('#controlInsensitivityExhaustBrakePipe').val(msg.airbrakeTestingTransaction.controlInsensitivityExhaustBrakePipe);
					$('#controlSensitivityBrakePipe').val(msg.airbrakeTestingTransaction.controlSensitivityBrakePipe);
					
					$('#firstBrakeStep').val(msg.airbrakeTestingTransaction.firstBrakeStep);
					$('#reactivityQuickServiceFailure').val(msg.airbrakeTestingTransaction.reactivityQuickServiceFailure);
					$('#parkingBrakeHandbrakeReleased').val(msg.airbrakeTestingTransaction.parkingBrakeHandbrakeReleased);
					$('#parkingBrakeHandbrakeApplied').val(msg.airbrakeTestingTransaction.parkingBrakeHandbrakeApplied);
					$('#emergencyBrakePassengerExhaustBrake').val(msg.airbrakeTestingTransaction.emergencyBrakePassengerExhaustBrake);
					$('#emergencyBrakePassengerCloseHandle').val(msg.airbrakeTestingTransaction.emergencyBrakePassengerCloseHandle);
					
					$('#emergencyBrakePassengerPassengerAlarm').val(msg.airbrakeTestingTransaction.emergencyBrakePassengerPassengerAlarm);
					$('#emergencyBrakeGuard').val(msg.airbrakeTestingTransaction.emergencyBrakeGuard);
					$('#cbcFitment').val(msg.airbrakeTestingTransaction.cbcFitment);
					$('#remarks_airbrake').val(msg.airbrakeTestingTransaction.remarks);
				
						}

				  })
				.error(function (msg){
					//$('#dialog').dialog('close');
					alert("Error Fetching Air Brake Testing Data");
				})
				  ;
	 			}
	 		
             //alert(moment(record.assemblyStartDate).format('DD-MM-YYYY'));
             var startDate=(record.receiptDateAtQuality).substring(0,10);
             
             
             var num = startDate.match(/\d+/g); 
     		
     		var date = new Date(num[0], num[1]-1, num[2]);
     		 var startDate=(record.receiptDateAtQuality).substring(0,10);
             $('#dateOfAirbrake').datepicker('option', 'minDate', date);
        
             $('#airbrakeTestingDialog').datepicker('option', 'minDate', date);
	 		
	 	 	$("#airbrakeTestingDialog").dialog({
	 	 		width: '80%',
	 	 
	 	 		title : 'Testing for  '+record.coachNumber ,                     	 	 		
	 	 		close: function (e, u) {
		              //$(".formError").remove();
		          	$("#airbrakeTestingDialog").validationEngine('hideAll');
	 	 		    },
		 	
					buttons: {
						Submit: {
                        text: "Submit",
                       
                        click:function () {
                  
                       var c=confirm("Verify data before submit, Are you sure to save data");
                    	if(c==false){return false;}	    	   
                    	$.ajax({
    						url : "airbrakeTestingAction",  //action-name as defined in struts.xml
    						dataType: 'json', 
    						data : {

    							furnishingAssetId: record.furnishingAssetId,
    							docNoAirbrake:$('#docNoAirbrake').val(),
    							dateOfAirbrake:$("#dateOfAirbrake").val(),
    							shiftAirbrake: $('#shiftAirbrake').val(),
    							cbcPPMakeforAirBrake:$('#cbcPPMakeforAirBrake').val(),  //sell_trans table
    							cbcPPNoforAirBrake:$('#cbcPPNoforAirBrake').val(),  //shell_trans table
    							cbcNPPMakeforAirBrake:$('#cbcNPPMakeforAirBrake').val(),  //shell_trans table
    							cbcNPPNoforAirBrake:$('#cbcNPPNoforAirBrake').val(), //shell_trans table
    							
    							bufferMake:$('#bufferMake').val(),  //furnishing_trans table
    							bufferNo:$('#bufferNo').val(), //furnishing_trans table
    							brakePanelMake:$('#brakePanelMake').val(), //furnishing_trans table
    							brakePanelrNo:$('#brakePanelrNo').val(), //furnishing_trans table
    							distributorValveMake:$('#distributorValveMake').val(), //furnishing_trans table
    							distributorValveNo:$('#distributorValveNo').val(), //furnishing_trans table
    							pullBoxMake:$('#pullBoxMake').val(), //furnishing_trans table
    							pullBoxNo:$('#pullBoxNo').val(), //furnishing_trans table
    							handBrakeMake:$('#handBrakeMake').val(), //furnishing_trans table
    							handBrakeNo:$('#handBrakeNo').val(), //furnishing_trans table
    							preTextLockCoach:$('#preTextLockCoach').val(),
                    	        preTextConformityBrakeMount:$('#preTextConformityBrakeMount').val(),
                    	        preTextVerifyAllBrake:$('#preTextVerifyAllBrake').val(),
                    	        preTextVerifyPositionCockes:$('#preTextVerifyPositionCockes').val(),
                    	        preTextOpenedCockes103:$('#preTextOpenedCockes103').val(),
                    	        preTextOpenedCockes104_1:$('#preTextOpenedCockes104_1').val(),
                    	        preTextOpenedCockes104_2:$('#preTextOpenedCockes104_2').val(),
                    	        preTextEmergencyCock:$('#preTextEmergencyCock').val(),
                    	        preTextDistributorValve:$('#preTextDistributorValve').val(),
    							
                    	        preTextBrakeCylinder:$('#preTextBrakeCylinder').val(),
                    	        preTextFitmentAuxiliaryReservoir:$('#preTextFitmentAuxiliaryReservoir').val(),
    							reservoirChargingGeneratorCoaches:$('#reservoirChargingGeneratorCoaches').val(),
    							reservoirChargingBrakePipePressure:$('#reservoirChargingBrakePipePressure').val(),
    							
    							reservoirChargingChargingTime:$('#reservoirChargingChargingTime').val(),
    							reservoirChargingControlPressure:$('#reservoirChargingControlPressure').val(),
    							

    							sealingTestInterruptCharging:$('#sealingTestInterruptCharging').val(),
    							sealingTestOpenCocks:$('#sealingTestOpenCocks').val(),
    							fullBrakeApplicationReducePressure:$('#fullBrakeApplicationReducePressure').val(),
    							fullBrakeApplicationEmergencyApplication:$('#fullBrakeApplicationEmergencyApplication').val(),
    							
    							fullBrakeApplicationMaxPressure:$('#fullBrakeApplicationMaxPressure').val(),
    							fullBrakeApplicationAllBrake:$('#fullBrakeApplicationAllBrake').val(),
    							releaseFullBrakeFillBP:$('#releaseFullBrakeFillBP').val(),
    							emergencyApplicationReduceBrakePressure:$('#emergencyApplicationReduceBrakePressure').val(),
    							emergencyApplicationAcceleratorRespond:$('#emergencyApplicationAcceleratorRespond').val(),
    							emergencyApplicationChargingTime:$('#emergencyApplicationChargingTime').val(),
    							emergencyApplicationMaxBCPressure:$('#emergencyApplicationMaxBCPressure').val(),
    							emergencyApplicationAllBrake:$('#emergencyApplicationAllBrake').val(),
    							
    							releaseEmergencyBrakeFillBP:$('#releaseEmergencyBrakeFillBP').val(),
    							releaseEmergencyBrakePressureDropTime:$('#releaseEmergencyBrakePressureDropTime').val(),
    							releaseEmergencyBrakeBrakeCylinderRelease:$('#releaseEmergencyBrakeBrakeCylinderRelease').val(),
    							graduatedBrakeApplication:$('#graduatedBrakeApplication').val(),
    							pressureGovernorChargeFeedingPipe:$('#pressureGovernorChargeFeedingPipe').val(),
    							pressureGovernorExhaustFeedingPipe:$('#pressureGovernorExhaustFeedingPipe').val(),
    							sealingTestFeed:$('#sealingTestFeed').val(),
    							normalServiceFeedMaxPressure:$('#normalServiceFeedMaxPressure').val(),
    							controlIndicatingDeviceActualFullBrake:$('#controlIndicatingDeviceActualFullBrake').val(),
    							controlIndicatingDeviceCockPosition4_1:$('#controlIndicatingDeviceCockPosition4_1').val(),
    							controlIndicatingDeviceCockPosition4_2:$('#controlIndicatingDeviceCockPosition4_2').val(),
    							controlIndicatingDeviceCockPosition41_42:$('#controlIndicatingDeviceCockPosition41_42').val(),
    							controlInsensitivityExhaustBrakePipe:$('#controlInsensitivityExhaustBrakePipe').val(),
    							controlSensitivityBrakePipe:$('#controlSensitivityBrakePipe').val(),
    							
    							firstBrakeStep:$('#firstBrakeStep').val(),
    							reactivityQuickServiceFailure:$('#reactivityQuickServiceFailure').val(),
    							parkingBrakeHandbrakeReleased:$('#parkingBrakeHandbrakeReleased').val(),
    							parkingBrakeHandbrakeApplied:$('#parkingBrakeHandbrakeApplied').val(),
    							emergencyBrakePassengerExhaustBrake:$('#emergencyBrakePassengerExhaustBrake').val(),
    							emergencyBrakePassengerCloseHandle:$('#emergencyBrakePassengerCloseHandle').val(),
    							
    							emergencyBrakePassengerPassengerAlarm:$('#emergencyBrakePassengerPassengerAlarm').val(),
    							emergencyBrakeGuard:$('#emergencyBrakeGuard').val(),
    							cbcFitment:$('#cbcFitment').val(),
    							remarks:$('#remarks_airbrake').val(),
    
    						},
    						
    						type : 'POST',
    						async : false,
            	 		
    						success : function( msg ) {
    							
    							$('#docNoAirbrake').val(''),
    							$("#dateOfAirbrake").val(''),
    							$('#shiftAirbrake').val(''),
    							$('#cbcPPMakeforAirBrake').val(''),  //sell_trans table
    							$('#cbcPPNoforAirBrake').val(''),  //shell_trans table
    							$('#cbcNPPMakeforAirBrake').val(''),  //shell_trans table
    							$('#cbcNPPNoforAirBrake').val(''), //shell_trans table
    							
    							$('#bufferMake').val(''),  //furnishing_trans table
    							$('#bufferNo').val(''), //furnishing_trans table
    							$('#brakePanelMake').val(''), //furnishing_trans table
    							$('#brakePanelrNo').val(''), //furnishing_trans table
    							$('#distributorValveMake').val(''), //furnishing_trans table
    							$('#distributorValveNo').val(''), //furnishing_trans table
    							$('#pullBoxMake').val(''), //furnishing_trans table
    							$('#pullBoxNo').val(''), //furnishing_trans table
    							$('#handBrakeMake').val(''), //furnishing_trans table
    							$('#handBrakeNo').val(''), //furnishing_trans table
    							$('#preTextLockCoach').val(''),
                    	        $('#preTextConformityBrakeMount').val(''),
                    	        $('#preTextVerifyAllBrake').val(''),
                    	        $('#preTextVerifyPositionCockes').val(''),
                    	        $('#preTextOpenedCockes103').val(''),
                    	        $('#preTextOpenedCockes104_1').val(''),
                    	        $('#preTextOpenedCockes104_2').val(''),
                    	        $('#preTextEmergencyCock').val(''),
                    	       $('#preTextDistributorValve').val(''),
    							
                    	       $('#preTextBrakeCylinder').val(''),
                    	        $('#preTextFitmentAuxiliaryReservoir').val(''),
    							$('#reservoirChargingGeneratorCoaches').val(''),
    							$('#reservoirChargingBrakePipePressure').val(''),
    							
    							$('#reservoirChargingChargingTime').val(''),
    							$('#reservoirChargingControlPressure').val(''),
    							

    							$('#sealingTestInterruptCharging').val(''),
    							$('#sealingTestOpenCocks').val(''),
    							$('#fullBrakeApplicationReducePressure').val(''),
    							$('#fullBrakeApplicationEmergencyApplication').val(''),
    							
    							$('#fullBrakeApplicationMaxPressure').val(''),
    							$('#fullBrakeApplicationAllBrake').val(''),
    							$('#releaseFullBrakeFillBP').val(''),
    							$('#emergencyApplicationReduceBrakePressure').val(''),
    							$('#emergencyApplicationAcceleratorRespond').val(''),
    							$('#emergencyApplicationChargingTime').val(''),
    							$('#emergencyApplicationMaxBCPressure').val(''),
    							$('#emergencyApplicationAllBrake').val(''),
    							
    							$('#releaseEmergencyBrakeFillBP').val(''),
    							$('#releaseEmergencyBrakePressureDropTime').val(''),
    							$('#releaseEmergencyBrakeBrakeCylinderRelease').val(''),
    							$('#graduatedBrakeApplication').val(''),
    							$('#pressureGovernorChargeFeedingPipe').val(''),
    							$('#pressureGovernorExhaustFeedingPipe').val(''),
    							$('#sealingTestFeed').val(''),
    							$('#normalServiceFeedMaxPressure').val(''),
    							$('#controlIndicatingDeviceActualFullBrake').val(''),
    							$('#controlIndicatingDeviceCockPosition4_1').val(''),
    							$('#controlIndicatingDeviceCockPosition4_2').val(''),
    							$('#controlIndicatingDeviceCockPosition41_42').val(''),
    							$('#controlInsensitivityExhaustBrakePipe').val(''),
    							$('#controlSensitivityBrakePipe').val(''),
    							
    							$('#firstBrakeStep').val(''),
    							$('#reactivityQuickServiceFailure').val(''),
    							$('#parkingBrakeHandbrakeReleased').val(''),
    							$('#parkingBrakeHandbrakeApplied').val(''),
    							$('#emergencyBrakePassengerExhaustBrake').val(''),
    							$('#emergencyBrakePassengerCloseHandle').val(''),
    							
    							$('#emergencyBrakePassengerPassengerAlarm').val(''),
    							$('#emergencyBrakeGuard').val(''),
    							$('#cbcFitment').val(''),
    							$('#remarks_airbrake').val(''),
    							
    							
    							$('#airbrakeTestingDialog').dialog('close'),
    							alert("saving Data");
    							$('#FurnishingProductionTableContainer').jtable('load');
							  },
							error:function (msg){
								$('#airbrakeTestingDialog').dialog('close');
								//alert("Error saving Data");
							}
                    	}) ;
	                 			    return true;
                        }    
	 	 		    },
                       Close: function () {
                       	
                                       $(this).dialog('close');
                                       $('#FurnishingProductionTableContainer').jtable('load');
                                   }
						  },
                    modal: true
		    	    });
		                    	 		
	
		            			    	   return true;
		                    	 		    
		                    	 			  
		                    	 		  }//ending else               	  
		                    	  // ajax call ends here				
		 }    						 
	
	}  ,	
         	
  
          
 		 				            ]
 		 				            }, 
            
			actions : {
	
 			listAction: 'listElectricalSIPFurnishingAction?stageID=<%=stageID%>',
 			
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
								
				
					receiptDateAtQuality:
					{
					title: 'Coach Receipt Date',
					width: '5%',
					type:'date',
					display:function(data){
						 
						return ((data.record.receiptDateAtQuality!=null) && (data.record.receiptDateAtQuality!="") ) ? moment(data.record.receiptDateAtQuality).format('DD-MM-YYYY') : "";
											}, 
							
					},
					coachNumber: {
						   title: 'Coach No.',
						   width : '10%',
							
							edit : false,
							create: false 
						},
						showerTestingFlag:
							{
							title:'',
							list:false,
							edit:false,
							create:false
							},
							biotankTestingFlag:
								{
								title:'',
								list:false,
								edit:false,
								create:false
								},
							cbcTestingFlag:
								{
								title:'',
								list:false,
								edit:false,
								create:false
								}
                        
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
	
	</script>
	
	<script>
	
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
	
	</script>