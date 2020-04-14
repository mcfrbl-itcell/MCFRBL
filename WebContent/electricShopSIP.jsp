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
<div id="detailDialog" style="height:150%; width:200%; display:none;z-index: 9;" ></div>
<div id="BatteryTesting" style="height:150%; width:200%; display:none;z-index: 9;" >
<table border="1" cellspacing="0" cellpadding="0">
<tr>
<td colspan="4" align="center"><h2>MODERN COACH FACTORY RAEBARELI</h2></td></tr>
<tr><th>DOC NO:</th><th><input type="text" style="width:100%;" id="BatteryElectricalDocNo" value="MCF/RBL/QEF/6003"></th>
<th>DOC Date:</th><th><input type="text" style="width:100%;" id="BatteryElectricalDocDate"></th>
</tr>
</table>

<table border="1" cellspacing="0" cellpadding="0">
<tr><th>COACH NO</th><td><input type="text" style="width:100%;" id="coachNo" readonly></td>
<th>TYPE OF COACH</th><td><input type="text" style="width:100%;" id="coachType1" readonly></td>
<th>SHELL NO</th><td><input type="text" style="width:100%;" id="shellNo" readonly ></td></tr>
<tr>
<th>DATE</th><td><input type="text" style="width:100%;" id="BatteryElectTestingDate" class="datepicker"></td>
<th>SHIFT</th><td><select name="" id="BatteryElectTestingShift">
<option value="">select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
</select></td>
</tr>
</table>
<table border="1">
<tr>
<TH>Sr no</TH>
<TH>Description of items</TH> 
<TH>Specified</TH>
<TH>Actual Observed</TH>
</tr>
<tr>
<th>1.</th>
<th>FOR LHB AC COACHES ONLY</th>
<th></th>
<th></th>
</tr>
<tr>
<th>a.)</th>
<th align="left">Provision of Battery box<br>Make:<input type="text" id="batteryBoxMake"></th>
<th align="left">As per drg no110113076 700 005,Alt C -01</th>
<th><input type="text" id="batteryBoxMakeActual"></th>
</tr>
<tr>
<th>b.)</th>
<th align="left">Mounting of Battery box</th>
<th align="left">As per drg no<br>110113076 700 001,Alt'a'.<br>1. Hx hd screw M16X70 -06<br>2. Hx hd nut M16 -06<br>3. Plain Washer A17 -12</th>
<th><input type="text" id="mountingBatteryBoxActual"></th>
</tr>
<tr>
<th>c.)</th>
<th align="left">Has battery been commissioned VRLA,SMF,70AH,54 Cells,02V each,Pure lead acid,Tin monoblock,Battery set in 09 modules.<br>MAKE:<input type="text"  align="left" id="batteryCommisionedMake"><br>
<table border="1">
<tr>
<th>SL.NO</th>
<th>Batt.No</th>
<th>Lug Date</th>
</tr>
<tr>
<th>1</th>
<th><input type="text" id="battery1"></th>
<th><input type="text" id="lugDate1" class="datepicker"></th>
</tr>
<tr>
<th>2</th>
<th><input type="text" id="battery2"></th>
<th><input type="text" id="lugDate2" class="datepicker"></th>
</tr>
<tr>
<th>3</th>
<th><input type="text" id="battery3"></th>
<th><input type="text" id="lugDate3" class="datepicker"></th>
</tr>
<tr>
<th>4</th>
<th><input type="text" id="battery4"></th>
<th><input type="text" id="lugDate4" class="datepicker"></th>
</tr>
<tr>
<th>5</th>
<th><input type="text" id="battery5"></th>
<th><input type="text" id="lugDate5" class="datepicker"></th>
</tr>
<tr>
<th>6</th>
<th><input type="text" id="battery6"></th>
<th><input type="text" id="lugDate6" class="datepicker"></th>
</tr>
<tr>
<th>7</th>
<th><input type="text" id="battery7"></th>
<th><input type="text" id="lugDate7" class="datepicker"></th>
</tr>
<tr>
<th>8</th>
<th><input type="text" id="battery8"></th>
<th><input type="text" id="lugDate8" class="datepicker"></th>
</tr>
<tr>
<th>9</th>
<th><input type="text" id="battery9"></th>
<th><input type="text" id="lugDate9" class="datepicker"></th>
</tr>
</table></th>
<th align="left">As per spec RDSO/PE/SPEC/D/TL-00 -09<br>1.Connectors -08<br>2.Fasteners -18<br>3.Plain washer B6 -18<br>4.Spring washers M6 -18<br>5.Battery fixing channel -01<br>6.Hx hd screw M16X50 -02<br>7.Plain washer B17 -02<br>NOTE: Front cover to be closed properly</th>
<th><input type="text" id="batteryCommisionedActual"></th>
</tr>
<tr>
<th>2.</th>
<th colspan="2" align="left">12 cell(3 mono blocks each comprising of 4 cells)Lead acid Battery<br> of 24V/290AH capacity complete with inter cell connector to feed<br> power to the engine starter motor for cranking the engine.<br>
MAKE:<input type="text"  align="left" id="leadAcidBatteryMake"><br>
<table>
<tr>
<td>SL no 1<input type="text" id="leadAcidBatteryMake1"></td>
<td>Lug Date:<input type="text" id="leadAcidBatteryLugDate1" class="datepicker"></td>
</tr>
<tr>
<td>SL no 2<input type="text" id="leadAcidBatteryMake2"></td>
<td>Lug Date:<input type="text" id="leadAcidBatteryLugDate2" class="datepicker"></td>
</tr>
<tr>
<td>SL no 3<input type="text" id="leadAcidBatteryMake3"></td>
<td>Lug Date:<input type="text" id="leadAcidBatteryLugDate3" class="datepicker"></td>
</tr>
</table></th>
<th><input type="text" id="leadAcidBatteryActual"></th>
</tr>
</table>
<p>Testing Status<input type="text" id="testingStatus"></p>
</div>

<!-- //Safety Testing -->
<div id="SafetyTesting" style="height:150%; width:200%; display:none;z-index: 9;" >
<table border="1" cellspacing="0" cellpadding="0">
<tr>
<td colspan="4" align="center"><h2>MODERN COACH FACTORY RAEBARELI</h2></td></tr>
<tr>
<th>DOC NO:</th><td><input type="text" style="width:100%;" id="safetyElectricalDocNo" value="MCF/RBL/QEF/6003"></td>
<th>DOC Date:</th><th><input type="text" style="width:100%;" id="safetyElectricalDocDate"></th>
</tr>
</table>

<table border="1" cellspacing="0" cellpadding="0">
<tr><th>COACH NO</th><td><input type="text" style="width:100%;" id="safetyCoachNo" readonly></td>
<th>TYPE OF COACH</th><td><input type="text" style="width:100%;" id="safetyCoachType1" readonly></td>
<th>SHELL NO</th><td><input type="text" style="width:100%;" id="safetyShellNo" readonly ></td></tr>
<tr>
<th>DATE</th><td><input type="text" style="width:100%;" id="safetyElectTestingDate" class="datepicker"></td>
<th>SHIFT</th><td><select name="" id="safetyElectTestingShift">
<option value="">select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
</select></td>
</tr>
</table>
<table border="1" cellspacing="0" cellpadding="0">
<tr>
<th>ENGINE(M/S)</th><td> <input type="text" name="safetyEngine" id="safetyEngine" ></td>
<th>SL.NO.</th><td><input type="text" name="safetyEngineSlno" id="safetyEngineSlno" ></td>
</tr>
<tr>
<th>ALTERNATOR(M/S)</th><td> <input type="text" name="safetyAlternator" id="safetyAlternator" ></td>
<th>SL.NO.</th><td><input type="text" name="safetyAlternatorSlno" id="safetyAlternatorSlno" ></td>
</tr>
<tr>
<th colspan="4" align="center">SAFETY CHECK</th>
</tr>
<tr>
<th colspan="2">LOW LUBE OIL PRESSURE(LLOP)</th>
<td colspan="2">
<input type="radio" name="lowOilPressure" value="ok" id="lowOilPressure">OK
<input type="radio" name="lowOilPressure" value="notok" id="lowOilPressure">NOT OK
<input type="radio" name="lowOilPressure" value="na" id="lowOilPressure">NA</td>
</tr>
<tr>
<th colspan="2">HIGH WATER TEMP.(HWT) ENGINE</th>
<td colspan="2">
<input type="radio" name="highWaterEngine" value="ok" id="highWaterEngine">OK
<input type="radio" name="highWaterEngine" value="notok" id="highWaterEngine">NOT OK
<input type="radio" name="highWaterEngine" value="na" id="highWaterEngine">NA</td>
</tr>
<tr>
<th colspan="2">LOW WATER COOLENT LEVEL(LWCL)</th>
<td colspan="2">
<input type="radio" name="lowWaterCoolLevel" value="ok" id="lowWaterCoolLevel">OK
<input type="radio" name="lowWaterCoolLevel" value="notok" id="lowWaterCoolLevel">NOT OK
<input type="radio" name="lowWaterCoolLevel" value="na" id="lowWaterCoolLevel">NA</td>
</tr>
<tr>
<th colspan="2">AIR FILTER CHOKE(VFR)</th>
<td colspan="2">
<input type="radio" name="airFilterChoke" value="ok" id="airFilterChoke">OK
<input type="radio" name="airFilterChoke" value="notok" id="airFilterChoke">NOT OK
<input type="radio" name="airFilterChoke" value="na" id="airFilterChoke">NA</td>
</tr>
<tr>
<th colspan="2">ALT EARTH LEAKAGE(AEL)</th>
<td colspan="2">
<input type="radio" name="altEarthLeak" value="ok" id="altEarthLeak">OK
<input type="radio" name="altEarthLeak" value="notok" id="altEarthLeak">NOT OK
<input type="radio" name="altEarthLeak" value="na" id="altEarthLeak">NA</td>
</tr>
<tr>
<th colspan="2">FEEDER EARTH LEAKAGE(FEL)</th>
<td colspan="2">
<input type="radio" name="feederEarthLeak" value="ok" id="feederEarthLeak">OK
<input type="radio" name="feederEarthLeak" value="notok" id="feederEarthLeak">NOT OK
<input type="radio" name="feederEarthLeak" value="na" id="feederEarthLeak">NA</td>
</tr>
<tr>
<th colspan="2">FEEDER OVER LOAD(FOL)</th>
<td colspan="2">
<input type="radio" name="feederOverLoad" value="ok" id="feederOverLoad">OK
<input type="radio" name="feederOverLoad" value="notok" id="feederOverLoad">NOT OK
<input type="radio" name="feederOverLoad" value="na" id="feederOverLoad">NA</td>
</tr>
<tr>
<th colspan="2">BUS COUPLER PERFORMANCE</th>
<td colspan="2">
<input type="radio" name="busCouplerPerformance" value="ok" id="busCouplerPerformance">OK
<input type="radio" name="busCouplerPerformance" value="notok" id="busCouplerPerformance">NOT OK
<input type="radio" name="busCouplerPerformance" value="na" id="busCouplerPerformance">NA</td>
</tr>
<tr>
<th colspan="2">HOOTER</th>
<td colspan="2">
<input type="radio" name="safetyHooter" value="ok" id="safetyHooter">OK
<input type="radio" name="safetyHooter" value="notok" id="safetyHooter">NOT OK
<input type="radio" name="safetyHooter" value="na" id="safetyHooter">NA</td>
</tr>
<tr>
<th colspan="2">UVR FUNCTION</th>
<td colspan="2">
<input type="radio" name="safetyUvrFunction" value="ok" id="safetyUvrFunction">OK
<input type="radio" name="safetyUvrFunction" value="notok" id="safetyUvrFunction">NOT OK
<input type="radio" name="safetyUvrFunction" value="na" id="safetyUvrFunction">NA</td>
</tr>
<tr>
<th colspan="2">OVR FUNCTION</th>
<td colspan="2">
<input type="radio" name="safetyOvrFunction" value="ok" id="safetyOvrFunction">OK
<input type="radio" name="safetyOvrFunction" value="notok" id="safetyOvrFunction">NOT OK
<input type="radio" name="safetyOvrFunction" value="na" id="safetyOvrFunction">NA</td>
</tr>
<tr>
<th colspan="2">AVR FUNCTION</th>
<td colspan="2">
<input type="radio" name="safetyAvrFunction" value="ok" id="safetyAvrFunction">OK
<input type="radio" name="safetyAvrFunction" value="notok" id="safetyAvrFunction">NOT OK
<input type="radio" name="safetyAvrFunction" value="na" id="safetyAvrFunction">NA</td>
</tr>
<tr>
<th colspan="2">EMERGENCY STOP</th>
<td colspan="2">
<input type="radio" name="safetyEmergencyStop" value="ok" id="safetyEmergencyStop">OK
<input type="radio" name="safetyEmergencyStop" value="notok" id="safetyEmergencyStop">NOT OK
<input type="radio" name="safetyEmergencyStop" value="na" id="safetyEmergencyStop">NA</td>
</tr>
<tr>
<th colspan="2">PHASE SEQUENCE TEST</th>
<td colspan="2">
<input type="radio" name="phaseSequenceTest" value="ok" id="phaseSequenceTest">OK
<input type="radio" name="phaseSequenceTest" value="notok" id="phaseSequenceTest">NOT OK
<input type="radio" name="phaseSequenceTest" value="na" id="phaseSequenceTest">NA</td>
</tr>
<tr>
<th colspan="2">STARTER BATTERY CHARGER</th>
<td colspan="2">
<input type="radio" name="starterBatteryCharger" value="ok" id="starterBatteryCharger">OK
<input type="radio" name="starterBatteryCharger" value="notok" id="starterBatteryCharger">NOT OK
<input type="radio" name="starterBatteryCharger" value="na" id="starterBatteryCharger">NA</td>
</tr>
<tr>
<th colspan="2">RAD CONTROL PANNEL</th>
<td colspan="2">
<input type="radio" name="radControlPannel" value="ok" id="radControlPannel">OK
<input type="radio" name="radControlPannel" value="notok" id="radControlPannel">NOT OK
<input type="radio" name="radControlPannel" value="na" id="radControlPannel">NA</td>
</tr>
<tr>
<th colspan="2">RAD FAN PANNEL</th>
<td colspan="2">
<input type="radio" name="radFanMotors" value="ok" id="radFanMotors">OK
<input type="radio" name="radFanMotors" value="notok" id="radFanMotors">NOT OK
<input type="radio" name="radFanMotors" value="na" id="radFanMotors">NA</td>
</tr>
<tr>
<th colspan="2">CAC CONTROL PANNEL</th>
<td colspan="2">
<input type="radio" name="cacControlPannel" value="ok" id="cacControlPannel">OK
<input type="radio" name="cacControlPannel" value="notok" id="cacControlPannel">NOT OK
<input type="radio" name="cacControlPannel" value="na" id="cacControlPannel">NA</td>
</tr>
<tr>
<th colspan="2">CAC MOTORS</th>
<td colspan="2">
<input type="radio" name="cacMotors" value="ok" id="cacMotors">OK
<input type="radio" name="cacMotors" value="notok" id="cacMotors">NOT OK
<input type="radio" name="cacMotors" value="na" id="cacMotors">NA</td>
</tr>
<tr>
<th colspan="2">ELECTRONIC GOVERNOR</th>
<td colspan="2">
<input type="radio" name="electronicGovernor" value="ok" id="electronicGovernor">OK
<input type="radio" name="electronicGovernor" value="notok" id="electronicGovernor">NOT OK
<input type="radio" name="electronicGovernor" value="na" id="electronicGovernor">NA</td>
</tr>
<tr>
<th colspan="4" align="center">INDICATION LAMP</th>
</tr>
<tr>
<th colspan="2">DC "ON"</th>
<td colspan="2">
<input type="radio" name="safetyDcOn" value="ok" id="safetyDcOn">OK
<input type="radio" name="safetyDcOn" value="notok" id="safetyDcOn">NOT OK
<input type="radio" name="safetyDcOn" value="na" id="safetyDcOn">NA</td>
</tr>
<tr>
<th colspan="2">AEL</th>
<td colspan="2">
<input type="radio" name="safetyAel" value="ok" id="safetyAel">OK
<input type="radio" name="safetyAel" value="notok" id="safetyAel">NOT OK
<input type="radio" name="safetyAel" value="na" id="safetyAel">NA</td>
</tr>
<tr>
<th colspan="2">FEL</th>
<td colspan="2">
<input type="radio" name="safetyFel" value="ok" id="safetyFel">OK
<input type="radio" name="safetyFel" value="notok" id="safetyFel">NOT OK
<input type="radio" name="safetyFel" value="na" id="safetyFel">NA</td>
</tr>
<tr>
<th colspan="2">FOL(From Relay)</th>
<td colspan="2">
<input type="radio" name="safetyFol" value="ok" id="safetyFol">OK
<input type="radio" name="safetyFol" value="notok" id="safetyFol">NOT OK
<input type="radio" name="safetyFol" value="na" id="safetyFol">NA</td>
</tr>
<tr>
<th colspan="2">UVR</th>
<td colspan="2">
<input type="radio" name="safetyUvr" value="ok" id="safetyUvr">OK
<input type="radio" name="safetyUvr" value="notok" id="safetyUvr">NOT OK
<input type="radio" name="safetyUvr" value="na" id="safetyUvr">NA</td>
</tr>
<tr>
<th colspan="2">FAULT</th>
<td colspan="2">
<input type="radio" name="safetyFault" value="ok" id="safetyFault">OK
<input type="radio" name="safetyFault" value="notok" id="safetyFault">NOT OK
<input type="radio" name="safetyFault" value="na" id="safetyFault">NA</td>
</tr>
<tr>
<th colspan="2">ALT ON</th>
<td colspan="2">
<input type="radio" name="safetyAltOn" value="ok" id="safetyAltOn">OK
<input type="radio" name="safetyAltOn" value="notok" id="safetyAltOn">NOT OK
<input type="radio" name="safetyAltOn" value="na" id="safetyAltOn">NA</td>
</tr>
<tr>
<th colspan="2">TFR A ON</th>
<td colspan="2">
<input type="radio" name="safetyTfrAOn" value="ok" id="safetyTfrAOn">OK
<input type="radio" name="safetyTfrAOn" value="notok" id="safetyTfrAOn">NOT OK
<input type="radio" name="safetyTfrAOn" value="na" id="safetyTfrAOn">NA</td>
</tr>
<tr>
<th colspan="2">SAFETY LOOP "A" ON</th>
<td colspan="2">
<input type="radio" name="safetyLoopAOn" value="ok" id="safetyLoopAOn">OK
<input type="radio" name="safetyLoopAOn" value="notok" id="safetyLoopAOn">NOT OK
<input type="radio" name="safetyLoopAOn" value="na" id="safetyLoopAOn">NA</td>
</tr>
<tr>
<th colspan="2">SAFETY LOOP "B" ON</th>
<td colspan="2">
<input type="radio" name="safetyLoopBOn" value="ok" id="safetyLoopBOn">OK
<input type="radio" name="safetyLoopBOn" value="notok" id="safetyLoopBOn">NOT OK
<input type="radio" name="safetyLoopBOn" value="na" id="safetyLoopBOn">NA</td>
</tr>
<tr>
<th colspan="2">FEEDER "A" ON</th>
<td colspan="2">
<input type="radio" name="safetyFeederAOn" value="ok" id="safetyFeederAOn">OK
<input type="radio" name="safetyFeederAOn" value="notok" id="safetyFeederAOn">NOT OK
<input type="radio" name="safetyFeederAOn" value="na" id="safetyFeederAOn">NA</td>
</tr>
<tr>
<th colspan="2">FEEDER "B" ON</th>
<td colspan="2">
<input type="radio" name="safetyFeederBOn" value="ok" id="safetyFeederBOn">OK
<input type="radio" name="safetyFeederBOn" value="notok" id="safetyFeederBOn">NOT OK
<input type="radio" name="safetyFeederBOn" value="na" id="safetyFeederBOn">NA</td>
</tr>
<tr>
<th colspan="2">BUS COUPLER ON</th>
<td colspan="2">
<input type="radio" name="safetyBusCouplerOn" value="ok" id="safetyBusCouplerOn">OK
<input type="radio" name="safetyBusCouplerOn" value="notok" id="safetyBusCouplerOn">NOT OK
<input type="radio" name="safetyBusCouplerOn" value="na" id="safetyBusCouplerOn">NA</td>
</tr>
<tr>
<th colspan="2">24V DC</th>
<td colspan="2">
<input type="radio" name="safety24vDc" value="ok" id="safety24vDc">OK
<input type="radio" name="safety24vDc" value="notok" id="safety24vDc">NOT OK
<input type="radio" name="safety24vDc" value="na" id="safety24vDc">NA</td>
</tr>
<tr>
<th colspan="2">BATT CHARGER DEFECTIVE</th>
<td colspan="2">
<input type="radio" name="battChargerDefect" value="ok" id="battChargerDefect">OK
<input type="radio" name="battChargerDefect" value="notok" id="battChargerDefect">NOT OK
<input type="radio" name="battChargerDefect" value="na" id="battChargerDefect">NA</td>
</tr>
<tr>
<th colspan="2">NON WORKING CONTRACTOR "A"</th>
<td colspan="2">
<input type="radio" name="nonWorkingContractorA" value="ok" id="nonWorkingContractorA">OK
<input type="radio" name="nonWorkingContractorA" value="notok" id="nonWorkingContractorA">NOT OK
<input type="radio" name="nonWorkingContractorA" value="na" id="nonWorkingContractorA">NA</td>
</tr>
<tr>
<th colspan="2">ACB "A" ON</th>
<td colspan="2">
<input type="radio" name="acbAOn" value="ok" id="acbAOn">OK
<input type="radio" name="acbAOn" value="notok" id="acbAOn">NOT OK
<input type="radio" name="acbAOn" value="na" id="acbAOn">NA</td>
</tr>
<tr>
<th colspan="2">TEST LAMP INDICATIONS ON</th>
<td colspan="2">
<input type="radio" name="testLampIndicationOn" value="ok" id="testLampIndicationOn">OK
<input type="radio" name="testLampIndicationOn" value="notok" id="testLampIndicationOn">NOT OK
<input type="radio" name="testLampIndicationOn" value="na" id="testLampIndicationOn">NA</td>
</tr>
</table>
<p>Testing Status<input type="text" id="safetyTestingStatus"></p>
</div>  
<!-- current testing -->
<div id="CurrentDetailsTesting" style="height:150%; width:200%; display:none;z-index: 9;">
<table border="1" cellspacing="0" cellpadding="0">
<tr>
<td colspan="4" align="center"><h2>MODERN COACH FACTORY RAEBARELI</h2></td></tr>
<tr>
<th>DOC NO:</th><td><input type="text" style="width:100%;" id="currentElectricalDocNo" value="MCF/RBL/QEF/6003"></td>
<th>DOC Date:</th><td><input type="text" style="width:100%;" id="currentElectricalDocDate"/></td>
</tr>
</table>
<table border="1" cellspacing="0" cellpadding="0">
<tr><th>COACH NO</th><td><input type="text" style="width:100%;" id="currentCoachNo" readonly></td>
<th>TYPE OF COACH</th><td><input type="text" style="width:100%;" id="currentCoachType1" readonly></td>
<th>SHELL NO</th><td><input type="text" style="width:100%;" id="currentShellNo" readonly ></td></tr>
<tr>
<th>DATE</th><td><input type="text" style="width:100%;" id="currentElectTestingDate" class="datepicker"></td>
<th>SHIFT</th><td><select name="" id="currentElectTestingShift">
<option value="">select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
</select></td>
</tr>
</table>
<table border="1">
<tr><td>AC unit make</td><td><input type="text" id="acUnitMake"></td><td>Unit 1</td><td><input type="text" id="acUnit1"></td><td>Unit 2</td><td><input type="text" id="acUnit2"></td></tr>
<tr><td>CPU SL.NO.</td><td><input type="text" id="cpuSlNo"></td><td>CPU Make</td><td><input type="text" id="cpuMake"></td></tr>
</table>
<table border="1">
<tr><td rowspan="2">01.</td><td colspan="5">AIR CONDITIONING EQUIPMENTS:</td></tr>
<tr><th>Description</th><th>Specified</th><th colspan="3">Actual observed(In Amp.)</th></tr>
<tr><th>1.1</th><th>AC Plant-1(NPP)</th><th>SIDEWAL/LEEL/AMIT/SSK/D.RAM/INTEC/FEEL</th><th>R</th><th>Y</th><th>B</th></tr>
<tr><th>1.1.1</th><th>BLR</th><td>1.4A-1.8A</td><td><input type="text" id="blrR"></td><td><input type="text" id="blrY"></td><td><input type="text" id="blrB"></td></tr>
<tr><th>1.1.2</th><th>CD-1</th><td rowspan="2">1.2A-1.6A</td><td><input type="text" id="cd1R"></td><td><input type="text" id="cd1Y"></td><td><input type="text" id="cd1B"></td></tr>
<tr><th>1.1.3</th><th>CD-2</th><td><input type="text" id="cd2R"></td><td><input type="text" id="cd2Y"></td><td><input type="text" id="cd2B"></td></tr>
<tr><th>1.1.4</th><th>CP-1</th><td rowspan="2">7.5A-10.0A</td><td><input type="text" id="cp1R"></td><td><input type="text" id="cp1Y"></td><td><input type="text" id="cp1B"></td></tr>
<tr><th>1.1.5</th><th>CP-2</th><td><input type="text" id="cp2R"></td><td><input type="text" id="cp2Y"></td><td><input type="text" id="cp2B"></td></tr>
<tr><th>1.1.6</th><th>HTR-1</th><td rowspan="2">7.9-8.5A</td><td><input type="text" id="htr1R"></td><td><input type="text" id="htr1Y"></td><td><input type="text" id="htr1B"></td></tr>
</table>
<table border="1" style:width=100%>
<tr><th>2.0</th><th>Description </th><th colspan="2" align="center">Spcified<br>Load current(1.2Amps)</th><th colspan="3" align="center">Actual observed<br>(In Amp)</th></tr>
<tr><th></th><th>Mono-block pumps</th><th>KALSI/KIND</th><th>D.R AUTO</th><th>R</th><th>Y</th><th>B</th></tr>
<tr><td>2.1</td><td><input type="text" id="monoBlockPump1"></td><td><input type="text" id="kalsi1"></td><td><input type="text" id="drAuto1"></td><td><input type="text" id="rActual1"></td><td><input type="text" id="yActual1"></td><td><input type="text" id="bActual1"></td></tr>
<tr><td>2.2</td><td><input type="text"id="monoBlockPump2"></td><td><input type="text" id="kalsi2"></td><td><input type="text" id="drAuto2"></td><td><input type="text" id="rActual2"></td><td><input type="text" id="yActual2"></td><td><input type="text" id="bActual2"></td></tr>
</table>
<p>Testing Status<input type="text" id="currentTestingStatus"></p>
</div>    
</body>
<script type="text/javascript">
var shellArray=[];
		$(document).ready(function() {
			
			var prevStage='<%=previousStage%>';
		
			
			
	    
	    
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
			$(".datepicker").datepicker({
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
			
			title : 'Furnishing Shop Production',
			
			paging:true,
            sorting: true,
            defaultSorting: 'furnishingAssetId ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      //Create toolbat
         toolbar:{
        	 items: [
        		 
        		 {
                 	//First toolbar entry
                     	icon: '<%=contextpath%>/images/rs_out.png',
                         text: 'Elec Stage-III',
                         click: function () {
                        	
                         	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                     	 	 if ($selectedRows.length<1)
                     		 alert("Please select a row for which you want to add EE Stage-III Testing");
                     	 	 else{
                     	 		var record;
                     	 		$selectedRows.each(function () {
                                     record = $(this).data('record');
                                     });
                         	var wWidth = $(window).width();
                 			var dWidth = wWidth * 0.9;
                 			var wheight = $(window).height();
                 			var dheight = wheight * 0.9;
                 			var furnishingAssetId=record.furnishingAssetId;
                 			var coachType=record.coachType;
                 			var shellAssetId=record.shellAssetId;
                 			var testType="Electrical Stage-III";
                 			var docNo="MCF/RBL/QEF/6001"
                 			var URL="add_testing_for_electric_shop?assetId="+furnishingAssetId+"&testingType="+encodeURI(testType)+"&coachType="+coachType+"&docNo="+docNo;
                 			
                 					var diagtitle="Add Electric Stage-III Testing for  Shell ="+search(shellAssetId);
                 					$( "#detailDialog" ).load( URL ).dialog({
										title: diagtitle,
										modal:true,
										height: dheight, 
										width: dWidth,
										closeOnEscape:true,
										Close: function () {
				                        	
											 $('#FurnishingProductionTableContainer').jtable().jtable('load');
											
	                                    }
										
                                
										}).prev(".ui-dialog-titlebar").css("background","blue").dialog("open");
                 		                    	 	 }
     						 
                         }
                     }, 
        		 
        		 
                     //2nd icon
                     {
                  		
                      	//Second toolbar entry
                          	icon: '<%=contextpath%>/images/rs_out.png',
                              text: 'Elec Stage-IIIA',
                              click: function () {
                             	
                              	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                          	 	 if ($selectedRows.length<1)
                          		 alert("Please select a row for which you want to add EE Stage-IIIA Testing");
                          	 	 else{
                          	 		var record;
                          	 		$selectedRows.each(function () {
                                          record = $(this).data('record');
                                          });
                              	var wWidth = $(window).width();
                      			var dWidth = wWidth * 0.9;
                      			var wheight = $(window).height();
                      			var dheight = wheight * 0.9;
                      			var furnishingAssetId=record.furnishingAssetId;
                      			var coachType=record.coachType;
                      			var shellAssetId=record.shellAssetId;
                      			var testType="Electrical Stage-IIIA";
                      			var docNo="MCF/RBL/QEF/6001A"
                      			var URL="add_testing_for_electric_shop?assetId="+furnishingAssetId+"&testingType="+encodeURI(testType)+"&coachType="+coachType+"&docNo="+docNo;
                      			
                      					var diagtitle="Add Electric Stage-IIIA Testing for  Shell ="+search(shellAssetId);
                      					
                      					$( "#detailDialog" ).load( URL ).dialog({
     										title: diagtitle,
     										modal:true,
     										height: dheight, 
     										width: dWidth,
     										closeOnEscape:true,
     										Close: function () {
     				                        	
     											 $('#FurnishingProductionTableContainer').jtable().jtable('load');
     											
     	                                    }
     										
                                     
     										}).prev(".ui-dialog-titlebar").css("background","blue").dialog("open");
                      		                    	 	 }
          						 
                              }
                          }, 
                          
                          
                          //3rd icon
                          {
                       		
                           	//Third toolbar entry
                               	icon: '<%=contextpath%>/images/rs_out.png',
                                   text: 'Elec Stage Testing',
                                   click: function () {
                                  	
                                   	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                               	 	 if ($selectedRows.length<1)
                               		 alert("Please select a row for which you want to add EE Stage Testing");
                               	 	 else{
                               	 		var record;
                               	 		$selectedRows.each(function () {
                                               record = $(this).data('record');
                                               });
                                   	var wWidth = $(window).width();
                           			var dWidth = wWidth * 0.9;
                           			var wheight = $(window).height();
                           			var dheight = wheight * 0.9;
                           			var furnishingAssetId=record.furnishingAssetId;
                           			var coachType=record.coachType;
                           			var shellAssetId=record.shellAssetId;
                           			var testType="STAGE TESTING";
                           			var docNo="MCF/RBL/QEF/6002A"
                           			var URL="add_testing_for_electric_shop?assetId="+furnishingAssetId+"&testingType="+encodeURI(testType)+"&coachType="+coachType+"&docNo="+docNo;
                           			
                           					var diagtitle="Add Electric Stage Testing for  Shell ="+search(shellAssetId);
                           					
                           					$( "#detailDialog" ).load( URL ).dialog({
          										title: diagtitle,
          										modal:true,
          										height: dheight, 
          										width: dWidth,
          										closeOnEscape:true,
          										Close: function () {
          				                        	
          											 $('#FurnishingProductionTableContainer').jtable().jtable('load');
          											
          	                                    }
          										
                                          
          										}).prev(".ui-dialog-titlebar").css("background","blue").dialog("open");
                           		                    	 	 }
               						 
                                   }
                               }, 
                               //4th toolbar
                               {
                              		
                                  	//fourth toolbar entry
                                      	icon: '<%=contextpath%>/images/rs_out.png',
                                          text: 'WSP',
                                          click: function () {
                                         	
                                          	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                                      	 	 if ($selectedRows.length<1)
                                      		 alert("Please select a row for which you want to add EE Stage Testing");
                                      	 	 else{
                                      	 		var record;
                                      	 		$selectedRows.each(function () {
                                                      record = $(this).data('record');
                                                      });
                                          	var wWidth = $(window).width();
                                  			var dWidth = wWidth * 0.9;
                                  			var wheight = $(window).height();
                                  			var dheight = wheight * 0.9;
                                  			var furnishingAssetId=record.furnishingAssetId;
                                  			var coachType=record.coachType;
                                  			var shellAssetId=record.shellAssetId;
                                  			var testType="WHEEL SLIDE PROTECTION SYSTEM";
                                  			var docNo="MCF/RBL/QEF/6004"
                                  			var URL="add_testing_for_electric_shop?assetId="+furnishingAssetId+"&testingType="+encodeURI(testType)+"&coachType="+coachType+"&docNo="+docNo;
                                  			
                                  					var diagtitle="Add Electric Stage Testing for  Shell ="+search(shellAssetId);
                                  					
                                  					$( "#detailDialog" ).load( URL ).dialog({
                 										title: diagtitle,
                 										modal:true,
                 										height: dheight, 
                 										width: dWidth,
                 										closeOnEscape:true,
                 										Close: function () {
                 				                        	
                 											 $('#FurnishingProductionTableContainer').jtable().jtable('load');
                 											
                 	                                    }
                 										
                                                 
                 										}).prev(".ui-dialog-titlebar").css("background","blue").dialog("open");
                                  		                    	 	 }
                      						 
                                          }
                                      }, 
                                      {
                                    		
                                        	// 5thtoolbar entry
                                            	icon: '<%=contextpath%>/images/rs_out.png',
                                                text: 'Functional Test',
                                                click: function () {
                                               	
                                                	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                                            	 	 if ($selectedRows.length<1)
                                            		 alert("Please select a row for which you want to add EE Stage Testing");
                                            	 	 else{
                                            	 		var record;
                                            	 		$selectedRows.each(function () {
                                                            record = $(this).data('record');
                                                            });
                                                	var wWidth = $(window).width();
                                        			var dWidth = wWidth * 0.9;
                                        			var wheight = $(window).height();
                                        			var dheight = wheight * 0.9;
                                        			var furnishingAssetId=record.furnishingAssetId;
                                        			var coachType=record.coachType;
                                        			var shellAssetId=record.shellAssetId;
                                        			var testType="FUNCTIONAL TEST";
                                        			var docNo="MCF/RBL/QEF/6006"
                                        			var URL="add_testing_for_electric_shop?assetId="+furnishingAssetId+"&testingType="+encodeURI(testType)+"&coachType="+coachType+"&docNo="+docNo;
                                        			
                                        					var diagtitle="Add Electric Stage Testing for  Shell ="+search(shellAssetId);
                                        					
                                        					$( "#detailDialog" ).load( URL ).dialog({
                       										title: diagtitle,
                       										modal:true,
                       										height: dheight, 
                       										width: dWidth,
                       										closeOnEscape:true,
                       										Close: function () {
                       				                        	
                       											 $('#FurnishingProductionTableContainer').jtable().jtable('load');
                       											
                       	                                    }
                       										
                                                       
                       										}).prev(".ui-dialog-titlebar").css("background","blue").dialog("open");
                                        		                    	 	 }
                            						 
                                                }
                                            },
                                            
                                            {
                                        		
                                            	// 6thtoolbar entry
                                                	icon: '<%=contextpath%>/images/rs_out.png',
                                                    text: 'Rolling Stock Certificate',
                                                    click: function () {
                                                   	
                                                    	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                                                	 	 if ($selectedRows.length<1)
                                                		 alert("Please select a row for which you want to add EE Stage Testing");
                                                	 	 else{
                                                	 		var record;
                                                	 		$selectedRows.each(function () {
                                                                record = $(this).data('record');
                                                                });
                                                    	var wWidth = $(window).width();
                                            			var dWidth = wWidth * 0.9;
                                            			var wheight = $(window).height();
                                            			var dheight = wheight * 0.9;
                                            			var furnishingAssetId=record.furnishingAssetId;
                                            			var coachType=record.coachType;
                                            			var shellAssetId=record.shellAssetId;
                                            			var testType="Rolling Stock Certificate";
                                            			var docNo="MCF/RBL/QEF/8001"
                                            			var URL="add_testing_for_electric_shop?assetId="+furnishingAssetId+"&testingType="+encodeURI(testType)+"&coachType="+coachType+"&docNo="+docNo;
                                            			
                                            					var diagtitle="Add Electric Stage Testing for  Shell ="+search(shellAssetId);
                                            					
                                            					$( "#detailDialog" ).load( URL ).dialog({
                           										title: diagtitle,
                           										modal:true,
                           										height: dheight, 
                           										width: dWidth,
                           										closeOnEscape:true,
                           										Close: function () {
                           				                        	
                           											 $('#FurnishingProductionTableContainer').jtable().jtable('load');
                           											
                           	                                    }
                           										
                                                           
                           										}).prev(".ui-dialog-titlebar").css("background","blue").dialog("open");
                                            		                    	 	 }
                                						 
                                                    }
                                                }, 
                                                {
                                            		
                                                	// 7thtoolbar entry
                                                    	icon: '<%=contextpath%>/images/rs_out.png',
                                                        text: 'Stage XI',
                                                        click: function () {
                                                       	
                                                        	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                                                    	 	 if ($selectedRows.length<1)
                                                    		 alert("Please select a row for which you want to add EE Stage Testing");
                                                    	 	 else{
                                                    	 		var record;
                                                    	 		$selectedRows.each(function () {
                                                                    record = $(this).data('record');
                                                                    });
                                                        	var wWidth = $(window).width();
                                                			var dWidth = wWidth * 0.9;
                                                			var wheight = $(window).height();
                                                			var dheight = wheight * 0.9;
                                                			var furnishingAssetId=record.furnishingAssetId;
                                                			var coachType=record.coachType;
                                                			var shellAssetId=record.shellAssetId;
                                                			var testType="Electrical Stage-IX";
                                                			var docNo="MCF/RBL/QEF/6002"
                                                			var URL="add_testing_for_electric_shop?assetId="+furnishingAssetId+"&testingType="+encodeURI(testType)+"&coachType="+coachType+"&docNo="+docNo;
                                                			
                                                					var diagtitle="Add Electric Stage Testing for  Shell ="+search(shellAssetId);
                                                					
                                                					$( "#detailDialog" ).load( URL ).dialog({
                               										title: diagtitle,
                               										modal:true,
                               										height: dheight, 
                               										width: dWidth,
                               										closeOnEscape:true,
                               										Close: function () {
                               				                        	
                               											 $('#FurnishingProductionTableContainer').jtable().jtable('load');
                               											
                               	                                    }
                               										
                                                               
                               										}).prev(".ui-dialog-titlebar").css("background","blue").dialog("open");
                                                		                    	 	 }
                                    						 
                                                        }
                                                    }, 
                               //8th icon
                               
                             { 
                               icon: '<%=contextpath%>/images/rs_out.png',
                               text: 'BatteryTesting',
                               click: function () {
                               	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                           	 	 if ($selectedRows.length<1)
                           		 alert("Please select a row for which you want to Inspect");
                           	 	 else{
                           	 		var record;
                           	 		$selectedRows.each(function () {
                                           record = $(this).data('record');
                                           });
                           	 		
                           	 	
                           	 		//show pre existing data
                           	 		$.ajax({
           								url:"showExistingBatteryData", //action-name as defined in struts.xml
           								dataType:'json',
           								type:'POST',
           								async:false,
           								data:{
           								furnishingAssetId:record.furnishingAssetId,
           								testingType:"Battery Testing",
           								},
           								success:function(data)
           								{
           									
           									$('#BatteryElectricalDocNo').val(data.elecTestTransactionPrimaryData.electricalDocNo);
           									$('#BatteryElectricalDocDate').val(data.elecTestTransactionPrimaryData.docDate);
           									$('#BatteryElectTestingShift').val(data.elecTestTransactionPrimaryData.testingShift);
           									//alert("hiee");
           									var batteryDate=(data.elecTestTransactionPrimaryData.testingDate).substring(0,10);
    										var batteryDateArray=batteryDate.split("-");
    										$('#BatteryElectTestingDate').datepicker("setDate",new Date(batteryDateArray[0],batteryDateArray[1]-1,batteryDateArray[2]));
           									$('#testingStatus').val(data.elecTestTransactionPrimaryData.testingStatus);
           									$('#coachNo').val(data.furnishingTransaction.coachNumber);
           									$('#coachType1').val(data.furnishingTransaction.coachType);
           									$('#shellNo').val(data.shellTransaction.shellNumber);
           									
           								}
           									
           								});
                           	 	
           								
                           	 		
                           	 		if(record.electricalBatteryTestingFlag==1)
       								{
                           	 		
       								$.ajax({
       									url:"showSaveDataBatteryTesting", //action-name as defined in struts.xml
       									dataType:'json',
       									type:'POST',
       									async:false,
       									data:{
       									furnishingAssetId:record.furnishingAssetId,	
       									},
       									success:function(data)
       									{
       										/*  $('#coachNo').val(data.furnishingTransaction.coachNumber); 
       										$('#coachType1').val(data.furnishingTransaction.coachType);
       										$('#shellNo').val(data.shellTransaction.shellNumber);
       										 */
       										$('#batteryBoxMake').val(data.electBatteryTestTrans.batteryBoxMake);                   							
                   							$('#batteryBoxMakeActual').val(data.electBatteryTestTrans.batteryBoxMakeActual);             							
                   							$('#mountingBatteryBoxActual').val(data.electBatteryTestTrans.mountingBatteryBoxActual);
                   							$('#batteryCommisionedMake').val(data.electBatteryTestTrans.batteryCommisionedActual);
                   							$('#battery1').val(data.electBatteryTestTrans.battery1);
                   							var date1=(data.electBatteryTestTrans.lugDate1).substring(0,10);
    										var date1Array=date1.split("-");
    										$('#lugDate1').datepicker("setDate",new Date(date1Array[0],date1Array[1]-1,date1Array[2]));
                   							
                   							$('#battery2').val(data.electBatteryTestTrans.battery2);
                   							var date2=(data.electBatteryTestTrans.lugDate2).substring(0,10);
    										var date2Array=date2.split("-");
    										$('#lugDate2').datepicker("setDate",new Date(date2Array[0],date2Array[1]-1,date2Array[2]));
    										
                   							$('#battery3').val(data.electBatteryTestTrans.battery3);
                   							var date3=(data.electBatteryTestTrans.lugDate3).substring(0,10);
    										var date3Array=date3.split("-");
    										$('#lugDate3').datepicker("setDate",new Date(date3Array[0],date3Array[1]-1,date3Array[2]));
    										
                   							$('#battery4').val(data.electBatteryTestTrans.battery4);
                   							var date4=(data.electBatteryTestTrans.lugDate4).substring(0,10);
    										var date4Array=date4.split("-");
    										$('#lugDate4').datepicker("setDate",new Date(date4Array[0],date4Array[1]-1,date4Array[2]));
    										
                   							$('#battery5').val(data.electBatteryTestTrans.battery5);
                   							var date5=(data.electBatteryTestTrans.lugDate5).substring(0,10);
    										var date5Array=date5.split("-");
    										$('#lugDate5').datepicker("setDate",new Date(date5Array[0],date5Array[1]-1,date5Array[2]));
    										
                   							$('#battery6').val(data.electBatteryTestTrans.battery6);
                   							var date6=(data.electBatteryTestTrans.lugDate6).substring(0,10);
    										var date6Array=date6.split("-");
    										$('#lugDate6').datepicker("setDate",new Date(date6Array[0],date6Array[1]-1,date6Array[2]));
                   							
                   							$('#battery7').val(data.electBatteryTestTrans.battery7);
                   							var date7=(data.electBatteryTestTrans.lugDate7).substring(0,10);
    										var date7Array=date7.split("-");
    										$('#lugDate7').datepicker("setDate",new Date(date7Array[0],date7Array[1]-1,date7Array[2]));
                   							
                   							$('#battery8').val(data.electBatteryTestTrans.battery8);
                   							var date8=(data.electBatteryTestTrans.lugDate8).substring(0,10);
    										var date8Array=date8.split("-");
    										$('#lugDate8').datepicker("setDate",new Date(date8Array[0],date8Array[1]-1,date8Array[2]));
                   						
                   							$('#battery9').val(data.electBatteryTestTrans.battery9);
                   							var date9=(data.electBatteryTestTrans.lugDate9).substring(0,10);
    										var date9Array=date9.split("-");
    										$('#lugDate9').datepicker("setDate",new Date(date9Array[0],date9Array[1]-1,date9Array[2]));
                   							
                   							$('#batteryCommisionedActual').val(data.electBatteryTestTrans.batteryCommisionedActual);
                   							$('#leadAcidBatteryMake').val(data.electBatteryTestTrans.leadAcidBatteryMake);
                   							$('#leadAcidBatteryMake1').val(data.electBatteryTestTrans.leadAcidBatteryMake1);
                   							
                   							var date10=(data.electBatteryTestTrans.leadAcidBatteryLugDate1).substring(0,10);
    										var date10Array=date10.split("-");
    										$('#leadAcidBatteryLugDate1').datepicker("setDate",new Date(date10Array[0],date10Array[1]-1,date10Array[2]));
                   							$('#leadAcidBatteryMake2').val(data.electBatteryTestTrans.leadAcidBatteryMake2);
                   							
                   							var date11=(data.electBatteryTestTrans.leadAcidBatteryLugDate2).substring(0,10);
    										var date11Array=date11.split("-");
    										$('#leadAcidBatteryLugDate2').datepicker("setDate",new Date(date11Array[0],date11Array[1]-1,date11Array[2]));
                   							$('#leadAcidBatteryMake3').val(data.electBatteryTestTrans.leadAcidBatteryMake3);
                   							
                   							var date12=(data.electBatteryTestTrans.leadAcidBatteryLugDate3).substring(0,10);
    										var date12Array=date12.split("-");
    										$('#leadAcidBatteryLugDate3').datepicker("setDate",new Date(date12Array[0],date12Array[1]-1,date12Array[2]));
                   							$('#leadAcidBatteryActual').val(data.electBatteryTestTrans.leadAcidBatteryActual);
                   							
                   							
       										
       									}
       										
       									});
       								} 

       								//setting min value
       								
                           	 	 	$("#BatteryTesting").dialog({
                           	 	 		title : 'Inspection report for Battery Testing'+record.furnishingAssetId , 
                           	 	 		width:'80%',
                           	 	 		close: function (e, u) {
                     	 		              //$(".formError").remove();
                           	 	 			/* $('#Stage2').find('form[name="shellsipStage2"]')[0].reset(); */
                     	 		          	$("#BatteryTesting").validationEngine('hideAll');
                     	 		          },
                       	 		 	
        		 							buttons: {
       	                                    Submit: {
       	                                       text: "Submit",
       	                                        id: "my-button-submit",
       	                                        click:function () {
       	                                    		//validation here
       											
       	                                    	var c=confirm("Do you want submit the SIP Form");
       	                                    	if(c==false){return false;}
                                                
       	                                    		    	   
       	                                    	 $.ajax({
       	                    						url : "saveBatteryTestData",  //action-name as defined in struts.xml
       	                    						dataType: 'json', 
       	                    						data : {
       	                    							furnishingAssetId:record.furnishingAssetId,
       	                    							electricalDocNo:$('#BatteryElectricalDocNo').val(),
       	                    							electricalDocDate:$('#BatteryElectricalDocDate').val(), 
       	                    							electTestingDate:$('#BatteryElectTestingDate').val(),
       	                    							electTestingShift:$('#BatteryElectTestingShift').val(),
       	                    							batteryBoxMake:$('#batteryBoxMake').val(),                   							
       	                    							batteryBoxMakeActual:$('#batteryBoxMakeActual').val(),              							
       	                    							mountingBatteryBoxActual:$('#mountingBatteryBoxActual').val(),
       	                    							batteryCommisionedMake:$('#batteryCommisionedMake').val(),
       	                    							battery1:$('#battery1').val(),
       	                    							lugDate1:$('#lugDate1').val(),
       	                    							battery2:$('#battery2').val(),
       	                    							lugDate2:$('#lugDate2').val(),
       	                    							battery3:$('#battery3').val(),
       	                    							lugDate3:$('#lugDate3').val(),
       	                    							battery4:$('#battery4').val(),
       	                    							lugDate4:$('#lugDate4').val(),
       	                    							battery5:$('#battery5').val(),
       	                    							lugDate5:$('#lugDate5').val(),
       	                    							battery6:$('#battery6').val(),
       	                    							lugDate6:$('#lugDate6').val(),
       	                    							battery7:$('#battery7').val(),
       	                    							lugDate7:$('#lugDate7').val(),
       	                    							battery8:$('#battery8').val(),
       	                    							lugDate8:$('#lugDate8').val(),
       	                    							battery9:$('#battery9').val(),
       	                    							lugDate9:$('#lugDate9').val(),
       	                    							batteryCommisionedActual:$('#batteryCommisionedActual').val(),
       	                    							leadAcidBatteryMake:$('#leadAcidBatteryMake').val(),
       	                    							leadAcidBatteryMake1:$('#leadAcidBatteryMake1').val(),
       	                    							leadAcidBatteryLugDate1:$('#leadAcidBatteryLugDate1').val(),
       	                    							leadAcidBatteryMake2:$('#leadAcidBatteryMake2').val(),
       	                    							leadAcidBatteryLugDate2:$('#leadAcidBatteryLugDate2').val(),
       	                    							leadAcidBatteryMake3:$('#leadAcidBatteryMake3').val(),
       	                    							leadAcidBatteryLugDate3:$('#leadAcidBatteryLugDate3').val(),
       	                    							leadAcidBatteryActual:$('#leadAcidBatteryActual').val(),
       	                    							testingStatus:$('#testingStatus').val(),
       	                    						},
       	                    						
       	                    						type : 'POST',
       	                    						async : false,
       	                            	 		}) 
       	                    						.done(function( msg ) {
       	                    							
       	                    							$('#BatteryElectricalDocNo').val(''), 
       	                    							$('#BatteryElectricalDocDate').val(''),
       	                    							$('#BatteryElectTestingDate').val(''),
       	                    							$('#BatteryElectTestingShift').val(''),
       	                    							$('#batteryBoxMake').val(''),                   							
       	                    							$('#batteryBoxMakeActual').val(''),              							
       	                    							$('#mountingBatteryBoxActual').val(''),
       	                    							$('#batteryCommisionedMake').val(''),
       	                    							$('#battery1').val(''),
       	                    							$('#lugDate1').val(''),
       	                    							$('#battery2').val(''),
       	                    							$('#lugDate2').val(''),
       	                    							$('#battery3').val(''),
       	                    							$('#lugDate3').val(''),
       	                    							$('#battery4').val(''),
       	                    							$('#lugDate4').val(''),
       	                    							$('#battery5').val(''),
       	                    							$('#lugDate5').val(''),
       	                    							$('#battery6').val(''),
       	                    							$('#lugDate6').val(''),
       	                    							$('#battery7').val(''),
       	                    							$('#lugDate7').val(''),
       	                    							$('#battery8').val(''),
       	                    							$('#lugDate8').val(''),
       	                    							$('#battery9').val(''),
       	                    							$('#lugDate9').val(''),
       	                    							$('#batteryCommisionedActual').val(''),
       	                    							$('#leadAcidBatteryMake').val(''),
       	                    							$('#leadAcidBatteryMake1').val(''),
       	                    							$('#leadAcidBatteryLugDate1').val(''),
       	                    							$('#leadAcidBatteryMake2').val(''),
       	                    							$('#leadAcidBatteryLugDate2').val(''),
       	                    							$('#leadAcidBatteryMake3').val(''),
       	                    							$('#leadAcidBatteryLugDate3').val(''),
       	                    							$('#leadAcidBatteryActual').val(''),
       	                    							$('#testingStatus').val(''),
       	                    						    
       	                    							
       	                    							
       	                    							
       	                    							
       	                    							$('#BatteryTesting').dialog('close');
       	                    							
       	                    							$('#FurnishingProductionTableContainer').jtable('load');
       	         								  })
       	         								.error(function (msg){
       	         									//$('#dialog').dialog('close');
       	         									alert("Error Fetching Data");
       	         								})
       	         								  ;
       					                 			    	   return true;
       				                                    }
       	                                    },
       				                        Close: function () {
       				                        	//$('#Stage2').find('form[name="shellsipStage2"]')[0].reset();
       				                                        $(this).dialog('close');
       				                                    }
       	                                    },
       	                    	        modal: true
                           	 	});
                        	 	
             			    	   return true;
                     	 		    
                     	 			  
                     	 		  }//ending else               	  
                     	  // ajax call ends here				
     						 
                         }
                     },
             		 //6th icon
                      { 
                         icon: '<%=contextpath%>/images/rs_out.png',
                         text: 'Current Details Testing',
                         click: function () {
                         	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                     	 	 if ($selectedRows.length<1)
                     		 alert("Please select a row for which you want to Inspect");
                     	 	 else{
                     	 		var record;
                     	 		$selectedRows.each(function () {
                                     record = $(this).data('record');
                                     });
                     	 		
                     	 		 
                     	 		//show pre existing data
                     	 		$.ajax({
           								url:"showExistingCurrentDetailsData", //action-name as defined in struts.xml
           								dataType:'json',
           								type:'POST',
           								async:false,
           								data:{
           								furnishingAssetId:record.furnishingAssetId,
           								testingType:"Current Details Testing",
           								},
           								success:function(data)
           								{
           									
           									$('#currentElectricalDocNo').val(data.elecTestTransactionPrimaryData.electricalDocNo);
           									$('#currentElectricalDocDate').val(data.elecTestTransactionPrimaryData.docDate);
           									$('#currentElectTestingShift').val(data.elecTestTransactionPrimaryData.testingShift);
           									var currentDate=(data.elecTestTransactionPrimaryData.testingDate).substring(0,10);
    										var currentDateArray=currentDate.split("-");
    										$('#currentElectTestingDate').datepicker("setDate",new Date(currentDateArray[0],currentDateArray[1]-1,currentDateArray[2]));
           									$('#currentTestingStatus').val(data.elecTestTransactionPrimaryData.testingStatus);
           									$('#currentCoachNo').val(data.furnishingTransaction.coachNumber);
           									$('#currentCoachType1').val(data.furnishingTransaction.coachType);
           									$('#currentShellNo').val(data.shellTransaction.shellNumber);
           									
           								}
           									
           								});
                           	 	
     								
                     	 		
                     	 		if(record.electricalCurrentTestingFlag==1)
 								{
                     	 		
 								$.ajax({
 									url:"showSaveDataCurrentDetailsTesting", //action-name as defined in struts.xml
 									dataType:'json',
 									type:'POST',
 									async:false,
 									data:{
 									furnishingAssetId:record.furnishingAssetId,	
 									},
 									success:function(data)
 									{
 										/*  $('#coachNo').val(data.furnishingTransaction.coachNumber); 
 										$('#coachType1').val(data.furnishingTransaction.coachType);
 										$('#shellNo').val(data.shellTransaction.shellNumber);
 										 */
 										$('#acUnitMake').val(data.currentDetailsTesting.acUnitMake);
             							$('#acUnit1').val(data.currentDetailsTesting.acUnit1);
             							$('#acUnit2').val(data.currentDetailsTesting.acUnit2);
             							$('#cpuSlNo').val(data.currentDetailsTesting.cpuSlNo);
             							$('#cpuMake').val(data.currentDetailsTesting.cpuMake);
             							$('#blrR').val(data.currentDetailsTesting.blrR);
             							$('#blrY').val(data.currentDetailsTesting.blrY);
             							$('#blrB').val(data.currentDetailsTesting.blrB);
             							$('#cd1R').val(data.currentDetailsTesting.cd1R);
             							$('#cd1Y').val(data.currentDetailsTesting.cd1Y);
             							$('#cd1B').val(data.currentDetailsTesting.cd1B);
             							$('#cd2R').val(data.currentDetailsTesting.cd2R);
             							$('#cd2Y').val(data.currentDetailsTesting.cd2Y);
             							$('#cd2B').val(data.currentDetailsTesting.cd2B);
             							$('#cp1R').val(data.currentDetailsTesting.cp1R);
             							$('#cp1Y').val(data.currentDetailsTesting.cp1Y);
             							$('#cp1B').val(data.currentDetailsTesting.cp1B);
             							$('#cp2R').val(data.currentDetailsTesting.cp2R);
             							$('#cp2Y').val(data.currentDetailsTesting.cp2Y);
             							$('#cp2B').val(data.currentDetailsTesting.cp2B);
             							$('#htr1R').val(data.currentDetailsTesting.htr1R);
             							$('#htr1Y').val(data.currentDetailsTesting.htr1Y);
             							$('#htr1B').val(data.currentDetailsTesting.htr1B);
             							$('#monoBlockPump1').val(data.currentDetailsTesting.monoBlockPump1);
             							$('#kalsi1').val(data.currentDetailsTesting.kalsi1);
             							$('#drAuto1').val(data.currentDetailsTesting.drAuto1);
             							$('#rActual1').val(data.currentDetailsTesting.actualR1);
             							$('#yActual1').val(data.currentDetailsTesting.actualY1);
             							$('#bActual1').val(data.currentDetailsTesting.actualB1);
             							$('#monoBlockPump2').val(data.currentDetailsTesting.monoBlockPump2);
             							$('#kalsi2').val(data.currentDetailsTesting.kalsi2);
             							$('#drAuto2').val(data.currentDetailsTesting.drAuto2);
             							$('#rActual2').val(data.currentDetailsTesting.actualR2);
             							$('#yActual2').val(data.currentDetailsTesting.actualY2);
             							$('#bActual2').val(data.currentDetailsTesting.actualB2);
             						     
 										
 									}
 										
 									});
 								} 

 								//setting min value
 								
                     	 	 	$("#CurrentDetailsTesting").dialog({
                     	 	 		title : 'Inspection report for Current Details of Equipment for asset id'+record.furnishingAssetId , 
                     	 	 		width:'80%',
                     	 	 		close: function (e, u) {
               	 		              //$(".formError").remove();
                     	 	 			/* $('#Stage2').find('form[name="shellsipStage2"]')[0].reset(); */
               	 		          	$("#CurrentDetailsTesting").validationEngine('hideAll');
               	 		          },
                 	 		 	
  		 							buttons: {
 	                                    Submit: {
 	                                       text: "Submit",
 	                                        id: "my-button-submit",
 	                                        click:function () {
 	                                    		//validation here
 											
 	                                    	var c=confirm("Do you want submit the SIP Form");
 	                                    	if(c==false){return false;}
                                          
 	                                    		    	   
 	                                    	$.ajax({
 	                    						url : "saveCurrentDetailsTestData",  //action-name as defined in struts.xml
 	                    						dataType: 'json', 
 	                    						data : {
 	                    							furnishingAssetId:record.furnishingAssetId,
 	                    							electricalDocNo:$('#currentElectricalDocNo').val(),
 	                    							electricalDocDate:$('#currentElectricalDocDate').val(), 
   	                    							electTestingDate:$('#currentElectTestingDate').val(),
   	                    							electTestingShift:$('#currentElectTestingShift').val(),
 	                    							acUnitMake:$('#acUnitMake').val(),
 	                    							acUnit1:$('#acUnit1').val(),
 	                    							acUnit2:$('#acUnit2').val(),
 	                    							cpuSlNo:$('#cpuSlNo').val(),
 	                    							cpuMake:$('#cpuMake').val(),
 	                    							blrR:$('#blrR').val(),
 	                    							blrY:$('#blrY').val(),
 	                    							blrB:$('#blrB').val(),
 	                    							cd1R:$('#cd1R').val(),
 	                    							cd1Y:$('#cd1Y').val(),
 	                    							cd1B:$('#cd1B').val(),
 	                    							cd2R:$('#cd2R').val(),
 	                    							cd2Y:$('#cd2Y').val(),
 	                    							cd2B:$('#cd2B').val(),
 	                    							cp1R:$('#cp1R').val(),
 	                    							cp1Y:$('#cp1Y').val(),
 	                    							cp1B:$('#cp1B').val(),
 	                    							cp2R:$('#cp2R').val(),
 	                    							cp2Y:$('#cp2Y').val(),
 	                    							cp2B:$('#cp2B').val(),
 	                    							htr1R:$('#htr1R').val(),
 	                    							htr1Y:$('#htr1Y').val(),
 	                    							htr1B:$('#htr1B').val(),
 	                    							monoBlockPump1:$('#monoBlockPump1').val(),
 	                    							kalsi1:$('#kalsi1').val(),
 	                    							drAuto1:$('#drAuto1').val(),
 	                    							rActual1:$('#rActual1').val(),
 	                    							yActual1:$('#yActual1').val(),
 	                    							bActual1:$('#bActual1').val(),
 	                    							monoBlockPump2:$('#monoBlockPump2').val(),
 	                    							kalsi2:$('#kalsi2').val(),
 	                    							drAuto2:$('#drAuto2').val(),
 	                    							rActual2:$('#rActual2').val(),
 	                    							yActual2:$('#yActual2').val(),
 	                    							bActual2:$('#bActual2').val(),
 	                    							testingStatus:$('#currentTestingStatus').val(),
 	                    							
 	                    						},
 	                    						
 	                    						type : 'POST',
 	                    						async : false,
 	                            	 		}) 
 	                    						.done(function( msg ) {
 	                    							
 	                    							$('#currentElectricalDocNo').val(''), 
 	                    							$('#currentElectricalDocDate').val(''),
   	                    							$('#currentElectTestingDate').val(''),
   	                    							$('#currentElectTestingShift').val(''),
 	                    							$('#acUnitMake').val(''),
 	                    							$('#acUnit1').val(''),
 	                    							$('#acUnit2').val(''),
 	                    							$('#cpuSlNo').val(''),
 	                    							$('#cpuMake').val(''),
 	                    							$('#blrR').val(''),
 	                    							$('#blrY').val(''),
 	                    							$('#blrB').val(''),
 	                    							$('#cd1R').val(''),
 	                    							$('#cd1Y').val(''),
 	                    							$('#cd1B').val(''),
 	                    							$('#cd2R').val(''),
 	                    							$('#cd2Y').val(''),
 	                    							$('#cd2B').val(''),
 	                    							$('#cp1R').val(''),
 	                    							$('#cp1Y').val(''),
 	                    							$('#cp1B').val(''),
 	                    							$('#cp2R').val(''),
 	                    							$('#cp2Y').val(''),
 	                    							$('#cp2B').val(''),
 	                    							$('#htr1R').val(''),
 	                    							$('#htr1Y').val(''),
 	                    							$('#htr1B').val(''),
 	                    							$('#monoBlockPump1').val(''),
 	                    							$('#kalsi1').val(''),
 	                    							$('#drAuto1').val(''),
 	                    							$('#rActual1').val(''),
 	                    							$('#yActual1').val(''),
 	                    							$('#bActual1').val(''),
 	                    							$('#monoBlockPump2').val(''),
 	                    							$('#kalsi2').val(''),
 	                    							$('#drAuto2').val(''),
 	                    							$('#rActual2').val(''),
 	                    							$('#yActual2').val(''),
 	                    							$('#bActual2').val(''),
 	                    							$('#currentTestingStatus').val(''),
 	                    							
 	                    						    
 	                    							
 	                    							
 	                    							
 	                    							
 	                    							$('#CurrentDetailsTesting').dialog('close');
 	                    							
 	                    							$('#FurnishingProductionTableContainer').jtable('load');
 	         								  })
 	         								.error(function (msg){
 	         									//$('#dialog').dialog('close');
 	         									alert("Error Fetching Data");
 	         								})
 	         								  ;
 					                 			    	   return true;
 				                                    }
 	                                    },
 				                        Close: function () {
 				                        	//$('#Stage2').find('form[name="shellsipStage2"]')[0].reset();
 				                                        $(this).dialog('close');
 				                                    }
 	                                    },
 	                    	        modal: true
                     	 	});
                  	 	
       			    	   return true;
               	 		    
               	 			  
               	 		  }//ending else               	  
               	  // ajax call ends here				
						 
                   }
               },
               
               //7TH
               { 
                   icon: '<%=contextpath%>/images/rs_out.png',
                   text: 'SafetyTesting',
                   click: function () {
                   	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
               	 	 if ($selectedRows.length<1)
               		 alert("Please select a row for which you want to Inspect");
               	 	 else{
               	 		var record;
               	 		$selectedRows.each(function () {
                               record = $(this).data('record');
                               });
               	 		
               	 		
               	 		
               	 		$.ajax({
           								url:"showExistingSafetyData", //action-name as defined in struts.xml
           								dataType:'json',
           								type:'POST',
           								async:false,
           								data:{
           								furnishingAssetId:record.furnishingAssetId,
           								testingType:"Safety Testing",
           								},
           								success:function(data)
           								{
           									
           									$('#SafetyElectricalDocNo').val(data.elecTestTransactionPrimaryData.electricalDocNo);
           									$('#safetyElectricalDocDate').val(data.elecTestTransactionPrimaryData.docDate);
           									$('#safetyElectTestingShift').val(data.elecTestTransactionPrimaryData.testingShift);
           									var SafetyDate=(data.elecTestTransactionPrimaryData.testingDate).substring(0,10);
    										var SafetyDateArray=SafetyDate.split("-");
    										$('#safetyElectTestingDate').datepicker("setDate",new Date(SafetyDateArray[0],SafetyDateArray[1]-1,SafetyDateArray[2]));
           									$('#safetyTestingStatus').val(data.elecTestTransactionPrimaryData.testingStatus);
           									$('#safetyCoachNo').val(data.furnishingTransaction.coachNumber);
           									$('#safetyCoachType1').val(data.furnishingTransaction.coachType);
           									$('#safetyShellNo').val(data.shellTransaction.shellNumber);
           									
           								}
           									
           								});
               	 		
               	 		
               	 		if(record.electricalSafetyTestingFlag==1)
							{
							
							$.ajax({
								url:"showSaveSafetyTestData", //action-name as defined in struts.xml
								dataType:'json',
								type:'POST',
								async:false,
								data:{
									furnishingAssetId:record.furnishingAssetId,	
								},
								success:function(data)
								{
								    //var stage2Date=(data.shellStage2.stage2SipDate).substring(0,10);
									//var stage2DateArray=stage2Date.split("-");
									//var sideWallD= new Date(sideWallDateArray[0],sideWallDateArray[1]-1,sideWallDateArray[2]);
									//$('#stage2SipDate').datepicker("setDate", new Date(stage2DateArray[0],stage2DateArray[1]-1,stage2DateArray[2]));
									$('#safetyEngine').val(data.electSafetyTestTrans.safetyEngine);
									$('#safetyAlternator').val(data.electSafetyTestTrans.safetyAlternator);
									$('#safetyEngineSlno').val(data.electSafetyTestTrans.safetyEngineSlno);
									$('#safetyAlternatorSlno').val(data.electSafetyTestTrans.safetyAlternatorSlno);
									$('[id="lowOilPressure"]').val([data.electSafetyTestTrans.lowOilPressure]);
									$('[id="highWaterEngine"]').val([data.electSafetyTestTrans.highWaterEngine]);
									$('[id="lowWaterCoolLevel"]').val([data.electSafetyTestTrans.lowWaterCoolLevel]);
									$('[id="airFilterChoke"]').val([data.electSafetyTestTrans.airFilterChoke]);
									$('[id="altEarthLeak"]').val([data.electSafetyTestTrans.altEarthLeak]);
									$('[id="feederEarthLeak"]').val([data.electSafetyTestTrans.feederEarthLeak]);
									$('[id="feederOverLoad"]').val([data.electSafetyTestTrans.feederOverLoad]);
									$('[id="busCouplerPerformance"]').val([data.electSafetyTestTrans.busCouplerPerformance]);
									$('[id="safetyHooter"]').val([data.electSafetyTestTrans.safetyHooter]);
									$('[id="safetyUvrFunction"]').val([data.electSafetyTestTrans.safetyUvrFunction]);
									$('[id="safetyOvrFunction"]').val([data.electSafetyTestTrans.safetyOvrFunction]);
									$('[id="safetyAvrFunction"]').val([data.electSafetyTestTrans.safetyAvrFunction]);
									$('[id="safetyEmergencyStop"]').val([data.electSafetyTestTrans.safetyEmergencyStop]);
									$('[id="phaseSequenceTest"]').val([data.electSafetyTestTrans.phaseSequenceTest]);
									$('[id="starterBatteryCharger"]').val([data.electSafetyTestTrans.starterBatteryCharger]);
									$('[id="radControlPannel"]').val([data.electSafetyTestTrans.radControlPannel]);
									$('[id="radFanMotors"]').val([data.electSafetyTestTrans.radFanMotors]);
									$('[id="cacControlPannel"]').val([data.electSafetyTestTrans.cacControlPannel]);
									$('[id="cacMotors"]').val([data.electSafetyTestTrans.cacMotors]);
									$('[id="electronicGovernor"]').val([data.electSafetyTestTrans.electronicGovernor]);
									$('[id="safetyDcOn"]').val([data.electSafetyTestTrans.safetyDcOn]);
									$('[id="safetyAel"]').val([data.electSafetyTestTrans.safetyAel]);
								    $('[id="safetyFel"]').val([data.electSafetyTestTrans.safetyFel]);
									$('[id="safetyFol"]').val([data.electSafetyTestTrans.safetyFol]);
									$('[id="safetyUvr"]').val([data.electSafetyTestTrans.safetyUvr]);
									$('[id="safetyFault"]').val([data.electSafetyTestTrans.safetyFault]);
									$('[id="safetyAltOn"]').val([data.electSafetyTestTrans.safetyAltOn]);
									$('[id="safetyTfrAOn"]').val([data.electSafetyTestTrans.safetyTfrAOn]);
									$('[id="safetyLoopAOn"]').val([data.electSafetyTestTrans.safetyLoopAOn]);
									$('[id="safetyLoopBOn"]').val([data.electSafetyTestTrans.safetyLoopBOn]);
									$('[id="safetyFeederAOn"]').val([data.electSafetyTestTrans.safetyFeederAOn]);
									$('[id="safetyFeederBOn"]').val([data.electSafetyTestTrans.safetyFeederBOn]);
									$('[id="safetyBusCouplerOn"]').val([data.electSafetyTestTrans.safetyBusCouplerOn]);
									$('[id="safety24vDc"]').val([data.electSafetyTestTrans.safety24vDc]);
									$('[id="battChargerDefect"]').val([data.electSafetyTestTrans.battChargerDefect]);
									$('[id="nonWorkingContractorA"]').val([data.electSafetyTestTrans.nonWorkingContractorA]);
									$('[id="acbAOn"]').val([data.electSafetyTestTrans.acbAOn]);
									$('[id="testLampIndicationOn"]').val([data.electSafetyTestTrans.testLampIndicationOn]);
									
									
								}
									
								});
							} 

							//setting min value
							
               	 	 	$("#SafetyTesting").dialog({
               	 	 		title : 'Inspection report for Safety Testing'+record.furnishingAssetId + '', 
               	 	 		width:'80%',
               	 	 		close: function (e, u) {
         	 		              //$(".formError").remove();
               	 	 			/* $('#Stage2').find('form[name="shellsipStage2"]')[0].reset(); */
         	 		          	$("#SafetyTesting").validationEngine('hideAll');
         	 		          },
           	 		 	
	 							buttons: {
                                   Submit: {
                                      text: "Submit",
                                       id: "my-button-submit",
                                       click:function () {
                                   		//validation here
										 var c=confirm("Do you want submit the SIP Form");
                                   	if(c==false){return false;}
                                    
                                   		    	   
                                   	 $.ajax({
                                   		url : "saveSafetyTestData",  //action-name as defined in struts.xml
                   						dataType: 'json', 
                   						data : {
                   							furnishingAssetId:record.furnishingAssetId,
                   							electricalDocNo:$('#safetyElectricalDocNo').val(), 
                   							electricalDocDate:$('#safetyElectricalDocDate').val(),
                   							electTestingDate:$('#safetyElectTestingDate').val(),
                   							electTestingShift:$('#safetyElectTestingShift').val(),
                   							safetyEngine:$('#safetyEngine').val(),                   							
                   							safetyAlternator:$('#safetyAlternator').val(),              							
                   							safetyEngineSlno:$('#safetyEngineSlno').val(),
                   							safetyAlternatorSlno:$('#safetyAlternatorSlno').val(),
                   							lowOilPressure:$("input[id='lowOilPressure']:checked").val(),
                   							highWaterEngine:$("input[id='highWaterEngine']:checked").val(),
                   							lowWaterCoolLevel:$("input[id='lowWaterCoolLevel']:checked").val(),
                   							airFilterChoke:$("input[id='airFilterChoke']:checked").val(),
                   							altEarthLeak:$("input[id='altEarthLeak']:checked").val(),
                   							feederEarthLeak:$("input[id='feederEarthLeak']:checked").val(),
                   							feederOverLoad:$("input[id='feederOverLoad']:checked").val(),
                   							busCouplerPerformance:$("input[id='busCouplerPerformance']:checked").val(),
                   							safetyHooter:$("input[id='safetyHooter']:checked").val(),
                   							safetyUvrFunction:$("input[id='safetyUvrFunction']:checked").val(),
                   							safetyOvrFunction:$("input[id='safetyOvrFunction']:checked").val(),
                   							safetyAvrFunction:$("input[id='safetyAvrFunction']:checked").val(),
                   							safetyEmergencyStop:$("input[id='safetyEmergencyStop']:checked").val(),
                   							phaseSequenceTest:$("input[id='phaseSequenceTest']:checked").val(),
                   							starterBatteryCharger:$("input[id='starterBatteryCharger']:checked").val(),
                   							radControlPannel:$("input[id='radControlPannel']:checked").val(),
                   							radFanMotors:$("input[id='radFanMotors']:checked").val(),
                   							cacControlPannel:$("input[id='cacControlPannel']:checked").val(),
                   							cacMotors:$("input[id='cacMotors']:checked").val(),
                   						    electronicGovernor:$("input[id='electronicGovernor']:checked").val(),
                   							safetyDcOn:$("input[id='safetyDcOn']:checked").val(),
                   							safetyAel:$("input[id='safetyAel']:checked").val(),
                   							safetyFel:$("input[id='safetyFel']:checked").val(),
                   							safetyFol:$("input[id='safetyFol']:checked").val(),
                   							safetyUvr:$("input[id='safetyUvr']:checked").val(),
                   							safetyFault:$("input[id='safetyFault']:checked").val(),
                   							safetyAltOn:$("input[id='safetyAltOn']:checked").val(),
                   							safetyTfrAOn:$("input[id='safetyTfrAOn']:checked").val(),
                   							safetyLoopAOn:$("input[id='safetyLoopAOn']:checked").val(),
                   							safetyLoopBOn:$("input[id='safetyLoopBOn']:checked").val(),
                   							safetyBusCouplerOn:$("input[id='safetyBusCouplerOn']:checked").val(),
                   							safety24vDc:$("input[id='safety24vDc']:checked").val(),
                   							battChargerDefect:$("input[id='battChargerDefect']:checked").val(),
                   							nonWorkingContractorA:$("input[id='nonWorkingContractorA']:checked").val(),
                   							acbAOn:$("input[id='acbAOn']:checked").val(),
                   							testLampIndicationOn:$("input[id='testLampIndicationOn']:checked").val(),
                   							testingStatus:$('#safetyTestingStatus').val(),
                   								},
                   						
                   						type : 'POST',
                   						async : false,
                           	 		}) 
                   						.done(function( msg ) {
                   							
                   							
                   							$('#safetyElectricalDocNo').val(''), 
                   							$('#safetyElectricalDocDate').val(''),
                   							$('#safetyElectTestingDate').val(''),
                   							$('#safetyElectTestingShift').val(''), 
                   							$('#safetyEngine').val(''),                   							
                   							$('#safetyAlternator').val(''),              							
                   							$('#safetyEngineSlno').val(''),
                   							$('#safetyAlternatorSlno').val(''),
                   							$("input[id='lowOilPressure']:checked").val(''),
                   							$("input[id='highWaterEngine']:checked").val(''),
                   							$("input[id='lowWaterCoolLevel']:checked").val(''),
                   							$("input[id='airFilterChoke']:checked").val(''),
                   							$("input[id='altEarthLeak']:checked").val(''),
                   							$("input[id='feederEarthLeak']:checked").val(''),
                   							$("input[id='feederOverLoad']:checked").val(''),
                   							$("input[id='busCouplerPerformance']:checked").val(''),
                   							$("input[id='safetyHooter']:checked").val(''),
                   							$("input[id='safetyUvrFunction']:checked").val(''),
                   							$("input[id='safetyOvrFunction']:checked").val(''),
                   							$("input[id='safetyAvrFunction']:checked").val(''),
                   							$("input[id='safetyEmergencyStop']:checked").val(''),
                   							$("input[id='phaseSequenceTest']:checked").val(''),
                   							$("input[id='starterBatteryCharger']:checked").val(''),
                   							$("input[id='radControlPannel']:checked").val(''),
                   							$("input[id='radFanMotors']:checked").val(''),
                   							$("input[id='cacControlPannel']:checked").val(''),
                   							$("input[id='cacMotors']:checked").val(''),
                   							$("input[id='electronicGovernor']:checked").val(''),
                                            $("input[id='safetyDcOn']:checked").val(''),
                   							$("input[id='safetyAel']:checked").val(''),
                   							$("input[id='safetyFel']:checked").val(''),
                   							$("input[id='safetyFol']:checked").val(''),
                   							$("input[id='safetyUvr']:checked").val(''),
                   							$("input[id='safetyFault']:checked").val(''),
                   							$("input[id='safetyAltOn']:checked").val(''),
                   							$("input[id='safetyTfrAOn']:checked").val(''),
                   							$("input[id='safetyLoopAOn']:checked").val(''),
                   							$("input[id='safetyLoopBOn']:checked").val(''),
                   							$("input[id='safetyFeederAOn']:checked").val(''),
                   							$("input[id='safetyFeederBOn']:checked").val(''),
                                           	$("input[id='safetyBusCouplerOn']:checked").val(''),
                   							$("input[id='safety24vDc']:checked").val(''),
                   							$("input[id='battChargerDefect']:checked").val(''),
                   							$("input[id='nonWorkingContractorA']:checked").val(''),
                   							$("input[id='acbAOn']:checked").val(''),
                   							$("input[id='testLampIndicationOn']:checked").val(''),
                   							$('#safetyTestingStatus').val(''),
                   					
                   				
                   							$('#SafetyTesting').dialog('close');
                   					
                   							$('#FurnishingProductionTableContainer').jtable('load');
        								  })
        								.error(function (msg){
        									//$('#dialog').dialog('close');
        									alert("Error Fetching Data");
        								})
        								  ;
				                 			    	   return true;
			                                    }
                                   },
			                        Close: function () {
			                        	//$('#Stage2').find('form[name="shellsipStage2"]')[0].reset();
			                                        $(this).dialog('close');
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
					assemblyDispatchDate: {
						   title: 'Dispatched from Shell',
						   width : '10%',
						  
						  display:function(data){
							  
		 						var assemblyDispatchDatefromShell;
								
		 						$.ajax({                    
		 							  url: 'assemblyDispatchDatefromShell',     
		 							  type: 'post', // performing a POST request
		 							  async: false,
									  
		 							  dataType: 'json',
		 								  data : {
											  shellAssetId: data.record.shellAssetId
		 								  	  }									                    
		 						})
		 								.done(function( msg ) {
		 									assemblyDispatchDatefromShell=msg.assemblyDispatchDatefromShell;
											
		 									//return msg.stageName;																			    											
		 								  })
		 								.error(function (msg){
		 									alert("Error Saving Data");
		 								})
		 								  ;
								
								return ((assemblyDispatchDatefromShell!=null) && (assemblyDispatchDatefromShell!="") ) ? moment(assemblyDispatchDatefromShell).format('DD-MM-YYYY') : "";

		 						},
							create: false,
							edit: false
							},
		
					
							vendorAllotted:{
								title :'Alloted Vendor',
								width: '8%',
								options: {"":"select","Hindustan Fiber Ltd.":"Hindustan Fiber Ltd.", 
									"Century (Varodara)":"Century (Varodara)", "CMT":"CMT", "Dhan Laxmi":"Dhan Laxmi", "ACME (New Delhi)":"ACME (New Delhi)",
									"Mahadev":"Mahadev", "AB Composite":"AB Composite", "Satabdi":"Satabdi", "Kinecco":"Kinecco",
									"OVPL":"OVPL", "Vibgyor":"Vibgyor"},
								list: true,
								create: true,
								edit: true
								},
								
							
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
							
							paintAssetId:{
							title:'Furnishing No',
							display:function(data)
							{
								var furnishingNo;
								if(data.record.paintAssetId!=null)
								{
		 						$.ajax({                    
		 							  url: 'furnNoByPaintId',     
		 							  type: 'post', // performing a POST request
		 							  async: false,
									  
		 							  dataType: 'json',
		 								  data : {
											
		 									 paintAssetId:data.record.paintAssetId
		 								  	  }									                    
		 						})
		 								.done(function( msg ) {
		 									furnishingNo=msg.furnNo;
											
		 									//return msg.stageName;																			    											
		 								  })
		 								.error(function (msg){
		 									alert("Error Saving Data");
		 								})
		 								  ;
								}
								return furnishingNo;
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
				
				remarks: {
				   title: 'Remarks',
				   width : '10%',
					type : 'textarea',
					edit : true,
					create: true 
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
					  
				var startDate=(data.record.assemblyStartDate).substring(0,10);
				
                    var num = startDate.match(/\d+/g); 
             		var date = new Date(num[0], num[1]-1, num[2]);
					 $('[name=expectedExitDate]').datepicker("option","minDate", date)	;	
					 $('[name=vendorAllottedDate]').datepicker("option","minDate", date)	;
 				
					  $("[name=bogiePpSideAssetId1]").on('change', 
								function() {
						
						  var ppBogieAssetId=$("[name=bogiePpSideAssetId1]").val();
						  
						  $("[name=bogieNppSideAssetId1]").find('[value='+ppBogieAssetId+']').remove();
						  
					  });
					  
					  data.form.validationEngine();
					  
					  
					  $("[name=bogieNppSideAssetId1]").on('change', 
								function() {
						  
						  var nppBogieAssetId=$("[name=bogieNppSideAssetId1]").val();
						  
						  $("[name=bogiePpSideAssetId1]").find('[value='+nppBogieAssetId+']').remove();
						  
					  });
					
				
					if(data.formType=='edit')
						{
						var ppBogieNo, nppbogieNo;
						
						
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
 									ppBogieNo=msg.bogieNo;
									
 									//return msg.stageName;																			    											
 								  })
 								.error(function (msg){
 									alert("Error Saving Data");
 								})
 								  ;
 						$('#Edit-bogiePpSideAssetId1')
 				         .append($("<option selected></option>")
 				                    .attr("value",data.record.bogiePpSideAssetId)
 				                    .text(ppBogieNo));
 						
						}
						
					
					
					//right wheel dropdown
					
					if(data.record.bogieNppSideAssetId!=null)
						{
					
					$.ajax({                    
						  url: 'descByBogieId',     
						  type: 'post', // performing a POST request
						  async: false,
						  
						  dataType: 'json',
							  data : {
								
								  bogieAssetId: data.record.bogieNppSideAssetId
							  	  }									                    
					})
							.done(function( msg ) {
								nppbogieNo=msg.bogieNo;
								
								//return msg.stageName;																			    											
							  })
							.error(function (msg){
								alert("Error Saving Data");
							})
							  ;
					
					$('#Edit-bogieNppSideAssetId1')
			         .append($("<option selected></option>")
			                    .attr("value",data.record.bogieNppSideAssetId)
			                    .text(nppbogieNo));
					
						}
					
				
					
						}
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
	<script>
// 	function findObjectByKey(array, key, value) {
// 	    for (var i = 0; i < array.length; i++) {
// 	        if (array[i][key] == value) {
// 	            return array[i];
// 	        }
// 	    }
// 	    return null;
// 	}
	
	</script>