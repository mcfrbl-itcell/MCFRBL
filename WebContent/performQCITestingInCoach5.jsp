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
input{
	font-weight:bold;
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
</style>



<body>
<div id="FurnishingProductionTableContainer"></div>
<div id="selectStages" style="height:150%; width:200%; display:none; z-index:9;">
<table>
<tr>	
	<td><button class="tablinks" id="1" onclick="openCity(event, 'F&PVC')">F&PVC</button></td>
   	<td><button class="tablinks" id="2" onclick="openCity(event, 'ParitionFrame')">Parition frame</button></td>
   	<td><button class="tablinks" id="3" onclick="openCity(event, 'Panel')">Panel</button></td>
   	<td><button class="tablinks" id="4" onclick="openCity(event, 'WindowCelling')">Window & celling</button></td>
   	<td><button class="tablinks" id="5" onclick="openCity(event, 'Moulding')">Moulding</button></td>
   	<td><button class="tablinks" id="6" onclick="openCity(event, 'SeatBerth')">Seat & Berth</button></td>
   	<td><button class="tablinks" id="7" onclick="openCity(event, 'Lavatory')">Lavatory</button></td>
   	<td><button class="tablinks" id="8" onclick="openCity(event, 'Plumbing')">Plumbing</button></td>
   	<td><button class="tablinks" id="9" onclick="openCity(event, 'AirBrake')">Air Brake</button></td>
   	<td><button class="tablinks" id="10" onclick="openCity(event, 'CoachLowering')">Coach Lowering</button></td>
   	<td><button class="tablinks" id="11" onclick="openCity(event, 'Paint')">Paint</button></td>
   	<td><button class="tablinks" id="12" onclick="openCity(event, 'CoachCleaning')">Coach Cleaning</button></td>
   	<td><button class="tablinks" id="13" onclick="openCity(event, 'FurnishingClearance')">Furnishing Clearance</button></td>
 </tr>
 </table>  	

 <div id="F&PVC" class="tabcontent">
    <form name="fpvc">
    <table class="t2" border="1" style="height:70px;">
			<tr style="height:100%;"><td class="t3"><p Style="text-align:center;font-size:12px;margin:0px;padding:0px;"><b>Modern Coach Factory, Raebareli</b></p><br><p Style="text-align:center;font-size:8px;margin:0px;padding:0px;">QUALITY CONTROL INSPECTION REPORT(QCI)</p><br><p Style="text-align:center;font-size:8px;margin:0px;padding:0px;">L2T,L3T,L2T(T),HUMSAFAR (FURNISHING QUALITY)</p></td><td>
			&nbsp;&nbsp;&nbsp;Doc No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="docNo" name="docNo" class="validate[required]"><br>&nbsp;&nbsp;&nbsp;Rev No: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="docRevNo" name="docRevNo"><br>&nbsp;&nbsp;&nbsp;Date: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="docDate" name="docDate" class="validate[required]"></td></tr>
		</table>
		<table border="1">
			<tr><td>Furnishing No.:<input type="text" id="furnishingNoQCI" name="furnishingNoQCI" readonly></td><td colspan="2">Booked To:<input type="text" id="bookedRly" name="bookedRly"></td><td>Shell No.:<input type="text" id="shellNo" name="shellNo"></td></tr>
			<tr><td>Coach No.:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="coachNo" name="coachNo" readonly></td><td colspan="2">Bogie No.<td>Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="dateOfTesting" name="dateOfTesting" class="validate[required]"></td></tr>
			<tr><td>RLY:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="bookedDiv" name="bookedDiv"></td><td>PP:<input type="text" id="bogiePp" name="bogiePp" readonly></td><td>NPP:<input type="text" id="bogieNpp" name="bogieNpp" readonly></td>
			<td>Shift:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="shiftOfTesting" class="validate[required]">
				 <option value="">Select</option>
             <option value="general">General</option>
             <option value="morning">Shift-I</option>
            <option value="evening">Shift-II</option>
               <option value="night">Shift-III</option>
				</select></td></tr>
		</table>
		<br><br>
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>1-F&PVC</b></td></tr>
			<tr><td>1.</td><td>Foot plate jam</td><td colspan="2"><input type="text" id="footPlateJam" name="footPlateJam"></td><td>Movement hard</td><td colspan="2"><input type="text" id="movementHard" name="movementHard"></td></tr>
			<tr><td>2.</td><td>Foot plate spring hardware loose and not property fitted</td><td colspan="5"><input type="text" id="footPlateSpringHardware" name="footPlateSpringHardware"></td></tr>
			<tr><td>3.</td><td>Foot plate side rubber pad hardware loose</td><td colspan="2"><input type="text" id="footPlateSideRubberLoose" name="footPlateSideRubberLoose"></td><td>Missing</td><td colspan="2"><input type="text" id="footPlateSideRubberMissing" name="footPlateSideRubberMissing"></td></tr>
			<tr><td>4.</td><td>Tail lamp taper fitted</td><td><input type="text" id="tailLampFitted" name="tailLampFitted"></td><td>Hardware missing</td><td><input type="text" id="tailLampHardwareMissing" name="tailLampHardwareMissing"></td><td>Welding done on tail lamp instead of nut bolting</td><td><input type="text" id="tailLampWelding" name="tailLampWelding"></td></tr>
			<tr><td>5.</td><td>Foot step found loose</td><td colspan="2"><input type="text" id="footStepLoose" name="footStepLoose"></td><td>Hardware missing</td><td colspan="2"><input type="text" id="footStepHardware" name="footStepHardware"></td></tr>
			<tr><td>6.</td><td>Fitment of entrance hand rail</td><td colspan="5"><input type="text" id="fitmentEntranceHandRail" name="fitmentEntranceHandRail"></td></tr>
			<tr><td>7.</td><td>Foot step rusted</td><td colspan="2"><input type="text" id="footStepRusted" name="footStepRusted"></td><td>Taper fitted</td><td colspan="2"><input type="text" id="footStepTaperFitted" name="footStepTaperFitted"></td></tr>
			<tr><td>8.</td><td>Step rail mounting screw not property sited</td><td colspan="2"><input type="text" id="stepRailScrewSited" name="stepRailScrewSited"></td><td>Missing</td><td colspan="2"><input type="text" id="stepRailScrewMissing" name="stepRailScrewMissing"></td></tr>
			<tr><td>9.</td><td>Chequer sheet corner not sealed</td><td colspan="2"><input type="text" id="chequerSheetNotSealed" name="chequerSheetNotSealed"></td><td>Roughly sealed</td><td colspan="2"><input type="text" id="chequerSheetRouglySealed" name="chequerSheetRouglySealed"></td></tr>
			<tr><td>10.</td><td>Roughly cutting of chequer sheet at corner</td><td colspan="5"><input type="text" id="roughlyCuttingChequerSheet" name="roughlyCuttingChequerSheet"></td></tr>
			<tr><td>11.</td><td>Chequer sheet is not sited properly at corner</td><td colspan="5"><input type="text" id="chequerSheetNotSitedCorner" name="chequerSheetNotSitedCorner"></td></tr>
			<tr><td>12.</td><td>Chequer sheet screw not properly sited in corner</td><td><input type="text" id="chequerSheetScrewSited" name="chequerSheetScrewSited"></td><td>Missing</td><td><input type="text" id="chequerSheetScrewMissing" name="chequerSheetScrewMissing"></td><td>Loose</td><td><input type="text" id="chequerSheetScrewLoose" name="chequerSheetScrewLoose"></td></tr>
			<tr><td>13.</td><td>Door stopper is not fitted at 90 degree</td><td colspan="5"><input type="text" id="doorStopperNotFitted" name="doorStopperNotFitted"></td></tr>
			<tr><td>14.</td><td>End wall safety handle not fitted</td><td><input type="text" id="endwallSafetyHandleFitted" name="endwallSafetyHandleFitted"></td><td>Loose</td><td><input type="text" id="endwallSafetyHandleLoose" name="endwallSafetyHandleLoose"></td><td>Hardware missing</td><td><input type="text" id="endwallSafetyHandleMissing" name="endwallSafetyHandleMissing"></td></tr>
			<tr><td>15.</td><td>PVC is not properly cutting and pasting near end wall door</td><td colspan="2"><input type="text" id="pvcCuttingPastingEndwalldoor" name="pvcCuttingPastingEndwalldoor"></td><td>Lavatory door frame</td><td colspan="2"><input type="text" id="pvcCuttingPastingLavatorydoor" name="pvcCuttingPastingLavatorydoor"></td></tr>
			<tr><td>16.</td><td>PVC joint welding roughly done cabin side</td><td colspan="2"><input type="text" id="pvcJointWeldingCabinSide" name="pvcJointWeldingCabinSide"></td><td>Non cabin side</td><td colspan="2"><input type="text" id="pvcJointWeldingNonCabinSide" name="pvcJointWeldingNonCabinSide"></td></tr>
			<tr><td>17.</td><td>Air bubble found on PVC</td><td colspan="5"><input type="text" id="airBubblePvc" name="airBubblePvc"></td></tr>
			<tr><td>18.</td><td>Floor not in level at corridor area</td><td colspan="5"><input type="text" id="floorLevelCorridorArea" name="floorLevelCorridorArea"></td></tr>
			<tr><td>19.</td><td>UIC vestibule note sited properly</td><td><input type="text" id="uicVestibuleSited" name="uicVestibuleSited"></td><td>Taper</td><td><input type="text" id="uicVestibuleTaper" name="uicVestibuleTaper"></td><td>Cracked</td><td><input type="text" id="uicVestibuleCracked" name="uicVestibuleCracked"></td></tr>
			<tr><td>20.</td><td>Foam/FAM sealing not done</td><td colspan="2"><input type="text" id="foamFamSealingNotDone" name="foamFamSealingNotDone"></td><td>Roughly done</td><td colspan="2"><input type="text" id="foamFamSealingRoughlyDone" name="foamFamSealingRoughlyDone"></td></tr>
			<tr><td>21.</td><td>Fitment of entrance door handle</td><td colspan="5"><input type="text" id="fitmentDoorHandle" name="fitmentDoorHandle"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkFpvc" name="testingObservationRemarkFpvc" style="width:100%;height:100px;"></textarea>
		
    </form>
  </div> 

	<div id="ParitionFrame" class="tabcontent">
	   <form name="paritionFrame">	
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>2-Partition frame</b></td></tr>
			<tr><td>1.</td><td>Dent mark on partition BN</td><td colspan="2"><input type="text" id="dentMarkPartitionBn" name="dentMarkPartitionBn"></td><td>Excess cut</td><td colspan="2"><input type="text" id="dentMarkPartitionExceesCut" name="dentMarkPartitionExceesCut"></td></tr>
			<tr><td>2.</td><td>Excess gap between U moulding and partition pillar BN</td><td colspan="5"><input type="text" id="excessGapUmouldingPartitionpillar" name="excessGapUmouldingPartitionpillar"></td></tr>
			<tr><td>3.</td><td>Middle berth stopper missing</td><td><input type="text" id="middleBearthStopperMissing" name="middleBearthStopperMissing"></td><td>Loose</td><td><input type="text" id="middleBearthStopperLoose" name="middleBearthStopperLoose"></td><td>Rubber pad missing</td><td><input type="text" id="middleBearthStopperRubberPad" name="middleBearthStopperRubberPad"></td></tr>
			<tr><td>4.</td><td>Partition pillar mounting hardware loose</td><td><input type="text" id="partitionPillarHardwareLoose" name="partitionPillarHardwareLoose"></td><td>Missing</td><td><input type="text" id="partitionPillarHardwareMissing" name="partitionPillarHardwareMissing"></td><td>Taper</td><td><input type="text" id="partitionPillarHardwareTaper" name="partitionPillarHardwareTaper"></td></tr>
			<tr><td>5.</td><td>Unwanted holes on partition</td><td colspan="2"><input type="text" id="unwantedHolesPartitionBn" name="unwantedHolesPartitionBn"></td><td>Plastic film not removed from partition</td><td colspan="2"><input type="text" id="plasticFilmRemovedPartition" name="plasticFilmRemovedPartition"></td></tr>
			<tr><td>6.</td><td>Roughly putty applied on partition</td><td colspan="5"><input type="text" id="roughlyPuttyPartition" name="roughlyPuttyPartition"></td></tr>
			<tr><td>7.</td><td>Partition pillar U moulding Zigzag</td><td colspan="2"><input type="text" id="partitionPillarZigzag" name="partitionPillarZigzag"></td><td>Not properly sited</td><td colspan="2"><input type="text" id="partitionPillarProperlySited" name="partitionPillarProperlySited"></td></tr>
			<tr><td>8.</td><td>Burr found on partition pillar</td><td colspan="2"><input type="text" id="burrFoundPartitionPillar" name="burrFoundPartitionPillar"></td><td>Berth holding bkt</td><td colspan="2"><input type="text" id="burrFoundBerthHoldingBkt" name="burrFoundBerthHoldingBkt"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkParitionFrame" name="testingObservationRemarkParitionFrame" style="width:100%;height:100px;"></textarea>
		</form>
  </div>
  
  <div id="Panel" class="tabcontent">
    <form name="panel">
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>3-Panel</b></td></tr>
			<tr><td>1.</td><td>AC air grill screw not tighten properly PP/NPP</td><td colspan="2"><input type="text" id="acAirGrillScrewTighten" name="acAirGrillScrewTighten"></td><td>Missing</td><td colspan="2"><input type="text" id="acAirGrillScrewMissing" name="acAirGrillScrewMissing"></td></tr>
			<tr><td>2.</td><td>Gap found between partition and panel</td><td colspan="5"><input type="text" id="gapPartitionPanel" name="gapPartitionPanel"></td></tr>
			<tr><td>3.</td><td>Unnecessary cut mark found on panel at corner</td><td colspan="5"><input type="text" id="cutMarkPanelCorner" name="cutMarkPanelCorner"></td></tr>
			<tr><td>4.</td><td>Panel found crack near</td><td colspan="5"><input type="text" id="panelCrackNear" name="panelCrackNear"></td></tr>
			<tr><td>5.</td><td>Dent mark found on panel near</td><td colspan="5"><input type="text" id="panelDentNear" name="panelDentNear"></td></tr>
			<tr><td>6.</td><td>Magazine bag screw loose</td><td colspan="2"><input type="text" id="magazineBagScrewLoose" name="magazineBagScrewLoose"></td><td>Not fitted</td><td colspan="2"><input type="text" id="magazineBagScrewNotFitted" name="magazineBagScrewNotFitted"></td></tr>
			<tr><td>7.</td><td>Magazine Taper fitted</td><td><input type="text" id="magazineTaperFitted" name="magazineTaperFitted"></td><td>Bulged</td><td><input type="text" id="magazineTaperBulged" name="magazineTaperBulged"></td><td>Damage</td><td><input type="text" id="magazineTaperDamage" name="magazineTaperDamage"></td></tr>
			<tr><td>8.</td><td>Unwanted hole found on panel/partition</td><td colspan="5"><input type="text" id="holePanelPartition" name="holePanelPartition"></td></tr>
			<tr><td>9.</td><td>Panel not properly locked</td><td colspan="5"><input type="text" id="panelNotLocked" name="panelNotLocked"></td></tr>
			<tr><td>10.</td><td>Excess gap between panel and partition</td><td colspan="5"><input type="text" id="excessGapPanelPartition" name="excessGapPanelPartition"></td></tr>
			<tr><td>11.</td><td>Window rubber excess in length</td><td><input type="text" id="windowRubberExcessLength" name="windowRubberExcessLength"></td><td>Short in length</td><td><input type="text" id="windowRubberShortLength" name="windowRubberShortLength"></td><td>Uprooted</td><td><input type="text" id="windowRubberUprooted" name="windowRubberUprooted"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkPanel" name="testingObservationRemarkPanel" style="width:100%;height:100px;"></textarea>
		</form>
  </div> 
  
  <div id="WindowCelling" class="tabcontent">
    <form name="windowCelling">
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>4-Window & celling</b></td></tr>
			<tr><td>1.</td><td>Screw missing from L type ceiling</td><td colspan="2"><input type="text" id="screwMissingLtypeCeiling" name="screwMissingLtypeCeiling"></td><td>Chip up</td><td colspan="2"><input type="text" id="screwMissingChipUp" name="screwMissingChipUp"></td></tr>
			<tr><td>2.</td><td>Doorway ceiling and gangway ceiling not in align</td><td colspan="2"><input type="text" id="doorwayGangwayCeilingAlign" name="doorwayGangwayCeilingAlign"></td><td>Dent mark</td><td colspan="2"><input type="text" id="doorwayGangwayCeilingDent" name="doorwayGangwayCeilingDent"></td></tr>
			<tr><td>3.</td><td>Chip up found on doorway and gang way ceiling</td><td colspan="5"><input type="text" id="chipupDoorwayGangwayCeiling" name="chipupDoorwayGangwayCeiling"></td></tr>
			<tr><td>4.</td><td>Excess gap found between doorway ceiling & linen room 3 ceiling</td><td colspan="5"><input type="text" id="excessGapDoorwayLinenroomCeiling" name="excessGapDoorwayLinenroomCeiling"></td></tr>
			<tr><td>5.</td><td>Taper gap found between corridor ceiling & partition</td><td colspan="5"><input type="text" id="taperGapCorridorPartition" name="taperGapCorridorPartition"></td></tr>
			<tr><td>6.</td><td>Nylon rope not provided in doorway ceiling</td><td colspan="2"><input type="text" id="nylonRopeDoorwayCeiling" name="nylonRopeDoorwayCeiling"></td><td>Ceiling unlock</td><td colspan="2"><input type="text" id="nylonRopeDoorwayCeilingUnlock" name="nylonRopeDoorwayCeilingUnlock"></td></tr>
			<tr><td>7.</td><td>Door way & gangway ceiling knotted using non standard rope instead of nylon rope</td><td colspan="5"><input type="text" id="doorwayGangwayCeilingKnotted" name="doorwayGangwayCeilingKnotted"></td></tr>
			<tr><td>8.</td><td>Gap found between s/wall ceiling & partition</td><td colspan="2"><input type="text" id="gapWallceilingPartition" name="gapWallceilingPartition"></td><td>Dent mark</td><td colspan="2"><input type="text" id="dentWallceilingPartition" name="dentWallceilingPartition"></td></tr>
			<tr><td>9.</td><td>EP sheet roughly applied between s/wall ceiling & partition</td><td colspan="5"><input type="text" id="epSheetWallceilingPartition" name="epSheetWallceilingPartition"></td></tr>		
			<tr><td>10.</td><td>Excess cut on ceiling</td><td><input type="text" id="excessCutCeiling" name="excessCutCeiling"></td><td>Dent mark near B.no.</td><td><input type="text" id="dentMarkNearB" name="dentMarkNearB"></td><td>Screw missing</td><td><input type="text" id="screwMissingCeiling" name="screwMissingCeiling"></td></tr>
			<tr><td>11.</td><td>Screw missing from side ceiling</td><td><input type="text" id="screwMissingSideCeiling" name="screwMissingSideCeiling"></td><td>Loose</td><td><input type="text" id="screwLooseSideCeiling" name="screwLooseSideCeiling"></td><td>Unwanted hole</td><td><input type="text" id="screwUnwantedHole" name="screwUnwantedHole"></td></tr>		
			<tr><td>12.</td><td>Side ceiling not in level with each other</td><td colspan="5"><input type="text" id="screwCeilingLevel" name="screwCeilingLevel"></td></tr>
			<tr><td>13.</td><td>Center diffuser level mismatch</td><td colspan="2"><input type="text" id="centreDiffuserLevelMismatch" name="centreDiffuserLevelMismatch"></td><td>Bulge</td><td colspan="2"><input type="text" id="centreDiffuserLevelBulge" name="centreDiffuserLevelBulge"></td></tr>
			<tr><td>14.</td><td>Center diffuser not locked properly</td><td colspan="2"><input type="text" id="centreDiffuserLockedPrperly" name="centreDiffuserLockedPrperly"></td><td>Industrial lock missing</td><td colspan="2"><input type="text" id="centreDiffuserLockedMissing" name="centreDiffuserLockedMissing"></td></tr>
			<tr><td>15.</td><td>Emergency pull handle rubber not sited properly</td><td colspan="5"><input type="text" id="emergencyPullhandlerubbberSited" name="emergencyPullhandlerubbberSited"></td></tr>
			<tr><td>16.</td><td>Window glass found cracked</td><td colspan="5"><input type="text" id="windowGlassCracked" name="windowGlassCracked"></td></tr>
			<tr><td>17.</td><td>Gap between small center diffuser and side ceiling</td><td colspan="5"><input type="text" id="gapCentreDiffuserSideceiling" name="gapCentreDiffuserSideceiling"></td></tr>
			<tr><td>18.</td><td>Gap found between sidewall ceiling and center diffuser</td><td colspan="5"><input type="text" id="gapSidewalceilingCentrediffuser" name="gapSidewalceilingCentrediffuser"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkWindowCelling" name="testingObservationRemarkWindowCelling" style="width:100%;height:100px;"></textarea>
		</form>
  </div>
  
  
  <div id="Moulding" class="tabcontent">
    <form name="moulding">
		<table border="1" style="width:99%;">
			<tr><td colspan="9" style="text-align:center;font-size:16px;width:99%;"><b>5-Moulding</b></td></tr>
			<tr><td style="width:11%;">1.</td><td colspan="2" style="width:22%;">End wall door cover is loose fitted</td><td style="width:11%;"><input type="text" id="endwallDoorCoverLoose" name="endwallDoorCoverLoose"></td><td colspan="2" style="width:22%;">Hardware Missing</td><td style="width:11%;"><input type="text" id="endwallDoorCoverMissing" name="endwallDoorCoverMissing"></td><td style="width:11%;">Not properly tighten</td><td style="width:11%;"><input type="text" id="endwallDoorCoverTighten" name="endwallDoorCoverTighten"></td></tr>
			<tr><td style="width:11%;">2.</td><td colspan="2" style="width:22%;">End wall door is not sliding smoothly</td><td style="width:11%;"><input type="text" id="endwallDoorSliding" name="endwallDoorSliding"></td><td colspan="2" style="width:22%;">Rail screw missing</td><td style="width:11%;"><input type="text" id="endwallRailscrewMissing" name="endwallRailscrewMissing"></td><td style="width:11%;">Loose</td><td style="width:11%;"><input type="text" id="endwallLoose" name="endwallLoose"></td></tr>
			<tr><td style="width:11%;">3.</td><td colspan="3" style="width:33%;">End wall door lock not in align</td><td style="width:11%;"><input type="text" id="endwallDoorlockAlign" name="endwallDoorlockAlign"></td><td colspan="3" style="width:33%;">Bracket hardware loose</td><td style="width:11%;"><input type="text" id="endwallDoorlockBracketLoose" name="endwallDoorlockBracketLoose"></td></tr>
			<tr><td style="width:11%;">4.</td><td colspan="2" style="width:22%;">Manual handle movement hard</td><td style="width:11%;"><input type="text" id="manualHandleMovementHard" name="manualHandleMovementHard"></td><td colspan="2" style="width:22%;">Hardware loose</td><td style="width:11%;"><input type="text" id="manualHandleMovementLoose" name="manualHandleMovementLoose"></td><td style="width:11%;">Handle rusted</td><td style="width:11%;"><input type="text" id="manualHandleRusted" name="manualHandleRusted"></td></tr>
			<tr><td style="width:11%;">5.</td><td colspan="3" style="width:33%;">Entrance Door movement is not smooth</td><td colspan="5" style="width:55%;"><input type="text" id="entranceDoorMovement" name="entranceDoorMovement"></td></tr>
			<tr><td style="width:11%;">6.</td><td colspan="3" style="width:33%;">Entrance Door pivot loose</td><td style="width:11%;"><input type="text" id="entranceDoorPivotLoose" name="entranceDoorPivotLoose"></td><td colspan="3" style="width:33%;">Pivot screw not properly sited</td><td style="width:11%;"><input type="text" id="entranceDoorPivotScrewSited" name="entranceDoorPivotScrewSited"></td></tr>
			<tr><td style="width:11%;">7.</td><td colspan="3" style="width:33%;">Entrance Door lock is not properly working</td><td style="width:11%;"><input type="text" id="entranceDoorLockWorking" name="entranceDoorLockWorking"></td><td colspan="3">Latch catch mismatch</td><td><input type="text" id="entranceDoorLatchMismatch" name="entranceDoorLatchMismatch"></td></tr>
			<tr><td style="width:11%;">8.</td><td colspan="3" style="width:33%;">Entrance Door bottom pivot excess in length</td><td colspan="5" style="width:55%;"><input type="text" id="entranceDoorBottomExcessLength" name="entranceDoorBottomExcessLength"></td></tr>
			<tr><td style="width:11%;">9.</td><td colspan="3" style="width:33%;">Entrance Door grazing with chequer sheet</td><td style="width:11%;"><input type="text" id="entranceDoorGrazingChequerSheet" name="entranceDoorGrazingChequerSheet"></td><td colspan="3" style="width:33%;">Rubber</td><td style="width:11%;"><input type="text" id="entranceDoorGrazingRubber" name="entranceDoorGrazingRubber"></td></tr>
			<tr><td style="width:11%;">10.</td><td colspan="3" style="width:33%;">Excess play found on entrance door pivot</td><td colspan="5" style="width:55%;"><input type="text" id="excessPlayEntranceDoorPivot" name="excessPlayEntranceDoorPivot"></td></tr>
			<tr><td style="width:11%;">11.</td><td colspan="2" style="width:22%;">Horizontal steel strip screw not properly tighten</td><td style="width:11%;"><input type="text" id="horizontalSteelStripScrewTighten" name="horizontalSteelStripScrewTighten"></td><td colspan="2" style="width:22%;">Screw missing</td><td style="width:11%;"><input type="text" id="horizontalSteelStripScrewMissing" name="horizontalSteelStripScrewMissing"></td><td style="width:11%;">Unwanted hole</td><td style="width:11%;"><input type="text" id="horizontalSteelStripScrewHole" name="horizontalSteelStripScrewHole"></td></tr>
			<tr><td style="width:11%;">12.</td><td colspan="2" style="width:22%;">Vertical steel strip screw not properly tighten</td><td style="width:11%;"><input type="text" id="verticalSteelStripScrewTighten" name="verticalSteelStripScrewTighten"></td><td colspan="2" style="width:22%;">Screw missing</td><td style="width:11%;"><input type="text" id="verticalSteelStripScrewMissing" name="verticalSteelStripScrewMissing"></td><td style="width:11%;">Unwanted hole</td><td style="width:11%;"><input type="text" id="verticalSteelStripScrewHole" name="verticalSteelStripScrewHole"></td></tr>
			<tr><td style="width:11%;">13.</td><td colspan="3" style="width:33%;">Horizontal/Vertical rubber are not pasted</td><td colspan="5" style="width:55%;"><input type="text" id="horizontalVerticalRubberPasted" name="horizontalVerticalRubberPasted"></td></tr>
			<tr><td style="width:11%;">14.</td><td colspan="2" style="width:22%;">Tilli panel loose fitted</td><td style="width:11%;"><input type="text" id="tilliPanelLooseFitted" name="tilliPanelLooseFitted"></td><td colspan="2" style="width:22%;">Bulge</td><td style="width:11%;"><input type="text" id="tilliPanelBulge" name="tilliPanelBulge"></td><td style="width:11%;">Unwanted hole</td><td style="width:11%;"><input type="text" id="tilliPanelHole" name="tilliPanelHole"></td></tr>
			<tr><td style="width:11%;">15.</td><td style="width:11%;">Vertical FRP loose fitted</td><td style="width:11%;"><input type="text" id="verticalFrpLooseFitted" name="verticalFrpLooseFitted"></td><td style="width:11%;">Screw missing</td><td style="width:11%;"><input type="text" id="verticalFrpScrewMissing" name="verticalFrpScrewMissing"></td><td style="width:11%;">Unwanted hole</td><td style="width:11%;"><input type="text" id="verticalFrpHole" name="verticalFrpHole"></td><td style="width:11%;">Screw not properly tighten</td><td style="width:11%;"><input type="text" id="verticalFrpScrewTighten" name="verticalFrpScrewTighten"></td></tr>
			<tr><td style="width:11%;">16.</td><td style="width:11%;">Horizontal FRP loose fitted</td><td style="width:11%;"><input type="text" id="horizontalFrpLooseFitted" name="horizontalFrpLooseFitted"></td><td style="width:11%;">Screw missing</td><td style="width:11%;"><input type="text" id="horizontalFrpScrewMissing" name="horizontalFrpScrewMissing"></td><td style="width:11%;">Unwanted hole</td><td style="width:11%;"><input type="text" id="horizontalFrpHole" name="horizontalFrpHole"></td><td style="width:11%;">Screw not properly tighten</td><td style="width:11%;"><input type="text" id="horizontalFrpScrewTighten" name="horizontalFrpScrewTighten"></td></tr>
			<tr><td style="width:11%;">17.</td><td colspan="3" style="width:33%;">Vertical FRP/Horizontal FRP joint mismatch</td><td colspan="5" style="width:55%;"><input type="text" id="verticalfrpHorizontalfrpJointMismatch" name="verticalfrpHorizontalfrpJointMismatch"></td></tr>
			<tr><td style="width:11%;">18.</td><td colspan="3" style="width:33%;">Horizontal & Vertical FRP edge uneven cut out</td><td style="width:11%;"><input type="text" id="horizontalVerticalFrpEdgeUneven" name="horizontalVerticalFrpEdgeUneven"></td><td colspan="3" style="width:33%;">Roughly putty applied</td><td style="width:11%;"><input type="text" id="horizontalVerticalFrpPutty" name="horizontalVerticalFrpPutty"></td></tr>
			<tr><td style="width:11%;">19.</td><td colspan="3" style="width:33%;">Gap found between self & partition</td><td colspan="5" style="width:55%;"><input type="text" id="gapSelfPartition" name="gapSelfPartition"></td></tr>
			<tr><td style="width:11%;">20.</td><td colspan="3" style="width:33%;">Flap door movement hard(pantry linen room)</td><td colspan="5" style="width:55%;"><input type="text" id="flapDoorMovementHard" name="flapDoorMovementHard"></td></tr>
			<tr><td style="width:11%;">21.</td><td colspan="3" style="width:33%;">Z-member hardware missing & loose(pantry linen room)</td><td style="width:11%;"><input type="text" id="ZMemberHardwareMissing" name="ZMemberHardwareMissing"></td><td colspan="3" style="width:33%;">Burr found</td><td style="width:11%;"><input type="text" id="ZMemberHardwareBurr" name="ZMemberHardwareBurr"></td></tr>
			<tr><td style="width:11%;">22.</td><td colspan="3" style="width:33%;">Linen room door stopper screw loose</td><td colspan="5" style="width:55%;"><input type="text" id="linenRoomDoorScrewLoose" name="linenRoomDoorScrewLoose"></td></tr>
			<tr><td style="width:11%;">23.</td><td colspan="3" style="width:33%;">Linen room binjo hinge screw missing</td><td style="width:11%;"><input type="text" id="linenRoomBinjoScrewMissing" name="linenRoomBinjoScrewMissing"></td><td colspan="3" style="width:33%;">Loose</td><td style="width:11%;"><input type="text" id="linenRoomBinjoScrewLoose" name="linenRoomBinjoScrewLoose"></td></tr>
			<tr><td style="width:11%;">24.</td><td colspan="3" style="width:33%;">Linen room hasp & staple missing</td><td colspan="5" style="width:55%;"><input type="text" id="linenRoomHaspStapleMissing" name="linenRoomHaspStapleMissing"></td></tr>
			<tr><td style="width:11%;">25.</td><td colspan="3" style="width:33%;">Compartment door frame not properly sited with partition pillar</td><td colspan="5" style="width:55%;"><input type="text" id="compartmentDoorframeSited" name="compartmentDoorframeSited"></td></tr>
			<tr><td style="width:11%;">26.</td><td colspan="3" style="width:33%;">Compartment door hinge screw loose/handle missing/loose</td><td style="width:11%;"><input type="text" id="compartmentDoorhingeScrewLoose" name="compartmentDoorhingeScrewLoose"></td><td colspan="3" style="width:33%;">Screw missing</td><td style="width:11%;"><input type="text" id="compartmentDoorhingeScrewMissing" name="compartmentDoorhingeScrewMissing"></td></tr>
			<tr><td style="width:11%;">27.</td><td colspan="3" style="width:33%;">Compartment door brush missing</td><td colspan="5" style="width:55%;"><input type="text" id="compartmentDoorbrushMissing" name="compartmentDoorbrushMissing"></td></tr>
			<tr><td style="width:11%;">28.</td><td colspan="3" style="width:33%;">Compartment door stopper is not properly working</td><td colspan="5" style="width:55%;"><input type="text" id="compartmentDoorstopperWorking" name="compartmentDoorstopperWorking"></td></tr>
			<tr><td style="width:11%;">29.</td><td colspan="3" style="width:33%;">Compartment door grazing with its frame</td><td colspan="5" style="width:55%;"><input type="text" id="compartmentDoorgrazing" name="compartmentDoorgrazing"></td></tr>
			<tr><td style="width:11%;">30.</td><td colspan="3" style="width:33%;">Checker for proper fitment of end wall & saloon sliding doors & smooth movement without jerks & noise</td><td colspan="5" style="width:55%;"><input type="text" id="properFitmentEndwallSaloondoor" name="properFitmentEndwallSaloondoor"></td></tr>
			<tr><td style="width:11%;">31.</td><td colspan="3" style="width:33%;">Ensure max. opening force of end wall & saloon sliding door shell be 50-80 Newton & 50-60 Newton respectively</td><td colspan="5" style="width:55%;"><input type="text" id="maxOpeningForceEndwallSaloondoor" name="maxOpeningForceEndwallSaloondoor"></td></tr>
			<tr><td style="width:11%;">32.</td><td colspan="3" style="width:33%;">Movement of sliding doors should be lower at the end of closing stroke for last 200mm(0.05m/sec)</td><td colspan="5" style="width:55%;"><input type="text" id="movementSlidingdoor" name="movementSlidingdoor"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkMoulding" name="testingObservationRemarkMoulding" style="width:100%;height:99px;"></textarea>
		</form>
  </div>
  
  
  <div id="SeatBerth" class="tabcontent">
    <form name="seatBerth">
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>6-Seat & Berth</b></td></tr>
			<tr><td>1.</td><td>Protection wall hardware loose B.No.</td><td colspan="2"><input type="text" id="protectionWallHardwareLoose" name="protectionWallHardwareLoose"></td><td>Hardware missing B.No.</td><td colspan="2"><input type="text" id="protectionWallHardwareMissing" name="protectionWallHardwareMissing"></td></tr>
			<tr><td>2.</td><td>Luggage rack loose No.</td><td><input type="text" id="luggageRackLoose" name="luggageRackLoose"></td><td>Taper cabin No.</td><td><input type="text" id="luggageRackTaper" name="luggageRackTaper"></td> <td>Hardware missing C.No.</td><td><input type="text" id="luggageRackMissing" name="luggageRackMissing"></td></tr>
			<tr><td>3.</td><td>Mirror not pasted cabin No.</td><td colspan="2"><input type="text" id="mirrorNotPasted" name="mirrorNotPasted"></td><td>Rubber uprooted</td><td colspan="2"><input type="text" id="mirrorRubberUprooted" name="mirrorRubberUprooted"></td></tr>
			<tr><td>4.</td><td>Coat hook loose B.No.</td><td colspan="2"><input type="text" id="coatHookLoose" name="coatHookLoose"></td><td>Screw missing B.No.</td><td colspan="2"><input type="text" id="coatHookMissing" name="coatHookMissing"></td></tr>
			<tr><td>5.</td><td>Coat hook APD not done B.No.</td><td colspan="2"><input type="text" id="coatHookApdDone" name="coatHookApdDone"></td><td>Roughly B.No.</td><td colspan="2"><input type="text" id="coatHookApdRoughly" name="coatHookApdRoughly"></td></tr>
			<tr><td>6.</td><td>Chip up found on doorway and gang way ceiling</td><td colspan="5"><input type="text" id="curtainMovementSmooth" name="curtainMovementSmooth"></td></tr>
			<tr><td>7.</td><td>Curtain Runner came out B.No.</td><td colspan="2"><input type="text" id="curtainRunnerCameOut" name="curtainRunnerCameOut"></td><td>Stopper not fitted B.No.</td><td colspan="2"><input type="text" id="curtainRunnerStopperFitted" name="curtainRunnerStopperFitted"></td></tr>
			<tr><td>8.</td><td>Snack table loose No.</td><td><input type="text" id="snackTableLoose" name="snackTableLoose"></td><td>Taper C.No.</td><td><input type="text" id="snackTableTapper" name="snackTableTapper"></td> <td>Screw missing C.No.</td><td><input type="text" id="snackTableScrewMissing" name="snackTableScrewMissing"></td></tr>
			<tr><td>9.</td><td>Safety rail tapper B.No.</td><td colspan="2"><input type="text" id="safetyRailTaper" name="safetyRailTaper"></td><td>Loose B.No.</td><td colspan="2"><input type="text" id="safetyRailLoose" name="safetyRailLoose"></td></tr>
			<tr><td>10.</td><td>Safety rail bkt. Hardware loose No.</td><td><input type="text" id="safetyRailBktLoose" name="safetyRailBktLoose"></td><td>Not properly tighten B.No.</td><td><input type="text" id="safetyRailBktTighten" name="safetyRailBktTighten"></td><td>Taper B.No.</td><td><input type="text" id="safetyRailBktTaper" name="safetyRailBktTaper"></td></tr>
			<tr><td>11.</td><td>Berth chain loose B.No.</td><td colspan="5"><input type="text" id="berthChainLoose" name="berthChainLoose"></td></tr>
			<tr><td>12.</td><td>Berth chain hardware B.No.</td><td colspan="2"><input type="text" id="berthChainHardwareLoose" name="berthChainHardwareLoose"></td><td>Missing B.No.</td><td colspan="2"><input type="text" id="berthChainHardwareMissing" name="berthChainHardwareMissing"></td></tr>
			<tr><td>13.</td><td>Bottle holder loose B.No.</td><td colspan="2"><input type="text" id="bottleHolderLoose" name="bottleHolderLoose"></td><td>Taper B.No.</td><td colspan="2"><input type="text" id="bottleHolderTaper" name="bottleHolderTaper"></td></tr>
			<tr><td>14.</td><td>Bottle holder screw missing B.No.</td><td colspan="2"><input type="text" id="bottoleHolderScrewMissing" name="bottoleHolderScrewMissing"></td><td>Damage B.No.</td><td colspan="2"><input type="text" id="bottoleHolderScrewDamage" name="bottoleHolderScrewDamage"></td></tr>
			<tr><td>15.</td><td>Berth mounting hardware with side wall loose B.No.</td><td><input type="text" id="berthMountingHardwareSidewallLoose" name="berthMountingHardwareSidewallLoose"></td><td>Taper B.No.</td><td><input type="text" id="berthMountingHardwareSidewallTaper" name="berthMountingHardwareSidewallTaper"></td><td>Missing B.No.</td><td><input type="text" id="berthMountingHardwareSidewallMissing" name="berthMountingHardwareSidewallMissing"></td></tr>
			<tr><td>16.</td><td>Berth mounting hardware with pillar bkt. B.No.</td><td><input type="text" id="berthMountingHardwarePillarLoose" name="berthMountingHardwarePillarLoose"></td><td>Taper B.No.</td><td><input type="text" id="berthMountingHardwarePillarTaper" name="berthMountingHardwarePillarTaper"></td><td>Missing B.No.</td><td><input type="text" id="berthMountingHardwarePillarMissing" name="berthMountingHardwarePillarMissing"></td></tr>
			<tr><td>17.</td><td>Berth found taper B.No.</td><td colspan="5"><input type="text" id="berthTapper" name="berthTapper"></td></tr>
			<tr><td>18.</td><td>Berth flap hardware loose B.No.</td><td colspan="2"><input type="text" id="berthFlapLoose" name="berthFlapLoose"></td><td>Flap bulge B.No.</td><td colspan="2"><input type="text" id="berthFlapBulge" name="berthFlapBulge"></td></tr>
			<tr><td>19.</td><td>Flap Al.strip excess in length</td><td colspan="2"><input type="text" id="flapAlStripExcessLength" name="flapAlStripExcessLength"></td><td>Its hardware excess in length</td><td colspan="2"><input type="text" id="flapAlHardwareExcessLength" name="flapAlHardwareExcessLength"></td></tr>
			<tr><td>20.</td><td>Transverse Berth not in level B.No.</td><td colspan="5"><input type="text" id="transverseBerthLevel" name="transverseBerthLevel"></td></tr>
			<tr><td>21.</td><td>Gap found between back rest of berth no.</td><td colspan="5"><input type="text" id="gapBackrestBerth" name="gapBackrestBerth"></td></tr>		
			<tr><td>22.</td><td>Back rest movement not smooth seat No.</td><td colspan="5"><input type="text" id="backrestMovement" name="backrestMovement"></td></tr>
			<tr><td>23.</td><td>Back rest grazing with ladder Seat No.</td><td colspan="2"><input type="text" id="backrestGrazingLadder" name="backrestGrazingLadder"></td><td>with Panel seat no.</td><td colspan="2"><input type="text" id="backrestGrazingPanelseat" name="backrestGrazingPanelseat"></td></tr>
			<tr><td>24.</td><td>Latch catch miss match seat no.</td><td colspan="5"><input type="text" id="latchCatchMissmatch" name="latchCatchMissmatch"></td></tr>
			<tr><td>25.</td><td>Burr found on latch Seat No.</td><td colspan="2"><input type="text" id="burrLatchSeat" name="burrLatchSeat"></td><td>Burr found on catch seat no.</td><td colspan="2"><input type="text" id="burrCatchSeat" name="burrCatchSeat"></td></tr>
			<tr><td>26.</td><td>Hole not done on partition for latch seat no.</td><td colspan="5"><input type="text" id="holePartitionLatchSeat" name="holePartitionLatchSeat"></td></tr>
			<tr><td>27.</td><td>Rexine torn on back rest seat no.</td><td colspan="2"><input type="text" id="rexineTornBackrestSeat" name="rexineTornBackrestSeat"></td><td>Berth no.</td><td colspan="2"><input type="text" id="rexineTornBerth" name="rexineTornBerth"></td></tr>
			<tr><td>28.</td><td>Almirah mounting hardware loose</td><td colspan="2"><input type="text" id="almirahHardwareLoose" name="almirahHardwareLoose"></td><td>Missing</td><td colspan="2"><input type="text" id="almirahHardwareMissing" name="almirahHardwareMissing"></td></tr>
			<tr><td>29.</td><td>Towel hole not working properly</td><td colspan="5"><input type="text" id="towerWorking" name="towerWorking"></td></tr>
			<tr><td>30.</td><td>not working properly</td><td colspan="5"><input type="text" id="almirahWorking" name="almirahWorking"></td></tr>
			<tr><td>31.</td><td>Unwanted hole in almirah</td><td colspan="5"><input type="text" id="almirahHole" name="almirahHole"></td></tr>
			<tr><td>32.</td><td>Unwanted hole near near bottle holder B.No.</td><td colspan="5"><input type="text" id="holeNearBottleHolder" name="holeNearBottleHolder"></td></tr>
			<tr><td>33.</td><td>Unwanted hole near near latch seat B.No.</td><td colspan="2"><input type="text" id="holeNearLatchSeat" name="holeNearLatchSeat"></td><td>Near catch seat no.</td><td colspan="2"><input type="text" id="holeNearCatchSeat" name="holeNearCatchSeat"></td></tr>
			<tr><td>34.</td><td>Rexin torn on berth and arm rest</td><td colspan="5"><input type="text" id="rexineTornBerthArmrest" name="rexineTornBerthArmrest"></td></tr>
			<tr><td>35.</td><td>Builder plate screw missing</td><td colspan="2"><input type="text" id="builderPlateScrewMissing" name="builderPlateScrewMissing"></td><td>Not standard screw provided</td><td colspan="2"><input type="text" id="builderPlateScrewMissmatch" name="builderPlateScrewMissmatch"></td></tr>
			<tr><td>36.</td><td>Rexene not pasted back side of berth BN.</td><td colspan="5"><input type="text" id="rexenePastedBacksideBerth" name="rexenePastedBacksideBerth"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkSeatBerth" name="testingObservationRemarkSeatBerth" style="width:100%;height:100px;"></textarea>
		</form>
  </div>
  
  
  <div id="Lavatory" class="tabcontent">
	   <form name="lavatory">	
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>7-Lavatory</b></td></tr>
			<tr><td>1.</td><td>Loro pipe loose</td><td colspan="2"><input type="text" id="loroPipeLoose" name="loroPipeLoose"></td><td>Hardware missing</td><td colspan="2"><input type="text" id="loroPipeMissing" name="loroPipeMissing"></td></tr>
			<tr><td>2.</td><td>Attachment wall hinge hardware loose</td><td><input type="text" id="attachmentWailHingeLoose" name="attachmentWailHingeLoose"></td><td>Missing</td><td><input type="text" id="attachmentWailHingeMissing" name="attachmentWailHingeMissing"></td><td>Dent mark</td><td><input type="text" id="attachmentWailHingeDent" name="attachmentWailHingeDent"></td></tr>
			<tr><td>3.</td><td>Attachment wall tower bolt screw missing</td><td colspan="2"><input type="text" id="attachmentWallTowerScrewMissing" name="attachmentWallTowerScrewMissing"></td><td>Bolt damage</td><td colspan="2"><input type="text" id="attachmentWallTowerBoltDamage" name="attachmentWallTowerBoltDamage"></td></tr>
			<tr><td>4.</td><td>Tower bolt not fitted</td><td colspan="2"><input type="text" id="towerBoltFitted" name="towerBoltFitted"></td><td>Hole not done for tower bolt</td><td colspan="2"><input type="text" id="towerBoltHole" name="towerBoltHole"></td></tr>
			<tr><td>5.</td><td>Soap case screw missing</td><td><input type="text" id="soapCaseScrewMissing" name="soapCaseScrewMissing"></td><td>Screw loose</td><td><input type="text" id="soapCaseScrewLoose" name="soapCaseScrewLoose"></td><td>Taper</td><td><input type="text" id="soapCaseScrewTaper" name="soapCaseScrewTaper"></td></tr>
			<tr><td>6.</td><td>Lav. wash basin not sealed</td><td><input type="text" id="lavWashBasinSealed" name="lavWashBasinSealed"></td><td>Outside</td><td><input type="text" id="lavWashBasinOutside" name="lavWashBasinOutside"></td><td>Inside</td><td><input type="text" id="avWashBasinInside" name="avWashBasinInside"></td></tr>
			<tr><td>7.</td><td>Lav. wash basin roughly sealed</td><td><input type="text" id="lavWashBasinRoughlySealed" name="lavWashBasinRoughlySealed"></td><td>Outside</td><td><input type="text" id="lavWashBasinRoughlyOutside" name="lavWashBasinRoughlyOutside"></td><td>Inside</td><td><input type="text" id="lavWashBasinRoughlyInside" name="lavWashBasinRoughlyInside"></td></tr>
			<tr><td>8.</td><td>Dustbin box not provided</td><td colspan="2"><input type="text" id="dustbinBoxProvided" name="dustbinBoxProvided"></td><td>Unlocked</td><td colspan="2"><input type="text" id="dustbinBoxUnlocked" name="dustbinBoxUnlocked"></td></tr>
			<tr><td>9.</td><td>Dustbin bkt hardware loose</td><td colspan="2"><input type="text" id="dustbinBktLoose" name="dustbinBktLoose"></td><td>Screw missing</td><td colspan="2"><input type="text" id="dustbikBktScrewMissing" name="dustbikBktScrewMissing"></td></tr>
			<tr><td>10.</td><td>Steel dustbin mounting bracket hardware loose</td><td colspan="5"><input type="text" id="steelDustbinBktLoose" name="steelDustbinBktLoose"></td></tr>		
			<tr><td>11.</td><td>Waste bin mounting hardware loose</td><td><input type="text" id="wasteBinLoose" name="wasteBinLoose"></td><td>Screw missing</td><td><input type="text" id="wasteBinScrewMissing" name="wasteBinScrewMissing"></td><td>Dent mark</td><td><input type="text" id="wasteBinScrewDent" name="wasteBinScrewDent"></td></tr>
			<tr><td>12.</td><td>Waste bin cover plate rusted</td><td colspan="2"><input type="text" id="wasteBinCoverPlateRusted" name="wasteBinCoverPlateRusted"></td><td>Magnet not pasted</td><td colspan="2"><input type="text" id="wasteBinCoverMagnet" name="wasteBinCoverMagnet"></td></tr>
			<tr><td>13.</td><td>Less no of screw fitted on waste bin cover plate</td><td colspan="2"><input type="text" id="lessScrewWasteBinCover" name="lessScrewWasteBinCover"></td><td>Cover plate grazing with module</td><td colspan="2"><input type="text" id="lessScrewWasteBinCoverGrazing" name="lessScrewWasteBinCoverGrazing"></td></tr>
			<tr><td>14.</td><td>Outside waste bin mounting hardware loose</td><td colspan="2"><input type="text" id="outsideWasteBinLoose" name="outsideWasteBinLoose"></td><td>Not tighten properly</td><td colspan="2"><input type="text" id="outsideWasteBinNotTighten" name="outsideWasteBinNotTighten"></td></tr>		
			<tr><td>15.</td><td>Sleeve screw missing </td><td><input type="text" id="sleeveScrewMissing" name="sleeveScrewMissing"></td><td>Not in level with floor</td><td><input type="text" id="sleeveScrewLevel" name="sleeveScrewLevel"></td><td>Not properly sited</td><td><input type="text" id="sleeveScrewSited" name="sleeveScrewSited"></td></tr>
			<tr><td>16.</td><td>Drain pipe leakage</td><td colspan="2"><input type="text" id="drainPipeLeakage" name="drainPipeLeakage"></td><td>Not sealed</td><td colspan="2"><input type="text" id="drainPipeSealed" name="drainPipeSealed"></td></tr>
			<tr><td>17.</td><td>Outside drain pipe sleeve not sited</td><td colspan="5"><input type="text" id="outsideDrainPipeSleeveSited" name="outsideDrainPipeSleeveSited"></td></tr>		
			<tr><td>18.</td><td>Loro pipe hardware loose</td><td colspan="5"><input type="text" id="loroPipehardwareLoose" name="loroPipehardwareLoose"></td></tr>
			<tr><td>19.</td><td>Lavatory door pivot loose</td><td><input type="text" id="lavatoryDoorPivotLoose" name="lavatoryDoorPivotLoose"></td><td>Screw missing</td><td><input type="text" id="lavatoryDoorScrewMissing" name="lavatoryDoorScrewMissing"></td><td>Screw not sited</td><td><input type="text" id="lavatoryDoorScrewSited" name="lavatoryDoorScrewSited"></td></tr>		
			<tr><td>20.</td><td>Lavatory door taper fitted</td><td colspan="2"><input type="text" id="lavatoryDoorTaperFitted" name="lavatoryDoorTaperFitted"></td><td>Unnecessary sound during movement of door</td><td colspan="2"><input type="text" id="lavatoryDoorTaperSound" name="lavatoryDoorTaperSound"></td></tr>
			<tr><td>21.</td><td>Lavatory door frame corner not properly sited</td><td colspan="2"><input type="text" id="lavatoryDoorFrameCornerSited" name="lavatoryDoorFrameCornerSited"></td><td>Excess gap between door and its frame</td><td colspan="2"><input type="text" id="lavatoryDoorFrameCornerGap" name="lavatoryDoorFrameCornerGap"></td></tr>
			<tr><td>22.</td><td>Lavatory door handle loose</td><td colspan="2"><input type="text" id="lavatoryDoorHandleLoose" name="lavatoryDoorHandleLoose"></td><td>Missing/not fitted</td><td colspan="2"><input type="text" id="lavatoryDoorHandleMissing" name="lavatoryDoorHandleMissing"></td></tr>
			<tr><td>23.</td><td>Coat hook loose in lavatory no.</td><td colspan="2"><input type="text" id="coathookLavatoryLoose" name="coathookLavatoryLoose"></td><td>Missing/not fitted</td><td colspan="2"><input type="text" id="coathookLavatoryMissing" name="coathookLavatoryMissing"></td></tr>
			<tr><td>24.</td><td>Engage-Vacant lock is not working smoothly</td><td colspan="2"><input type="text" id="engageVacantLockWorking" name="engageVacantLockWorking"></td><td>Male-female part mismatch</td><td colspan="2"><input type="text" id="engageVacantLockMaleFemaleMismatch" name="engageVacantLockMaleFemaleMismatch"></td></tr>
			<tr><td>25.</td><td>Engage-Vacant lock female part loose</td><td colspan="2"><input type="text" id="engageVacantLockFemaleLoose" name="engageVacantLockFemaleLoose"></td><td>Screw missing</td><td colspan="2"><input type="text" id="engageVacantLockFemaleMissing" name="engageVacantLockFemaleMissing"></td></tr>
			<tr><td>26.</td><td>Engage-Vacant lock Male part loose</td><td colspan="2"><input type="text" id="engageVacantLockMaleLoose" name="engageVacantLockMaleLoose"></td><td>Screw missing</td><td colspan="2"><input type="text" id="engageVacantLockMaleMissing" name="engageVacantLockMaleMissing"></td></tr>
			<tr><td>27.</td><td>Swing lock catch loose</td><td colspan="2"><input type="text" id="swingLockCatchLoose" name="swingLockCatchLoose"></td><td>Latch loose</td><td colspan="2"><input type="text" id="swingLockCatchLatch" name="swingLockCatchLatch"></td></tr>
			<tr><td>28.</td><td>Swing lock catch hardware excess in length</td><td colspan="2"><input type="text" id="swingLockCatchHardwareExcessLength" name="swingLockCatchHardwareExcessLength"></td><td>Burr found on swing lock hardware</td><td colspan="2"><input type="text" id="swingLockCatchHardwareBurr" name="swingLockCatchHardwareBurr"></td></tr>
			<tr><td>29.</td><td>Lavatory door closer screw not tighten properly</td><td><input type="text" id="lavatoryDoorCloserScrewTighten" name="lavatoryDoorCloserScrewTighten"></td><td>Rusted</td><td><input type="text" id="lavatoryDoorCloserScrewRusted" name="lavatoryDoorCloserScrewRusted"></td><td>Movement not smooth</td><td><input type="text" id="lavatoryDoorCloserScrewMovement" name="lavatoryDoorCloserScrewMovement"></td></tr>
			<tr><td>30.</td><td>Soap dispenser loose</td><td><input type="text" id="soapDispenserLoose" name="soapDispenserLoose"></td><td>Taper</td><td><input type="text" id="soapDispenserTaper" name="soapDispenserTaper"></td><td>Screw missing</td><td><input type="text" id="soapDispenserMissing" name="soapDispenserMissing"></td></tr>
			<tr><td>31.</td><td>not provided in soap dispenser</td><td colspan="5"><input type="text" id="bracketSoapDispenser" name="bracketSoapDispenser"></td></tr>
			<tr><td>32.</td><td>Lotah tap strainer level up with respect to floor level</td><td colspan="5"><input type="text" id="lotahTapStrainerLevel" name="lotahTapStrainerLevel"></td></tr>
			<tr><td>33.</td><td>Lotah tap strainer not sealed</td><td><input type="text" id="lotahTapStrainerSealed" name="lotahTapStrainerSealed"></td><td>Roughly sealed</td><td><input type="text" id="lotahTapStrainerRoughlySealed" name="lotahTapStrainerRoughlySealed"></td><td>Screw missing</td><td><input type="text" id="lotahTapStrainerScrewMissing" name="lotahTapStrainerScrewMissing"></td></tr>
			<tr><td>34.</td><td>Additional wall handle cap not pasted</td><td colspan="2"><input type="text" id="wallHandleCapPasted" name="wallHandleCapPasted"></td><td>Handle screw loose</td><td colspan="2"><input type="text" id="wallHandleScrewLoose" name="wallHandleScrewLoose"></td></tr>
			<tr><td>35.</td><td>Pan level up with respect to floor level</td><td colspan="2"><input type="text" id="panLevelFloorLevel" name="panLevelFloorLevel"></td><td>Roughly sealed</td><td colspan="2"><input type="text" id="panLevelFloorLevelRoughlySealed" name="panLevelFloorLevelRoughlySealed"></td></tr>
			<tr><td>36.</td><td>I/S wash basin mounting hardware missing</td><td><input type="text" id="washBasinHardwareMissing" name="washBasinHardwareMissing"></td><td>Not tighten properly</td><td><input type="text" id="washBasinHardwareTighten" name="washBasinHardwareTighten"></td><td>Loose</td><td><input type="text" id="washBasinHardwareLoose" name="washBasinHardwareLoose"></td></tr>
			<tr><td>37.</td><td>Dent mark found on module</td><td colspan="2"><input type="text" id="dentOnModule" name="dentOnModule"></td><td>Dent on HPL sheet</td><td colspan="2"><input type="text" id="dentOnHplSheet" name="dentOnHplSheet"></td></tr>
			<tr><td>38.</td><td>Module joint not sealed</td><td colspan="2"><input type="text" id="moduleJointNotSealed" name="moduleJointNotSealed"></td><td>Roughly sealed</td><td colspan="2"><input type="text" id="moduleJointRoughlySealed" name="moduleJointRoughlySealed"></td></tr>
			<tr><td>39.</td><td>Commode hardware loose</td><td colspan="2"><input type="text" id="commodeHardwareLoose" name="commodeHardwareLoose"></td><td>Missing</td><td colspan="2"><input type="text" id="commodeHardwareMissing" name="commodeHardwareMissing"></td></tr>
			<tr><td>40.</td><td>Plastic film not removed from ceiling/door</td><td colspan="5"><input type="text" id="plasticFilmRemovedCeilingDoor" name="plasticFilmRemovedCeilingDoor"></td></tr>
			<tr><td>41.</td><td>Ceiling not in level</td><td><input type="text" id="ceilingNotLevel" name="ceilingNotLevel"></td><td>Hardware loose</td><td><input type="text" id="ceilingHardwareLoose" name="ceilingHardwareLoose"></td><td>Dent mark</td><td><input type="text" id="ceilingHardwareDent" name="ceilingHardwareDent"></td></tr>
			<tr><td>42.</td><td>Module hardware with side wall loose</td><td colspan="5"><input type="text" id="moduleHardwareSidewallLoose" name="moduleHardwareSidewallLoose"></td></tr>
			<tr><td>43.</td><td>Mirror holder loose</td><td><input type="text" id="mirrorHolderLoose" name="mirrorHolderLoose"></td><td>Mirror holder taper</td><td><input type="text" id="mirrorHolderTaper" name="mirrorHolderTaper"></td><td>APD not done</td><td><input type="text" id="mirrorHolderApdDone" name="mirrorHolderApdDone"></td></tr>
			<tr><td>44.</td><td>Hopper window frame not properly sited</td><td><input type="text" id="hopperWindowFrameSited" name="hopperWindowFrameSited"></td><td>Short in length</td><td><input type="text" id="hopperWindowFrameShort" name="hopperWindowFrameShort"></td><td>Excess length</td><td><input type="text" id="hopperWindowFrameExcess" name="hopperWindowFrameExcess"></td></tr>
			<tr><td>45.</td><td>Hopper window rubber uprooted</td><td colspan="2"><input type="text" id="hopperWindowRubberUprooted" name="hopperWindowRubberUprooted"></td><td>Hopper window glass crack</td><td colspan="2"><input type="text" id="hopperWindowGlassCrack" name="hopperWindowGlassCrack"></td></tr>
			<tr><td>46.</td><td>Condition of lavatory floor level</td><td colspan="5"><input type="text" id="conditionLavatoryFloorLevel" name="conditionLavatoryFloorLevel"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkLavatory" name="testingObservationRemarkLavatory" style="width:100%;height:100px;"></textarea>
		</form>
  </div>
  
  
  <div id="Plumbing" class="tabcontent">
	   <form name="plumbing">	
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>8-Plumbing</b></td></tr>
			<tr><td>1.</td><td>Reading of water level gauge</td><td colspan="5"><input type="text" id="readingWaterLevelGauge" name="readingWaterLevelGauge"></td></tr>
			<tr><td>2.</td><td>I/S & O/S wash basin tap loose</td><td colspan="5"><input type="text" id="isOsWashbasinTapLoose" name="isOsWashbasinTapLoose"></td></tr>
			<tr><td>3.</td><td>Shower handle loose</td><td colspan="5"><input type="text" id="showerHandleLoose" name="showerHandleLoose"></td></tr>
			<tr><td>4.</td><td>Shower handle broken</td><td colspan="5"><input type="text" id="showerHandleBroken" name="showerHandleBroken"></td></tr>
			<tr><td>5.</td><td>Shower handle stand screw loose</td><td colspan="5"><input type="text" id="showerHandleStandScrewLoose" name="showerHandleStandScrewLoose"></td></tr>
			<tr><td>6.</td><td>Upper tank U camp rubber missing & loose</td><td colspan="5"><input type="text" id="upperTankUclampRubberMissingLoose" name="upperTankUclampRubberMissingLoose"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkPlumbing" name="testingObservationRemarkPlumbing" style="width:100%;height:100px;"></textarea>
		</form>
  </div>
  
  
  <div id="AirBrake" class="tabcontent">
	   <form name="airBrake">	
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>9-Air Brake</b></td></tr>
			<tr><td>1.</td><td>Releasing device chuck nut loose</td><td colspan="5"><input type="text" id="releasingDeviceChuckLoose" name="releasingDeviceChuckLoose"></td></tr>
			<tr><td>2.</td><td>Releasing device rod taper fitted</td><td colspan="5"><input type="text" id="releasingDeviceRodFitted" name="releasingDeviceRodFitted"></td></tr>
			<tr><td>3.</td><td>Brake indicator out of sole bar and taper fitted</td><td colspan="5"><input type="text" id="brakeIndicatorFitted" name="brakeIndicatorFitted"></td></tr>
			<tr><td>4.</td><td>Air hose pipe angle cock hardware loose and PVC packing provided</td><td colspan="5"><input type="text" id="airHosepipeAngleCookLoose" name="airHosepipeAngleCookLoose"></td></tr>
			<tr><td>5.</td><td>Emergency pull box cover bulged and handle taper fitted</td><td colspan="5"><input type="text" id="emergencyPullboxCoverFitted" name="emergencyPullboxCoverFitted"></td></tr>
			<tr><td>6.</td><td>Lavatory air pipe clamp not properly fitted</td><td colspan="2"><input type="text" id="lavatoryAirPipeClampFitted" name="lavatoryAirPipeClampFitted"></td><td>Alarm pipe clamp not fitted</td><td colspan="2"><input type="text" id="alarmPipeClampFitted" name="alarmPipeClampFitted"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkAirBrake" name="testingObservationRemarkAirBrake" style="width:100%;height:100px;"></textarea>
		</form>
  </div>
  
  
  <div id="CoachLowering" class="tabcontent">
	   <form name="coachLowering">	
	   <h3 style="text-align:center;">10-Coach Lowering</h3>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkCoachLowering" name="testingObservationRemarkCoachLowering" style="width:100%;height:100px;"></textarea>
		</form>
  </div>
  
  
  <div id="Paint" class="tabcontent">
	   <form name="paint">	
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>11-Paint</b></td></tr>
			<tr><td>1.</td><td>Fitment of Destination Board/No. Plate</td><td colspan="5"><input type="text" id="fitmentDestinationboardNoPlate" name="fitmentDestinationboardNoPlate"></td></tr>
			<tr><td>2.</td><td>Check proper stenciling & lettering</td><td colspan="5"><input type="text" id="properStencillingLettering" name="properStencillingLettering"></td></tr>
			<tr><td>3.</td><td>Burr found o braille sticker rivet</td><td colspan="5"><input type="text" id="burrBraileSticker" name="burrBraileSticker"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkPaint" name="testingObservationRemarkPaint" style="width:100%;height:100px;"></textarea>
		</form>
  </div>
  
  
  <div id="CoachCleaning" class="tabcontent">
	   <form name="coachCleaning">	
		<table border="1">
			<tr><td colspan="7" style="text-align:center;font-size:16px;"><b>12-Coach Cleaning</b></td></tr>
			<tr><td>1.</td><td>Floor found dirty</td><td colspan="2"><input type="text" id="floorDirty" name="floorDirty"></td><td>Lavatory found dirty</td><td colspan="2"><input type="text" id="lavatoryDirty" name="lavatoryDirty"></td></tr>
			<tr><td>2.</td><td>Ceilings found dirty</td><td colspan="2"><input type="text" id="ceilingDirty" name="ceilingDirty"></td><td>Seat & Berths found dirty</td><td colspan="2"><input type="text" id="seatBerthDirty" name="seatBerthDirty"></td></tr>
			<tr><td>3.</td><td>Panels found dirty</td><td colspan="2"><input type="text" id="panelDirty" name="panelDirty"></td><td>Store room, pantry, linen room found dirty</td><td colspan="2"><input type="text" id="storeroomPantryLinenDirty" name="storeroomPantryLinenDirty"></td></tr>
			<tr><td>4.</td><td>Rails of sliding found dirty</td><td colspan="2"><input type="text" id="railsSlidingDoorDirty" name="railsSlidingDoorDirty"></td><td>Window glass found dirty</td><td colspan="2"><input type="text" id="windowGlassDirty" name="windowGlassDirty"></td></tr>
			<tr><td>5.</td><td>Plastic film of fittings not removed</td><td colspan="2"><input type="text" id="plasticFilmRemoved" name="plasticFilmRemoved"></td><td>Doors found dirty</td><td colspan="2"><input type="text" id="doorDirty" name="doorDirty"></td></tr>
		</table>
		<h3>Testing Observations</h3>
			<textarea id="testingObservationRemarkCoachCleaning" name="testingObservationRemarkCoachCleaning" style="width:100%;height:100px;"></textarea>
		</form>
  </div>
   <div id="FurnishingClearance" class="tabcontent">
	   <form name="furnishingClearance">	
		<p style="text-align:center;font-weight:bold;">Furnishing Clearance</p>
		</form>
  </div>
  
  
</div>
 


</body>
<script>
var shellArray=[];
var btn;
var furnishingId;
var obj={};
$(document).ready(function(){
	
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

//});  
 

     

var shellArray=[];
		//$(document).ready(function() {
			
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
	
						
	$('#FurnishingProductionTableContainer').jtable({
			
			title : 'Issue QCI for Coach',
			
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
        {
       	 icon: '<%=contextpath%>/images/rs_out.png',
            text: 'Perform QCI',
            click: function () {
            	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
        	 	 if ($selectedRows.length<1)
        		 alert("Please select a row for which you want to sent for Perform QCI");
        	 	 else{
        	 		var record;
        	 		$selectedRows.each(function () {
                        record = $(this).data('record');
                        furnishingId=record.furnishingAssetId;
                        });
							
						
					
        	 	 	$("#selectStages").dialog({
        	 	 		title : 'QCI for  '+search(record.shellTransactionId) + 'from Stage- <%=stageID%>',
        	 	 		width:'91%',
        	 	 		height: ($(window).height() - 60),
        	 	 		close: function (e, u) {
        	 	 			if(btn==1){
       	 	 					 $('form[name="fpvc"]')[0].reset() ;
 	 		          			 $("#selectStages").validationEngine('hideAll'); 
        	 	 			}
        	 	 			else if(btn==2){
              	 	 			 $('form[name="paritionFrame"]')[0].reset() ;
              	 	 			$("#selectStages").validationEngine('hideAll'); 
               	 	 		}
        	 	 			else if(btn==3){
             	 	 			 $('form[name="panel"]')[0].reset() ;
             	 	 			$("#selectStages").validationEngine('hideAll'); 
              	 	 		}
        	 	 			else if(btn==4){
            	 	 			 $('form[name="windowCelling"]')[0].reset() ;
            	 	 			$("#selectStages").validationEngine('hideAll'); 
             	 	 		}
        	 	 			else if(btn==5){
           	 	 			 	 $('form[name="moulding"]')[0].reset() ;
           	 	 			$("#selectStages").validationEngine('hideAll'); 
            	 	 		}
        	 	 			else if(btn==6){
          	 	 			 	 $('form[name="seatBerth"]')[0].reset() ;
          	 	 			 $("#selectStages").validationEngine('hideAll'); 
           	 	 			}
        	 	 			else if(btn==7){
         	 	 			 	 $('form[name="lavatory"]')[0].reset() ;
         	 	 			 	$("#selectStages").validationEngine('hideAll'); 
          	 	 			}
        	 	 			else if(btn==8){
        	 	 			 	 $('form[name="plumbing"]')[0].reset() ;
        	 	 			 	$("#selectStages").validationEngine('hideAll'); 
         	 	 			}
        	 	 			else if(btn==9){
       	 	 			 	 	 $('form[name="airBrake"]')[0].reset() ;
       	 	 				 	$("#selectStages").validationEngine('hideAll'); 
        	 	 			}
        	 	 			else if(btn==10){
       	 	 			 		 $('form[name="coachLowering"]')[0].reset() ;
       	 	 				 	$("#selectStages").validationEngine('hideAll'); 
        	 	 			}
        	 	 			else if(btn==11){
       	 	 			 		 $('form[name="paint"]')[0].reset() ;
       	 		 			 	$("#selectStages").validationEngine('hideAll'); 
        	 	 			}
        	 	 			else if(btn==12){
       	 	 			 		 $('form[name="coachCleaning"]')[0].reset() ;
       	 		 			 	$("#selectStages").validationEngine('hideAll'); 
        	 	 			}
        	 	 			else if(btn==13){
      	 	 			 		 $('form[name="furnishingClearance"]')[0].reset() ;
	       	 	 			 	$("#selectStages").validationEngine('hideAll'); 
       	 	 			 	}
        	 	 			else{
        	 	 				alert("Doesn't exist!!!");
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
                             
                            		    	   
                            	$.ajax({
            						url : "savefPvc",  //action-name as defined in struts.xml
            						dataType: 'json', 
            						data : {
            							furnishingAssetId: record.furnishingAssetId,
            							
            							coachNo: $('#coachNo').val(),
            							bookedDiv: $('#bookedDiv').val(),
            							bookedRly: $('#bookedRly').val(),
            							docNo:$('#docNo').val(),
            							docRevNo:$('#docRevNo').val(),
            							docDate:$('#docDate').val(),
            							dateOfTesting:$('#dateOfTesting').val(),
            							shiftOfTesting:$('#shiftOfTesting').val(),
        								footPlateJam:$('#footPlateJam').val(),
        								movementHard:$('#movementHard').val(),
        								footPlateSpringHardware:$('#footPlateSpringHardware').val(),
        								footPlateSideRubberLoose:$('#footPlateSideRubberLoose').val(),
        								footPlateSideRubberMissing:$('#footPlateSideRubberMissing').val(),
        								tailLampFitted:$('#tailLampFitted').val(),
        								tailLampHardwareMissing:$('#tailLampHardwareMissing').val(),
        								tailLampWelding:$('#tailLampWelding').val(),
        								footStepLoose:$('#footStepLoose').val(),
        								footStepHardware:$('#footStepHardware').val(),
        								fitmentEntranceHandRail:$('#fitmentEntranceHandRail').val(),
        								footStepRusted:$('#footStepRusted').val(),
        								footStepTaperFitted:$('#footStepTaperFitted').val(),
        								stepRailScrewSited:$('#stepRailScrewSited').val(),
        								stepRailScrewMissing:$('#stepRailScrewMissing').val(),
        								chequerSheetNotSealed:$('#chequerSheetNotSealed').val(),
        								chequerSheetRouglySealed:$('#chequerSheetRouglySealed').val(),
        								roughlyCuttingChequerSheet:$('#roughlyCuttingChequerSheet').val(),
        								chequerSheetNotSitedCorner:$('#chequerSheetNotSitedCorner').val(),
        								chequerSheetScrewSited:$('#chequerSheetScrewSited').val(),
        								chequerSheetScrewMissing:$('#chequerSheetScrewMissing').val(),
        								chequerSheetScrewLoose:$('#chequerSheetScrewLoose').val(),
        								doorStopperNotFitted:$('#doorStopperNotFitted').val(),
        								endwallSafetyHandleFitted:$('#endwallSafetyHandleFitted').val(),
        								endwallSafetyHandleLoose:$('#endwallSafetyHandleLoose').val(),
        								endwallSafetyHandleMissing:$('#endwallSafetyHandleMissing').val(),
        								pvcCuttingPastingEndwalldoor:$('#pvcCuttingPastingEndwalldoor').val(),
        								pvcCuttingPastingLavatorydoor:$('#pvcCuttingPastingLavatorydoor').val(),
        								pvcJointWeldingCabinSide:$('#pvcJointWeldingCabinSide').val(),
        								pvcJointWeldingNonCabinSide:$('#pvcJointWeldingNonCabinSide').val(),
        								airBubblePvc:$('#airBubblePvc').val(),
        								floorLevelCorridorArea:$('#floorLevelCorridorArea').val(),
        								uicVestibuleSited:$('#uicVestibuleSited').val(),
        								uicVestibuleTaper:$('#uicVestibuleTaper').val(),
        								uicVestibuleCracked:$('#uicVestibuleCracked').val(),
        								foamFamSealingNotDone:$('#foamFamSealingNotDone').val(),
        								foamFamSealingRoughlyDone:$('#foamFamSealingRoughlyDone').val(),
        								fitmentDoorHandle:$('#fitmentDoorHandle').val(),
        								testingObservationRemark:$('#testingObservationRemarkFpvc').val(),
            							
            							
            						
            						},
            						
            						type : 'POST',
            						async : false,
                    	 		})
            						.done(function( msg ) {

	            							$('#docNo').val(''),
    	        							$('#docRevNo').val(''),
    	        							$('#docDate').val(''),
                							$('#dateOfTesting').val(''),
            								$('#shiftOfTesting').val(''),
            								$('#footPlateJam').val(''),
		        		                    $('#movementHard').val(''),                   							
		        		                    $('#footPlateSpringHardware').val(''),               							
		        		                    $('#footPlateSideRubberLoose').val(''),   
		        		                    $('#footPlateSideRubberMissing').val(''),   
		        		                    $('#tailLampFitted').val(''),   
		        		                    $('#tailLampHardwareMissing').val(''),   
		        		                    $('#tailLampWelding').val(''),
		        		                    $('#footStepLoose').val(''),
		        		                    $('#footStepHardware').val(''),                   							
		        		                    $('#fitmentEntranceHandRail').val(''),               							
		        		                    $('#footStepRusted').val(''),   
		        		                    $('#footStepTaperFitted').val(''),   
		        		                    $('#stepRailScrewSited').val(''),   
		        		                    $('#stepRailScrewMissing').val(''),   
		        		                    $('#chequerSheetNotSealed').val(''),
		        		                    $('#chequerSheetRouglySealed').val(''),
		        		                    $('#roughlyCuttingChequerSheet').val(''),                   							
		        		                    $('#chequerSheetNotSitedCorner').val(''),               							
		        		                    $('#chequerSheetScrewSited').val(''),   
		        		                    $('#chequerSheetScrewMissing').val(''),   
		        		                    $('#chequerSheetScrewLoose').val(''),   
		        		                    $('#doorStopperNotFitted').val(''),   
		        		                    $('#endwallSafetyHandleFitted').val(''),
		        		                    $('#endwallSafetyHandleLoose').val(''),
		        		                    $('#endwallSafetyHandleMissing').val(''),                   							
		        		                    $('#pvcCuttingPastingEndwalldoor').val(''),               							
		        		                    $('#pvcCuttingPastingLavatorydoor').val(''),   
		        		                    $('#pvcJointWeldingCabinSide').val(''),   
		        		                    $('#pvcJointWeldingNonCabinSide').val(''),   
		        		                    $('#airBubblePvc').val(''),   
		        		                    $('#floorLevelCorridorArea').val(''),
		        		                    $('#uicVestibuleSited').val(''),
		        		                    $('#uicVestibuleTaper').val(''),                   							
		        		                    $('#uicVestibuleCracked').val(''),               							
		        		                    $('#foamFamSealingNotDone').val(''),   
		        		                    $('#foamFamSealingRoughlyDone').val(''),   
		        		                    $('#fitmentDoorHandle').val(''),   
		        		                    $('#testingObservationRemarkFpvc').val(''),
            							
            						
            							//$('#selectStages').dialog('close'),
            							
            							$('#FurnishingProductionTableContainer').jtable('load');
 								  })
 								.error(function (msg){
 									
 									alert("Error Fetching Data");
 								});
                            	
                            	}
                            	else if(btn==2){
                            		var c=confirm("Do you want to submit data!!");
                                	if(c==false){return false;}
                                 
                                		    	   
                                	$.ajax({
                						url : "savePartitionFrame",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						data : {
                							furnishingAssetId: record.furnishingAssetId,
                							dentMarkPartitionBn:$('#dentMarkPartitionBn').val(),
                							dentMarkPartitionExceesCut:$('#dentMarkPartitionExceesCut').val(),
                							excessGapUmouldingPartitionpillar:$('#excessGapUmouldingPartitionpillar').val(),
                							middleBearthStopperMissing:$('#middleBearthStopperMissing').val(),
                							middleBearthStopperLoose:$('#middleBearthStopperLoose').val(),
                							middleBearthStopperRubberPad:$('#middleBearthStopperRubberPad').val(),
                							partitionPillarHardwareLoose:$('#partitionPillarHardwareLoose').val(),
                							partitionPillarHardwareMissing:$('#partitionPillarHardwareMissing').val(),
                							partitionPillarHardwareTaper:$('#partitionPillarHardwareTaper').val(),
                							unwantedHolesPartitionBn:$('#unwantedHolesPartitionBn').val(),
                							plasticFilmRemovedPartition:$('#plasticFilmRemovedPartition').val(),
                							roughlyPuttyPartition:$('#roughlyPuttyPartition').val(),
                							partitionPillarZigzag:$('#partitionPillarZigzag').val(),
                							partitionPillarProperlySited:$('#partitionPillarProperlySited').val(),
                							burrFoundPartitionPillar:$('#burrFoundPartitionPillar').val(),
                							burrFoundBerthHoldingBkt:$('#burrFoundBerthHoldingBkt').val(),
                							testingObservationRemark:$('#testingObservationRemarkParitionFrame').val(),
                							
                						},
                						
                						type : 'POST',
                						async : false,
                        	 		})
                						.done(function( msg ) {
                							
                							 $('#dentMarkPartitionBn').val(''),
                							 $('#dentMarkPartitionExceesCut').val(''),
                							 $('#excessGapUmouldingPartitionpillar').val(''),
                							 $('#middleBearthStopperMissing').val(''),
                							 $('#middleBearthStopperLoose').val(''),
                							 $('#middleBearthStopperRubberPad').val(''),
                							 $('#partitionPillarHardwareLoose').val(''),
                							 $('#partitionPillarHardwareLoose').val(''),
                							 $('#partitionPillarHardwareMissing').val(''),
                							 $('#partitionPillarHardwareTaper').val(''),
                							 $('#unwantedHolesPartitionBn').val(''),
                							 $('#plasticFilmRemovedPartition').val(''),
                							 $('#roughlyPuttyPartition').val(''),
                							 $('#partitionPillarZigzag').val(''),
                							 $('#partitionPillarProperlySited').val(''),
                							 $('#burrFoundPartitionPillar').val(''),
                							 $('#burrFoundBerthHoldingBkt').val(''),
                							 $('#testingObservationRemarkParitionFrame').val(''),
                							 
                							//$('#selectStages').dialog('close'),
                							
                							$('#FurnishingProductionTableContainer').jtable('load');
     								  })
     								.error(function (msg){
     									
     									alert("Error Fetching Data");
     								});
                                	
                            	}
                            	  else if(btn==3){
                            		var c=confirm("Do you want to submit data!!");
                                	if(c==false){return false;}
                                 
                                		    	   
                                	$.ajax({
                						url : "savePanel",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						data : {
                							furnishingAssetId: record.furnishingAssetId,
                							acAirGrillScrewTighten:$('#acAirGrillScrewTighten').val(),
                							acAirGrillScrewMissing:$('#acAirGrillScrewMissing').val(),
                							gapPartitionPanel:$('#gapPartitionPanel').val(),
                							cutMarkPanelCorner:$('#cutMarkPanelCorner').val(),
                							panelCrackNear:$('#panelCrackNear').val(),
                							panelDentNear:$('#panelDentNear').val(),
                							magazineBagScrewLoose:$('#magazineBagScrewLoose').val(),
                							magazineBagScrewNotFitted:$('#magazineBagScrewNotFitted').val(),
                							magazineTaperFitted:$('#magazineTaperFitted').val(),
                							magazineTaperBulged:$('#magazineTaperBulged').val(),
                							magazineTaperDamage:$('#magazineTaperDamage').val(),
                							holePanelPartition:$('#holePanelPartition').val(),
                							panelNotLocked:$('#panelNotLocked').val(),
                							excessGapPanelPartition:$('#excessGapPanelPartition').val(),
                							windowRubberExcessLength:$('#windowRubberExcessLength').val(),
                							windowRubberShortLength:$('#windowRubberShortLength').val(),
                							windowRubberUprooted:$('#windowRubberUprooted').val(),
                							testingObservationRemark:$('#testingObservationRemarkPanel').val(),
                							
                							
                						},
                						
                						type : 'POST',
                						async : false,
                        	 		})
                						.done(function( msg ) {
                							
                							 $('#acAirGrillScrewTighten').val(''),
                							 $('#acAirGrillScrewMissing').val(''),
                							 $('#gapPartitionPanel').val(''),
                							 $('#cutMarkPanelCorner').val(''),
                							 $('#panelCrackNear').val(''),
                							 $('#panelDentNear').val(''),
                							 $('#magazineBagScrewLoose').val(''),
                							 $('#magazineBagScrewNotFitted').val(''),
                							 $('#magazineTaperFitted').val(''),
                							 $('#magazineTaperBulged').val(''),
                							 $('#magazineTaperDamage').val(''),
                							 $('#holePanelPartition').val(''),
                							 $('#panelNotLocked').val(''),
                							 $('#excessGapPanelPartition').val(''),
                							 $('#windowRubberExcessLength').val(''),
                							 $('#windowRubberShortLength').val(''),
                							 $('#windowRubberUprooted').val(''),
                							 $('#testingObservationRemarkPanel').val(''),
                							 
                						//	$('#selectStages').dialog('close'),
                							
                							$('#FurnishingProductionTableContainer').jtable('load');
     								  })
     								.error(function (msg){
     									
     									alert("Error Fetching Data");
     								});
                                	
                            	}  
                            	  else if(btn==4){
                            		  var c=confirm("Do you want to submit data!!");
                                  	if(c==false){return false;}
                                   
                                  		    	   
                                  	$.ajax({
                  						url : "saveWindowCelling",  //action-name as defined in struts.xml
                  						dataType: 'json', 
                  						data : {
                  							furnishingAssetId: record.furnishingAssetId,
                  							screwMissingLtypeCeiling:$('#screwMissingLtypeCeiling').val(),
                  							screwMissingChipUp:$('#screwMissingChipUp').val(),
                  							doorwayGangwayCeilingAlign:$('#doorwayGangwayCeilingAlign').val(),
                  							doorwayGangwayCeilingDent:$('#doorwayGangwayCeilingDent').val(),
                  							chipupDoorwayGangwayCeiling:$('#chipupDoorwayGangwayCeiling').val(),
                  							excessGapDoorwayLinenroomCeiling:$('#excessGapDoorwayLinenroomCeiling').val(),
                  							taperGapCorridorPartition:$('#taperGapCorridorPartition').val(),
                  							nylonRopeDoorwayCeiling:$('#nylonRopeDoorwayCeiling').val(),
                  							nylonRopeDoorwayCeilingUnlock:$('#nylonRopeDoorwayCeilingUnlock').val(),
                  							doorwayGangwayCeilingKnotted:$('#doorwayGangwayCeilingKnotted').val(),
                  							gapWallceilingPartition:$('#gapWallceilingPartition').val(),
                  							dentWallceilingPartition:$('#dentWallceilingPartition').val(),
                  							epSheetWallceilingPartition:$('#epSheetWallceilingPartition').val(),
                  							excessCutCeiling:$('#excessCutCeiling').val(),
                  							dentMarkNearB:$('#dentMarkNearB').val(),
                  							screwMissingCeiling:$('#screwMissingCeiling').val(),
                  							screwMissingSideCeiling:$('#screwMissingSideCeiling').val(),
                  							screwLooseSideCeiling:$('#screwLooseSideCeiling').val(),
                  							screwUnwantedHole:$('#screwUnwantedHole').val(),
                  							screwCeilingLevel:$('#screwCeilingLevel').val(),
                  							centreDiffuserLevelMismatch:$('#centreDiffuserLevelMismatch').val(),
                  							centreDiffuserLevelBulge:$('#centreDiffuserLevelBulge').val(),
                  							centreDiffuserLockedPrperly:$('#centreDiffuserLockedPrperly').val(),
                  							centreDiffuserLockedMissing:$('#centreDiffuserLockedMissing').val(),
                  							emergencyPullhandlerubbberSited:$('#emergencyPullhandlerubbberSited').val(),
                  							windowGlassCracked:$('#windowGlassCracked').val(),
                  							gapCentreDiffuserSideceiling:$('#gapCentreDiffuserSideceiling').val(),
                  							gapSidewalceilingCentrediffuser:$('#gapSidewalceilingCentrediffuser').val(),
                  							testingObservationRemark:$('#testingObservationRemarkWindowCelling').val(),
                  							
                  							
                  						},
                  						
                  						type : 'POST',
                  						async : false,
                          	 		})
                  						.done(function( msg ) {
                  							
                  							$('#screwMissingLtypeCeiling').val(''),
                  							$('#screwMissingChipUp').val(''),
                  							$('#doorwayGangwayCeilingAlign').val(''),
                  							$('#doorwayGangwayCeilingDent').val(''),
                  							$('#chipupDoorwayGangwayCeiling').val(''),
                  							$('#excessGapDoorwayLinenroomCeiling').val(''),
                  							$('#taperGapCorridorPartition').val(''),
                  							$('#nylonRopeDoorwayCeiling').val(''),
                  							$('#nylonRopeDoorwayCeilingUnlock').val(''),
                  							$('#doorwayGangwayCeilingKnotted').val(''),
                  							$('#gapWallceilingPartition').val(''),
                  							$('#dentWallceilingPartition').val(''),
                  							$('#epSheetWallceilingPartition').val(''),
                  							$('#excessCutCeiling').val(''),
                  							$('#dentMarkNearB').val(''),
                  							$('#screwMissingCeiling').val(''),
                  							$('#screwMissingSideCeiling').val(''),
                  							$('#screwLooseSideCeiling').val(''),
                  							$('#screwUnwantedHole').val(''),
                  							$('#screwCeilingLevel').val(''),
                  							$('#centreDiffuserLevelMismatch').val(''),
                  							$('#centreDiffuserLevelBulge').val(''),
                  							$('#centreDiffuserLockedPrperly').val(''),
                  							$('#centreDiffuserLockedMissing').val(''),
                  							$('#emergencyPullhandlerubbberSited').val(''),
                  							$('#windowGlassCracked').val(''),
                  							$('#gapCentreDiffuserSideceiling').val(''),
                  							$('#gapSidewalceilingCentrediffuser').val(''),
                  							$('#testingObservationRemarkWindowCelling').val(''),
                  							 
                  							//$('#selectStages').dialog('close'),
                  							
                  							$('#FurnishingProductionTableContainer').jtable('load');
       								  })
       								.error(function (msg){
       									
       									alert("Error Fetching Data");
       								});
                                  	
                            	  }
                            	  else if(btn==5){
                            		  var c=confirm("Do you want to submit data!!");
                                  	if(c==false){return false;}
                                   
                                  		    	   
                                  	$.ajax({
                  						url : "saveMoulding",  //action-name as defined in struts.xml
                  						dataType: 'json', 
                  						data : {
                  							furnishingAssetId: record.furnishingAssetId,
                  							endwallDoorCoverLoose:$('#endwallDoorCoverLoose').val(),
                  							endwallDoorCoverMissing:$('#endwallDoorCoverMissing').val(),
                  							endwallDoorCoverTighten:$('#endwallDoorCoverTighten').val(),
                  							endwallDoorSliding:$('#endwallDoorSliding').val(),
                  							endwallRailscrewMissing:$('#endwallRailscrewMissing').val(),
                  							endwallLoose:$('#endwallLoose').val(),
                  							endwallDoorlockAlign:$('#endwallDoorlockAlign').val(),
                  							endwallDoorlockBracketLoose:$('#endwallDoorlockBracketLoose').val(),
                  							manualHandleMovementHard:$('#manualHandleMovementHard').val(),
                  							manualHandleMovementLoose:$('#manualHandleMovementLoose').val(),
                  							manualHandleRusted:$('#manualHandleRusted').val(),
                  							entranceDoorMovement:$('#entranceDoorMovement').val(),
                  							entranceDoorPivotLoose:$('#entranceDoorPivotLoose').val(),
                  							entranceDoorPivotScrewSited:$('#entranceDoorPivotScrewSited').val(),
                  							entranceDoorLockWorking:$('#entranceDoorLockWorking').val(),
                  							entranceDoorLatchMismatch:$('#entranceDoorLatchMismatch').val(),
                  							entranceDoorBottomExcessLength:$('#entranceDoorBottomExcessLength').val(),
                  							entranceDoorGrazingChequerSheet:$('#entranceDoorGrazingChequerSheet').val(),
                  							entranceDoorGrazingRubber:$('#entranceDoorGrazingRubber').val(),
                  							excessPlayEntranceDoorPivot:$('#excessPlayEntranceDoorPivot').val(),
                  							horizontalSteelStripScrewTighten:$('#horizontalSteelStripScrewTighten').val(),
                  							horizontalSteelStripScrewMissing:$('#horizontalSteelStripScrewMissing').val(),
                  							horizontalSteelStripScrewHole:$('#horizontalSteelStripScrewHole').val(),
                  							verticalSteelStripScrewTighten:$('#verticalSteelStripScrewTighten').val(),
                  							verticalSteelStripScrewMissing:$('#verticalSteelStripScrewMissing').val(),
                  							verticalSteelStripScrewHole:$('#verticalSteelStripScrewHole').val(),
                  							horizontalVerticalRubberPasted:$('#horizontalVerticalRubberPasted').val(),
                  							tilliPanelLooseFitted:$('#tilliPanelLooseFitted').val(),
                  							tilliPanelBulge:$('#tilliPanelBulge').val(),
                  							tilliPanelHole:$('#tilliPanelHole').val(),
                  							verticalFrpLooseFitted:$('#verticalFrpLooseFitted').val(),
                  							verticalFrpScrewMissing:$('#verticalFrpScrewMissing').val(),
                  							verticalFrpHole:$('#verticalFrpHole').val(),
                  							verticalFrpScrewTighten:$('#verticalFrpScrewTighten').val(),
                  							horizontalFrpLooseFitted:$('#horizontalFrpLooseFitted').val(),
                  							horizontalFrpScrewMissing:$('#horizontalFrpScrewMissing').val(),
                  							horizontalFrpHole:$('#horizontalFrpHole').val(),
                  							horizontalFrpScrewTighten:$('#horizontalFrpScrewTighten').val(),
                  							verticalfrpHorizontalfrpJointMismatch:$('#verticalfrpHorizontalfrpJointMismatch').val(),
                  							horizontalVerticalFrpEdgeUneven:$('#horizontalVerticalFrpEdgeUneven').val(),
                  							horizontalVerticalFrpPutty:$('#horizontalVerticalFrpPutty').val(),
                  							gapSelfPartition:$('#gapSelfPartition').val(),
                  							flapDoorMovementHard:$('#flapDoorMovementHard').val(),
                  							ZMemberHardwareMissing:$('#ZMemberHardwareMissing').val(),
                  							ZMemberHardwareBurr:$('#ZMemberHardwareBurr').val(),
                  							linenRoomDoorScrewLoose:$('#linenRoomDoorScrewLoose').val(),
                  							linenRoomBinjoScrewMissing:$('#linenRoomBinjoScrewMissing').val(),
                  							linenRoomBinjoScrewLoose:$('#linenRoomBinjoScrewLoose').val(),
                  							linenRoomHaspStapleMissing:$('#linenRoomHaspStapleMissing').val(),
                  							compartmentDoorframeSited:$('#compartmentDoorframeSited').val(),
                  							compartmentDoorhingeScrewLoose:$('#compartmentDoorhingeScrewLoose').val(),
                  							compartmentDoorhingeScrewMissing:$('#compartmentDoorhingeScrewMissing').val(),
                  							compartmentDoorbrushMissing:$('#compartmentDoorbrushMissing').val(),
                  							compartmentDoorstopperWorking:$('#compartmentDoorstopperWorking').val(),
                  							compartmentDoorgrazing:$('#compartmentDoorgrazing').val(),
                  							properFitmentEndwallSaloondoor:$('#properFitmentEndwallSaloondoor').val(),
                  							maxOpeningForceEndwallSaloondoor:$('#maxOpeningForceEndwallSaloondoor').val(),
                  							movementSlidingdoor:$('#movementSlidingdoor').val(),
                  							testingObservationRemark:$('#testingObservationRemarkMoulding').val(),
                  							
                  							
                  						},
                  						
                  						type : 'POST',
                  						async : false,
                          	 		})
                  						.done(function( msg ) {
                  							
                  							$('#endwallDoorCoverLoose').val(''),
                  							$('#endwallDoorCoverMissing').val(''),
                  							$('#endwallDoorCoverTighten').val(''),
                  							$('#endwallDoorSliding').val(''),
                  							$('#endwallRailscrewMissing').val(''),
                  							$('#endwallLoose').val(''),
                  							$('#endwallDoorlockAlign').val(''),
                  							$('#endwallDoorlockBracketLoose').val(''),
                  							$('#manualHandleMovementHard').val(''),
                  							$('#manualHandleMovementLoose').val(''),
                  							$('#manualHandleRusted').val(''),
                  							$('#entranceDoorMovement').val(''),
                  							$('#entranceDoorPivotLoose').val(''),
                  							$('#entranceDoorPivotScrewSited').val(''),
                  							$('#entranceDoorLockWorking').val(''),
                  							$('#entranceDoorLatchMismatch').val(''),
                  							$('#entranceDoorBottomExcessLength').val(''),
                  							$('#entranceDoorGrazingChequerSheet').val(''),
                  							$('#entranceDoorGrazingRubber').val(''),
                  							$('#excessPlayEntranceDoorPivot').val(''),
                  							$('#horizontalSteelStripScrewTighten').val(''),
                  							$('#horizontalSteelStripScrewMissing').val(''),
                  							$('#horizontalSteelStripScrewHole').val(''),
                  							$('#verticalSteelStripScrewTighten').val(''),
                  							$('#verticalSteelStripScrewMissing').val(''),
                  							$('#verticalSteelStripScrewHole').val(''),
                  							$('#horizontalVerticalRubberPasted').val(''),
                  							$('#tilliPanelLooseFitted').val(''),
                  							$('#tilliPanelBulge').val(''),
                  							$('#tilliPanelHole').val(''),
                  							$('#verticalFrpLooseFitted').val(''),
                  							$('#verticalFrpScrewMissing').val(''),
                  							$('#verticalFrpHole').val(''),
                  							$('#verticalFrpScrewTighten').val(''),
                  							$('#horizontalFrpLooseFitted').val(''),
                  							$('#horizontalFrpScrewMissing').val(''),
                  							$('#horizontalFrpHole').val(''),
                  							$('#horizontalFrpScrewTighten').val(''),
                  							$('#verticalfrpHorizontalfrpJointMismatch').val(''),
                  							$('#horizontalVerticalFrpEdgeUneven').val(''),
                  							$('#horizontalVerticalFrpPutty').val(''),
                  							$('#gapSelfPartition').val(''),
                  							$('#flapDoorMovementHard').val(''),
                  							$('#ZMemberHardwareMissing').val(''),
                  							$('#ZMemberHardwareBurr').val(''),
                  							$('#linenRoomDoorScrewLoose').val(''),
                  							$('#linenRoomBinjoScrewMissing').val(''),
                  							$('#linenRoomBinjoScrewLoose').val(''),
                  							$('#linenRoomHaspStapleMissing').val(''),
                  							$('#compartmentDoorframeSited').val(''),
                  							$('#compartmentDoorhingeScrewLoose').val(''),
                  							$('#compartmentDoorhingeScrewMissing').val(''),
                  							$('#compartmentDoorbrushMissing').val(''),
                  							$('#compartmentDoorstopperWorking').val(''),
                  							$('#compartmentDoorgrazing').val(''),
                  							$('#properFitmentEndwallSaloondoor').val(''),
                  							$('#maxOpeningForceEndwallSaloondoor').val(''),
                  							$('#movementSlidingdoor').val(''),
                  							$('#testingObservationRemarkMoulding').val(''),
                  							 
                  						//	$('#selectStages').dialog('close'),
                  							
                  							$('#FurnishingProductionTableContainer').jtable('load');
       								  })
       								.error(function (msg){
       									
       									alert("Error Fetching Data");
       								});
                                  	
                            	  }
                            	  else if(btn==6){
                            		  var c=confirm("Do you want to submit data!!");
                                  	if(c==false){return false;}
                                   
                                  		    	   
                                  	$.ajax({
                  						url : "saveSeatBerth",  //action-name as defined in struts.xml
                  						dataType: 'json', 
                  						data : {
                  							furnishingAssetId: record.furnishingAssetId,
                  							protectionWallHardwareLoose:$('#protectionWallHardwareLoose').val(),
                  							protectionWallHardwareMissing:$('#protectionWallHardwareMissing').val(),
                  							luggageRackLoose:$('#luggageRackLoose').val(),
                  							luggageRackTaper:$('#luggageRackTaper').val(),
                  							luggageRackMissing:$('#luggageRackMissing').val(),
                  							mirrorNotPasted:$('#mirrorNotPasted').val(),
                  							mirrorRubberUprooted:$('#mirrorRubberUprooted').val(),
                  							coatHookLoose:$('#coatHookLoose').val(),
                  							coatHookMissing:$('#coatHookMissing').val(),
                  							coatHookApdDone:$('#coatHookApdDone').val(),
                  							coatHookApdRoughly:$('#coatHookApdRoughly').val(),
                  							curtainMovementSmooth:$('#curtainMovementSmooth').val(),
                  							curtainRunnerCameOut:$('#curtainRunnerCameOut').val(),
                  							curtainRunnerStopperFitted:$('#curtainRunnerStopperFitted').val(),
                  							snackTableLoose:$('#snackTableLoose').val(),
                  							snackTableTapper:$('#snackTableTapper').val(),
                  							snackTableScrewMissing:$('#snackTableScrewMissing').val(),
                  							safetyRailTaper:$('#safetyRailTaper').val(),
                  							safetyRailLoose:$('#safetyRailLoose').val(),
                  							safetyRailBktLoose:$('#safetyRailBktLoose').val(),
                  							safetyRailBktTighten:$('#safetyRailBktTighten').val(),
                  							safetyRailBktTaper:$('#safetyRailBktTaper').val(),
                  							berthChainLoose:$('#berthChainLoose').val(),
                  							berthChainHardwareLoose:$('#berthChainHardwareLoose').val(),
                  							berthChainHardwareMissing:$('#berthChainHardwareMissing').val(),
                  							bottleHolderLoose:$('#bottleHolderLoose').val(),
                  							bottleHolderTaper:$('#bottleHolderTaper').val(),
                  							bottoleHolderScrewMissing:$('#bottoleHolderScrewMissing').val(),
                  							bottoleHolderScrewDamage:$('#bottoleHolderScrewDamage').val(),
                  							berthMountingHardwareSidewallLoose:$('#berthMountingHardwareSidewallLoose').val(),
                  							berthMountingHardwareSidewallTaper:$('#berthMountingHardwareSidewallTaper').val(),
                  							berthMountingHardwareSidewallMissing:$('#berthMountingHardwareSidewallMissing').val(),
                  							berthMountingHardwarePillarLoose:$('#berthMountingHardwarePillarLoose').val(),
                  							berthMountingHardwarePillarTaper:$('#berthMountingHardwarePillarTaper').val(),
                  							berthMountingHardwarePillarMissing:$('#berthMountingHardwarePillarMissing').val(),
                  							berthTapper:$('#berthTapper').val(),
                  							berthFlapLoose:$('#berthFlapLoose').val(),
                  							berthFlapBulge:$('#berthFlapBulge').val(),
                  							flapAlStripExcessLength:$('#flapAlStripExcessLength').val(),
                  							flapAlHardwareExcessLength:$('#flapAlHardwareExcessLength').val(),
                  							transverseBerthLevel:$('#transverseBerthLevel').val(),
                  							gapBackrestBerth:$('#gapBackrestBerth').val(),
                  							backrestMovement:$('#backrestMovement').val(),
                  							backrestGrazingLadder:$('#backrestGrazingLadder').val(),
                  							backrestGrazingPanelseat:$('#backrestGrazingPanelseat').val(),
                  							latchCatchMissmatch:$('#latchCatchMissmatch').val(),
                  							burrLatchSeat:$('#burrLatchSeat').val(),
                  							burrCatchSeat:$('#burrCatchSeat').val(),
                  							holePartitionLatchSeat:$('#holePartitionLatchSeat').val(),
                  							rexineTornBackrestSeat:$('#rexineTornBackrestSeat').val(),
                  							rexineTornBerth:$('#rexineTornBerth').val(),
                  							almirahHardwareLoose:$('#almirahHardwareLoose').val(),
                  							almirahHardwareMissing:$('#almirahHardwareMissing').val(),
                  							towerWorking:$('#towerWorking').val(),
                  							almirahWorking:$('#almirahWorking').val(),
                  							almirahHole:$('#almirahHole').val(),
                  							holeNearBottleHolder:$('#holeNearBottleHolder').val(),
                  							holeNearLatchSeat:$('#holeNearLatchSeat').val(),
                  							holeNearCatchSeat:$('#holeNearCatchSeat').val(),
                  							rexineTornBerthArmrest:$('#rexineTornBerthArmrest').val(),
                  							builderPlateScrewMissing:$('#builderPlateScrewMissing').val(),
                  							builderPlateScrewMissmatch:$('#builderPlateScrewMissmatch').val(),
                  							rexenePastedBacksideBerth:$('#rexenePastedBacksideBerth').val(),
                  							testingObservationRemark:$('#testingObservationRemarkSeatBerth').val(),
                  							
                  							
                  						},
                  						
                  						type : 'POST',
                  						async : false,
                          	 		})
                  						.done(function( msg ) {
                  							
                  							$('#protectionWallHardwareLoose').val(''),
                  							$('#protectionWallHardwareMissing').val(''),
                  							$('#luggageRackLoose').val(''),
                  							$('#luggageRackTaper').val(''),
                  							$('#luggageRackMissing').val(''),
                  							$('#mirrorNotPasted').val(''),
                  							$('#mirrorRubberUprooted').val(''),
                  							$('#coatHookLoose').val(''),
                  							$('#coatHookMissing').val(''),
                  							$('#coatHookApdDone').val(''),
                  							$('#coatHookApdRoughly').val(''),
                  							$('#curtainMovementSmooth').val(''),
                  							$('#curtainRunnerCameOut').val(''),
                  							$('#curtainRunnerStopperFitted').val(''),
                  							$('#snackTableLoose').val(''),
                  							$('#snackTableTapper').val(''),
                  							$('#snackTableScrewMissing').val(''),
                  							$('#safetyRailTaper').val(''),
                  							$('#safetyRailLoose').val(''),
                  							$('#safetyRailBktLoose').val(''),
                  							$('#safetyRailBktTighten').val(''),
                  							$('#safetyRailBktTaper').val(''),
                  							$('#berthChainLoose').val(''),
                  							$('#berthChainHardwareLoose').val(''),
                  							$('#berthChainHardwareMissing').val(''),
                  							$('#bottleHolderLoose').val(''),
                  							$('#bottleHolderTaper').val(''),
                  							$('#bottoleHolderScrewMissing').val(''),
                  							$('#bottoleHolderScrewDamage').val(''),
                  							$('#berthMountingHardwareSidewallLoose').val(''),
                  							$('#berthMountingHardwareSidewallTaper').val(''),
                  							$('#berthMountingHardwareSidewallMissing').val(''),
                  							$('#berthMountingHardwarePillarLoose').val(''),
                  							$('#berthMountingHardwarePillarTaper').val(''),
                  							$('#berthMountingHardwarePillarMissing').val(''),
                  							$('#berthTapper').val(''),
                  							$('#berthFlapLoose').val(''),
                  							$('#berthFlapBulge').val(''),
                  							$('#flapAlStripExcessLength').val(''),
                  							$('#flapAlHardwareExcessLength').val(''),
                  							$('#transverseBerthLevel').val(''),
                  							$('#gapBackrestBerth').val(''),
                  							$('#backrestMovement').val(''),
                  							$('#backrestGrazingLadder').val(''),
                  							$('#backrestGrazingPanelseat').val(''),
                  							$('#latchCatchMissmatch').val(''),
                  							$('#burrLatchSeat').val(''),
                  							$('#burrCatchSeat').val(''),
                  							$('#holePartitionLatchSeat').val(''),
                  							$('#rexineTornBackrestSeat').val(''),
                  							$('#rexineTornBerth').val(''),
                  							$('#almirahHardwareLoose').val(''),
                  							$('#almirahHardwareMissing').val(''),
                  							$('#towerWorking').val(''),
                  							$('#almirahWorking').val(''),
                  							$('#almirahHole').val(''),
                  							$('#holeNearBottleHolder').val(''),
                  							$('#holeNearLatchSeat').val(''),
                  							$('#holeNearCatchSeat').val(''),
                  							$('#rexineTornBerthArmrest').val(''),
                  							$('#builderPlateScrewMissing').val(''),
                  							$('#builderPlateScrewMissmatch').val(''),
                  							$('#rexenePastedBacksideBerth').val(''),
                  							$('#testingObservationRemarkSeatBerth').val(''),
                  							 
                  							//$('#selectStages').dialog('close'),
                  							
                  							$('#FurnishingProductionTableContainer').jtable('load');
       								  })
       								.error(function (msg){
       									
       									alert("Error Fetching Data");
       								});
                                  	
                            	  }
                            	   else if(btn==7){
                            		  var c=confirm("Do you want to submit data!!");
                                  	if(c==false){return false;}
                                   
                                  		    	   
                                  	$.ajax({
                  						url : "saveLavatory",  //action-name as defined in struts.xml
                  						dataType: 'json', 
                  						data : {
                  							furnishingAssetId: record.furnishingAssetId,
                  							loroPipeLoose:$('#loroPipeLoose').val(),
                  							loroPipeMissing:$('#loroPipeMissing').val(),
                  							attachmentWailHingeLoose:$('#attachmentWailHingeLoose').val(),
                  							attachmentWailHingeMissing:$('#attachmentWailHingeMissing').val(),
                  							attachmentWailHingeDent:$('#attachmentWailHingeDent').val(),
                  							attachmentWallTowerScrewMissing:$('#attachmentWallTowerScrewMissing').val(),
                  							attachmentWallTowerBoltDamage:$('#attachmentWallTowerBoltDamage').val(),
                  							towerBoltFitted:$('#towerBoltFitted').val(),
                  							towerBoltHole:$('#towerBoltHole').val(),
                  							soapCaseScrewMissing:$('#soapCaseScrewMissing').val(),
                  							soapCaseScrewLoose:$('#soapCaseScrewLoose').val(),
                  							soapCaseScrewTaper:$('#soapCaseScrewTaper').val(),
                  							lavWashBasinSealed:$('#lavWashBasinSealed').val(),
                  							lavWashBasinOutside:$('#lavWashBasinOutside').val(),
                  							avWashBasinInside:$('#avWashBasinInside').val(),
                  							lavWashBasinRoughlySealed:$('#lavWashBasinRoughlySealed').val(),
                  							lavWashBasinRoughlyOutside:$('#lavWashBasinRoughlyOutside').val(),
                  							lavWashBasinRoughlyInside:$('#lavWashBasinRoughlyInside').val(),
                  							dustbinBoxProvided:$('#dustbinBoxProvided').val(),
                  							dustbinBoxUnlocked:$('#dustbinBoxUnlocked').val(),
                  							dustbinBktLoose:$('#dustbinBktLoose').val(),
                  							dustbikBktScrewMissing:$('#dustbikBktScrewMissing').val(),
                  							steelDustbinBktLoose:$('#steelDustbinBktLoose').val(),
                  							wasteBinLoose:$('#wasteBinLoose').val(),
                  							wasteBinScrewMissing:$('#wasteBinScrewMissing').val(),
                  							wasteBinScrewDent:$('#wasteBinScrewDent').val(),
                  							wasteBinCoverPlateRusted:$('#wasteBinCoverPlateRusted').val(),
                  							wasteBinCoverMagnet:$('#wasteBinCoverMagnet').val(),
                  							lessScrewWasteBinCover:$('#lessScrewWasteBinCover').val(),
                  							lessScrewWasteBinCoverGrazing:$('#lessScrewWasteBinCoverGrazing').val(),
                  							outsideWasteBinLoose:$('#outsideWasteBinLoose').val(),
                  							outsideWasteBinNotTighten:$('#outsideWasteBinNotTighten').val(),
                  							sleeveScrewMissing:$('#sleeveScrewMissing').val(),
                  							sleeveScrewLevel:$('#sleeveScrewLevel').val(),
                  							sleeveScrewSited:$('#sleeveScrewSited').val(),
                  							drainPipeLeakage:$('#drainPipeLeakage').val(),
                  							drainPipeSealed:$('#drainPipeSealed').val(),
                  							outsideDrainPipeSleeveSited:$('#outsideDrainPipeSleeveSited').val(),
                  							loroPipehardwareLoose:$('#loroPipehardwareLoose').val(),
                  							lavatoryDoorPivotLoose:$('#lavatoryDoorPivotLoose').val(),
                  							lavatoryDoorScrewMissing:$('#lavatoryDoorScrewMissing').val(),
                  							lavatoryDoorScrewSited:$('#lavatoryDoorScrewSited').val(),
                  							lavatoryDoorTaperFitted:$('#lavatoryDoorTaperFitted').val(),
                  							lavatoryDoorTaperSound:$('#lavatoryDoorTaperSound').val(),
                  							lavatoryDoorFrameCornerSited:$('#lavatoryDoorFrameCornerSited').val(),
                  							lavatoryDoorFrameCornerGap:$('#lavatoryDoorFrameCornerGap').val(),
                  							lavatoryDoorHandleLoose:$('#lavatoryDoorHandleLoose').val(),
                  							lavatoryDoorHandleMissing:$('#lavatoryDoorHandleMissing').val(),
                  							coathookLavatoryLoose:$('#coathookLavatoryLoose').val(),
                  							coathookLavatoryMissing:$('#coathookLavatoryMissing').val(),
                  							engageVacantLockWorking:$('#engageVacantLockWorking').val(),
                  							engageVacantLockMaleFemaleMismatch:$('#engageVacantLockMaleFemaleMismatch').val(),
                  							engageVacantLockFemaleLoose:$('#engageVacantLockFemaleLoose').val(),
                  							engageVacantLockFemaleMissing:$('#engageVacantLockFemaleMissing').val(),
                  							engageVacantLockMaleLoose:$('#engageVacantLockMaleLoose').val(),
                  							engageVacantLockMaleMissing:$('#engageVacantLockMaleMissing').val(),
                  							swingLockCatchLoose:$('#swingLockCatchLoose').val(),
                  							swingLockCatchLatch:$('#swingLockCatchLatch').val(),
                  							swingLockCatchHardwareExcessLength:$('#swingLockCatchHardwareExcessLength').val(),
                  							swingLockCatchHardwareBurr:$('#swingLockCatchHardwareBurr').val(),
                  							lavatoryDoorCloserScrewTighten:$('#lavatoryDoorCloserScrewTighten').val(),
                  							lavatoryDoorCloserScrewRusted:$('#lavatoryDoorCloserScrewRusted').val(),
                  							lavatoryDoorCloserScrewMovement:$('#lavatoryDoorCloserScrewMovement').val(),
                  							soapDispenserLoose:$('#soapDispenserLoose').val(),
                  							soapDispenserTaper:$('#soapDispenserTaper').val(),
                  							soapDispenserMissing:$('#soapDispenserMissing').val(),
                  							bracketSoapDispenser:$('#bracketSoapDispenser').val(),
                  							lotahTapStrainerLevel:$('#lotahTapStrainerLevel').val(),
                  							lotahTapStrainerSealed:$('#lotahTapStrainerSealed').val(),
                  							lotahTapStrainerRoughlySealed:$('#lotahTapStrainerRoughlySealed').val(),
                  							lotahTapStrainerScrewMissing:$('#lotahTapStrainerScrewMissing').val(),
                  							wallHandleCapPasted:$('#wallHandleCapPasted').val(),
                  							wallHandleScrewLoose:$('#wallHandleScrewLoose').val(),
                  							panLevelFloorLevel:$('#panLevelFloorLevel').val(),
                  							panLevelFloorLevelRoughlySealed:$('#panLevelFloorLevelRoughlySealed').val(),
                  							washBasinHardwareMissing:$('#washBasinHardwareMissing').val(),
                  							washBasinHardwareTighten:$('#washBasinHardwareTighten').val(),
                  							washBasinHardwareLoose:$('#washBasinHardwareLoose').val(),
                  							dentOnModule:$('#dentOnModule').val(),
                  							dentOnHplSheet:$('#dentOnHplSheet').val(),
                  							moduleJointNotSealed:$('#moduleJointNotSealed').val(),
                  							moduleJointRoughlySealed:$('#moduleJointRoughlySealed').val(),
                  							commodeHardwareLoose:$('#commodeHardwareLoose').val(),
                  							commodeHardwareMissing:$('#commodeHardwareMissing').val(),
                  							plasticFilmRemovedCeilingDoor:$('#plasticFilmRemovedCeilingDoor').val(),
                  							ceilingNotLevel:$('#ceilingNotLevel').val(),
                  							ceilingHardwareLoose:$('#ceilingHardwareLoose').val(),
                  							ceilingHardwareDent:$('#ceilingHardwareDent').val(),
                  							moduleHardwareSidewallLoose:$('#moduleHardwareSidewallLoose').val(),
                  							mirrorHolderLoose:$('#mirrorHolderLoose').val(),
                  							mirrorHolderTaper:$('#mirrorHolderTaper').val(),
                  							mirrorHolderApdDone:$('#mirrorHolderApdDone').val(),
                  							hopperWindowFrameSited:$('#hopperWindowFrameSited').val(),
                  							hopperWindowFrameShort:$('#hopperWindowFrameShort').val(),
                  							hopperWindowFrameExcess:$('#hopperWindowFrameExcess').val(),
                  							hopperWindowRubberUprooted:$('#hopperWindowRubberUprooted').val(),
                  							hopperWindowGlassCrack:$('#hopperWindowGlassCrack').val(),
                  							conditionLavatoryFloorLevel:$('#conditionLavatoryFloorLevel').val(),
                  							testingObservationRemark:$('#testingObservationRemarkLavatory').val(),
                  							
                  							
                  						},
                  						
                  						type : 'POST',
                  						async : false,
                          	 		})
                  						.done(function( msg ) {
                  							
                  							$('#screwMissingLtypeCeiling').val(''),
                  							$('#loroPipeLoose').val(''),
                  							$('#loroPipeMissing').val(''),
                  							$('#attachmentWailHingeLoose').val(''),
                  							$('#attachmentWailHingeMissing').val(''),
                  							$('#attachmentWailHingeDent').val(''),
                  							$('#attachmentWallTowerScrewMissing').val(''),
                  							$('#attachmentWallTowerBoltDamage').val(''),
                  							$('#towerBoltFitted').val(''),
                  							$('#towerBoltHole').val(''),
                  							$('#soapCaseScrewMissing').val(''),
                  							$('#soapCaseScrewLoose').val(''),
                  							$('#soapCaseScrewTaper').val(''),
                  							$('#lavWashBasinSealed').val(''),
                  							$('#lavWashBasinOutside').val(''),
                  							$('#avWashBasinInside').val(''),
                  							$('#lavWashBasinRoughlySealed').val(''),
                  							$('#lavWashBasinRoughlyOutside').val(''),
                  							$('#lavWashBasinRoughlyInside').val(''),
                  							$('#dustbinBoxProvided').val(''),
                  							$('#dustbinBoxUnlocked').val(''),
                  							$('#dustbinBktLoose').val(''),
                  							$('#dustbikBktScrewMissing').val(''),
                  							$('#steelDustbinBktLoose').val(''),
                  							$('#wasteBinLoose').val(''),
                  							$('#wasteBinScrewMissing').val(''),
                  							$('#wasteBinScrewDent').val(''),
                  							$('#wasteBinCoverPlateRusted').val(''),
                  							$('#wasteBinCoverMagnet').val(''),
                  							$('#lessScrewWasteBinCover').val(''),
                  							$('#lessScrewWasteBinCoverGrazing').val(''),
                  							$('#outsideWasteBinLoose').val(''),
                  							$('#outsideWasteBinNotTighten').val(''),
                  							$('#sleeveScrewMissing').val(''),
                  							$('#sleeveScrewLevel').val(''),
                  							$('#sleeveScrewSited').val(''),
                  							$('#drainPipeLeakage').val(''),
                  							$('#drainPipeSealed').val(''),
                  							$('#outsideDrainPipeSleeveSited').val(''),
                  							$('#loroPipehardwareLoose').val(''),
                  							$('#lavatoryDoorPivotLoose').val(''),
                  							$('#lavatoryDoorScrewMissing').val(''),
                  							$('#lavatoryDoorScrewSited').val(''),
                  							$('#lavatoryDoorTaperFitted').val(''),
                  							$('#lavatoryDoorTaperSound').val(''),
                  							$('#lavatoryDoorFrameCornerSited').val(''),
                  							$('#lavatoryDoorFrameCornerGap').val(''),
                  							$('#lavatoryDoorHandleLoose').val(''),
                  							$('#lavatoryDoorHandleMissing').val(''),
                  							$('#coathookLavatoryLoose').val(''),
                  							$('#coathookLavatoryMissing').val(''),
                  							$('#engageVacantLockWorking').val(''),
                  							$('#engageVacantLockMaleFemaleMismatch').val(''),
                  							$('#engageVacantLockFemaleLoose').val(''),
                  							$('#engageVacantLockFemaleMissing').val(''),
                  							$('#engageVacantLockMaleLoose').val(''),
                  							$('#engageVacantLockMaleMissing').val(''),
                  							$('#swingLockCatchLoose').val(''),
                  							$('#swingLockCatchLatch').val(''),
                  							$('#swingLockCatchHardwareExcessLength').val(''),
                  							$('#swingLockCatchHardwareBurr').val(''),
                  							$('#lavatoryDoorCloserScrewTighten').val(''),
                  							$('#lavatoryDoorCloserScrewRusted').val(''),
                  							$('#lavatoryDoorCloserScrewMovement').val(''),
                  							$('#soapDispenserLoose').val(''),
                  							$('#soapDispenserTaper').val(''),
                  							$('#soapDispenserMissing').val(''),
                  							$('#bracketSoapDispenser').val(''),
                  							$('#lotahTapStrainerLevel').val(''),
                  							$('#lotahTapStrainerSealed').val(''),
                  							$('#lotahTapStrainerRoughlySealed').val(''),
                  							$('#lotahTapStrainerScrewMissing').val(''),
                  							$('#wallHandleCapPasted').val(''),
                  							$('#wallHandleScrewLoose').val(''),
                  							$('#panLevelFloorLevel').val(''),
                  							$('#panLevelFloorLevelRoughlySealed').val(''),
                  							$('#washBasinHardwareMissing').val(''),
                  							$('#washBasinHardwareTighten').val(''),
                  							$('#washBasinHardwareLoose').val(''),
                  							$('#dentOnModule').val(''),
                  							$('#dentOnHplSheet').val(''),
                  							$('#moduleJointNotSealed').val(''),
                  							$('#moduleJointRoughlySealed').val(''),
                  							$('#commodeHardwareLoose').val(''),
                  							$('#commodeHardwareMissing').val(''),
                  							$('#plasticFilmRemovedCeilingDoor').val(''),
                  							$('#ceilingNotLevel').val(''),
                  							$('#ceilingHardwareLoose').val(''),
                  							$('#ceilingHardwareDent').val(''),
                  							$('#moduleHardwareSidewallLoose').val(''),
                  							$('#mirrorHolderLoose').val(''),
                  							$('#mirrorHolderTaper').val(''),
                  							$('#mirrorHolderApdDone').val(''),
                  							$('#hopperWindowFrameSited').val(''),
                  							$('#hopperWindowFrameShort').val(''),
                  							$('#hopperWindowFrameExcess').val(''),
                  							$('#hopperWindowRubberUprooted').val(''),
                  							$('#hopperWindowGlassCrack').val(''),
                  							$('#conditionLavatoryFloorLevel').val(''),
                  							$('#testingObservationRemarkLavatory').val(''),
                  							 
                  							//$('#selectStages').dialog('close'),
                  							
                  							$('#FurnishingProductionTableContainer').jtable('load');
       								  })
       								.error(function (msg){
       									
       									alert("Error Fetching Data");
       								});
                                  
                            	  }
                            	  else if(btn==8){
                            		  var c=confirm("Do you want to submit data!!");
                                  	if(c==false){return false;}
                                   
                                  		    	   
                                  	$.ajax({
                  						url : "savePlumbing",  //action-name as defined in struts.xml
                  						dataType: 'json', 
                  						data : {
                  							furnishingAssetId: record.furnishingAssetId,
                  							readingWaterLevelGauge:$('#readingWaterLevelGauge').val(),
                  							isOsWashbasinTapLoose:$('#isOsWashbasinTapLoose').val(),
                  							showerHandleLoose:$('#showerHandleLoose').val(),
                  							showerHandleBroken:$('#showerHandleBroken').val(),
                  							showerHandleStandScrewLoose:$('#showerHandleStandScrewLoose').val(),
                  							upperTankUclampRubberMissingLoose:$('#upperTankUclampRubberMissingLoose').val(),
                  							testingObservationRemark:$('#testingObservationRemarkPlumbing').val(),
                  							
                  							
                  						},
                  						
                  						type : 'POST',
                  						async : false,
                          	 		})
                  						.done(function( msg ) {
                  							
                  							$('#readingWaterLevelGauge').val(''),
                  							$('#isOsWashbasinTapLoose').val(''),
                  							$('#showerHandleLoose').val(''),
                  							$('#showerHandleBroken').val(''),
                  							$('#showerHandleStandScrewLoose').val(''),
                  							$('#upperTankUclampRubberMissingLoose').val(''),
                  							$('#testingObservationRemarkPlumbing').val(''),
                  							 
                  						//	$('#selectStages').dialog('close'),
                  							
                  							$('#FurnishingProductionTableContainer').jtable('load');
       								  })
       								.error(function (msg){
       									
       									alert("Error Fetching Data");
       								});
                                  
                            	  }
                            	  else if(btn==9){
                            		  var c=confirm("Do you want to submit data!!");
                                  	if(c==false){return false;}
                                   
                                  		    	   
                                  	$.ajax({
                  						url : "saveAirBrake",  //action-name as defined in struts.xml
                  						dataType: 'json', 
                  						data : {
                  							furnishingAssetId: record.furnishingAssetId,
                  							releasingDeviceChuckLoose:$('#releasingDeviceChuckLoose').val(),
                  							releasingDeviceRodFitted:$('#releasingDeviceRodFitted').val(),
                  							brakeIndicatorFitted:$('#brakeIndicatorFitted').val(),
                  							airHosepipeAngleCookLoose:$('#airHosepipeAngleCookLoose').val(),
                  							emergencyPullboxCoverFitted:$('#emergencyPullboxCoverFitted').val(),
                  							lavatoryAirPipeClampFitted:$('#lavatoryAirPipeClampFitted').val(),
                  							alarmPipeClampFitted:$('#alarmPipeClampFitted').val(),
                  							testingObservationRemark:$('#testingObservationRemarkAirBrake').val(),
                  							
                  							
                  						},
                  						
                  						type : 'POST',
                  						async : false,
                          	 		})
                  						.done(function( msg ) {
                  							
                  							$('#releasingDeviceChuckLoose').val(''),
                  							$('#releasingDeviceRodFitted').val(''),
                  							$('#brakeIndicatorFitted').val(''),
                  							$('#airHosepipeAngleCookLoose').val(''),
                  							$('#emergencyPullboxCoverFitted').val(''),
                  							$('#lavatoryAirPipeClampFitted').val(''),
                  							$('#alarmPipeClampFitted').val(''),
                  							$('#testingObservationRemarkAirBrake').val(''),
                  							 
                  						//	$('#selectStages').dialog('close'),
                  							
                  							$('#FurnishingProductionTableContainer').jtable('load');
       								  })
       								.error(function (msg){
       									
       									alert("Error Fetching Data");
       								});
                                  } 
                            	  else if(btn==10){
                            		  var c=confirm("Do you want to submit data!!");
                                  	if(c==false){return false;}
                                   
                                  		    	   
                                  	$.ajax({
                  						url : "saveCoachLowering",  //action-name as defined in struts.xml
                  						dataType: 'json', 
                  						data : {
                  							furnishingAssetId: record.furnishingAssetId,
                  							testingObservationRemark:$('#testingObservationRemarkCoachLowering').val(),
                  							
                  							
                  						},
                  						
                  						type : 'POST',
                  						async : false,
                          	 		})
                  						.done(function( msg ) {
                  							
                  							
                  							$('#testingObservationRemark').val(''),
                  							 
                  							//$('#selectStages').dialog('close'),
                  							
                  							$('#FurnishingProductionTableContainer').jtable('load');
       								  })
       								.error(function (msg){
       									
       									alert("Error Fetching Data");
       								});
                                  }
                            	  else if(btn==11){
                            		  var c=confirm("Do you want to submit data!!");
                                  	if(c==false){return false;}
                                   
                                  		    	   
                                  	$.ajax({
                  						url : "savePaint",  //action-name as defined in struts.xml
                  						dataType: 'json', 
                  						data : {
                  							furnishingAssetId: record.furnishingAssetId,
                  							fitmentDestinationboardNoPlate:$('#fitmentDestinationboardNoPlate').val(),
                  							properStencillingLettering:$('#properStencillingLettering').val(),
                  							burrBraileSticker:$('#burrBraileSticker').val(),
                  							testingObservationRemark:$('#testingObservationRemarkPaint').val(),
                  							
                  							
                  						},
                  						
                  						type : 'POST',
                  						async : false,
                          	 		})
                  						.done(function( msg ) {
                  							
                  							$('#fitmentDestinationboardNoPlate').val(''),
                  							$('#properStencillingLettering').val(''),
                  							$('#burrBraileSticker').val(''),
                  							$('#testingObservationRemarkPaint').val(''),
                  							 
                  							//$('#selectStages').dialog('close'),
                  							
                  							$('#FurnishingProductionTableContainer').jtable('load');
       								  })
       								.error(function (msg){
       									
       									alert("Error Fetching Data");
       								});
                                  }
                            	  else if(btn==12){
                            		  var c=confirm("Do you want to submit data!!");
                                  	if(c==false){return false;}
                                   
                                  		    	   
                                  	$.ajax({
                  						url : "saveCoachCleaning",  //action-name as defined in struts.xml
                  						dataType: 'json', 
                  						data : {
                  							furnishingAssetId: record.furnishingAssetId,
                  							floorDirty:$('#floorDirty').val(),
                  							lavatoryDirty:$('#lavatoryDirty').val(),
                  							ceilingDirty:$('#ceilingDirty').val(),
                  							seatBerthDirty:$('#seatBerthDirty').val(),
                  							panelDirty:$('#panelDirty').val(),
                  							storeroomPantryLinenDirty:$('#storeroomPantryLinenDirty').val(),
                  							railsSlidingDoorDirty:$('#railsSlidingDoorDirty').val(),
                  							windowGlassDirty:$('#windowGlassDirty').val(),
                  							plasticFilmRemoved:$('#plasticFilmRemoved').val(),
                  							doorDirty:$('#doorDirty').val(),
                  							testingObservationRemark:$('#testingObservationRemarkCoachCleaning').val(),
                  							
                  							
                  						},
                  						
                  						type : 'POST',
                  						async : false,
                          	 		})
                  						.done(function( msg ) {
                  							
                  							$('#floorDirty').val(''),
                  							$('#lavatoryDirty').val(''),
                  							$('#ceilingDirty').val(''),
                  							$('#seatBerthDirty').val(''),
                  							$('#panelDirty').val(''),
                  							$('#storeroomPantryLinenDirty').val(''),
                  							$('#railsSlidingDoorDirty').val(''),
                  							$('#windowGlassDirty').val(''),
                  							$('#plasticFilmRemoved').val(''),
                  							$('#doorDirty').val(''),
                  							$('#testingObservationRemarkCoachCleaning').val(''),
                  							 
                  							//$('#selectStages').dialog('close'),
                  							
                  							$('#FurnishingProductionTableContainer').jtable('load');
       								  })
       								.error(function (msg){
       									
       									alert("Error Fetching Data");
       								});
                                  }
                            	  else if(btn==13){
                            		  var cfm=confirm("Do you want to submit QCI form. Kindly verify each tab before sumbitting. Data cannot after submit");
                                    	if(cfm==false){return false;}
                                  		    	   
                                    	$.ajax({
                      						url : "furnishingClearanceQCI",  //action-name as defined in struts.xml
                      						dataType: 'json', 
                      						data : {
                      							furnishingAssetId: record.furnishingAssetId,
                      							dateOfTest: obj.dateOfTesting
                      							
                      							
                      						},
                      						
                      						type : 'POST',
                      						async : false,
                              	 		})
                      						.done(function( msg ) {
                      							
                      							alert(msg.message);
                      							 
                      							$('#selectStages').dialog('close'),
                      							
                      							$('#FurnishingProductionTableContainer').jtable('load');
           								  })
           								.error(function (msg){
           									
           									alert("Error Fetching Data");
           								});
                                      }                            
                                  	else{
                            		alert("Bye");
                            	}
			                 			    	    return true; 
		                                    }
                            },
		                        Close: function () {
		                        	if(btn==1){
		                        		$('form[name="fpvc"]')[0].reset() ;
                                        $(this).dialog('close');
		                        	}
		                        	else if(btn==2){
		              	 	 			 $('form[name="paritionFrame"]')[0].reset() ;
 			              	 	 		 $(this).dialog('close');
		        	 		         }
		                        	else if(btn==3){
		             	 	 			 $('form[name="panel"]')[0].reset() ;
		             	 	 			 $(this).dialog('close');
		                        	}
		                        	else if(btn==4){
		            	 	 			 $('form[name="windowCelling"]')[0].reset() ;
   		            	 	 			 $(this).dialog('close');
		             	 	 		}
		                        	else if(btn==5){
		           	 	 			 	 $('form[name="moulding"]')[0].reset() ;
		           	 	 			 	 $(this).dialog('close');
		            	 	 		}
		                        	else if(btn==6){
		          	 	 			 	 $('form[name="seatBerth"]')[0].reset() ;
		          	 	 			 	 $(this).dialog('close');
		           	 	 			}
		                        	else if(btn==7){
		         	 	 			 	 $('form[name="lavatory"]')[0].reset() ;
		         	 	 			  	 $(this).dialog('close');
		          	 	 			}
		                        	else if(btn==8){
		        	 	 			 	 $('form[name="plumbing"]')[0].reset() ;
		        	 	 			 	 $(this).dialog('close');
		         	 	 			}
		        	 	 			else if(btn==9){
		       	 	 			 	 	 $('form[name="airBrake"]')[0].reset() ;
		       	 	 			 		 $(this).dialog('close');
		       	 	 			 	}
		        	 	 			else if(btn==10){
		       	 	 			 		 $('form[name="coachLowering"]')[0].reset() ;
		       	 	 			 		 $(this).dialog('close');
		       	 	 			 	}
		        	 	 			else if(btn==11){
		       	 	 			 		 $('form[name="paint"]')[0].reset() ;
		       	 	 			 		 $(this).dialog('close');
		       	 	 			 	}
		        	 	 			else if(btn==12){
		       	 	 			 		 $('form[name="coachCleaning"]')[0].reset() ;
		       	 	 			 		 $(this).dialog('close');
		        	 	 			}
		        	 	 			else if(btn==13){
		      	 	 			 		 $('form[name="furnishingClearance"]')[0].reset() ;
		      	 	 			 		 $(this).dialog('close');
		      	 	 			 	}
		        	 	 			else{
		        	 	 				alert("Doesn't exist!!!");
		        	 	 			}
		                         }
                            },
            	        modal: true
   });
        	 		
        	 		
        	 		
        	 		
        	 		
        	 		    
			    	   return true;
        	 		    
        	 			  
        	 		  }//ending else               	  
        	  // ajax call ends here				
					 
            }
        } 
       	 
       
               
              
       ]
       },
			actions : {
	
 			listAction: 'availableForQCIFurnishingAction?stageID=<%=stageID%>',
 			
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
	function isNumberKey(el, evt) {
		var spanid=el.id+'_output';
		//alert(spanid);
		 var h = document.getElementById(el.id);
		    var charCode = (evt.which) ? evt.which : event.keyCode;
		    var number = el.value.split('.');
		    if((charCode != 46 && charCode > 31) && (charCode < 48 || charCode > 57)) {
document.getElementById(spanid).innerHTML='<span style="background: #fee;width: 200px;height: 25px;margin: 15px 0;color: #a33;">Only number and point allowed</span>';
		     
		return false;
		    }
		else
		{
		document.getElementById(spanid).innerHTML="";
		}
		    //just one dot
		    if(number.length>1 && charCode == 46){

		document.getElementById(spanid).innerHTML='<span style="background:#fee;width:200px;height: 25px;margin: 15px 0;color: #a33;">Not a valid number</span>';

		         return false;
		    }
		    //get the carat position
		    var caratPos = getSelectionStart(el);
		    var dotPos = el.value.indexOf(".");
		    if( caratPos > dotPos && dotPos>-1 && (number[1].length > 1)){ //Change 1 to 2 for 3 places of decimal allowed
		        return false;
		    }
		    return true;
		}


		function getSelectionStart(o) {
		if (o.createTextRange) {
		var r = document.selection.createRange().duplicate();
		r.moveEnd('character', o.value.length);
		if (r.text == '') return o.value.length
		return o.value.lastIndexOf(r.text)
		} else return o.selectionStart
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
			 		if(record.qciTestingFlag==1)
	                {
		 		$('input[type="text"], textarea').each(function(){
		 		   $(this).attr('readonly','readonly');
		 		}); 
		 		$("#select option").each(function(i){
		 			$('option:not(:selected)').attr('disabled', true);
		 	    });
		 		$("input[type=radio]").attr('disabled', true);
	                }
	            else
	                {
	            	$('input[type="text"], textarea').each(function(){
	     	 		   $(this).attr('readonly', false);
	     	 		}); 
	     	 		$("#select option").each(function(i){
	     	 			$('option:not(:selected)').attr('disabled', false);
	     	 	    });
	     	 		$("input[type=radio]").attr('disabled', false);
	                 }
    // ajax call to retireve flag value 
         $.ajax({
	 			url : "setObjectForFlag",  //action-name as defined in struts.xml
				dataType: 'json', 
				async:false,
				data : {
					furnishingAssetId: record.furnishingAssetId,
				},
				success:function(data)
				{
					obj=data.qciFPvcTrans; 	//set value in obj	
				}
	 		});
		             
				 if(btn==1){
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
							$('#bookedDiv').val(data.bookedDiv)
							
							
						}
				  });
				// if(Object.keys(obj).length!=0){
				if(obj!=null){
				 if(obj.qcifpvcflag==1)
					{
						var cfm=confirm("Data for F&PVC is already updated. Do you want to verify data?");
		           	if(cfm==false){return false;}	
					$.ajax({
					url : "showDatafpvc",  //action-name as defined in struts.xml
					dataType: 'json', 
					async:false,
					data : {
						furnishingAssetId: record.furnishingAssetId,
					},
					success:function(data)
					{
						$('#docNo').val(data.qciFPvcTrans.docNo);
						$('#docRevNo').val(data.qciFPvcTrans.docRevNo);
						var date1=(data.qciFPvcTrans.docDate).substring(0,10);
						var date1Array=date1.split("-");
						$('#docDate').datepicker("setDate",new Date(date1Array[0],date1Array[1]-1,date1Array[2]));
						
						var date2=(data.qciFPvcTrans.dateOfTesting).substring(0,10);
						var date2Array=date2.split("-");
						$('#dateOfTesting').datepicker("setDate",new Date(date2Array[0],date2Array[1]-1,date2Array[2]));
						$('#shiftOfTesting').val(data.qciFPvcTrans.shiftOfTesting);
						$('#footPlateJam').val(data.qciFPvcTrans.footPlateJam);	
						$('#movementHard').val(data.qciFPvcTrans.movementHard);
						$('#footPlateSpringHardware').val(data.qciFPvcTrans.footPlateSpringHardware);
						$('#footPlateSideRubberLoose').val(data.qciFPvcTrans.footPlateSideRubberLoose);
						$('#footPlateSideRubberMissing').val(data.qciFPvcTrans.footPlateSideRubberMissing);
						$('#tailLampFitted').val(data.qciFPvcTrans.tailLampFitted);
						$('#tailLampHardwareMissing').val(data.qciFPvcTrans.tailLampHardwareMissing);
						$('#tailLampWelding').val(data.qciFPvcTrans.tailLampWelding);
						$('#footStepLoose').val(data.qciFPvcTrans.footStepLoose);
						$('#footStepHardware').val(data.qciFPvcTrans.footStepHardware);
						$('#fitmentEntranceHandRail').val(data.qciFPvcTrans.fitmentEntranceHandRail);
						$('#footStepRusted').val(data.qciFPvcTrans.footStepRusted);
						$('#footStepTaperFitted').val(data.qciFPvcTrans.footStepTaperFitted);
						$('#stepRailScrewSited').val(data.qciFPvcTrans.stepRailScrewSited);
						$('#stepRailScrewMissing').val(data.qciFPvcTrans.stepRailScrewMissing);
						$('#chequerSheetNotSealed').val(data.qciFPvcTrans.chequerSheetNotSealed);
						$('#chequerSheetRouglySealed').val(data.qciFPvcTrans.chequerSheetRouglySealed);
						$('#roughlyCuttingChequerSheet').val(data.qciFPvcTrans.roughlyCuttingChequerSheet);
						$('#chequerSheetNotSitedCorner').val(data.qciFPvcTrans.chequerSheetNotSitedCorner);
						$('#chequerSheetScrewSited').val(data.qciFPvcTrans.chequerSheetScrewSited);
						$('#chequerSheetScrewMissing').val(data.qciFPvcTrans.chequerSheetScrewMissing);
						$('#chequerSheetScrewLoose').val(data.qciFPvcTrans.chequerSheetScrewLoose);
						$('#doorStopperNotFitted').val(data.qciFPvcTrans.doorStopperNotFitted);
						$('#endwallSafetyHandleFitted').val(data.qciFPvcTrans.endwallSafetyHandleFitted);
						$('#endwallSafetyHandleLoose').val(data.qciFPvcTrans.endwallSafetyHandleLoose);
						$('#endwallSafetyHandleMissing').val(data.qciFPvcTrans.endwallSafetyHandleMissing);
						$('#pvcCuttingPastingEndwalldoor').val(data.qciFPvcTrans.pvcCuttingPastingEndwalldoor);
						$('#pvcCuttingPastingLavatorydoor').val(data.qciFPvcTrans.pvcCuttingPastingLavatorydoor);
						$('#pvcJointWeldingCabinSide').val(data.qciFPvcTrans.pvcJointWeldingCabinSide);
						$('#pvcJointWeldingNonCabinSide').val(data.qciFPvcTrans.pvcJointWeldingNonCabinSide);
						$('#airBubblePvc').val(data.qciFPvcTrans.airBubblePvc);
						$('#floorLevelCorridorArea').val(data.qciFPvcTrans.floorLevelCorridorArea);
						$('#uicVestibuleSited').val(data.qciFPvcTrans.uicVestibuleSited);
						$('#uicVestibuleTaper').val(data.qciFPvcTrans.uicVestibuleTaper);
						$('#uicVestibuleCracked').val(data.qciFPvcTrans.uicVestibuleCracked);
						$('#foamFamSealingNotDone').val(data.qciFPvcTrans.foamFamSealingNotDone);
						$('#foamFamSealingRoughlyDone').val(data.qciFPvcTrans.foamFamSealingRoughlyDone);
						$('#fitmentDoorHandle').val(data.qciFPvcTrans.fitmentDoorHandle);
						$('#testingObservationRemarkFpvc').val(data.qciFPvcTrans.testingObservationRemark);
						
				
								
					}
		             });
					}  
				 }
			}
			else if(btn==2){
				if(obj!=null){
				 if(obj.qciPartitionFrameFlag==1)
					{
						var cfm=confirm("Data for PartitionFrame is already updated. Do you want to verify data?");
		        	if(cfm==false){return false;}	
					$.ajax({
					url : "showDataPartitionFrame",  //action-name as defined in struts.xml
					dataType: 'json', 
					async:false,
					data : {
						furnishingAssetId: record.furnishingAssetId,
					},
					success:function(data)
					{
						$('#dentMarkPartitionBn').val(data.qciPartitionFrameTrans.dentMarkPartitionBn);	
						$('#dentMarkPartitionExceesCut').val(data.qciPartitionFrameTrans.dentMarkPartitionExceesCut);	
						$('#excessGapUmouldingPartitionpillar').val(data.qciPartitionFrameTrans.excessGapUmouldingPartitionpillar);	
						$('#middleBearthStopperMissing').val(data.qciPartitionFrameTrans.middleBearthStopperMissing);	
						$('#middleBearthStopperLoose').val(data.qciPartitionFrameTrans.middleBearthStopperLoose);	
						$('#middleBearthStopperRubberPad').val(data.qciPartitionFrameTrans.middleBearthStopperRubberPad);	
						$('#partitionPillarHardwareLoose').val(data.qciPartitionFrameTrans.partitionPillarHardwareLoose);	
						$('#partitionPillarHardwareMissing').val(data.qciPartitionFrameTrans.partitionPillarHardwareMissing);	
						$('#partitionPillarHardwareTaper').val(data.qciPartitionFrameTrans.partitionPillarHardwareTaper);	
						$('#unwantedHolesPartitionBn').val(data.qciPartitionFrameTrans.unwantedHolesPartitionBn);	
						$('#plasticFilmRemovedPartition').val(data.qciPartitionFrameTrans.plasticFilmRemovedPartition);	
						$('#roughlyPuttyPartition').val(data.qciPartitionFrameTrans.roughlyPuttyPartition);	
						$('#partitionPillarZigzag').val(data.qciPartitionFrameTrans.partitionPillarZigzag);	
						$('#partitionPillarProperlySited').val(data.qciPartitionFrameTrans.partitionPillarProperlySited);	
						$('#burrFoundPartitionPillar').val(data.qciPartitionFrameTrans.burrFoundPartitionPillar);	
						$('#burrFoundBerthHoldingBkt').val(data.qciPartitionFrameTrans.burrFoundBerthHoldingBkt);	
						$('#testingObservationRemarkParitionFrame').val(data.qciPartitionFrameTrans.testingObservationRemark);	
										
					}
		          });
					} 
			}
			} 
			else if(btn==3){
				if(obj!=null){
				if(obj.qciPanelFlag==1)
				{
					var cfm=confirm("Data for Panel is already updated. Do you want to verify data?");
		    	if(cfm==false){return false;}	
				$.ajax({
				url : "showDataPanel",  //action-name as defined in struts.xml
				dataType: 'json', 
				async:false,
				data : {
					furnishingAssetId: record.furnishingAssetId,
				},
				success:function(data)
				{
					$('#acAirGrillScrewTighten').val(data.qciPanelTrans.acAirGrillScrewTighten);
					$('#acAirGrillScrewMissing').val(data.qciPanelTrans.acAirGrillScrewMissing);
					$('#gapPartitionPanel').val(data.qciPanelTrans.gapPartitionPanel);
					$('#cutMarkPanelCorner').val(data.qciPanelTrans.cutMarkPanelCorner);
					$('#panelCrackNear').val(data.qciPanelTrans.panelCrackNear);
					$('#panelDentNear').val(data.qciPanelTrans.panelDentNear);
					$('#magazineBagScrewLoose').val(data.qciPanelTrans.magazineBagScrewLoose);
					$('#magazineBagScrewNotFitted').val(data.qciPanelTrans.magazineBagScrewNotFitted);
					$('#magazineTaperFitted').val(data.qciPanelTrans.magazineTaperFitted);
					$('#magazineTaperBulged').val(data.qciPanelTrans.magazineTaperBulged);
					$('#magazineTaperDamage').val(data.qciPanelTrans.magazineTaperDamage);
					$('#holePanelPartition').val(data.qciPanelTrans.holePanelPartition);
					$('#panelNotLocked').val(data.qciPanelTrans.panelNotLocked);
					$('#excessGapPanelPartition').val(data.qciPanelTrans.excessGapPanelPartition);
					$('#windowRubberExcessLength').val(data.qciPanelTrans.windowRubberExcessLength);
					$('#windowRubberShortLength').val(data.qciPanelTrans.windowRubberShortLength);
					$('#windowRubberUprooted').val(data.qciPanelTrans.windowRubberUprooted);
					$('#testingObservationRemarkPanel').val(data.qciPanelTrans.testingObservationRemark);	
									
				}
		      });
				}
				}
			}
			else if(btn==4){
				if(obj!=null){
				if(obj.qciWindowCellingFlag==1)
				{
					var cfm=confirm("Data for Window & Celling is already updated. Do you want to verify data?");
		    	if(cfm==false){return false;}	
				$.ajax({
				url : "showDataWindowCelling",  //action-name as defined in struts.xml
				dataType: 'json', 
				async:false,
				data : {
					furnishingAssetId: record.furnishingAssetId,
				},
				success:function(data)
				{
					$('#screwMissingLtypeCeiling').val(data.qciWindowCeilingTrans.screwMissingLtypeCeiling);
					$('#screwMissingChipUp').val(data.qciWindowCeilingTrans.screwMissingChipUp);
					$('#doorwayGangwayCeilingAlign').val(data.qciWindowCeilingTrans.doorwayGangwayCeilingAlign);
					$('#doorwayGangwayCeilingDent').val(data.qciWindowCeilingTrans.doorwayGangwayCeilingDent);
					$('#chipupDoorwayGangwayCeiling').val(data.qciWindowCeilingTrans.chipupDoorwayGangwayCeiling);
					$('#excessGapDoorwayLinenroomCeiling').val(data.qciWindowCeilingTrans.excessGapDoorwayLinenroomCeiling);
					$('#taperGapCorridorPartition').val(data.qciWindowCeilingTrans.taperGapCorridorPartition);
					$('#nylonRopeDoorwayCeiling').val(data.qciWindowCeilingTrans.nylonRopeDoorwayCeiling);
					$('#nylonRopeDoorwayCeilingUnlock').val(data.qciWindowCeilingTrans.nylonRopeDoorwayCeilingUnlock);
					$('#doorwayGangwayCeilingKnotted').val(data.qciWindowCeilingTrans.doorwayGangwayCeilingKnotted);
					$('#gapWallceilingPartition').val(data.qciWindowCeilingTrans.gapWallceilingPartition);
					$('#dentWallceilingPartition').val(data.qciWindowCeilingTrans.dentWallceilingPartition);
					$('#epSheetWallceilingPartition').val(data.qciWindowCeilingTrans.epSheetWallceilingPartition);
					$('#excessCutCeiling').val(data.qciWindowCeilingTrans.excessCutCeiling);
					$('#dentMarkNearB').val(data.qciWindowCeilingTrans.dentMarkNearB);
					$('#screwMissingCeiling').val(data.qciWindowCeilingTrans.screwMissingCeiling);
					$('#screwMissingSideCeiling').val(data.qciWindowCeilingTrans.screwMissingSideCeiling);
					$('#screwLooseSideCeiling').val(data.qciWindowCeilingTrans.screwLooseSideCeiling);
					$('#screwUnwantedHole').val(data.qciWindowCeilingTrans.screwUnwantedHole);
					$('#screwCeilingLevel').val(data.qciWindowCeilingTrans.screwCeilingLevel);
					$('#centreDiffuserLevelMismatch').val(data.qciWindowCeilingTrans.centreDiffuserLevelMismatch);
					$('#centreDiffuserLevelBulge').val(data.qciWindowCeilingTrans.centreDiffuserLevelBulge);
					$('#centreDiffuserLockedPrperly').val(data.qciWindowCeilingTrans.centreDiffuserLockedPrperly);
					$('#centreDiffuserLockedMissing').val(data.qciWindowCeilingTrans.centreDiffuserLockedMissing);
					$('#emergencyPullhandlerubbberSited').val(data.qciWindowCeilingTrans.emergencyPullhandlerubbberSited);
					$('#windowGlassCracked').val(data.qciWindowCeilingTrans.windowGlassCracked);
					$('#gapCentreDiffuserSideceiling').val(data.qciWindowCeilingTrans.gapCentreDiffuserSideceiling);
					$('#gapSidewalceilingCentrediffuser').val(data.qciWindowCeilingTrans.gapSidewalceilingCentrediffuser);
					$('#testingObservationRemarkWindowCelling').val(data.qciWindowCeilingTrans.testingObservationRemark);	
									
				}
		      });
				}
				}
			}
			else if(btn==5){
				if(obj!=null){
				if(obj.qciMouldingFlag==1)
				{
					var cfm=confirm("Data for Moulding is already updated. Do you want to verify data?");
		    	if(cfm==false){return false;}	
				$.ajax({
				url : "showDataMoulding",  //action-name as defined in struts.xml
				dataType: 'json', 
				async:false,
				data : {
					furnishingAssetId: record.furnishingAssetId,
				},
				success:function(data)
				{
					$('#endwallDoorCoverLoose').val(data.qciMouldingTrans.endwallDoorCoverLoose);
					$('#endwallDoorCoverMissing').val(data.qciMouldingTrans.endwallDoorCoverMissing);
					$('#endwallDoorCoverTighten').val(data.qciMouldingTrans.endwallDoorCoverTighten);
					$('#endwallDoorSliding').val(data.qciMouldingTrans.endwallDoorSliding);
					$('#endwallRailscrewMissing').val(data.qciMouldingTrans.endwallRailscrewMissing);
					$('#endwallLoose').val(data.qciMouldingTrans.endwallLoose);
					$('#endwallDoorlockAlign').val(data.qciMouldingTrans.endwallDoorlockAlign);
					$('#endwallDoorlockBracketLoose').val(data.qciMouldingTrans.endwallDoorlockBracketLoose);
					$('#manualHandleMovementHard').val(data.qciMouldingTrans.manualHandleMovementHard);
					$('#manualHandleMovementLoose').val(data.qciMouldingTrans.manualHandleMovementLoose);
					$('#manualHandleRusted').val(data.qciMouldingTrans.manualHandleRusted);
					$('#entranceDoorMovement').val(data.qciMouldingTrans.entranceDoorMovement);
					$('#entranceDoorPivotLoose').val(data.qciMouldingTrans.entranceDoorPivotLoose);
					$('#entranceDoorPivotScrewSited').val(data.qciMouldingTrans.entranceDoorPivotScrewSited);
					$('#entranceDoorLockWorking').val(data.qciMouldingTrans.entranceDoorLockWorking);
					$('#entranceDoorLatchMismatch').val(data.qciMouldingTrans.entranceDoorLatchMismatch);
					$('#entranceDoorBottomExcessLength').val(data.qciMouldingTrans.entranceDoorBottomExcessLength);
					$('#entranceDoorGrazingChequerSheet').val(data.qciMouldingTrans.entranceDoorGrazingChequerSheet);
					$('#entranceDoorGrazingRubber').val(data.qciMouldingTrans.entranceDoorGrazingRubber);
					$('#excessPlayEntranceDoorPivot').val(data.qciMouldingTrans.excessPlayEntranceDoorPivot);
					$('#horizontalSteelStripScrewTighten').val(data.qciMouldingTrans.horizontalSteelStripScrewTighten);
					$('#horizontalSteelStripScrewMissing').val(data.qciMouldingTrans.horizontalSteelStripScrewMissing);
					$('#horizontalSteelStripScrewHole').val(data.qciMouldingTrans.horizontalSteelStripScrewHole);
					$('#verticalSteelStripScrewTighten').val(data.qciMouldingTrans.verticalSteelStripScrewTighten);
					$('#verticalSteelStripScrewMissing').val(data.qciMouldingTrans.verticalSteelStripScrewMissing);
					$('#verticalSteelStripScrewHole').val(data.qciMouldingTrans.verticalSteelStripScrewHole);
					$('#horizontalVerticalRubberPasted').val(data.qciMouldingTrans.horizontalVerticalRubberPasted);
					$('#tilliPanelLooseFitted').val(data.qciMouldingTrans.tilliPanelLooseFitted);
					$('#tilliPanelBulge').val(data.qciMouldingTrans.tilliPanelBulge);
					$('#tilliPanelHole').val(data.qciMouldingTrans.tilliPanelHole);
					$('#verticalFrpLooseFitted').val(data.qciMouldingTrans.verticalFrpLooseFitted);
					$('#verticalFrpScrewMissing').val(data.qciMouldingTrans.verticalFrpScrewMissing);
					$('#verticalFrpHole').val(data.qciMouldingTrans.verticalFrpHole);
					$('#verticalFrpScrewTighten').val(data.qciMouldingTrans.verticalFrpScrewTighten);
					$('#horizontalFrpLooseFitted').val(data.qciMouldingTrans.horizontalFrpLooseFitted);
					$('#horizontalFrpScrewMissing').val(data.qciMouldingTrans.horizontalFrpScrewMissing);
					$('#horizontalFrpHole').val(data.qciMouldingTrans.horizontalFrpHole);
					$('#horizontalFrpScrewTighten').val(data.qciMouldingTrans.horizontalFrpScrewTighten);
					$('#verticalfrpHorizontalfrpJointMismatch').val(data.qciMouldingTrans.verticalfrpHorizontalfrpJointMismatch);
					$('#horizontalVerticalFrpEdgeUneven').val(data.qciMouldingTrans.horizontalVerticalFrpEdgeUneven);
					$('#horizontalVerticalFrpPutty').val(data.qciMouldingTrans.horizontalVerticalFrpPutty);
					$('#gapSelfPartition').val(data.qciMouldingTrans.gapSelfPartition);
					$('#flapDoorMovementHard').val(data.qciMouldingTrans.flapDoorMovementHard);
					$('#ZMemberHardwareMissing').val(data.qciMouldingTrans.ZMemberHardwareMissing);
					$('#ZMemberHardwareBurr').val(data.qciMouldingTrans.ZMemberHardwareBurr);
					$('#linenRoomDoorScrewLoose').val(data.qciMouldingTrans.linenRoomDoorScrewLoose);
					$('#linenRoomBinjoScrewMissing').val(data.qciMouldingTrans.linenRoomBinjoScrewMissing);
					$('#linenRoomBinjoScrewLoose').val(data.qciMouldingTrans.linenRoomBinjoScrewLoose);
					$('#linenRoomHaspStapleMissing').val(data.qciMouldingTrans.linenRoomHaspStapleMissing);
					$('#compartmentDoorframeSited').val(data.qciMouldingTrans.compartmentDoorframeSited);
					$('#compartmentDoorhingeScrewLoose').val(data.qciMouldingTrans.compartmentDoorhingeScrewLoose);
					$('#compartmentDoorhingeScrewMissing').val(data.qciMouldingTrans.compartmentDoorhingeScrewMissing);
					$('#compartmentDoorbrushMissing').val(data.qciMouldingTrans.compartmentDoorbrushMissing);
					$('#compartmentDoorstopperWorking').val(data.qciMouldingTrans.compartmentDoorstopperWorking);
					$('#compartmentDoorgrazing').val(data.qciMouldingTrans.compartmentDoorgrazing);
					$('#properFitmentEndwallSaloondoor').val(data.qciMouldingTrans.properFitmentEndwallSaloondoor);
					$('#maxOpeningForceEndwallSaloondoor').val(data.qciMouldingTrans.maxOpeningForceEndwallSaloondoor);
					$('#movementSlidingdoor').val(data.qciMouldingTrans.movementSlidingdoor);
					$('#testingObservationRemarkMoulding').val(data.qciMouldingTrans.testingObservationRemark);	
									
				}
		      });
				}
				}
			}
			else if(btn==6){
				if(obj!=null){
				if(obj.qciSeatBerthFlag==1)
				{
					var cfm=confirm("Data for Seat & Berth is already updated. Do you want to verify data?");
		    	if(cfm==false){return false;}	
				$.ajax({
				url : "showDataSeatBerth",  //action-name as defined in struts.xml
				dataType: 'json', 
				async:false,
				data : {
					furnishingAssetId: record.furnishingAssetId,
				},
				success:function(data)
				{
					$('#protectionWallHardwareLoose').val(data.qciSeatBerthTrans.protectionWallHardwareLoose);
					$('#protectionWallHardwareMissing').val(data.qciSeatBerthTrans.protectionWallHardwareMissing);
					$('#luggageRackLoose').val(data.qciSeatBerthTrans.luggageRackLoose);
					$('#luggageRackTaper').val(data.qciSeatBerthTrans.luggageRackTaper);
					$('#luggageRackMissing').val(data.qciSeatBerthTrans.luggageRackMissing);
					$('#mirrorNotPasted').val(data.qciSeatBerthTrans.mirrorNotPasted);
					$('#mirrorRubberUprooted').val(data.qciSeatBerthTrans.mirrorRubberUprooted);
					$('#coatHookLoose').val(data.qciSeatBerthTrans.coatHookLoose);
					$('#coatHookMissing').val(data.qciSeatBerthTrans.coatHookMissing);
					$('#coatHookApdDone').val(data.qciSeatBerthTrans.coatHookApdDone);
					$('#coatHookApdRoughly').val(data.qciSeatBerthTrans.coatHookApdRoughly);
					$('#curtainMovementSmooth').val(data.qciSeatBerthTrans.curtainMovementSmooth);
					$('#curtainRunnerCameOut').val(data.qciSeatBerthTrans.curtainRunnerCameOut);
					$('#curtainRunnerStopperFitted').val(data.qciSeatBerthTrans.curtainRunnerStopperFitted);
					$('#snackTableLoose').val(data.qciSeatBerthTrans.snackTableLoose);
					$('#snackTableTapper').val(data.qciSeatBerthTrans.snackTableTapper);
					$('#snackTableScrewMissing').val(data.qciSeatBerthTrans.snackTableScrewMissing);
					$('#safetyRailTaper').val(data.qciSeatBerthTrans.safetyRailTaper);
					$('#safetyRailLoose').val(data.qciSeatBerthTrans.safetyRailLoose);
					$('#safetyRailBktLoose').val(data.qciSeatBerthTrans.safetyRailBktLoose);
					$('#safetyRailBktTighten').val(data.qciSeatBerthTrans.safetyRailBktTighten);
					$('#safetyRailBktTaper').val(data.qciSeatBerthTrans.safetyRailBktTaper);
					$('#berthChainLoose').val(data.qciSeatBerthTrans.berthChainLoose);
					$('#berthChainHardwareLoose').val(data.qciSeatBerthTrans.berthChainHardwareLoose);
					$('#berthChainHardwareMissing').val(data.qciSeatBerthTrans.berthChainHardwareMissing);
					$('#bottleHolderLoose').val(data.qciSeatBerthTrans.bottleHolderLoose);
					$('#bottleHolderTaper').val(data.qciSeatBerthTrans.bottleHolderTaper);
					$('#bottoleHolderScrewMissing').val(data.qciSeatBerthTrans.bottoleHolderScrewMissing);
					$('#bottoleHolderScrewDamage').val(data.qciSeatBerthTrans.bottoleHolderScrewDamage);
					$('#berthMountingHardwareSidewallLoose').val(data.qciSeatBerthTrans.berthMountingHardwareSidewallLoose);
					$('#berthMountingHardwareSidewallTaper').val(data.qciSeatBerthTrans.berthMountingHardwareSidewallTaper);
					$('#berthMountingHardwareSidewallMissing').val(data.qciSeatBerthTrans.berthMountingHardwareSidewallMissing);
					$('#berthMountingHardwarePillarLoose').val(data.qciSeatBerthTrans.berthMountingHardwarePillarLoose);
					$('#berthMountingHardwarePillarTaper').val(data.qciSeatBerthTrans.berthMountingHardwarePillarTaper);
					$('#berthMountingHardwarePillarMissing').val(data.qciSeatBerthTrans.berthMountingHardwarePillarMissing);
					$('#berthTapper').val(data.qciSeatBerthTrans.berthTapper);
					$('#berthFlapLoose').val(data.qciSeatBerthTrans.berthFlapLoose);
					$('#berthFlapBulge').val(data.qciSeatBerthTrans.berthFlapBulge);
					$('#flapAlStripExcessLength').val(data.qciSeatBerthTrans.flapAlStripExcessLength);
					$('#flapAlHardwareExcessLength').val(data.qciSeatBerthTrans.flapAlHardwareExcessLength);
					$('#transverseBerthLevel').val(data.qciSeatBerthTrans.transverseBerthLevel);
					$('#gapBackrestBerth').val(data.qciSeatBerthTrans.gapBackrestBerth);
					$('#backrestMovement').val(data.qciSeatBerthTrans.backrestMovement);
					$('#backrestGrazingLadder').val(data.qciSeatBerthTrans.backrestGrazingLadder);
					$('#backrestGrazingPanelseat').val(data.qciSeatBerthTrans.backrestGrazingPanelseat);
					$('#latchCatchMissmatch').val(data.qciSeatBerthTrans.latchCatchMissmatch);
					$('#burrLatchSeat').val(data.qciSeatBerthTrans.burrLatchSeat);
					$('#burrCatchSeat').val(data.qciSeatBerthTrans.burrCatchSeat);
					$('#holePartitionLatchSeat').val(data.qciSeatBerthTrans.holePartitionLatchSeat);
					$('#rexineTornBackrestSeat').val(data.qciSeatBerthTrans.rexineTornBackrestSeat);
					$('#rexineTornBerth').val(data.qciSeatBerthTrans.rexineTornBerth);
					$('#almirahHardwareLoose').val(data.qciSeatBerthTrans.almirahHardwareLoose);
					$('#almirahHardwareMissing').val(data.qciSeatBerthTrans.almirahHardwareMissing);
					$('#towerWorking').val(data.qciSeatBerthTrans.towerWorking);
					$('#almirahWorking').val(data.qciSeatBerthTrans.almirahWorking);
					$('#almirahHole').val(data.qciSeatBerthTrans.almirahHole);
					$('#holeNearBottleHolder').val(data.qciSeatBerthTrans.holeNearBottleHolder);
					$('#holeNearLatchSeat').val(data.qciSeatBerthTrans.holeNearLatchSeat);
					$('#holeNearCatchSeat').val(data.qciSeatBerthTrans.holeNearCatchSeat);
					$('#rexineTornBerthArmrest').val(data.qciSeatBerthTrans.rexineTornBerthArmrest);
					$('#builderPlateScrewMissing').val(data.qciSeatBerthTrans.builderPlateScrewMissing);
					$('#builderPlateScrewMissmatch').val(data.qciSeatBerthTrans.builderPlateScrewMissmatch);
					$('#rexenePastedBacksideBerth').val(data.qciSeatBerthTrans.rexenePastedBacksideBerth);
					$('#testingObservationRemarkSeatBerth').val(data.qciSeatBerthTrans.testingObservationRemark);	
									
				}
		      });
				}
				}
			}
			else if(btn==7){
				if(obj!=null){
				if(obj.qciLavatoryFlag==1)
				{
					var cfm=confirm("Data for Lavatory is already updated. Do you want to verify data?");
		    	if(cfm==false){return false;}	
				$.ajax({
				url : "showDataLavatory",  //action-name as defined in struts.xml
				dataType: 'json', 
				async:false,
				data : {
					furnishingAssetId: record.furnishingAssetId,
				},
				success:function(data)
				{
					$('#loroPipeLoose').val(data.qciLavatoryTrans.loroPipeLoose);
					$('#loroPipeMissing').val(data.qciLavatoryTrans.loroPipeMissing);
					$('#attachmentWailHingeLoose').val(data.qciLavatoryTrans.attachmentWailHingeLoose);
					$('#attachmentWailHingeMissing').val(data.qciLavatoryTrans.attachmentWailHingeMissing);
					$('#attachmentWailHingeDent').val(data.qciLavatoryTrans.attachmentWailHingeDent);
					$('#attachmentWallTowerScrewMissing').val(data.qciLavatoryTrans.attachmentWallTowerScrewMissing);
					$('#attachmentWallTowerBoltDamage').val(data.qciLavatoryTrans.attachmentWallTowerBoltDamage);
					$('#towerBoltFitted').val(data.qciLavatoryTrans.towerBoltFitted);
					$('#towerBoltHole').val(data.qciLavatoryTrans.towerBoltHole);
					$('#soapCaseScrewMissing').val(data.qciLavatoryTrans.soapCaseScrewMissing);
					$('#soapCaseScrewLoose').val(data.qciLavatoryTrans.soapCaseScrewLoose);
					$('#soapCaseScrewTaper').val(data.qciLavatoryTrans.soapCaseScrewTaper);
					$('#lavWashBasinSealed').val(data.qciLavatoryTrans.lavWashBasinSealed);
					$('#lavWashBasinOutside').val(data.qciLavatoryTrans.lavWashBasinOutside);
					$('#avWashBasinInside').val(data.qciLavatoryTrans.avWashBasinInside);
					$('#lavWashBasinRoughlySealed').val(data.qciLavatoryTrans.lavWashBasinRoughlySealed);
					$('#lavWashBasinRoughlyOutside').val(data.qciLavatoryTrans.lavWashBasinRoughlyOutside);
					$('#lavWashBasinRoughlyInside').val(data.qciLavatoryTrans.lavWashBasinRoughlyInside);
					$('#dustbinBoxProvided').val(data.qciLavatoryTrans.dustbinBoxProvided);
					$('#dustbinBoxUnlocked').val(data.qciLavatoryTrans.dustbinBoxUnlocked);
					$('#dustbinBktLoose').val(data.qciLavatoryTrans.dustbinBktLoose);
					$('#dustbikBktScrewMissing').val(data.qciLavatoryTrans.dustbikBktScrewMissing);
					$('#steelDustbinBktLoose').val(data.qciLavatoryTrans.steelDustbinBktLoose);
					$('#wasteBinLoose').val(data.qciLavatoryTrans.wasteBinLoose);
					$('#wasteBinScrewMissing').val(data.qciLavatoryTrans.wasteBinScrewMissing);
					$('#wasteBinScrewDent').val(data.qciLavatoryTrans.wasteBinScrewDent);
					$('#wasteBinCoverPlateRusted').val(data.qciLavatoryTrans.wasteBinCoverPlateRusted);
					$('#wasteBinCoverMagnet').val(data.qciLavatoryTrans.wasteBinCoverMagnet);
					$('#lessScrewWasteBinCover').val(data.qciLavatoryTrans.lessScrewWasteBinCover);
					$('#lessScrewWasteBinCoverGrazing').val(data.qciLavatoryTrans.lessScrewWasteBinCoverGrazing);
					$('#outsideWasteBinLoose').val(data.qciLavatoryTrans.outsideWasteBinLoose);
					$('#outsideWasteBinNotTighten').val(data.qciLavatoryTrans.outsideWasteBinNotTighten);
					$('#sleeveScrewMissing').val(data.qciLavatoryTrans.sleeveScrewMissing);
					$('#sleeveScrewLevel').val(data.qciLavatoryTrans.sleeveScrewLevel);
					$('#sleeveScrewSited').val(data.qciLavatoryTrans.sleeveScrewSited);
					$('#drainPipeLeakage').val(data.qciLavatoryTrans.drainPipeLeakage);
					$('#drainPipeSealed').val(data.qciLavatoryTrans.drainPipeSealed);
					$('#outsideDrainPipeSleeveSited').val(data.qciLavatoryTrans.outsideDrainPipeSleeveSited);
					$('#loroPipehardwareLoose').val(data.qciLavatoryTrans.loroPipehardwareLoose);
					$('#lavatoryDoorPivotLoose').val(data.qciLavatoryTrans.lavatoryDoorPivotLoose);
					$('#lavatoryDoorScrewMissing').val(data.qciLavatoryTrans.lavatoryDoorScrewMissing);
					$('#lavatoryDoorScrewSited').val(data.qciLavatoryTrans.lavatoryDoorScrewSited);
					$('#lavatoryDoorTaperFitted').val(data.qciLavatoryTrans.lavatoryDoorTaperFitted);
					$('#lavatoryDoorTaperSound').val(data.qciLavatoryTrans.lavatoryDoorTaperSound);
					$('#lavatoryDoorFrameCornerSited').val(data.qciLavatoryTrans.lavatoryDoorFrameCornerSited);
					$('#lavatoryDoorFrameCornerGap').val(data.qciLavatoryTrans.lavatoryDoorFrameCornerGap);
					$('#lavatoryDoorHandleLoose').val(data.qciLavatoryTrans.lavatoryDoorHandleLoose);
					$('#lavatoryDoorHandleMissing').val(data.qciLavatoryTrans.lavatoryDoorHandleMissing);
					$('#coathookLavatoryLoose').val(data.qciLavatoryTrans.coathookLavatoryLoose);
					$('#coathookLavatoryMissing').val(data.qciLavatoryTrans.coathookLavatoryMissing);
					$('#engageVacantLockWorking').val(data.qciLavatoryTrans.engageVacantLockWorking);
					$('#engageVacantLockMaleFemaleMismatch').val(data.qciLavatoryTrans.engageVacantLockMaleFemaleMismatch);
					$('#engageVacantLockFemaleLoose').val(data.qciLavatoryTrans.engageVacantLockFemaleLoose);
					$('#engageVacantLockFemaleMissing').val(data.qciLavatoryTrans.engageVacantLockFemaleMissing);
					$('#engageVacantLockMaleLoose').val(data.qciLavatoryTrans.engageVacantLockMaleLoose);
					$('#engageVacantLockMaleMissing').val(data.qciLavatoryTrans.engageVacantLockMaleMissing);
					$('#swingLockCatchLoose').val(data.qciLavatoryTrans.swingLockCatchLoose);
					$('#swingLockCatchLatch').val(data.qciLavatoryTrans.swingLockCatchLatch);
					$('#swingLockCatchHardwareExcessLength').val(data.qciLavatoryTrans.swingLockCatchHardwareExcessLength);
					$('#swingLockCatchHardwareBurr').val(data.qciLavatoryTrans.swingLockCatchHardwareBurr);
					$('#lavatoryDoorCloserScrewTighten').val(data.qciLavatoryTrans.lavatoryDoorCloserScrewTighten);
					$('#lavatoryDoorCloserScrewRusted').val(data.qciLavatoryTrans.lavatoryDoorCloserScrewRusted);
					$('#lavatoryDoorCloserScrewMovement').val(data.qciLavatoryTrans.lavatoryDoorCloserScrewMovement);
					$('#soapDispenserLoose').val(data.qciLavatoryTrans.soapDispenserLoose);
					$('#soapDispenserTaper').val(data.qciLavatoryTrans.soapDispenserTaper);
					$('#soapDispenserMissing').val(data.qciLavatoryTrans.soapDispenserMissing);
					$('#bracketSoapDispenser').val(data.qciLavatoryTrans.bracketSoapDispenser);
					$('#lotahTapStrainerLevel').val(data.qciLavatoryTrans.lotahTapStrainerLevel);
					$('#lotahTapStrainerSealed').val(data.qciLavatoryTrans.lotahTapStrainerSealed);
					$('#lotahTapStrainerRoughlySealed').val(data.qciLavatoryTrans.lotahTapStrainerRoughlySealed);
					$('#lotahTapStrainerScrewMissing').val(data.qciLavatoryTrans.lotahTapStrainerScrewMissing);
					$('#wallHandleCapPasted').val(data.qciLavatoryTrans.wallHandleCapPasted);
					$('#wallHandleScrewLoose').val(data.qciLavatoryTrans.wallHandleScrewLoose);
					$('#panLevelFloorLevel').val(data.qciLavatoryTrans.panLevelFloorLevel);
					$('#panLevelFloorLevelRoughlySealed').val(data.qciLavatoryTrans.panLevelFloorLevelRoughlySealed);
					$('#washBasinHardwareMissing').val(data.qciLavatoryTrans.washBasinHardwareMissing);
					$('#washBasinHardwareTighten').val(data.qciLavatoryTrans.washBasinHardwareTighten);
					$('#washBasinHardwareLoose').val(data.qciLavatoryTrans.washBasinHardwareLoose);
					$('#dentOnModule').val(data.qciLavatoryTrans.dentOnModule);
					$('#dentOnHplSheet').val(data.qciLavatoryTrans.dentOnHplSheet);
					$('#moduleJointNotSealed').val(data.qciLavatoryTrans.moduleJointNotSealed);
					$('#moduleJointRoughlySealed').val(data.qciLavatoryTrans.moduleJointRoughlySealed);
					$('#commodeHardwareLoose').val(data.qciLavatoryTrans.commodeHardwareLoose);
					$('#commodeHardwareMissing').val(data.qciLavatoryTrans.commodeHardwareMissing);
					$('#plasticFilmRemovedCeilingDoor').val(data.qciLavatoryTrans.plasticFilmRemovedCeilingDoor);
					$('#ceilingNotLevel').val(data.qciLavatoryTrans.ceilingNotLevel);
					$('#ceilingHardwareLoose').val(data.qciLavatoryTrans.ceilingHardwareLoose);
					$('#ceilingHardwareDent').val(data.qciLavatoryTrans.ceilingHardwareDent);
					$('#moduleHardwareSidewallLoose').val(data.qciLavatoryTrans.moduleHardwareSidewallLoose);
					$('#mirrorHolderLoose').val(data.qciLavatoryTrans.mirrorHolderLoose);
					$('#mirrorHolderTaper').val(data.qciLavatoryTrans.mirrorHolderTaper);
					$('#mirrorHolderApdDone').val(data.qciLavatoryTrans.mirrorHolderApdDone);
					$('#hopperWindowFrameSited').val(data.qciLavatoryTrans.hopperWindowFrameSited);
					$('#hopperWindowFrameShort').val(data.qciLavatoryTrans.hopperWindowFrameShort);
					$('#hopperWindowFrameExcess').val(data.qciLavatoryTrans.hopperWindowFrameExcess);
					$('#hopperWindowRubberUprooted').val(data.qciLavatoryTrans.hopperWindowRubberUprooted);
					$('#hopperWindowGlassCrack').val(data.qciLavatoryTrans.hopperWindowGlassCrack);
					$('#conditionLavatoryFloorLevel').val(data.qciLavatoryTrans.conditionLavatoryFloorLevel);
					$('#testingObservationRemarkLavatory').val(data.qciLavatoryTrans.testingObservationRemark);	
									
				}
		      });
				}
				}
			}
			 else if(btn==8){
				 if(obj!=null){
				if(obj.qciPlumbingFlag==1)
				{
					var cfm=confirm("Data for Window & Celling is already updated. Do you want to verify data?");
		    	if(cfm==false){return false;}	
				$.ajax({
				url : "showDataPlumbing",  //action-name as defined in struts.xml
				dataType: 'json', 
				async:false,
				data : {
					furnishingAssetId: record.furnishingAssetId,
				},
				success:function(data)
				{
					$('#readingWaterLevelGauge').val(data.qciPlumbingTrans.readingWaterLevelGauge);
					$('#isOsWashbasinTapLoose').val(data.qciPlumbingTrans.isOsWashbasinTapLoose);
					$('#showerHandleLoose').val(data.qciPlumbingTrans.showerHandleLoose);
					$('#showerHandleBroken').val(data.qciPlumbingTrans.showerHandleBroken);
					$('#showerHandleStandScrewLoose').val(data.qciPlumbingTrans.showerHandleStandScrewLoose);
					$('#upperTankUclampRubberMissingLoose').val(data.qciPlumbingTrans.upperTankUclampRubberMissingLoose);
					$('#testingObservationRemarkPlumbing').val(data.qciPlumbingTrans.testingObservationRemark);	
									
				}
		      });
				}
				 }
			}
			 else if(btn==9){
				 if(obj!=null){
					if(obj.qciAirBrakeFlag==1)
					{
						var cfm=confirm("Data for Air Brake is already updated. Do you want to verify data?");
			    	if(cfm==false){return false;}	
					$.ajax({
					url : "showDataAirBrake",  //action-name as defined in struts.xml
					dataType: 'json', 
					async:false,
					data : {
						furnishingAssetId: record.furnishingAssetId,
					},
					success:function(data)
					{
						$('#releasingDeviceChuckLoose').val(data.qciAirBrakeTrans.releasingDeviceChuckLoose);
						$('#releasingDeviceRodFitted').val(data.qciAirBrakeTrans.releasingDeviceRodFitted);
						$('#brakeIndicatorFitted').val(data.qciAirBrakeTrans.brakeIndicatorFitted);
						$('#airHosepipeAngleCookLoose').val(data.qciAirBrakeTrans.airHosepipeAngleCookLoose);
						$('#emergencyPullboxCoverFitted').val(data.qciAirBrakeTrans.emergencyPullboxCoverFitted);
						$('#lavatoryAirPipeClampFitted').val(data.qciAirBrakeTrans.lavatoryAirPipeClampFitted);
						$('#alarmPipeClampFitted').val(data.qciAirBrakeTrans.alarmPipeClampFitted);
						$('#testingObservationRemarkAirBrake').val(data.qciAirBrakeTrans.testingObservationRemark);	
										
					}
			      });
					}
				 }
				}
			 
			 else if(btn==10){
				 if(obj!=null){
					if(obj.qciCoachLoweringFlag==1)
					{
						var cfm=confirm("Data for Coach Lowering is already updated. Do you want to verify data?");
			    	if(cfm==false){return false;}	
					$.ajax({
					url : "showDataCoachLowering",  //action-name as defined in struts.xml
					dataType: 'json', 
					async:false,
					data : {
						furnishingAssetId: record.furnishingAssetId,
					},
					success:function(data)
					{
						$('#testingObservationRemarkCoachLowering').val(data.qciCoachLoweringTrans.testingObservationRemark);	
										
					}
			      });
					}
				 }
				}
			 else if(btn==11){
				 if(obj!=null){
					if(obj.qciPaintFlag==1)
					{
						var cfm=confirm("Data for Paint is already updated. Do you want to verify data?");
			    	if(cfm==false){return false;}	
					$.ajax({
					url : "showDataPaint",  //action-name as defined in struts.xml
					dataType: 'json', 
					async:false,
					data : {
						furnishingAssetId: record.furnishingAssetId,
					},
					success:function(data)
					{
						$('#fitmentDestinationboardNoPlate').val(data.qciPaintTrans.fitmentDestinationboardNoPlate);
						$('#properStencillingLettering').val(data.qciPaintTrans.properStencillingLettering);
						$('#burrBraileSticker').val(data.qciPaintTrans.burrBraileSticker);
						$('#testingObservationRemarkPaint').val(data.qciPaintTrans.testingObservationRemark);	
										
					}
			      });
					}
				 }
				}
			 else if(btn==12){
				 if(obj!=null){
					if(obj.qciCoachCleaningFlag==1)
					{
						var cfm=confirm("Data for Coach Cleaning is already updated. Do you want to verify data?");
			    	if(cfm==false){return false;}	
					$.ajax({
					url : "showDataCoachCleaning",  //action-name as defined in struts.xml
					dataType: 'json', 
					async:false,
					data : {
						furnishingAssetId: record.furnishingAssetId,
					},
					success:function(data)
					{
						$('#floorDirty').val(data.qciCoachCleaningTrans.floorDirty);
						$('#lavatoryDirty').val(data.qciCoachCleaningTrans.lavatoryDirty);
						$('#ceilingDirty').val(data.qciCoachCleaningTrans.ceilingDirty);
						$('#seatBerthDirty').val(data.qciCoachCleaningTrans.seatBerthDirty);
						$('#panelDirty').val(data.qciCoachCleaningTrans.panelDirty);
						$('#storeroomPantryLinenDirty').val(data.qciCoachCleaningTrans.storeroomPantryLinenDirty);
						$('#railsSlidingDoorDirty').val(data.qciCoachCleaningTrans.railsSlidingDoorDirty);
						$('#windowGlassDirty').val(data.qciCoachCleaningTrans.windowGlassDirty);
						$('#plasticFilmRemoved').val(data.qciCoachCleaningTrans.plasticFilmRemoved);
						$('#doorDirty').val(data.qciCoachCleaningTrans.doorDirty);
						$('#testingObservationRemarkCoachCleaning').val(data.qciCoachCleaningTrans.testingObservationRemark);	
										
					}
			      });
					}
				 }
				}
			 else if(btn==13)
				 {
				if(obj!=null){
				// if(Object.keys(obj).length!=0){
					 
					 if(obj.qcifpvcflag!=1){
						 alert("QCI  for Flooring and PVC not submitted");
						 return false;
						 }
					 if(obj.qciPartitionFrameFlag!=1){
						 alert("QCI  for Partition Frame not submitted");
						 return false;
						 }
					 if(obj.qciPanelFlag!=1){
						 alert("QCI  for Panel not submitted");
						 return false;
						 }
					 if(obj.qciWindowCellingFlag!=1){
						 alert("QCI  for Window & Ceiling not submitted");
						 return false;
						 }
					 if(obj.qciMouldingFlag!=1){
						 alert("QCI  for Moulding not submitted");
						 return false;
						 }
					 if(obj.qciSeatBerthFlag!=1){
						 alert("QCI  for Seat & Berth not submitted");
						 return false;
						 }
					 if(obj.qciLavatoryFlag!=1){
						 alert("QCI  for Lavatory not submitted");
						 return false;
						 }
					 if(obj.qciPlumbingFlag!=1){
						 alert("QCI  for Plumbing not submitted");
						 return false;
						 }
					 if(obj.qciAirBrakeFlag!=1){
						 alert("QCI  for Air Brake not submitted");
						 return false;
						 }
					 if(obj.qciCoachLoweringFlag!=1){
						 alert("QCI  for Coach Lowering not submitted");
						 return false;
						 }
					 if(obj.qciPaintFlag!=1){
						 alert("QCI  for Paint not submitted");
						 return false;
						 }
					 if(obj.qciCoachCleaningFlag!=1){
						 alert("QCI  for Coach Cleaning submitted");
						 return false;
						}
						}
				 else
					 {
					 alert("Kindly entered all the data for QCI Test");
					 return false;
					 }
				 }
			 else{
				alert("Do not exist!!!");
			}
			}
		}










		
	</script>