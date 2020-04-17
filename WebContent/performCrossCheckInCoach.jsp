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
<!--  <script src="https://cdn.ckeditor.com/4.14.0/full/ckeditor.js"></script>    -->

  <script src="<%=contextpath %>/js/ckeditor/ckeditor.js" type="text/javascript"></script>  
<%-- <script type="text/javascript" src="<%=contextpath %>/js/ckeditor/adapters/jquery.js"></script> --%>
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
	
  display:block; 
  //z-index:15;
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
#selectStages {
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}
#selectStages button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 10px;
}
#selectStages button:hover {
  background-color: #ddd;
}
#selectStages button.active {
  background-color: #ccc;
}
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
.topright{
  float: right;
  cursor: pointer;
  font-size: 28px;
  }
#example{
	width:100%;
} 
.cke_skin_kama .cke_dialog_body { z-index: 9 !important; }
</style>
<body>
<div id="FurnishingProductionTableContainer"></div>
<div id="selectStages" style="height:150%; width:200%; display:none;z-index: 9;">
<table>
<tr>	
	<td><button class="tablinks" id="1" onclick="openCity(event, 'General')">General</button></td>
	<td><button class="tablinks" id="2" onclick="openCity(event, 'F&PVC')">F&PVC</button></td>
   	<td><button class="tablinks" id="3" onclick="openCity(event, 'ParitionFrame')">Parition frame</button></td>
   	<td><button class="tablinks" id="4" onclick="openCity(event, 'Panel')">Panel</button></td>
   	<td><button class="tablinks" id="5" onclick="openCity(event, 'WindowCelling')">Window & celling</button></td>
   	<td><button class="tablinks" id="6" onclick="openCity(event, 'Moulding')">Moulding</button></td>
   	<td><button class="tablinks" id="7" onclick="openCity(event, 'SeatBerth')">Seat & Berth</button></td>
   	<td><button class="tablinks" id="8" onclick="openCity(event, 'Lavatory')">Lavatory</button></td>
   	<td><button class="tablinks" id="9" onclick="openCity(event, 'Plumbing')">Plumbing</button></td>
   	<td><button class="tablinks" id="10" onclick="openCity(event, 'AirBrake')">Air Brake</button></td>
   	<td><button class="tablinks" id="11" onclick="openCity(event, 'CoachLowering')">Coach Lowering</button></td>
   	<td><button class="tablinks" id="12" onclick="openCity(event, 'Paint')">Paint</button></td>
   	<td><button class="tablinks" id="13" onclick="openCity(event, 'CoachCleaning')">Coach Cleaning</button></td>
 </tr>
 </table>
 <div id="General" class="tabcontent">
    <form name="general" id="general">
        <p Style="text-align:center;font-size:22px;"><b>General</b></p>
     <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <table class="t2" border="1" style="height:70px;">
			<tr style="height:100%;"><td class="t3"><p Style="text-align:center;font-size:12px;margin:0px;padding:0px;"><b>Modern Coach Factory, Raebareli</b></p><br><p Style="text-align:center;font-size:8px;margin:0px;padding:0px;">QUALITY CONTROL INSPECTION REPORT(QCI)</p><br><p Style="text-align:center;font-size:8px;margin:0px;padding:0px;">L2T,L3T,L2T(T),HUMSAFAR (FURNISHING QUALITY)</p></td><td>
			&nbsp;&nbsp;&nbsp;Doc No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="docNo" name="docNo" class="validate[required]"><br>&nbsp;&nbsp;&nbsp;Rev No: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="docRevNo" name="docRevNo"><br>&nbsp;&nbsp;&nbsp;Date: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="docDate" name="docDate" class="validate[required]"></td></tr>
		</table>
		<table border="1">
			<tr><td>Furnishing No.:<input type="text" id="furnishingNoQCI" name="furnishingNoQCI" readonly></td><td colspan="2">Booked To:<select id="bookedRly" name="bookedRly" onchange="myFunction(this.value)"></select></td><td>Shell No.:<input type="text" id="shellNo" name="shellNo"></td></tr>
			<tr><td>Coach No.:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="coachNo" name="coachNo" readonly></td><td colspan="2">Bogie No.<td>Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="dateOfTesting" name="dateOfTesting" class="validate[required]"></td></tr>
			<tr><td>RLY:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="bookedDiv" name="bookedDiv" disabled></select></td><td>PP:<input type="text" id="bogiePp" name="bogiePp" readonly></td><td>NPP:<input type="text" id="bogieNpp" name="bogieNpp" readonly></td>
			<td>Shift:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="shiftOfTesting" class="validate[required]">
				 <option value="">Select</option>
             <option value="general">General</option>
             <option value="morning">Shift-I</option>
            <option value="evening">Shift-II</option>
               <option value="night">Shift-III</option>
				</select></td></tr>
		</table>
		<br><br>
		
		<textarea name="generaltext" id="generaltext" rows="5" cols="47"></textarea>
		</form>
  </div>  	
<div id="F&PVC" class="tabcontent">
    <form name="fpvc" id="fpvc">
     <p Style="text-align:center;font-size:22px;"><b>F&PVC</b></p><span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
    
		
		<textarea name="fpvctext" id="fpvctext" rows="5" cols="47"></textarea>
		
    </form>
  </div> 

	<div id="ParitionFrame" class="tabcontent">
	   <form name="paritionFrame" id="paritionFrame">	
	   <p Style="text-align:center;font-size:22px;"><b>Parition Frame</b></p> <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
		
		<textarea name="paritionframetext" id="paritionframetext" rows="5" cols="47"></textarea>
		</form>
  </div>
  
  <div id="Panel" class="tabcontent">
    <form name="panel" id="panel">
    <p Style="text-align:center;font-size:22px;"><b>Panel</b></p>
     <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
    	
		<textarea name="paneltext" id="paneltext" rows="5" cols="47"></textarea>
		</form>
  </div> 
  
  <div id="WindowCelling" class="tabcontent">
    <form name="windowCelling" id="windowCelling">
        <p Style="text-align:center;font-size:22px;"><b>Window Celling</b></p>
     <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
		
		<textarea name="windowcellingtext" id="windowcellingtext" rows="5" cols="47"></textarea>
		</form>
  </div>
  
  
  <div id="Moulding" class="tabcontent">
    <form name="moulding" id="moulding">
            <p Style="text-align:center;font-size:22px;"><b>Moulding</b></p>
     <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
		
		<textarea name="mouldingtext" id="mouldingtext" rows="5" cols="47"></textarea>
		</form>
  </div>
  
  
  <div id="SeatBerth" class="tabcontent">
    <form name="seatBerth" id="seatBerth">
                <p Style="text-align:center;font-size:22px;"><b>Seat Berth</b></p>
     <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
		
		<textarea name="seatBerthtext" id="seatBerthtext" rows="5" cols="47"></textarea>
		</form>
  </div>
  
  
  <div id="Lavatory" class="tabcontent">
	   <form name="lavatory" id="lavatory">	
	    <p Style="text-align:center;font-size:22px;"><b>Lavatory</b></p>
	    <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
		
		<textarea name="lavatorytext" id="lavatorytext" rows="5" cols="47"></textarea>
		</form>
  </div>
  
  
  <div id="Plumbing" class="tabcontent">
	   <form name="plumbing" id="plumbing">	
	       <p Style="text-align:center;font-size:22px;"><b>Plumbing</b></p>
	    <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
		
		<textarea name="plumbingtext" id="plumbingtext" rows="5" cols="47"></textarea>
		</form>
  </div>
  
  
  <div id="AirBrake" class="tabcontent">
	   <form name="airBrake" id="airBrake">	
	   	       <p Style="text-align:center;font-size:22px;"><b>Air Brake</b></p>
	    <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
		
		<textarea name="airbraketext" id="airbraketext" rows="5" cols="47"></textarea>
		</form>
  </div>
  
  
  <div id="CoachLowering" class="tabcontent">
	   <form name="coachLowering" id="coachLowering">
	     <p Style="text-align:center;font-size:22px;"><b>Coach Lowering</b></p>
	    <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>	
	   
	   <textarea name="coachloweringtext" id="coachloweringtext" rows="5" cols="47"></textarea>
		</form>
  </div>
  
  
  <div id="Paint" class="tabcontent">
	   <form name="paint" id="paint">	
	   	 <p Style="text-align:center;font-size:22px;"><b>Paint</b></p>
	    <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
		
		<textarea name="painttext" id="painttext" rows="5" cols="47">
				</textarea>
		</form>
  </div>
  
  
  <div id="CoachCleaning" class="tabcontent">
	   <form name="coachCleaning" id="coachCleaning">	
	   <p Style="text-align:center;font-size:22px;"><b>Coach Cleaning</b></p>
	    <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
    <br><br><br>
		
		<textarea name="coachcleaningtext" id="coachcleaningtext" rows="5" cols="47">
				</textarea>
		</form>
  </div> 		
 </div>
<!-- <div id="TextEditor" style="display:none;z-index:9;">
 		<form>
				<textarea name="example" id="example" class="example" rows="5" cols="47">
				</textarea>
      	</form>
</div> -->
 </body>
  <script>
  
       // CKEDITOR.replace( 'example' );
    function DestroyCKEditorInstances1(generaltext)
	{
    	if (CKEDITOR.instances[generaltext])
    	{
        	CKEDITOR.instances[generaltext].destroy();
    	}
	}  
	function DestroyCKEditorInstances2(fpvctext)
	{
    	if (CKEDITOR.instances[fpvctext])
    	{
        	CKEDITOR.instances[fpvctext].destroy();
    	}
	}
    function DestroyCKEditorInstances3(paritionframetext)
    {
        if (CKEDITOR.instances[paritionframetext])
        {
            CKEDITOR.instances[paritionframetext].destroy();
        }
    }
    function DestroyCKEditorInstances4(paneltext)
    {
        if (CKEDITOR.instances[paneltext])
        {
            CKEDITOR.instances[paneltext].destroy();
        }
    }
    function DestroyCKEditorInstances5(windowcellingtext)
    {
        if (CKEDITOR.instances[windowcellingtext])
        {
            CKEDITOR.instances[windowcellingtext].destroy();
        }
    }
    function DestroyCKEditorInstances6(mouldingtext)
    {
        if (CKEDITOR.instances[mouldingtext])
        {
            CKEDITOR.instances[mouldingtext].destroy();
        }
    }
    function DestroyCKEditorInstances7(seatBerthtext)
    {
        if (CKEDITOR.instances[seatBerthtext])
        {
            CKEDITOR.instances[seatBerthtext].destroy();
        }
    }
    function DestroyCKEditorInstances8(lavatorytext)
    {
        if (CKEDITOR.instances[lavatorytext])
        {
            CKEDITOR.instances[lavatorytext].destroy();
        }
    }
    function DestroyCKEditorInstances9(plumbingtext)
    {
        if (CKEDITOR.instances[plumbingtext])
        {
            CKEDITOR.instances[plumbingtext].destroy();
        }
    }
    function DestroyCKEditorInstances10(airbraketext)
    {
        if (CKEDITOR.instances[airbraketext])
        {
            CKEDITOR.instances[airbraketext].destroy();
        }
    }
    function DestroyCKEditorInstances11(coachloweringtext)
    {
        if (CKEDITOR.instances[coachloweringtext])
        {
            CKEDITOR.instances[coachloweringtext].destroy();
        }
    }
    function DestroyCKEditorInstances12(painttext)
    {
        if (CKEDITOR.instances[painttext])
        {
            CKEDITOR.instances[painttext].destroy();
        }
    }
    function DestroyCKEditorInstances13(coachcleaningtext)
    {
        if (CKEDITOR.instances[coachcleaningtext])
        {
            CKEDITOR.instances[coachcleaningtext].destroy();
        }
    }
   
var shellArray=[];
var btn;
var furnishingId;
var obj={};
		$(document).ready(function() {

			//retrieve railway 
	        $("#bookedRly").append('<option value="">Select</option>');
				<c:forEach var="a" items="${zoneList}">
				var o = new Option("${a}", "${a}");
				$("#bookedRly").append(o);
		    </c:forEach>
//end of code

			
			$('#docDate').datepicker({			
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
			 
		/* 	$('#dateOfTesting').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        maxDate: new Date(),
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		      		    }); */
				var bogieNumbers=[]; 

				var j=1;
				bogieNumbers[0]={ Value:null, DisplayText: "Select" };
				<c:forEach var="b" items="${bogieNumberList}">
				bogieNumbers[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
					j++;
				    </c:forEach>
				  //end: retrieving axle number in dropdown option
							
	$('#FurnishingProductionTableContainer').jtable({
			
			title : 'Issue Cross Check for Coach',
			
			paging:true,
            sorting: true,
            defaultSorting: 'qciTestingDate ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
            
            
            
            //Create toolbat
            toolbar: {
                items: [
             {
            	 icon: '<%=contextpath%>/images/rs_out.png',
                 text: 'Cross Check',
                 click: function () {
                 	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
             	 	 if ($selectedRows.length<1)
             		 alert("Please select a row for which you want to sent for Cross Check!!!");
             	 	 else{
             	 		var record;
             	 		$selectedRows.each(function () {
                             record = $(this).data('record');
                             furnishingId=record.furnishingAssetId;
                             });

             	 		$.ajax({
    			 			url : "setObjectForCrossCheck",  //action-name as defined in struts.xml
    						dataType: 'json', 
    						async:false,
    						data : {
    							furnishingAssetId: record.furnishingAssetId,
    						},
    						success:function(data)
    						{
    							obj=data.crossCheckinTrans; 	//set value in obj
    							
    							$('#generaltext').val(data.crossCheckinTrans.textGeneral);
    							var date1=(data.crossCheckinTrans.docDate).substring(0,10);
    							var date1Array=date1.split("-");
    							$('#docDate').datepicker("setDate",new Date(date1Array[0],date1Array[1]-1,date1Array[2]));
    							
    							var date2=(data.crossCheckinTrans.dateOfTesting).substring(0,10);
    							var date2Array=date2.split("-");
    							$('#dateOfTesting').datepicker("setDate",new Date(date2Array[0],date2Array[1]-1,date2Array[2]));
    							$('#shiftOfTesting').val(data.crossCheckinTrans.shiftOfTesting);
    							$('#fpvctext').val(data.crossCheckinTrans.textFpvc);
    							$('#paritionframetext').val(data.crossCheckinTrans.textParitionFrame);
    							$('#paneltext').val(data.crossCheckinTrans.textPanel);
    							$('#windowcellingtext').val(data.crossCheckinTrans.textWindowCelling);
    							$('#mouldingtext').val(data.crossCheckinTrans.textMoulding);
    							$('#seatBerthtext').val(data.crossCheckinTrans.textSeatBerth);

    							$('#lavatorytext').val(data.crossCheckinTrans.textLavatory);
    							$('#plumbingtext').val(data.crossCheckinTrans.textPlumbing);
    							$('#airbraketext').val(data.crossCheckinTrans.textAirBrake);
    							$('#coachloweringtext').val(data.crossCheckinTrans.textCoachLowering);
    							$('#painttext').val(data.crossCheckinTrans.textPaint);
    							$('#coachcleaningtext').val(data.crossCheckinTrans.textCoachCleaning);
        						}
    			 		});             	 		
                        
             	 		
             	 			//code to open form using tabs
             	 			$('#1').click(function(){
             	 		    	$('#general').show();	
             	 		    	$.ajax({
    	    						url : "showExistingDataOfQCI",  //action-name as defined in struts.xml
    	    						dataType: 'json', 
    	    						async:false,
    	    						data : {
    	    							furnishingAssetId: record.furnishingAssetId,
    	    						},
    	    						success:function(data)
    	    						{ 	
    	    							$('#docNo').val(data.formDocNoOCI),	
    	    							$('#docRevNo').val(data.formRevNoQCI),
    	    							$('#coachNo').val(data.coachNumber),
    	    							$('#furnishingNoQCI').val(data.furnishingNo),
    	    							$('#shellNo').val(data.shellNumber),
    	    							$('#bogiePp').val(data.bogieNopp),
    	    							$('#bogieNpp').val(data.bogieNoNpp),
    	    							$('#bookedRly').val(data.bookedRly),
    	    							$('#bookedDiv').val(data.bookedDiv);
    	    							if(data.crossCheck!=null)
        	    							{
    	    								var da=(data.crossCheck.docDate).substring(0,10);
    	    								var daArray=da.split("-");
    	        							$('#dateOfTesting').datepicker("setDate",new Date(daArray[0],daArray[1]-1,daArray[2]));
    	        							$('#shiftOfTesting').val(data.crossCheck.shiftOfTesting);
        	    							}
    	    							// $('#fpvctext').val(obj.textFpvc);
    	    							//$('#generaltext').val(obj.textGeneral);						
    	    						}
    	    				  });			
     						});
             	 			$('#2').click(function(){
             	 			
        	 				 	$('#fpvc').show();
        	 				 	 				
     						});
             	 			$('#3').click(function(){
             	 		    	$('#paritionFrame').show();				
     						});
             	 			$('#4').click(function(){
            	 				$('#panel').show();				
         					});
                 	 		$('#5').click(function(){
                 		    	$('#windowCelling').show();				
         					});
                	 		$('#6').click(function(){
      	 				 		$('#moulding').show();				
             				});
                     		$('#7').click(function(){
                     	    	$('#seatBerth').show();				
             				});
                     	 	$('#8').click(function(){
                    	 		$('#lavatory').show();				
                			});
                	 		$('#9').click(function(){
                            	$('#plumbing').show();				
                 			});
                         	$('#10').click(function(){
                        	 	$('#airBrake').show();				
                     		});
                            $('#11').click(function(){
                            	$('#coachLowering').show();				
                     		});
                            $('#12').click(function(){
                             	$('#paint').show();				
                         	});
                            $('#13').click(function(){
                             	$('#coachCleaning').show();				
                         	});
             	 		
             	 	 	$("#selectStages").dialog({
             	 	 		title : 'Cross Check for  '+search(record.shellTransactionId) + 'from Stage- <%=stageID%>',
             	 	 		width:'91%',
             	 	 		height: ($(window).height() - 60),
             	 	 		create: function (event) { $(event.target).parent().css('position', 'fixed');},
            		        open:function(event) {
            		         CKEDITOR.replace('generaltext',{language: 'html',height:300,width:800, allowedContent: true});
            		         CKEDITOR.replace('fpvctext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('paritionframetext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('paneltext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('windowcellingtext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('mouldingtext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('seatBerthtext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('lavatorytext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('plumbingtext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('airbraketext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('coachloweringtext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('painttext',{language: 'html',height:300,width:800, allowedContent: true});
                		     CKEDITOR.replace('coachcleaningtext',{language: 'html',height:300,width:800, allowedContent: true});
                		     

                		     },
             	 	 		close: function (e, u) {
             	 	 			if(btn==1){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
	        	 	 			 		$("#general").hide();
	                                     $(this).dialog('close');
             	 	 			}
             	 	 			else if(btn==2){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#fpvc").hide();
                                     $(this).dialog('close');
      	 		          			/*  $("#selectStages").validationEngine('hideAll');  */
             	 	 			}
             	 	 			else if(btn==3){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#paritionFrame").hide();
                                     $(this).dialog('close');
                   	 	 			/* $("#selectStages").validationEngine('hideAll'); */ 
                    	 	 		}
             	 	 			else if(btn==4){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
	        	 	 			 		$("#panel").hide();
                                     $(this).dialog('close');
                  	 	 			/* $("#selectStages").validationEngine('hideAll'); */ 
                   	 	 		}
             	 	 			else if(btn==5){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#windowCelling").hide();
                                     $(this).dialog('close');
                 	 	 			/* $("#selectStages").validationEngine('hideAll'); */ 
                  	 	 		}
             	 	 			else if(btn==6){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#moulding").hide();
                                     $(this).dialog('close');
                	 	 			/* $("#selectStages").validationEngine('hideAll'); */ 
                 	 	 		}
             	 	 			else if(btn==7){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#seatBerth").hide();
                                     $(this).dialog('close');
               	 	 				/*  $("#selectStages").validationEngine('hideAll'); */ 
                	 	 			}
             	 	 			else if(btn==8){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#lavatory").hide();
                                     $(this).dialog('close');
              	 	 			 	/* $("#selectStages").validationEngine('hideAll');  */
               	 	 			}
             	 	 			else if(btn==9){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#plumbingtext").hide();
                                     $(this).dialog('close');
             	 	 			 	/* $("#selectStages").validationEngine('hideAll'); */ 
              	 	 			}
             	 	 			else if(btn==10){
            	 	 			 	 	 
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#airBrake").hide();
                                     $(this).dialog('close');
            	 	 				 	/* $("#selectStages").validationEngine('hideAll'); */ 
             	 	 			}
             	 	 			else if(btn==11){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#coachLowering").hide();
                                     $(this).dialog('close');
            	 	 				 	/* $("#selectStages").validationEngine('hideAll');  */
             	 	 			}
             	 	 			else if(btn==12){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
		                        		$("#paint").hide();
                                     $(this).dialog('close');
            	 		 			 	/* $("#selectStages").validationEngine('hideAll');  */
             	 	 			}
             	 	 			else if(btn==13){
             	 	 				$('form[name="general"]')[0].reset();
	                        		DestroyCKEditorInstances1('generaltext');
             	 	 				$('form[name="fpvc"]')[0].reset();
		                        		DestroyCKEditorInstances2('fpvctext');
		                        		$('form[name="paritionFrame"]')[0].reset();
	                        		 DestroyCKEditorInstances3('paritionframetext');
	                        		 $('form[name="panel"]')[0].reset();
		                        		 DestroyCKEditorInstances4('paneltext');
		                        		$('form[name="windowCelling"]')[0].reset();
	                        		 DestroyCKEditorInstances5('windowcellingtext');
	                        		$('form[name="moulding"]')[0].reset();
		                        		 DestroyCKEditorInstances6('mouldingtext');
		                        		$('form[name="seatBerth"]')[0].reset();
		                        		DestroyCKEditorInstances7('seatBerthtext');
		                        		$('form[name="lavatory"]')[0].reset();
		                        		DestroyCKEditorInstances8('lavatorytext');
		                        		$('form[name="plumbing"]')[0].reset();
	                        		 DestroyCKEditorInstances9('plumbingtext');
	                        		 $('form[name="airBrake"]')[0].reset();
		        	 	 			 	DestroyCKEditorInstances10('airbraketext');
		        	 	 				$('form[name="coachLowering"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
	        	 	 			 		$('form[name="paint"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances12('painttext');
	        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
	        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
	        	 	 			 		$("#coachCleaning").hide();
	                                     $(this).dialog('close');
	            	 		 			 	/* $("#selectStages").validationEngine('hideAll');  */
             	 	 			}
             	 	 			
             	 	 			
             	 	 	},
         	 		 	
     							buttons: {
                                 Submit: {
                                    text: "Submit",
                                     id: "my-button-submit",
                                     click:function () {
                                    	 if(btn==1){
                                    		 if ($('#shiftOfTesting').validationEngine('validate')) {
                                              	
                                                 return false;
                                             }
         	  								if ($('#docDate').validationEngine('validate')) {
         									                                    	
         		                                return false;
         		                            }
         									if ($('#dateOfTesting').validationEngine('validate')) {
         														
         									    return false;
         									}
                                          	var c=confirm("Do you want to submit data!!");
                                          	if(c==false){return false;}
                                           	
                                          	//alert(CKEDITOR.instances.fpvctext.getData()) ;  // retieve value of ckeditor
                                         	//alert(CKEDITOR.instances['fpvctext'].getData());// another way to retieve data
                                         	  	   
                                          		    	   
                                         	$.ajax({
                         						url : "saveGeneralText",  //action-name as defined in struts.xml
                         						dataType: 'json', 
                         						data : {
                         							furnishingAssetId: record.furnishingAssetId,
                         							textGeneral: CKEDITOR.instances['generaltext'].getData(),
                         							docDate:$('#docDate').val(),
                        							dateOfTesting:$('#dateOfTesting').val(),
                        							shiftOfTesting:$('#shiftOfTesting').val(),
                         						},
                         						
                         						type : 'POST',
                         						async : false,
                                 	 		})
                         						.done(function( msg ) {
                         							$('#docDate').val(''),
                        							$('#dateOfTesting').val(''),
                        							$('#shiftOfTesting').val(''),
                         							$('#generaltext').val(''),
                         							$('#FurnishingProductionTableContainer').jtable('load');
              								  })
               								.error(function (msg){
               									
               									alert("Error Fetching Data");
               								});
                                          	$("#general").hide();
                                          	
                                          	}
                                     else if(btn==2){
                                    	 
                                 	var c=confirm("Do you want to submit data!!");
                                 	if(c==false){return false;}
                                  	
                                 	//alert(CKEDITOR.instances.fpvctext.getData()) ;  // retieve value of ckeditor
                                	//alert(CKEDITOR.instances['fpvctext'].getData());// another way to retieve data
                                	  	   
                                 		    	   
                                	$.ajax({
                						url : "saveFpvcText",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						data : {
                							furnishingAssetId: record.furnishingAssetId,
                							
                							textFpvc: CKEDITOR.instances['fpvctext'].getData(),
                						},
                						
                						type : 'POST',
                						async : false,
                        	 		})
                						.done(function( msg ) {
                							
                							$('#fpvctext').val(''),
                							$('#FurnishingProductionTableContainer').jtable('load');
     								  })
      								.error(function (msg){
      									
      									alert("Error Fetching Data");
      								});
                                 	$("#fpvc").hide();
                                 	
                                 	}
                                 	else if(btn==3){
                                 		var c=confirm("Do you want to submit data!!");
                                     	if(c==false){return false;}
                                      
                                     		    	   
                                     	$.ajax({
                     						url : "saveParitionFrameText",  //action-name as defined in struts.xml
                     						dataType: 'json', 
                     						data : {
                     							furnishingAssetId: record.furnishingAssetId,
                     							textParitionFrame: CKEDITOR.instances['paritionframetext'].getData(),
                     							
                     						},
                     						
                     						type : 'POST',
                     						async : false,
                             	 		})
                     						.done(function( msg ) {
                     							
                     							 $('#paritionframetext').val(''),
                     							 $('#FurnishingProductionTableContainer').jtable('load');
          								  })
          								.error(function (msg){
          									
          									alert("Error Fetching Data");
          								});
                                     	$("#paritionFrame").hide();
                                     	
                                 	}
                                 	  else if(btn==4){
                                 		var c=confirm("Do you want to submit data!!");
                                     	if(c==false){return false;}
                                     	//alert(CKEDITOR.instances['paneltext'].getData());
                                     		    	   
                                     	$.ajax({
                     						url : "savePanelText",  //action-name as defined in struts.xml
                     						dataType: 'json', 
                     						data : {
                     							furnishingAssetId: record.furnishingAssetId,
                     							textPanel: CKEDITOR.instances['paneltext'].getData(),
                     							
                     						},
                     						
                     						type : 'POST',
                     						async : false,
                             	 		})
                     						.done(function( msg ) {
                     							
                     							 $('#paneltext').val(''),
                     								
                     							$('#FurnishingProductionTableContainer').jtable('load');
          								  })
          								.error(function (msg){
          									
          									alert("Error Fetching Data");
          								});
                                     	$("#panel").hide();
                                 	}  
                                 	  else if(btn==5){
                                 		  var c=confirm("Do you want to submit data!!");
                                       	if(c==false){return false;}
                                        
                                       		    	   
                                       	$.ajax({
                       						url : "saveWindowCellingText",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							furnishingAssetId: record.furnishingAssetId,
                       							textWindowCelling: CKEDITOR.instances['windowcellingtext'].getData(),	
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		})
                       						.done(function( msg ) {
                       							
                       							$('#windowcellingtext').val(''),
                       							
                       							$('#FurnishingProductionTableContainer').jtable('load');
            								  })
            								.error(function (msg){
            									
            									alert("Error Fetching Data");
            								});
                                     	$("#windowCelling").hide();
                                 	  }
                                 	  else if(btn==6){
                                 		  var c=confirm("Do you want to submit data!!");
                                       	if(c==false){return false;}
                                        
                                       		    	   
                                       	$.ajax({
                       						url : "saveMouldingText",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							furnishingAssetId: record.furnishingAssetId,
                       							textMoulding: CKEDITOR.instances['mouldingtext'].getData(),
                       							
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		})
                       						.done(function( msg ) {
                       							
                       							$('#mouldingtext').val(''),
                       							
                       							$('#FurnishingProductionTableContainer').jtable('load');
            								  })
            								.error(function (msg){
            									
            									alert("Error Fetching Data");
            								});
                                       	$("#moulding").hide();
                                 	  }
                                 	  else if(btn==7){
                                 		  var c=confirm("Do you want to submit data!!");
                                       	if(c==false){return false;}
                                        
                                       		    	   
                                       	$.ajax({
                       						url : "saveSeatBerthText",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							furnishingAssetId: record.furnishingAssetId,
                       							textSeatBerth: CKEDITOR.instances['seatBerthtext'].getData(),
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		})
                       						.done(function( msg ) {
                       							
                       							$('#seatBerthtext').val(''),
                       							
                       							$('#FurnishingProductionTableContainer').jtable('load');
            								  })
            								.error(function (msg){
            									
            									alert("Error Fetching Data");
            								});
                                     	$("#seatBerth").hide();
                                 	  }
                                 	   else if(btn==8){
                                 		  var c=confirm("Do you want to submit data!!");
                                       	if(c==false){return false;}
                                        
                                       		    	   
                                       	$.ajax({
                       						url : "saveLavatoryText",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							furnishingAssetId: record.furnishingAssetId,
                       							textLavatory: CKEDITOR.instances['lavatorytext'].getData(),
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		})
                       						.done(function( msg ) {
                       							
                       							$('#lavatorytext').val(''),
                       							
                       							$('#FurnishingProductionTableContainer').jtable('load');
            								  })
            								.error(function (msg){
            									
            									alert("Error Fetching Data");
            								});
                                       	$("#lavatory").hide();
                                 	  }
                                 	  else if(btn==9){
                                 		  var c=confirm("Do you want to submit data!!");
                                       	if(c==false){return false;}
                                        
                                       		    	   
                                       	$.ajax({
                       						url : "savePlumbingText",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							furnishingAssetId: record.furnishingAssetId,
                       							textPlumbing: CKEDITOR.instances['plumbingtext'].getData(),
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		})
                       						.done(function( msg ) {
                       							
                       							$('#plumbingtext').val(''),
                       							
                       							$('#FurnishingProductionTableContainer').jtable('load');
            								  })
            								.error(function (msg){
            									
            									alert("Error Fetching Data");
            								});
                                       	$("#plumbing").hide();
                                 	  }
                                 	  else if(btn==10){
                                 		  var c=confirm("Do you want to submit data!!");
                                       	if(c==false){return false;}
                                        
                                       		    	   
                                       	$.ajax({
                       						url : "saveAirBrakeText",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							furnishingAssetId: record.furnishingAssetId,
                       							textAirBrake: CKEDITOR.instances['airbraketext'].getData(),
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		})
                       						.done(function( msg ) {
                       							
                       							$('#airbraketext').val(''),
                       							
                       							$('#FurnishingProductionTableContainer').jtable('load');
            								  })
            								.error(function (msg){
            									
            									alert("Error Fetching Data");
            								});
                                       	$("#airBrake").hide();
                                       } 
                                 	  else if(btn==11){
                                 		  var c=confirm("Do you want to submit data!!");
                                       	if(c==false){return false;}
                                        
                                       		    	   
                                       	$.ajax({
                       						url : "saveCoachLoweringText",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							furnishingAssetId: record.furnishingAssetId,
                       							textCoachLowering: CKEDITOR.instances['coachloweringtext'].getData(),
                       							
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		})
                       						.done(function( msg ) {
                       							
                       							
                       							$('#coachloweringtext').val(''),
                       							 
                       							
                       							$('#FurnishingProductionTableContainer').jtable('load');
            								  })
            								.error(function (msg){
            									
            									alert("Error Fetching Data");
            								});
                                       	$("#coachLowering").hide();
                                       }
                                 	  else if(btn==12){
                                 		  var c=confirm("Do you want to submit data!!");
                                       	if(c==false){return false;}
                                        
                                       		    	   
                                       	$.ajax({
                       						url : "savePaintText",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							furnishingAssetId: record.furnishingAssetId,
                       							textPaint: CKEDITOR.instances['painttext'].getData(),
                       							
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		})
                       						.done(function( msg ) {
                       							
                       							$('#painttext').val(''),
                       							
                       							$('#FurnishingProductionTableContainer').jtable('load');
            								  })
            								.error(function (msg){
            									
            									alert("Error Fetching Data");
            								});
                                       	$("#paint").hide();
                                       }
                                 	  else if(btn==13){
                                 		  var c=confirm("Do you want to submit data!!");
                                       	if(c==false){return false;}
                                        
                                       		    	   
                                       	$.ajax({
                       						url : "saveCoachCleaningText",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							furnishingAssetId: record.furnishingAssetId,
                       							textCoachCleaning: CKEDITOR.instances['coachcleaningtext'].getData(),
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		})
                       						.done(function( msg ) {
                       							
                       							$('#coachcleaningtext').val(''),
                       							$('#selectStages').dialog('close'),	
                       							$('#FurnishingProductionTableContainer').jtable('load');
            								  })
            								.error(function (msg){
            									
            									alert("Error Fetching Data");
            								});
                                       	$("#coachCleaning").hide();
                                       }                            
                                       	else{
                                 		alert("Bye");
                                 	}
     			                 			    	    return true; 
     		                                    }
                                 },
     		                        Close: function () {
     		                        	if(btn==1){
     	             	 	 				$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		        	 	 			 		$("#general").hide();
     		                                     $(this).dialog('close');
     	             	 	 			}
     		                        	else if(btn==2){
     		                        		  
     		                        		$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		                        		$("#fpvc").hide();
                                             $(this).dialog('close');
     		                        	}
     		                        	else if(btn==3){
     		                        		
     		                        		$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		                        		$("#paritionFrame").hide();
      			              	 	 		$(this).dialog('close');
     		        	 		         }
     		                        	else if(btn==4){
     		                        		  
     		                        		$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		                        		$("#panel").hide();
     		             	 	 			$(this).dialog('close');
     		                        	}
     		                        	else if(btn==5){
     		                        		 
     		                        		$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		                        		$("#windowCelling").hide();
        		            	 	 		$(this).dialog('close');
     		             	 	 		}
     		                        	else if(btn==6){
     		                        		  
     		                        		$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		                        		$("#moulding").hide();
     		           	 			 	    $(this).dialog('close');
     		            	 	 		}
     		                        	else if(btn==7){
     		                        		   
     		                        		$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		                        		$("#seatBerth").hide();
     		          	 	 			 	 $(this).dialog('close');
     		           	 	 			}
     		                        	else if(btn==8){
     		                        		   
     		                        		$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		                        		$("#lavatory").hide();
     		         	 	 			  	 $(this).dialog('close');
     		          	 	 			}
     		                        	else if(btn==9){
     		                        		  
     		                        		$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		                        		$("#plumbing").hide();
     		        	 	 			 	 $(this).dialog('close');
     		         	 	 			}
     		        	 	 			else if(btn==10){
     		        	 	 				  
     		        	 	 				$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		        	 	 				$("#airBrake").hide();
     		       	 	 			 		 $(this).dialog('close');
     		       	 	 			 	}
     		        	 	 			else if(btn==11){
     		        	 	 				 
     		        	 	 				$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		        	 	 				$("#coachLowering").hide();
     		       	 	 			 		 $(this).dialog('close');
     		       	 	 			 	}
     		        	 	 			else if(btn==12){
     		        	 	 				 	 
     		        	 	 				$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		        	 	 				$("#paint").hide();
     		       	 	 			 		 $(this).dialog('close');
     		       	 	 			 	}
     		        	 	 			else if(btn==13){
     		        	 	 				  
     		        	 	 				$('form[name="general"]')[0].reset();
     		                        		DestroyCKEditorInstances1('generaltext');
     	             	 	 				$('form[name="fpvc"]')[0].reset();
     			                        		DestroyCKEditorInstances2('fpvctext');
     			                        		$('form[name="paritionFrame"]')[0].reset();
     		                        		 DestroyCKEditorInstances3('paritionframetext');
     		                        		 $('form[name="panel"]')[0].reset();
     			                        		 DestroyCKEditorInstances4('paneltext');
     			                        		$('form[name="windowCelling"]')[0].reset();
     		                        		 DestroyCKEditorInstances5('windowcellingtext');
     		                        		$('form[name="moulding"]')[0].reset();
     			                        		 DestroyCKEditorInstances6('mouldingtext');
     			                        		$('form[name="seatBerth"]')[0].reset();
     			                        		DestroyCKEditorInstances7('seatBerthtext');
     			                        		$('form[name="lavatory"]')[0].reset();
     			                        		DestroyCKEditorInstances8('lavatorytext');
     			                        		$('form[name="plumbing"]')[0].reset();
     		                        		 DestroyCKEditorInstances9('plumbingtext');
     		                        		 $('form[name="airBrake"]')[0].reset();
     			        	 	 			 	DestroyCKEditorInstances10('airbraketext');
     			        	 	 				$('form[name="coachLowering"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances11('coachloweringtext');
     		        	 	 			 		$('form[name="paint"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances12('painttext');
     		        	 	 			 		$('form[name="coachCleaning"]')[0].reset();
     		        	 	 			 		DestroyCKEditorInstances13('coachcleaningtext');
     		        	 	 				$("#coachCleaning").hide();
     		       	 	 			 		 $(this).dialog('close');
     		        	 	 			}
     		        	 	 			
     		        	 	 			
     		                         }
                                 },
                 	        modal: true
        });
             	 		
             	 		
             	 		
             	 		
             	 		
             	 		    
     			    	   return true;
             	 		    
             	 			  
             	 		  }//ending else               	  
             	  // ajax call ends here				
     					 
                 }
             
             }, 
            
                    
                   
            ]
            },
                        
			actions : {
	
 			listAction: 'availableForCrossCheckFurnishingAction?stageID=<%=stageID%>',
 			
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
	
	</script>
	
	<script>
	function myFunction(zone)
	{
		
		var zoneValue = zone ;
		if(zoneValue!="")
			
			{
		$("#bookedDiv").removeAttr('disabled');
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
          
            $('#bookedDiv')
                           .find('option')
                           .remove()
                           .end();

            $('#bookedDiv').append(
                    '<option value="">Select</option>');
                        for ( var i = 0; i < msg.divList.length; i++) {
                       
                        $('#bookedDiv').append(
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
	 function open1(event) {
	     CKEDITOR.replace('generaltext',{language: 'html',height:300,width:800, allowedContent: true});
	     }
	function open2(event) {
	     CKEDITOR.replace('fpvctext',{language: 'html',height:300,width:800, allowedContent: true});
	     }
	 function open3(event) {
		 CKEDITOR.replace('paritionframetext',{language: 'html',height:300,width:800, allowedContent: true});
	     
	 }
	function open4(event) {
	 CKEDITOR.replace('paneltext',{language: 'html',height:300,width:800, allowedContent: true});
	    
	 }
	function open5(event) {
	 CKEDITOR.replace('windowcellingtext',{language: 'html',height:300,width:800, allowedContent: true});
	    
	 }
	function open6(event) {
	 CKEDITOR.replace('mouldingtext',{language: 'html',height:300,width:800, allowedContent: true});
	    
	 }
	function open7(event) {
	 CKEDITOR.replace('seatBerthtext',{language: 'html',height:300,width:800, allowedContent: true});
	    
	 }
	function open8(event) {
	 CKEDITOR.replace('lavatorytext',{language: 'html',height:300,width:800, allowedContent: true});
	    
	 }
	function open9(event) {
	 CKEDITOR.replace('plumbingtext',{language: 'html',height:300,width:800, allowedContent: true});
	    
	 }
	function open10(event) {
	 CKEDITOR.replace('airbraketext',{language: 'html',height:300,width:800, allowedContent: true});
    
	 }
	function open11(event) {
	 CKEDITOR.replace('coachloweringtext',{language: 'html',height:300,width:800, allowedContent: true});
	    
	 }
	function open12(event) {
	 CKEDITOR.replace('painttext',{language: 'html',height:300,width:800, allowedContent: true});
	    
	 }
	function open13(event) {
	 CKEDITOR.replace('coachcleaningtext', {language: 'html',height:300,width:800, allowedContent: true} );

	 }
	
	
	function openCity(evt, cityName) {   // function openCity
		
		
		var i, tabcontent, tablinks;
		  btn=evt.target.id;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
	
		  var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
		 	 if ($selectedRows.length<1)
			 alert("Please select a row for which you want to sent for Perform QCI");
		 	 else{
		 		
		 		$selectedRows.each(function () {
	             record = $(this).data('record');
	             });
		 		
		 		
		 		if(btn==1){	
   				 	 $("#general").show();
   				 	 open1(event);			
   				}
		 		else if(btn==2){
    				 $("#fpvc").show();
    				 open1(event);
    			}
    			else if(btn==3){
    				$("#paritionFrame").show();
    				open3(event);
    			} 
    			else if(btn==4){
    				$("#panel").show();	
    				open4(event);
    			}
    			else if(btn==5){
    				$("#windowCelling").show();  				
    				open5(event);
     			}
    			else if(btn==6){
    				$("#moulding").show();
    				open6(event);
    			}
    			else if(btn==7){
    				$("#seatBerth").show();    				
    				open7(event);
    			}
    			else if(btn==8){
    				$("#seatBerth").show();
    				open8(event);
    			}
    			else if(btn==9){
    				$("#plumbing").show();
    				open9(event);
    			}
    			else if(btn==10){
    				$("#airBrake").show();
    				open10(event);
    			}
    			else if(btn==11){
    				$("#coachLowering").show();
    				open11(event);
    			}
    			else if(btn==12){
    				$("#paint").show();
    				open12(event);
    			}
    			else if(btn==13){
    				$("#coachCleaning").show();
    				open13(event);
    			}  //end of else block
    			
		 	 }	
		 	 
	}
		 	 
	 		             
			
	
	
	
	

	</script>