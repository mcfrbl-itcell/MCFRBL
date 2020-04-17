<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="newdashboard.model.WorkDay"%>
<%@ page import="newdashboard.model.CoachWise"%>
<%@ page import="newdashboard.model.ShopWise"%>
<%@ page import="newdashboard.model.MainDial"%>
<%@ page import="newdashboard.model.DailyProd"%>
<%@ page import="newdashboard.model.CoachProd"%>
<%@ page import="newdashboard.model.ShopMan"%>

<%@ page import="newdashboard.model.Performance"%>
<%@ page import="newdashboard.model.Alarm"%>

<%@ page import="newdashboard.model.MachineBreakdown"%>
<%@ page import="newdashboard.model.BeltHolding"%>
<%@ page import="ACTION.NewDashboardAction" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%

ArrayList<WorkDay> workdaylist =new ArrayList<WorkDay>();

ArrayList<CoachWise> cwlist =new ArrayList<CoachWise>();

ArrayList<ShopWise> swlist =new ArrayList<ShopWise>();

ArrayList<MainDial> mdlist =new ArrayList<MainDial>();

ArrayList<DailyProd> dplist =new ArrayList<DailyProd>();

ArrayList<CoachProd> cplist = new ArrayList<CoachProd>();

ArrayList<ShopMan> smlist = new ArrayList<ShopMan>();

ArrayList<Performance> pflist = new ArrayList<Performance>();

ArrayList<Alarm> alist = new ArrayList<Alarm>();

ArrayList<MachineBreakdown> mblist = new ArrayList<MachineBreakdown>();

ArrayList<BeltHolding> bhlist = new ArrayList<BeltHolding>();
 
 

		workdaylist = (ArrayList<WorkDay>)request.getAttribute("wdlist");
	
		cwlist = (ArrayList<CoachWise>)request.getAttribute("cwlist");
	
		swlist = (ArrayList<ShopWise>)request.getAttribute("swlist");
	
	 	mdlist = (ArrayList<MainDial>)request.getAttribute("mdlist"); 
 
	 	dplist = (ArrayList<DailyProd>)request.getAttribute("dplist");
	 	 
	 	cplist = (ArrayList<CoachProd>)request.getAttribute("cplist");
	 	
	 	smlist = (ArrayList<ShopMan>)request.getAttribute("smlist");
	 	
		pflist = (ArrayList<Performance>)request.getAttribute("pflist");
	 	
	 	alist = (ArrayList<Alarm>)request.getAttribute("alist");
	 	
		mblist = (ArrayList<MachineBreakdown>)request.getAttribute("mblist");
	 	
	 	bhlist = (ArrayList<BeltHolding>)request.getAttribute("bhlist");

	 	/* WORKDAY */
	 	
Double ytd = null;
Double tot = null;

for(WorkDay wd : workdaylist) {
	
	ytd = Double.parseDouble(wd.getYtdwday());
	tot = Double.parseDouble(wd.getTotwday());

}


		/* COACH WISE PERFORMANCE */		


ArrayList<String> rstype =new ArrayList<String>();
ArrayList<Double> tgt =new ArrayList<Double>();
ArrayList<Double> mfg =new ArrayList<Double>();
ArrayList<Double> gateout =new ArrayList<Double>();

for(CoachWise cw : cwlist) {
	
	rstype.add("'"+cw.getRstype()+"'");
	try{
	    Double tgtvalue = Double.parseDouble(cw.getTgt());
	    tgt.add(tgtvalue);
	    Double mfgvalue = Double.parseDouble(cw.getMfg());
	    mfg.add(mfgvalue);
	    Double gateoutvalue = Double.parseDouble(cw.getGateout());
	    gateout.add(gateoutvalue);
	    } catch(Exception e){
	    	e.printStackTrace();
	    }
}


		/* SHOP WISE PERFORMANCE */

ArrayList<String> stagedesc =new ArrayList<String>();
ArrayList<Double> yearlytarget =new ArrayList<Double>();
ArrayList<Double> cumprod =new ArrayList<Double>();

for(ShopWise sw : swlist) {
	
	stagedesc.add("'"+sw.getStage()+"'");
	try{
	    Double yearlytartgetvalue = Double.parseDouble(sw.getYearlytarget());
	    yearlytarget.add(yearlytartgetvalue);
	    Double cumprodvalue = Double.parseDouble(sw.getCumprod());
	    cumprod.add(cumprodvalue);
	    } catch(Exception e){
	    	e.printStackTrace();
	    }
}


		/* MAIN DIAL  */

Double mtarget = null;
Double mprop = null;
Double mgateout = null;
Double mmfg = null;
Double mreqd = null;

Double maxtarget = null;
Double newmtarget = null;
Double newmprop = null;
Double newmgateout = null;
Double newmmfg = null;
Double newmreqd = null;
Double negnewmreqd = null;

for(MainDial md : mdlist) {
	
	
	mtarget = Double.parseDouble(md.getTarget());
	maxtarget=(mtarget*110)/100;
	newmtarget = Math.round((mtarget*100))/maxtarget;
	mprop = Double.parseDouble(md.getProptarget());
	newmprop = Math.round((mprop*100))/maxtarget;
	mgateout= Double.parseDouble(md.getGateout());
	newmgateout = Math.round((mgateout*100))/maxtarget;
	mmfg= Double.parseDouble(md.getMfg());
	newmmfg = Math.round((mmfg*100))/maxtarget;
	mreqd= Double.parseDouble(md.getReqd());
	newmreqd = Math.round((mreqd*100))/maxtarget;
	
}
 
		
		/* DAILY PRODUCTION */


Double crdt_mfg = null;
Double prod_actl_rate = null;
Double prod_reqd_rate = null;

for( DailyProd dp : dplist ){
	
	crdt_mfg = Double.parseDouble(dp.getCrdt_mfg());
	prod_actl_rate = Double.parseDouble(dp.getProd_actl_rate());
	prod_reqd_rate = Double.parseDouble(dp.getProd_reqd_rate());
}



/* COACH PRODUCTION PLAN */


ArrayList<String> coachtype = new ArrayList<String>();
ArrayList<Double> typetgtqty = new ArrayList<Double>();
ArrayList<Double> prctqty = new ArrayList<Double>();
double sum = 0 ;


	for(CoachProd cp : cplist){
		
		coachtype.add("'"+cp.getCoachtype()+"'");
		
		Double typetgtqtyvalue = Double.parseDouble(cp.getTypetgtqty());
		
		sum += typetgtqtyvalue;
		typetgtqty.add(typetgtqtyvalue);
		
		Double prctqtyvalue = Double.parseDouble(cp.getPrctqty());
		
		prctqty.add(prctqtyvalue);
		
	}
	
	
	
	/* SHOP MAN FOR TABLE */

	
	/* PERFORMANCE */

String perf = null;

for(Performance pf : pflist) {
	
	perf = pf.getPerf();

}


/* AS ON */

String ason = null;

ason = request.getAttribute("ason").toString();


/* ALARM */

ArrayList<String> alarmdate =new ArrayList<String>();
ArrayList<String> alarmdetail =new ArrayList<String>();


for(Alarm al : alist) {
	
	
	alarmdate.add(al.getAlrm_date());
	alarmdetail.add(al.getAlrm_dtls());
	
}


/*  ALARM DESC */

String alarm_desc = null;

alarm_desc = request.getAttribute("alarm_desc").toString();



/*  SHOP UTIL DESC */

String shop_util_desc = null;

shop_util_desc = request.getAttribute("shop_util_desc").toString();


/*  MACHINE BREAKDOWN DESC */

String break_desc = null;

break_desc = request.getAttribute("break_desc").toString();

/*  BELT HOLDING DESC */

String belt_desc = null;

belt_desc = request.getAttribute("belt_desc").toString();
String contextpath=request.getContextPath();
 %>
<html>

<head>
<style>
body { padding-right: 0 !important }

.modal-open{overflow:auto;padding-right:0 !important;}

#p1 {background-color:rgb(255,0,0);opacity:0.6;}
#p2 {background-color:rgb(0,255,0);opacity:0.6;}
#p3 {background-color:rgb(0,0,255);opacity:0.6;}
#p4 {background-color:rgb(192,192,192);opacity:0.6;}
#p5 {background-color:rgb(255,255,0);opacity:0.6;}
#p6 {background-color:rgb(255,0,255);opacity:0.6;}

#tdWorkDay1 {background-color:rgba(173, 255, 47, 0.5);}
#tdWorkDay2 {background-color:rgba(255, 0, 0, 0.5);}

#tdWorkDayNew1 {background-color:rgb(255, 253, 163);}
#tdWorkDayNew2 {background-color:rgb(198, 252, 255);}

#tdDailyProd1 {background-color:rgba(173, 255, 47,0.5);}
#tdDailyProd2 {background-color:rgba(255, 0, 0,0.5);}
#tdDailyProd3 {background-color:rgba(44, 130, 201,0.5);}

.apexcharts-title-text {
  font-weight: 600
}


.sameline h6{
display: inline-block;
font-weight: bold;

}

</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Work Days</title>


<script src="<%=contextpath %>/newdashboard/chart-all.js"></script>


<script src="<%=contextpath %>/newdashboard/chartjs-plugin-datalabels.js"></script>
	
<script src="<%=contextpath %>/newdashboard/apexcharts.js"></script>
<script src="<%=contextpath %>/newdashboard/html2pdf.bundle.min.js"></script>

<%-- 
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

 --%>
<script src="<%=contextpath %>/newdashboard/jquery.min.js"></script>
  <script src="<%=contextpath %>/newdashboard/bootstrap.min.js"></script>
</head>
<body>
<!-- ROW 1 -->
<div class="row" id="row1">
<div class="col-sm-3">



<div align="center" class="chart-wrapper" id="chart1">
<canvas id="myWorkDayChart" width="200px" height="170px"></canvas> 
</div>
<div align="center">
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myWDModal">View Data</button>
</div>

<div align="center" class="chart-wrapper">
<canvas id="myDailyProdChart" width="100px" height="190px"></canvas>
</div>
<div align="center">
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myDPModal">View Data</button>
</div>




<!-- Modal myWDModal -->
  <div class="modal fade" id="myWDModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center"><b><i>Working Days</i></b></h4>
        </div>
        <div class="modal-body">
          <!-- <p>Some text in the modal.</p> -->
          <!-- <h5><b><i>Working Days Table</i></b></h5> -->
		<div class="table-responsive">
			<table id="WorkDayChartTable" class="table table-bordered text-center tablesorter table-condensed">
				
					<tr>
						<th id="tdWorkDayNew1" class="text-uppercase text-center" align="center">Working Days Over</th>
						<th id="tdWorkDayNew2" class="text-uppercase text-center" align="center">Total Working Days</th>
					</tr> 
				
				
					<tr>
						<td id="tdWorkDayNew1" style="font-weight:bold;" ><%out.print(ytd.intValue());%></td>
						<td id="tdWorkDayNew2" style="font-weight:bold;" ><%out.print(tot.intValue());%></td>
					</tr>
				
			</table>
			<!-- <div align="right">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div> -->
		</div>
		
		<!-- <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myWDModalinPop">View Data</button> -->
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
  
  
  
  <!-- Modal myDPModal -->
  <div class="modal fade" id="myDPModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center"><b><i>Daily Production</i></b></h4>
        </div>
        <div class="modal-body">
          <!-- <p>Some text in the modal.</p> -->
          <!-- <h5><b><i>Daily Production Table</i></b></h5> -->
		<div class="table-responsive">
			<table id="DailyProdChartTable" class="table table-bordered text-center tablesorter table-condensed">
				
					<tr>
						<th id="tdWorkDayNew1" class="text-uppercase text-center" align="center">Previous Day</th>
						<th id="tdWorkDayNew2" class="text-uppercase text-center" align="center">Actual Rate</th>
						<th id="tdWorkDayNew1" class="text-uppercase text-center" align="center">Required Rate</th>
					</tr> 
				
				
					<tr>
						<td style="font-weight:bold;" id="tdWorkDayNew1"><%out.print(crdt_mfg);%></td>
						<td style="font-weight:bold;" id="tdWorkDayNew2"><%out.print(prod_actl_rate);%></td>
						<td style="font-weight:bold;" id="tdWorkDayNew1"><%out.print(prod_reqd_rate);%></td>
					</tr>
				
			</table>
		</div>
		
		
        </div>
       <!--  <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
  
  
  
  <!-- Modal myWDModal -->
  <div class="modal fade" id="myWDModalinPop" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Table Data</h4>
        </div>
        <div class="modal-body">
          <!-- <p>Some text in the modal.</p> -->
          <h5><b><i>Working Days Table</i></b></h5>
		<div class="table-responsive">
			<table id="WorkDayChartTable" class="table table-bordered text-center tablesorter">
				
					<tr>
						<th id="tdWorkDay1" class="text-uppercase">Working Days Over</th>
						<th id="tdWorkDay2" class="text-uppercase">Total Working Days</th>
					</tr> 
				
				
					<tr>
						<td id="tdWorkDay1"><%out.print(ytd.intValue());%></td>
						<td id="tdWorkDay2"><%out.print(tot.intValue());%></td>
					</tr>
				
			</table>
		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>




</div>

<div class="col-sm-5">
<%-- <div align="center">
<h4 style=" color : blue; font-weight: bold; font-size: 18pxS " align="center"><%out.print(perf); %></h4>
</div> --%>
<div id="rBarchart"></div>


</div>

<div class="col-sm-4">

<div class="sameline" align="right">

<!-- onClick="printDiv()" -->
<h6><a href="#" id="downloadPdf" onclick="printDiv()" >Export PDF</a></h6>  
<h6><%out.print(ason); %></h6>
</div>
<div align="center">
<h6 style="font-weight: bold;"><a href="#" data-toggle="modal" data-target="#myAlarmModal">Alarm : <%out.print(alarm_desc); %></a></h6>
<%-- <h5 style="font-weight: bold;"><%out.print(alarm_desc); %></h5> --%>
</div>

<div align="center">
<h6 style="font-weight: bold;"><a href="#" data-toggle="modal" data-target="#mySMModal">Man power Utilisation : <%out.print(shop_util_desc); %></a></h6>
<%-- <h5 style="font-weight: bold;"><%out.print(shop_util_desc); %></h5> --%>
</div>

<div align="center">
<h6 style="font-weight: bold;"><a href="#" data-toggle="modal" data-target="#myMBModal">Machine Breakdown : <%out.print(break_desc); %></a></h6>
<%-- <h5 style="font-weight: bold;"><%out.print(shop_util_desc); %></h5> --%>
</div>

<div align="center">
<h6 style="font-weight: bold;"><a href="#" data-toggle="modal" data-target="#myBHModal">Belt Holding : <%out.print(belt_desc); %></a></h6>
<%-- <h5 style="font-weight: bold;"><%out.print(shop_util_desc); %></h5> --%>
</div>
<!-- <div align="center">
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myAlarmModal">Alarm Data</button>
</div> -->


<!-- Modal myAlarmModal -->
  <div class="modal fade" id="myAlarmModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center"><b><i>Alarm</i></b></h4>
        </div>
        <div class="modal-body">
          <!-- <p>Some text in the modal.</p> -->
          <!-- <h5><b><i>Alarm Table</i></b></h5> -->
		<div class="table-responsive">
			<table id="AlarmTable" class="table table-bordered text-center tablesorter table-condensed">
				
					<tr>
						<th id="tdWorkDayNew1" class="text-uppercase text-center" align="center">Alarm Date</th>
						<th id="tdWorkDayNew2" class="text-uppercase text-center" align="center">Alarm Details</th>
						
					</tr> 
				
					<c:forEach items="${alist}" var="al">
					<tr>
						<td style="font-weight:bold;" id="tdWorkDayNew1">${al.alrm_date}</td>
						<td style="font-weight:bold;" id="tdWorkDayNew2">${al.alrm_dtls}</td>
						
					</tr>
					</c:forEach>
				
			</table>
		</div>
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
  
  <!-- Modal myMBModal -->
  <div class="modal fade" id="myMBModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center"><b><i>Machine Breakdown</i></b></h4>
        </div>
        <div class="modal-body">
          <!-- <p>Some text in the modal.</p> -->
          <!-- <h5><b><i>Machine Breakdown Details Table</i></b></h5> -->
		<div class="table-responsive">
			<table id="MBTable" class="table table-bordered tablesorter table-condensed">
				
					<tr>
						<th id="tdWorkDayNew1" class="text-uppercase">Machine SR No.</th>
						<th id="tdWorkDayNew2" class="text-uppercase">Machine Description</th>
						<th id="tdWorkDayNew1" class="text-uppercase">Breakdown Date</th>
						
						
					</tr> 
				
					<c:forEach items="${mblist}" var="mb">
					<tr>
						<td style="font-weight:bold;" id="tdWorkDayNew1">${mb.machine_sr_no}</td>
						<td style="font-weight:bold;" id="tdWorkDayNew2">${mb.machine_description}</td>
						<td style="font-weight:bold;" id="tdWorkDayNew1">${mb.breakdown_date}</td>
					</tr>
					</c:forEach>
				
			</table>
		</div>
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
 
 
 <!-- Modal myBHModal -->
  <div class="modal fade" id="myBHModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center"><b><i>Belt Holding</i></b></h4>
        </div>
        <div class="modal-body">
          <!-- <p>Some text in the modal.</p> -->
          <!-- <h5><b><i>Belt Holding Details Table</i></b></h5> -->
		<div class="table-responsive">
			<table id="MBTable" class="table table-bordered tablesorter">
				
					<tr>
						<th id="tdWorkDayNew1" class="text-uppercase">Shop</th>
						<th id="tdWorkDayNew2" class="text-uppercase">Unified PL No.</th>
						<th id="tdWorkDayNew1" class="text-uppercase">PL Description</th>
						<th id="tdWorkDayNew2" class="text-uppercase">Coach Affected</th>
					</tr> 
				
					<c:forEach items="${bhlist}" var="bh">
					<tr>
						<td style="font-weight:bold;" id="tdWorkDayNew1">${bh.shop}</td>
						<td style="font-weight:bold;" id="tdWorkDayNew2">${bh.unified_pl_no}</td>
						<td style="font-weight:bold;" id="tdWorkDayNew1">${bh.pl_desc}</td>
						<td style="font-weight:bold;" id="tdWorkDayNew2">${bh.coach_affected}</td>
						
					</tr>
					</c:forEach>
				
			</table>
		</div>
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
  

<div align="center">
<canvas id="myCoachProdNut" width="410px" height="220px">
</canvas>
</div>

<div align="center">
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myCPModal">View Data</button>
</div>

<!-- Modal myCPModal -->
  <div class="modal fade" id="myCPModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h4 class="modal-title" align="center"><b><i>Coach Production Plan</i></b></h4>
        </div>
        <div class="modal-body">
          <!-- <p>Some text in the modal.</p> -->
          <!-- <h5><b><i>Coach Production Plan Table</i></b></h5> -->
		<div class="table-responsive">
			<table id="CoachProdChartTable" class="table table-bordered text-center tablesorter table-condensed">
				
					<tr>
						<th id="tdWorkDayNew1" class="text-uppercase text-center" align="center">Coach</th>
						<th id="tdWorkDayNew2" class="text-uppercase text-center" align="center">Target Qty</th>
						<th id="tdWorkDayNew1" class="text-uppercase text-center" align="center">Quantity (%)</th>
					</tr> 
				
					<c:forEach items="${cplist}" var="cp">
					<tr>
						<td style="font-weight:bold;" id="tdWorkDayNew1">${cp.coachtype}</td>
						<td style="font-weight:bold;" id="tdWorkDayNew2">${cp.typetgtqty}</td>
						<td style="font-weight:bold;" id="tdWorkDayNew1">${cp.prctqty}</td>
					</tr>
					</c:forEach>
				
			</table>
		</div>
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>


</div>



</div>




<!-- ROW 2 -->

<div class="row">

 <div class="col-sm-3">
<div align="center">
<br><br>
<button class="button btn btn-info" id="cwp" type="button" >Coach Wise Performance Chart</button> 
<br><br>
<button class="button btn btn-info" id="swp" type="button" >Shop Wise Performance Chart</button>
<br><br>
<!-- <button class="button btn btn-info" id="swm" type="button" >Shop Wise Manpower Table</button> -->
<!-- <button type="button" id="swm" class="btn btn-info" data-toggle="modal" data-target="#mySMModal">Shop Wise Manpower Table</button> -->
<br><br>
<!-- Modal mySMModal -->
			  <div class="modal fade" id="mySMModal" role="dialog">
			    <div class="modal-dialog modal-sm">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title" align="center"><b><i>Shop Wise Manpower Utilization As On</i></b></h4>
			        </div>
			        <div class="modal-body">
			          <!-- <p>Some text in the modal.</p> -->
			         <!--  <h5><b><i>Shop Wise Manpower Utilization</i></b></h5> -->
					<div class="table-responsive">
						<table id="ShopManTable" class="table table-bordered text-center tablesorter table-condensed">
							
								<tr>
									<th id="tdWorkDayNew1" class="text-uppercase text-center" align="center">Shop</th>
									<th id="tdWorkDayNew2" class="text-uppercase text-center" align="center">Man Days</th>
									<th id="tdWorkDayNew1"class="text-uppercase text-center" align="center">Util (%)</th>
									<th id="tdWorkDayNew2" class="text-uppercase text-center" align="center">Avg Man</th>
								</tr> 
							
								<c:forEach items="${smlist}" var="sm">
								<tr>
									<td style="font-weight:bold;" id="tdWorkDayNew1">${sm.shop}</td>
									<td style="font-weight:bold;" id="tdWorkDayNew2">${sm.prevdaymanpower}</td>
									<td style="font-weight:bold;" id="tdWorkDayNew1">${sm.prevdaymanutil}</td>
									<td style="font-weight:bold;" id="tdWorkDayNew2">${sm.avgfinyrmanutil}</td>
								</tr>
								</c:forEach>
							
						</table>
					</div>
			        </div>
			        <!-- <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div> -->
			      </div>
			      
			    </div>
			  </div>
</div>

</div> 

<div class="col-sm-9">
<div align="center">
<div class="chart-wrapper">
<canvas id="toggleChartRow2" width="700" height="200"></canvas>
</div>
<button id="toggleModalRow2" type="button" class="btn btn-info" data-toggle="modal" data-target="#myCWModalRow2">View Data</button>
</div>



				
				
				<!-- Modal myCWModal ROW2 -->
			  <div class="modal fade" id="myCWModalRow2" role="dialog">
			    <div class="modal-dialog modal-sm">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title" align="center"><b><i>Coach Wise Performance</i></b></h4>
			        </div>
			        <div class="modal-body">
			          <!-- <p>Some text in the modal.</p> -->
			          <!-- <h5><b><i>Coach Wise Performance Table Data</i></b></h5> -->
					<div class="table-responsive">
						<table id="myChart2Table" class="table table-bordered text-center tablesorter table-condensed">
							
								<tr>
									<th id="tdWorkDayNew1" class="text-uppercase text-center" align="center">Coach</th>
									<th id="tdWorkDayNew2" class="text-uppercase text-center" align="center">Tgt</th>
									<th id="tdWorkDayNew1" class="text-uppercase text-center" align="center">MFG</th>
									<th id="tdWorkDayNew2" class="text-uppercase text-center" align="center">GateOut</th>
								</tr> 
							
								<c:forEach items="${cwlist}" var="cw">
								<tr>
									<td style="font-weight:bold;" id="tdWorkDayNew1">${cw.rstype}</td>
									<td style="font-weight:bold;" id="tdWorkDayNew2">${cw.tgt}</td>
									<td style="font-weight:bold;" id="tdWorkDayNew1">${cw.mfg}</td>
									<td style="font-weight:bold;" id="tdWorkDayNew2">${cw.gateout}</td>
								</tr>
								</c:forEach>
							
						</table>
					</div>
			        </div>
			        <!-- <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div> -->
			      </div>
			      
			    </div>
			  </div>
			  
			  	<!-- Modal mySWModal ROW2 -->
			  <div class="modal fade" id="mySWModalRow2" role="dialog">
			    <div class="modal-dialog modal-sm">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			           <h4 class="modal-title" align="center"><b><i>Shop Wise Performance</i></b></h4>
			        </div>
			        <div class="modal-body">
			          <!-- <p>Some text in the modal.</p> -->
			          <!-- <h5><b><i>Shop Wise Performance Table Data</i></b></h5> -->
					<div class="table-responsive">
						<table id="myChart2Table" class="table table-bordered tablesorter table-condensed">
							
								<tr>
									<th id="tdWorkDayNew1" class="text-uppercase">STAGE</th>
									<th id="tdWorkDayNew2" class="text-uppercase">YEARLY TARGET</th>
									<th id="tdWorkDayNew1" class="text-uppercase">CUM PROD</th>
									
								</tr> 
							
								<c:forEach items="${swlist}" var="sw">
								<tr>
									<td style="font-weight:bold;" id="tdWorkDayNew1">${sw.stage}</td>
									<td style="font-weight:bold;" id="tdWorkDayNew2">${sw.yearlytarget}</td>
									<td style="font-weight:bold;" id="tdWorkDayNew1">${sw.cumprod}</td>
									
								</tr>
								</c:forEach>
							
						</table>
					</div>
			        </div>
			        <!-- <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div> -->
			      </div>
			      
			    </div>
			  </div>
				


</div>





</div>




 <script> 
        function printDiv() { 
            
        	var element = document.getElementById('printAll');
        	var opt = {
        	  margin:       1,
        	  filename:     'coachdashboard.pdf',
        	  image:        { type: 'jpeg', quality: 1 },
        	  html2canvas:  { scale: 4 },
        	  jsPDF:        { unit: 'px', format: [1400,800], orientation: 'landscape' }
        	};

        	
        	html2pdf(element, opt);

            
        } 
    </script>


<!-- <script>

$(document).ready(function() {
    $('#MBTable').DataTable( {
        "pagingType": "full_numbers"
    } );
} );
</script> -->


<script>




 var ctx1 = document.getElementById("toggleChartRow2").getContext('2d'); 
/* var ctx1 = document.getElementById("toggleChartRow2"); */
ctx1.save();

 var ctx2 = document.getElementById("toggleChartRow2").getContext('2d'); 
/* var ctx2 = document.getElementById("toggleChartRow2"); */
ctx2.save();


var config1 = {
	    type: 'bar',
	    data: {
	    	/* labels: ['a', 'b', 'c', 'd', 'e'], */
	      labels: <%out.print(rstype);%>, 
	      
	      datasets: [{
	        label: 'mfg value',
	        yAxisID: 'A',
	         /* data: [100, 90, 80, 70, 60], */ 
	         data: <%out.print(mfg);%>, 
	        /* backgroundColor: 'rgba(255, 215, 0, 1)' */
	        backgroundColor: 'rgba(173, 255, 47, 1)'
	      }, {
	        label: 'gate out',
	        yAxisID: 'A',
	         /* data: [-100, -90, -80, -70, -60],  */
	         data: <%out.print(gateout);%>, 
	        backgroundColor: 'rgba(255, 0, 0, 1)'
	      },
	      {
	          label: 'Target',
	          yAxisID: 'A',
	           /* data: [-100, -90, -80, -70, -60],  */
	           data: <%out.print(tgt);%>, 
	          backgroundColor: 'rgba(44, 130, 201, 1)'
	        }]
	      /* borderWidth:1,
	      borderColor:'#777',
	      hoverBorderWidth:3,
	      hoverBorderColor:'#000' */
	    },
	    
	    options: {
	    	title:{
	            display:true,
	            text:'Coach Wise Performance',
	            fontSize:25
	          },
	           /* legend:{
	          display:true,
	          position:'right',
	          labels:{
	            fontColor:'#000'
	          }
	        }, */
	        layout:{
	          padding:{
	            left:50,
	            right:0,
	            bottom:0,
	            top:0
	          }
	        }, 
	        
	        plugins: {
	            datalabels: {
	              anchor: 'end',
	              align: 'top',
	              formatter: Math.round,
	              font: {
	                weight: 'bold'
	              }
	            }
	          },
	      scales: {
	        yAxes: [{
	          id: 'A',
	          position: 'left'
	        }],
	        xAxes: [{
	            display: true,
	            ticks: {
	                beginAtZero: true,
	                steps: 10,
	                stepValue: 5,
	                max: 100
	            }
	        }]
	      },
	      responsive : true,
	      maintainAspectRatio : true
	    }
	  };

var config2 = {
	    type: 'bar',
	    data: {
	    	
	      labels: <%out.print(stagedesc);%>, 
	      
	      datasets: [{
	        label: 'cum prod',
	        yAxisID: 'A',
	         /* data: [100, 90, 80, 70, 60], */ 
	         data: <%out.print(cumprod);%>, 
	        /* backgroundColor: 'rgba(255, 215, 0, 1)' */
	        backgroundColor: 'rgba(173, 255, 47, 1)'
	      }, 
	      {
	          label: 'Target',
	          yAxisID: 'A',
	           /* data: [-100, -90, -80, -70, -60],  */
	           data: <%out.print(yearlytarget);%>, 
	          backgroundColor: 'rgba(44, 130, 201, 1)'
	        }]
	      /* borderWidth:1,
	      borderColor:'#777',
	      hoverBorderWidth:3,
	      hoverBorderColor:'#000' */
	    },
	    
	    options: {
	    	title:{
	            display:true,
	            text:'Shop Wise Performance',
	            fontSize:25
	          },
	           /* legend:{
	          display:true,
	          position:'right',
	          labels:{
	            fontColor:'#000'
	          }
	        }, */
	        layout:{
	          padding:{
	            left:50,
	            right:0,
	            bottom:0,
	            top:0
	          }
	        }, 
	        
	        plugins: {
	            datalabels: {
	              anchor: 'end',
	              align: 'top',
	              formatter: Math.round,
	              font: {
	                weight: 'bold'
	              }
	            }
	          },
	      scales: {
	        yAxes: [{
	          id: 'A',
	          position: 'left'
	        }],
	        xAxes: [{
	            display: true,
	            ticks: {
	                beginAtZero: true,
	                steps: 10,
	                stepValue: 5,
	                max: 100
	            }
	        }]
	      },
	      responsive : true,
	      maintainAspectRatio : true
	    }
	  };
	

var togglechartrow2 = new Chart(ctx1, config1);

$("#cwp").click(function() {
   
	 // Destroy old graph
    if (togglechartrow2) {
    	togglechartrow2.destroy();
    }

    // Render chart
   /*  chart = new Chart(
        document.getElementById(idChartMainWrapperCanvas),
        chartOptions
    ); */
    
    togglechartrow2 = new Chart(ctx1, config1);
    $('#toggleModalRow2').attr('data-target', '#myCWModalRow2');
	
    
});
$("#swp").click(function() {
	
	 // Destroy old graph
    if (togglechartrow2) {
    	togglechartrow2.destroy();
    }

    // Render chart
    togglechartrow2 = new Chart(ctx2, config2);
    $('#toggleModalRow2').attr('data-target', '#mySWModalRow2');
	
});




</script>

<script>

var options1 = {
		  chart: {
		    width:500,
			height: 500,
		    type: "radialBar",
		    animations: {
		        enabled: true,
		        easing: 'easeinout',
		        speed: 2000,
		        animateGradually: {
		            enabled: true,
		            delay: 150
		        },
		        dynamicAnimation: {
		            enabled: true,
		            speed: 350
		        }
		    }/* ,dropShadow: {
		    	  enabled: true,
		    	  top: 0,
		    	  left: 0,
		    	  blur: 1,
		    	  opacity: 0.5
		    	} *//* , toolbar: {
		        show: true,
		        tools: {
		          download: true,
		          selection: true,
		          zoom: true,
		          zoomin: true,
		          zoomout: true,
		          pan: true,
		          reset: true | '<img src="/static/icons/reset.png" width="20">',
		          customIcons: []
		        },
		        autoSelected: 'zoom' 
		      } */
		      
		      
		  },
		  series: [<%out.print(newmtarget);%>, <%out.print(newmprop);%>, <%out.print(newmmfg);%>, <%out.print(newmgateout);%>, <%out.print(newmreqd);%>],
          colors:['rgba(44, 130, 201, 1)', 'rgba(173, 255, 47, 1)', 'rgba(128,0,0, 0.8)', 'rgba(138,141,145, 1)', 'rgba(255,0,0, 1)'],
		  legend: {
			    show: true,
			    showForSingleSeries: false,
			    showForNullSeries: true,
			    showForZeroSeries: true,
			    position: 'bottom',
			    horizontalAlign: 'center', 
			    floating: false,
			    fontSize: '14px',
			    fontFamily: 'Helvetica, Arial',
			    formatter: undefined,
			    inverseOrder: false,
			    width: undefined,
			    height: undefined,
			    tooltipHoverFormatter: undefined,
			    offsetX: 0,
			    offsetY: 0,
			    labels: {
			        colors: undefined,
			        useSeriesColors: false
			    },
			    markers: {
			        width: 12,
			        height: 12,
			        strokeWidth: 0,
			        strokeColor: '#fff',
			        fillColors: undefined,
			        radius: 12,
			        customHTML: undefined,
			        onClick: undefined,
			        offsetX: 0,
			        offsetY: 0
			    },
			    
			    itemMargin: {
			        horizontal: 5,
			        vertical: 0
			    },
			    onItemClick: {
			        toggleDataSeries: true
			    },
			    onItemHover: {
			        highlightDataSeries: true
			    },
			},
			
		  plotOptions: {
		    radialBar: {
		    	
		    	startAngle: 0,
		          endAngle: 360,
		          offsetX: 0,
		          offsetY: 0,
		      dataLabels: {
		    	  show: true,
		    	  
	              name: {
	                  show: true,
	                  fontSize: '20px',
	                  fontFamily: 'Helvetica, Arial, sans-serif',
	                  color: undefined,
	                  offsetY: 0
	                },
		    	  value: {
	                  show: true,
	                  /* color: ['rgba(44, 130, 201, 1)', 'rgba(44, 130, 201, 1)', 'rgba(44, 130, 201, 1)', 'rgba(44, 130, 201, 1)', 'rgba(44, 130, 201, 1)'], */
	                  fontSize: '18px',
	                  offsetY: 0,
	                  formatter: function (val) {
	                
	               			return (val*<%out.print(maxtarget);%>)/100
	                  }
	                },
	                
	                
		    	  
		        total: {
		          show: false,
		          label: 'MAIN DIAL'
		        },
		        legend: {
		            show: true
		          }
		      }
		    }
		  },title: {
			    text: 'MAIN DIAL CHART',
			    align: 'center',
			    margin: 10,
			    offsetX: 0,
			    offsetY: 0,
			    floating: false,
			    style: {
			      fontSize:  '25px',
			      fontWeight:  'bold',
			      fontFamily:  'Helvetica, Arial, sans-serif',
			      color:  '#263238'
			    },
			},
			
			 stroke: {
				    lineCap: "round"
				  },
			labels: ['TARGET', 'PROP TARGET', 'MFG', 'GATEOUT', 'REQD'],
		};

		new ApexCharts(document.querySelector("#rchart"), options1).render();


</script>








	

<script>

new Chart(document.getElementById("myCoachProdNut"), {
    type: 'doughnut',
    data: {
      labels: <%out.print(coachtype);%>,
      datasets: [
        {
          label: "COACH PRODUCTION PLAN",
          backgroundColor: ["#56568f","#92589b","#cc5590","#f75d73","#ff7b48",'rgba(255,0,0,0.7)','rgba(255,0,12,1)','rgba(255,135,0,0.5)','rgba(255,0,217,1)','rgba(0,0,128,1)'],
          data: <%out.print(typetgtqty);%>
        }
      ]
    },
    options: {
    	cutoutPercentage : 50,
    	legend: {
    		display: true,
    		position: 'right',
    		labels: {
    		      padding: 2
    		    }
            
        },
        
        layout: {
            padding: {
                left: 0,
                right: 0,
                top: 0,
                bottom: 0
            }
        },
        
        tooltips: {
            enabled: true,
            mode: 'label'
        },
    	title: {
        display: true,
        text: 'Coach Production Plan',
        fontSize:20,
        padding: 5
      },
      /*  plugins: {
            
    	   datalabels: {
    	       formatter: (value, ctx) => {
    	         let datasets = ctx.chart.data.datasets;
    	         if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
    	           let sum = datasets[0].data.reduce((a, b) => a + b, 0);
    	           let percentage = Math.round((value / sum) * 100) + '%';
    	           return percentage;
    	         } else {
    	           return percentage;
    	         }
    	       },
    	       color: '#fff',
    	     }
          } */
          
          /*  plugins: {
				datalabels: {
					anchor: 'end',
		              align: 'center',
					backgroundColor: function(context) {
						return context.dataset.backgroundColor;
					},
					borderColor: 'white',
					borderRadius: 30,
					borderWidth: 4,
					color: 'white',
					display: function(context) {
						var dataset = context.dataset;
						var count = dataset.data.length;
						var value = dataset.data[context.dataIndex];
						return value.toFixed(2) + "%";
					},
					font: {
						weight: 'bold'
					},
					color: '#fff',
					formatter: Math.round
				}
			}   */
			
			plugins: {
	            datalabels: {
	            	  display: 'auto'	,
	            	  anchor: 'end',
	            	  align: 'center',
		              
		              backgroundColor: function(context) {
							return context.dataset.backgroundColor;
						},
						borderColor: 'white',
						borderRadius: 25,
						borderWidth: 2,
	            	formatter: (value, ctx) => {
	                
	                  
	               /*     let percentage = value.toFixed(1)+"%";
	                  
	                  return percentage;  */
	                  
	                   let percent = (value/<%out.print(sum);%>)*100;
	                  
	                  return (percent.toFixed(1))+"%"; 

	              
	                },
	                font: {
						
					},
	                color: '#fff',
	                     }
	        } ,
			
			/*  pieceLabel: {
		          render: 'data',
		          fontColor: '#000',
		          position: 'outside',
		          segment: true
		        },  */
    responsive : false,
    maintainAspectRatio:false
    }
});

</script>	



<script>

new Chart(document.getElementById("myChartNut"), {
    type: 'doughnut',
    data: {
      labels: ["TARGET", "PROP TARGET", "GATEOUT", "MFG", "REQD"],
      datasets: [
        {
          label: "MAIN DIAL",
          backgroundColor: ["#56568f","#92589b","#cc5590","#f75d73","#ff7b48"],
          data: [<%out.print(mtarget);%>, <%out.print(mprop);%>, <%out.print(mgateout);%>, <%out.print(mmfg);%>, <%out.print(mreqd);%>]
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'MAIN DIAL'
      },
      /* plugins: {
            datalabels: {
              anchor: 'end',
              align: 'top',
              formatter: Math.round,
              font: {
                weight: 'bold'
              }
            }
          }, */
          
          plugins: {
				datalabels: {
					anchor: 'end',
		              align: 'center',
					backgroundColor: function(context) {
						return context.dataset.backgroundColor;
					},
					borderColor: 'white',
					borderRadius: 25,
					borderWidth: 2,
					color: 'white',
					display: function(context) {
						var dataset = context.dataset;
						var count = dataset.data.length;
						var value = dataset.data[context.dataIndex];
						return value > count * 1.5;
					},
					font: {
						weight: 'bold'
					},
					formatter: Math.round
				}
			},
    responsive : true,
    maintainAspectRatio:false
    }
});

</script>	
	



	<script>
    
  var canvas = document.getElementById('myWorkDayChart');
  new Chart(canvas, {
    type: 'bar',
    data: {
    	
    	 labels: ['Number of Days',],
    	
    	 
    	  <%--  labels: ['Yesterday Working Days', 'Total Working Days'],  
         
            datasets: [{
             labels: ['Yesterday Working Days', 'Total Working Days'], 

             data: [<%out.print(ytd);%>,<%out.print(tot);%>], 
            
            backgroundColor: ['rgba(173, 255, 47, 1)','rgba(255, 0, 0, 1)']
          }]   --%>
    	
    
  
	   datasets: [{
	      
		  label: 'Working Days Over',

	      data: [<%out.print(ytd);%>], 
	      
	      backgroundColor: 'rgba(173, 255, 47, 1)'
	    }, 
	    {
	      label: 'Total Working Days',
 
	      data: [<%out.print(tot);%>], 
	       
	      backgroundColor: 'rgba(255, 0, 0, 1)'
	    }] 
    
    },
    
    options: {
    	legend: {
    	      display: true,
    	      position: 'bottom',
    	      labels: {
    	        fontColor: "#000"
    	      }
    	    },
    	title:{
            display:true,
            text:'Working Days',
            fontSize:18,
            fontFamily: "'Helvetica', 'Arial', sans-serif",
            fontStyle:'bold'
            
          }, 
        layout:{
          padding:{
            left:50,
            right:0,
            bottom:0,
            top:0
          }
        }, 
        
        tooltips: {
            enabled: true,
            mode: 'single',
            titleFontSize: 10,
            bodyFontSize: 10,
            /* caretSize: 20, */
            callbacks: {
                label: function(tooltipItems, data) { 
                	
                	var i, label = [], l = data.datasets.length;
                    for (i = 0; i < l; i += 1) {
                    	
                    	
                        label[0] = " 'Total Number of working days in factory excluding holidays (ideally equals 265- 17 gaz holidays - 52 sundays = 296 ) ' " ;
                        label[1] = " 'Number of working days over since 1 april of the year till date ' " ;
                    }
                    return label;
                }
            }
        },
        
        
        plugins: {
            datalabels: {
              anchor: 'end',
              align: 'top',
              formatter: Math.round,
              font: {
                weight: 'bold'
              }
            }
          },
      scales: {
        yAxes: [{
        	beginAtZero: true,
        	id: 'A',
          position: 'left',
          ticks: {beginAtZero: true,
  	     min: 0,
  	        stepSize: 200
  	      },
          gridLines: {
              display : false
          }

        }],
        xAxes: [{
            display: true,
             ticks: {
                beginAtZero: true,
                steps: 5,
                stepValue: 20,
                min:0
                
            },
            gridLines: {
                display : true
            }

        }]
      },
      responsive : false,
      maintainAspectRatio:false
    }
  });

  </script>
  
  
  <script>
    
  var canvas = document.getElementById('myDailyProdChart');
  new Chart(canvas, {
    type: 'bar',
    data: {
    	
    	 labels: ['Daily Production Rate',],
    	
    	 
    	  <%--  labels: ['Yesterday Working Days', 'Total Working Days'],  
         
            datasets: [{
             labels: ['Yesterday Working Days', 'Total Working Days'], 

             data: [<%out.print(ytd);%>,<%out.print(tot);%>], 
            
            backgroundColor: ['rgba(173, 255, 47, 1)','rgba(255, 0, 0, 1)']
          }]   --%>
    	
    
  
	   datasets: [{
	      
		  label: 'Previous Day',
		  
		  yAxisID: 'A',

	      data: [<%out.print(crdt_mfg);%>], 
	      
	      backgroundColor: 'rgba(173, 255, 47, 1)'
	    }, 
	    {
	      label: 'Actual Rate',
	      
	      yAxisID: 'A',
 
	      data: [<%out.print(prod_actl_rate);%>], 
	       
	      backgroundColor: 'rgba(255, 0, 0, 1)'
	    }, 
	    {
		      label: 'Required Rate',
		      
		      yAxisID: 'A',
	 
		      data: [<%out.print(prod_reqd_rate);%>], 
		       
		      backgroundColor: 'rgba(44, 130, 201, 1)'
		    }] 
    
    },
    
    options: {
    	legend: {
    	      display: true,
    	      position: 'bottom',
    	      labels: {
    	        fontColor: "#000"
    	      }
    	    },
    	title:{
            display:true,
            text:'Daily Production Rate',
            fontSize:18,
            padding: 20
          }, 
        layout:{
          padding:{
            left:50,
            right:0,
            bottom:0,
            top:0
          }
        }, 
        
        plugins: {
            datalabels: {
              anchor: 'end',
              align: 'top',
              /* formatter: Math.round, */
              font: {
                weight: 'bold'
              }
            }
          },
      scales: {
        yAxes: [{
        	display: true,
	          id: 'A',
	          position: 'left',
	        	  ticks: {beginAtZero: true,
	        	        
	        	        min: 0,
	        	        stepSize: 400,
	        	        steps:5
	        	      }, 
  	    gridLines: {
            display : false
        }
        }],
        xAxes: [{
            display: true,
             ticks: {
                beginAtZero: true /* ,
                min:0,
                steps: 5,
                 stepValue: 20   */
                
                
            } ,
            gridLines: {
                display : true
            }
        }]
      },
      responsive : true,
      maintainAspectRatio:false
    }
  });

  </script>


	<script>
  
  
  var canvas = document.getElementById('myChart2');
  new Chart(canvas, {
    type: 'bar',
    data: {
    	/* labels: ['a', 'b', 'c', 'd', 'e'], */
      labels: <%out.print(rstype);%>, 
      
      datasets: [{
        label: 'mfg value',
        yAxisID: 'A',
         /* data: [100, 90, 80, 70, 60], */ 
         data: <%out.print(mfg);%>, 
        /* backgroundColor: 'rgba(255, 215, 0, 1)' */
        backgroundColor: 'rgba(173, 255, 47, 1)'
      }, {
        label: 'gate out',
        yAxisID: 'A',
         /* data: [-100, -90, -80, -70, -60],  */
         data: <%out.print(gateout);%>, 
        backgroundColor: 'rgba(255, 0, 0, 1)'
      },
      {
          label: 'Target',
          yAxisID: 'A',
           /* data: [-100, -90, -80, -70, -60],  */
           data: <%out.print(tgt);%>, 
          backgroundColor: 'rgba(44, 130, 201, 1)'
        }]
      /* borderWidth:1,
      borderColor:'#777',
      hoverBorderWidth:3,
      hoverBorderColor:'#000' */
    },
    
    options: {
    	title:{
            display:true,
            text:'Coach Wise Performance',
            fontSize:25
          },
           /* legend:{
          display:true,
          position:'right',
          labels:{
            fontColor:'#000'
          }
        }, */
        layout:{
          padding:{
            left:50,
            right:0,
            bottom:0,
            top:0
          }
        }, 
        
        plugins: {
            datalabels: {
              anchor: 'end',
              align: 'top',
              formatter: Math.round,
              font: {
                weight: 'bold'
              }
            }
          },
      scales: {
        yAxes: [{
          id: 'A',
          position: 'left'
        }],
        xAxes: [{
            display: true,
            ticks: {
                beginAtZero: true,
                steps: 10,
                stepValue: 5,
                max: 100
            }
        }]
      },
      responsive : true,
      maintainAspectRatio:false
    }
  });

  </script>


	<script>
  
  
  var canvas = document.getElementById('myChart3');
  new Chart(canvas, {
    type: 'bar',
    data: {
    	/* labels: ['a', 'b', 'c', 'd', 'e'], */
      labels: <%out.print(stagedesc);%>, 
      
      datasets: [{
        label: 'cum prod',
        yAxisID: 'A',
         /* data: [100, 90, 80, 70, 60], */ 
         data: <%out.print(cumprod);%>, 
        /* backgroundColor: 'rgba(255, 215, 0, 1)' */
        backgroundColor: 'rgba(173, 255, 47, 1)'
      }, 
      {
          label: 'Target',
          yAxisID: 'A',
           /* data: [-100, -90, -80, -70, -60],  */
           data: <%out.print(yearlytarget);%>, 
          backgroundColor: 'rgba(44, 130, 201, 1)'
        }]
      /* borderWidth:1,
      borderColor:'#777',
      hoverBorderWidth:3,
      hoverBorderColor:'#000' */
    },
    
    options: {
    	title:{
            display:true,
            text:'Shop Wise Performance',
            fontSize:25
          },
           /* legend:{
          display:true,
          position:'right',
          labels:{
            fontColor:'#000'
          }
        }, */
        layout:{
          padding:{
            left:50,
            right:0,
            bottom:0,
            top:0
          }
        }, 
        
        plugins: {
            datalabels: {
              anchor: 'end',
              align: 'top',
              formatter: Math.round,
              font: {
                weight: 'bold'
              }
            }
          },
      scales: {
        yAxes: [{
          id: 'A',
          position: 'left'
        }],
        xAxes: [{
            display: true,
            ticks: {
                beginAtZero: true,
                steps: 10,
                stepValue: 5,
                max: 100
            }
        }]
      },
      responsive : true,
      maintainAspectRatio:false
    }
  });

  </script>
  
 	 <script>
  
  
  var canvas = document.getElementById('myChart4');
  new Chart(canvas, {
    type: 'horizontalBar',
    data: {
    	/* labels: ['a', 'b', 'c', 'd', 'e'], */
      labels: <%out.print(rstype);%>, 
      
      datasets: [{
        label: 'mfg value',
        yAxisID: 'A',
         /* data: [100, 90, 80, 70, 60], */ 
         data: <%out.print(mfg);%>, 
        /* backgroundColor: 'rgba(255, 215, 0, 1)' */
        backgroundColor: 'rgba(173, 255, 47, 1)'
      }, {
        label: 'gate out',
        yAxisID: 'A',
         /* data: [-100, -90, -80, -70, -60],  */
         data: <%out.print(gateout);%>, 
        backgroundColor: 'rgba(255, 0, 0, 1)'
      }, {
          label: 'Target',
          yAxisID: 'A',
           /* data: [-100, -90, -80, -70, -60],  */
           data: <%out.print(tgt);%>, 
          backgroundColor: 'rgba(44, 130, 201, 1)'
        }]
      /* borderWidth:1,
      borderColor:'#777',
      hoverBorderWidth:3,
      hoverBorderColor:'#000' */
    },
    
    options: {
    	title:{
            display:true,
            text:'Coach Wise Performance',
            fontSize:25
          },
           /* legend:{
          display:true,
          position:'right',
          labels:{
            fontColor:'#000'
          }
        }, */
        layout:{
          padding:{
            left:50,
            right:0,
            bottom:0,
            top:0
          }
        }, 
        
        plugins: {
            datalabels: {
              anchor: 'end',
              align: 'right',
              formatter: Math.round,
              font: {
                weight: 'bold'
              }
            }
          },
      scales: {
        yAxes: [{
          id: 'A',
          position: 'left'
        }],
        xAxes: [{
            display: true,
            ticks: {
                beginAtZero: true/* ,
                steps: 10,
                stepValue: 5,
                max: 100 */
            }
        }]
      },
      responsive : true,
      maintainAspectRatio:false
    }
  });

  </script>  
 
 
 
   <script>
  
  var canvas1 = document.getElementById('myLineChart');
  new Chart(canvas1, {
	  type: 'line',
	  data: {
	   
	    labels: ['2012', '2013', '2014', '2015', '2016', '2017', '2018'],
	    
	    
	    datasets: [{
	        
	        label: 'Production',
	        yAxisID: 'A',
	        data: [38233.0, 46316.0, 46664.0, 41386.0, 37068.0, 37748.0, 36124.0], 
	        backgroundColor: 'rgba(255, 215, 0, 1)',
	        borderColor: 'rgba(255, 215, 0, 1)',
	        lineTension:0.1,
	        showLine:true,
	        fill: false
	        
	      }]
	    
	  },
	  
	  options: {
	    	title:{
	            display:true,
	            text:'Production Year Wise Performance',
	            fontSize:25
	          },
	           
	        layout:{
	          padding:{
	            left:50,
	            right:0,
	            bottom:0,
	            top:0
	          }
	        }, 
	        
	        plugins: {
	            datalabels: {
	              anchor: 'end',
	              align: 'center',
	              formatter: Math.round,
	              font: {
	                weight: 'bold'
	              }
	            }
	          },
	       scales: {
	        yAxes: [{
	        	display: true,
	          id: 'A',
	          position: 'left',
	        	  ticks: {beginAtZero: false/* ,
	        	        
	        	        min: 0, */
	        	        
	        	      }
	        }],
	        xAxes: [{
	            display: true,
	            ticks: {
	                beginAtZero: false,
	                steps: 10,
	                stepValue: 5,
	                max: 100
	            }
	        }]
	      }, 
	          responsive : true,
	          maintainAspectRatio:false
	    }
	  
	});
  
  
  
  </script>
  
 
   
    	
  
 
 
 	
	 <script>
  
  var canvas = document.getElementById('myDoubleLineChart');
  new Chart(canvas, {
	  type: 'line',
	  data: {
	    
	    labels: <%out.print(stagedesc);%>,
	    
	    
	    datasets: [{
	        
	        label: 'cum prod',
	        yAxisID: 'A',
	       
	         data: <%out.print(cumprod);%>, 
	        backgroundColor: 'rgba(255, 215, 0, 1)',
	        borderColor: 'rgba(255, 215, 0, 1)',
	        lineTension:0.1,
	        showLine:true,
	        	fill: false
	      }, {
	       
	        label: 'Target',
	        yAxisID: 'A',
	        
	         data: <%out.print(yearlytarget);%>, 
	        backgroundColor: 'rgba(255, 0, 0, 1)',
	        borderColor: 'rgba(255, 0, 0, 1)',
	        lineTension:0.1,
	        showLine:true,
	        	fill: false
	      }]
	    
	  },
	 
	  
	  options: {
	    	title:{
	            display:true,
	            text:'Shop Wise Performance',
	            fontSize:25
	          },
	           
	        layout:{
	          padding:{
	            left:50,
	            right:0,
	            bottom:0,
	            top:0
	          }
	        }, 
	        
	        plugins: {
	            datalabels: {
	              anchor: 'end',
	              align: 'top',
	              formatter: Math.round,
	              font: {
	                weight: 'bold'
	              }
	            }
	          },
	       scales: {
	        yAxes: [{
	        	display: true,
	          id: 'A',
	          position: 'left',
	        	  ticks: {beginAtZero: true,
	        	        /* max: 100,
	        	        min: 0,
	        	        stepSize: 10 */
	        	      }
	        }],
	        xAxes: [{
	            display: true,
	            ticks: {
	                beginAtZero: true,
	                /* steps: 10,
	                stepValue: 5,
	                max: 100 */
	            }
	        }]
	      },
	      responsive : true,
	      maintainAspectRatio:false 
	    }
	  
	});
  
  
  
  </script>
  

  
  <script>
  
  var options = {
          series: [<%out.print(newmtarget);%>, <%out.print(newmprop);%>, <%out.print(newmmfg);%>, <%out.print(newmgateout);%>, <%out.print(newmreqd);%>],
          colors:['rgba(44, 130, 201, 1)', 'rgba(50,205,50 ,1 )','rgba(138,141,145, 1)', 'rgba(128,0,0, 0.8)', 'rgba(255,0,0, 1)'],
          chart: {
        	  width:560,
        	  height: 460,
          
          type: 'radialBar',
          animations: {
		        enabled: true,
		        easing: 'easeinout',
		        speed: 2000,
		        animateGradually: {
		            enabled: true,
		            delay: 150
		        },
		        dynamicAnimation: {
		            enabled: true,
		            speed: 350
		        }
		    }
        },
        plotOptions: {
          radialBar: {
            offsetY: 0,
            startAngle: 0,
            endAngle: 270,
            hollow: {
              margin: 5,
              size: '30%',
              background: 'transparent',
              image: undefined,
            },
            dataLabels: {
              name: {
                show: true,
                fontSize: '16px'
              },
              value: {
                  show: true,
                  /* color: ['rgba(44, 130, 201, 1)', 'rgba(44, 130, 201, 1)', 'rgba(44, 130, 201, 1)', 'rgba(44, 130, 201, 1)', 'rgba(44, 130, 201, 1)'], */
                  fontSize: '18px',
                  offsetY: 5,
                  formatter: function (val) {
                
               			return Math.round((val*<%out.print(maxtarget);%>))/100
                  }
                }
            }
          }
        },
        /* colors: ['#1ab7ea', '#0084ff', '#39539E', '#0077B5'], */
        stroke: {
				    lineCap: "round"
				  },
				  title: {
			          text: '<%out.print("Production YTD - Out Turn : "+perf); %>',
			          align: 'center',
			          style: {
			              fontSize:  '20px',
			              fontWeight : "bold",
			              fontFamily:  'Helvetica',
			              color:  '#666666'
			            }
			        },
        labels: ['TARGET', 'PROP TARGET', 'MFG', 'GATEOUT', 'REQD'],
        legend: {
          show: true,
          floating: true,
          fontSize: '18px',
          fontFamily: 'Helvetica',
          position: 'left',
          offsetX: 30,
          offsetY: 60,
          labels: {
            useSeriesColors: true,
          },
          markers: {
            size: 2
          },
          formatter: function(seriesName, opts) {
            return seriesName + "  :  " + Math.round(((opts.w.globals.series[opts.seriesIndex])*<%out.print(maxtarget);%>))/100
          },
          itemMargin: {
            horizontal: 0,
          }
        },
        responsive: [{
          breakpoint: 300,
          options: {
            legend: {
                show: true
            }
          }
        }]
        };

        var chart = new ApexCharts(document.querySelector("#rBarchart"), options);
        chart.render();
  
  </script>
  
 
 
  
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.XYChart3D);

// Add data
chart.data = [{
    "country": "USA",
    "year2017": 3.5,
    "year2018": 4.2
}, {
    "country": "UK",
    "year2017": 1.7,
    "year2018": 3.1
}, {
    "country": "Canada",
    "year2017": 2.8,
    "year2018": 2.9
}, {
    "country": "Japan",
    "year2017": 2.6,
    "year2018": 2.3
}, {
    "country": "France",
    "year2017": 1.4,
    "year2018": 2.1
}, {
    "country": "Brazil",
    "year2017": 2.6,
    "year2018": 4.9
}, {
    "country": "Russia",
    "year2017": 6.4,
    "year2018": 7.2
}, {
    "country": "India",
    "year2017": 8,
    "year2018": 7.1
}, {
    "country": "China",
    "year2017": 9.9,
    "year2018": 10.1
}];

// Create axes
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.renderer.minGridDistance = 30;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.title.text = "GDP growth rate";
valueAxis.renderer.labels.template.adapter.add("text", function(text) {
  return text + "%";
});

// Create series
var series = chart.series.push(new am4charts.ColumnSeries3D());
series.dataFields.valueY = "year2017";
series.dataFields.categoryX = "country";
series.name = "Year 2017";
series.clustered = false;
series.columns.template.tooltipText = "GDP grow in {category} (2017): [bold]{valueY}[/]";
series.columns.template.fillOpacity = 0.9;

var series2 = chart.series.push(new am4charts.ColumnSeries3D());
series2.dataFields.valueY = "year2018";
series2.dataFields.categoryX = "country";
series2.name = "Year 2018";
series2.clustered = false;
series2.columns.template.tooltipText = "GDP grow in {category} (2017): [bold]{valueY}[/]";

}); // end am4core.ready()
</script>

	

</body>


</html>