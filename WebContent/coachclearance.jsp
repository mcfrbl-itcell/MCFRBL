<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="ACTION.Coachtypeclearance"%>
   <%-- <%@page import="ACTION.DispatchedCoaches" %> --%>
    <%@ page import="model.User" %>
   <%@ page import ="java.util.*"%>
   <%@ page import="java.sql.*" %>
   <%@page import="beans.TestingMobileClearance" %>
   <%@page import="hibernateConnect.HibernateConfig" %>
   <%@page import="org.hibernate.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<title>Insert title here</title>
</head>
<style>

.vertical {
  writing-mode: vertical-rl;
  transform: rotate(0deg);
}
th{
   text-align: center;
   padding:6px;
   font-size: 95%;
}
td{
   text-align: center;
}
.Custom{
 position: relative;
 font-family: Arial;
 box-sizing: border-box;
   padding-left:2px;}
   
   .Custom-select select {
  display: none; 
}

.select-selected {
  background-color: white;
}
.submitBtn:hover {
  background-color:#5555;
  color: white;  
}
input[type=submit] {
  background-color: SlateBlue;
  color: white;
  cursor: pointer;
  align:center;
  font-size: 15px;
  border-radius: 10px;
  padding: 6px;
}
.submitBtn{
	margin-left:10px;
	outline:none;
}

}
</style>
<body>
<div class="row">
<div class="col-sm-9 col-md-6 col-lg-8">
<h1 style="font-size:20px;color:SlateBlue; margin-left:20px;margin-right:40px">Select Coach Type :</h1>
<%System.out.println("coachclearanace"); 
Coachtypeclearance s=new Coachtypeclearance();
s.getcoachDetails();
System.out.println("fetched coach list"); 
List<String>substagei=s.getCoachtypelist();
System.out.println("substagei coach list"); 
%>
<div class="Custom" style="margin-bottom:20px;margin-left:20px;">
<select id="dropdown" style="font-size:17px; background-color:F7F1EF;">
<option>Select:</option><% 
 
for(String i:substagei) {%>
<option value="<%=i%>"><%=i%></option>
<% 
}
%>
</select>&nbsp;&nbsp;&nbsp;<input type="submit"  value="Confirm" name="SUBMIT" class="submitBtn" id="submitBtn" onClick="return coachtypedetails()" style="margin-left:120px;margin-bottom:40px;">
&nbsp;&nbsp;&nbsp;<input type="submit" value="Back" id="SUBMIT" class="submitBtn" onclick="goBack()" style="margin-left:20px;margin-bottom:40px;">

</div>
     <div id="1" class="table-responsive"></div>

</div>   
   <div class="col-sm-3 col-md-6 col-lg-4">
     <h1 style="font-size:25px;color:SlateBlue; margin-left:100px ; margin-bottom:148px;"> Dispatched Coaches :</h1>
   <div id="2" class = "table-responsive">
 <table class="table" style="margin-left:3px; border:1px solidblack;">

<tr>
<th>Coach Type</th>
<th>No. of Coaches</th>
<th>Furn No. List</th>
</tr>


<%
Session session1=null;

List<Object[]> DispatchedCoaches = null;
//HttpSession session_http = ServletActionContext.getRequest().getSession(true);
 session1 = HibernateConfig.getSession();


	//String hql="select F.furnishing_asset_id, P.furnishing_no, P.coach_type,furn_stage_date_proc(F.furnishing_asset_id)  from furnishing_tran F, paint_tran P where F.paint_asset_id = P.paint_asset_id and furn_all_stage_status_proc(F.furnishing_asset_id)='Y';";
	String hql="select furnishing_asset_id, furnishing_no, coach_type from dispatched_coach order by coach_type";
	Query query = session1.createSQLQuery(hql);
	DispatchedCoaches = query.list();  
     Map<String,List<String>> myMaps = new HashMap<String,List<String>>();  
     //Map<String,Integer> count = new HashMap<String,Integer>();  
     //int i=0;
     for(Object[] item: DispatchedCoaches)
     {

	String furnishingNo=item[1].toString();
	String coachType=item[2].toString();
	
	if (!myMaps.containsKey(coachType)) {
        myMaps.put(coachType, new ArrayList<String>());
	}
    myMaps.get(coachType).add(furnishingNo);
    
	}
     for (Map.Entry<String, List<String>> entry : myMaps.entrySet()) {
    	    //System.out.println(entry.getKey() + " = " + entry.getValue());
    

%>

	
		
		<tr>
	     <td><%=entry.getKey() %></td>
	    <td> <%=entry.getValue().size() %></td>
	     <td> <%=entry.getValue().toString().replace("[","").replace("]","") %></td>
	     
	    </tr>

<%
}
%> 
     </table>
</div>
      
     </div>
  </div>
 
</body>




<script>

function goBack() {
  window.history.back();
}

function coachtypedetails(){
	var Coachtype= $('#dropdown').find(":selected").text();
	//console.log("received broadcast: " + ", " +Coachtype);
	//var stage=$('input[id=stage]').val();
	//var stageDesc=stage.toUpperCase();

	
	
//dispatch coaches end
    var formdata={Coachtype:Coachtype};
	$.ajax({
		url:"coachClearance",
		type:'POST',
		data:formdata,
		async:false,
	   success: function(data){ 
		   /* */ 
	if(data.substagestagedesclist.length!=0 && data.furnishingnumberList.length!=0){
		  var $table  =  $('<table class="table" style="margin-left:20px;"border="2px solidblack"; ></table>');
		    var $tr =  $('<tr> </tr>');
		    var $th0 =  $('<th class="vertical" >Furn No.</th>');
			 $tr.append($th0);
			   //$table.append($tr);
			 for(var i in data.substagestagedesclist){
			 var $th=$('<th class="vertical" > </th>');
			 $th.append(data.substagestagedesclist[i]);
			 $tr.append($th);
			 }
			 $table.append($tr);
			 
			 
	   for(var i in data.furnishingnumberList){
				  var $tr =  $('<tr></tr>');
			      var $th0 =  $('<th></th>');
			     // console.log("furnishing number " + ", " +data.furnishingnumberList[i]);
				   $th0.append(data.furnishingnumberList[i]);
				   $tr.append($th0);
			    for(var j in data.substage_idList){
			    	//console.log("substage description" + ", " +data.substagestagedesclist[j]);
			    	var $td =  $('<td></td>');
			    	   var flag=false;
			    	for(var k in data.substageidfromtmcList){
			    		 //console.log("tmc se jo data aya hai " + ", " +data.stageList[k]);
			    		 if(data.substageidfromtmcList[k]==data.substage_idList[j] && data.furnishingnumberList[i]==data.originalfurnishingnumberlist[k]){
			    			 if(data.testingstatusList[k]=="ok")  
			    				 flag=true;
			    		 }
			    		       
			    	 }
			    	if(flag==true)
			    	    $td.append("Y");
			    	else 
			    		$td.append("N");
			    	
			    	
			   	$tr.append($td);
			    	
			    }	
			    $table.append($tr);
			   } 
			 
			 
		 
		   $('#1').empty().append($table);
		   
	}	   
	else{ 
	         var $markup=$('<p style="font-size:160%; margin-left:40px; text-align:center ">--x--x--No Data Available--x--x--</p>');
		   $('#1').empty().html($markup); 
	     
	}



	
		   } 
		  
	   
		   
	   });
}
	
</script>
</html>