<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.DbConnection" %>

<html>
<head>
<% 
String contextpath=request.getContextPath(); 
String testingType=request.getParameter("testingType");
String docNo=request.getParameter("docNo");
System.out.println(docNo);
System.out.println(testingType);
%>
<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"> 

function saveElecTest(furnishingAssetId,coachType,testingType,parameterName,subParaName,columnName,fieldValue) 
{
	$.ajax({  
		 url: "elec_param_default_value_save_action",     
		 type: "POST", // performing a POST request
		 dataType:"json",
		  
		 data : {
			 AssetId :furnishingAssetId,
			 coachtype : coachType,
			 testingtype : testingType,
			 paraName : parameterName,
			 subPara:subParaName,
			 columnName : columnName,
			 fieldValue : fieldValue
		  },
		  async: false,
		  
		  success: function (data) {
			  // alert("hello");
			  //('#dep').html(data.message);
	     	
			      },
			    error: function (data)
			    {
			    	alert("error1");
			  //  $('#dep').html(data.message);   
			    },
			  });
			   
} 
/* $("#button").click(function() {
    $("#dataTables1 input[type=text]").each(function() {
         if((this).hasClass('integer'))
        {
        if(!isNaN(this.value)) {
            alert(this.value + " is a valid number");
        }
     }
    });
    return false;
});
 */
function buttonClick(assetId,testingType, coachType)
{
	 
	var c=confirm("Do you want to submit data for Electrical Testing");
	if(c==false){return false;}
	
	//var electAssetId=$('input[id=]').val();
	$.ajax({  
		 url: "elec_param_default_value_save1_action",     
		  type: "POST",// performing a POST request
		 dataType:"json",
		  
		 data : {
			
			 AssetId:assetId,
			 testingtype:testingType,
			 coachType: coachType,
			 testDocNo:$('#electricalDocNo').val(),
			 testingDate:$('#electTestingDate').val(),
			 testShift:$('#electTestingShift').val(),
			 testStatus:$('#elecTestingStatus').val(),
			 docDate:$('#electricalDocDate').val(),
			
		  },
		 
		  async: false,
		  
		  success: function (data) {
			    //alert("hello"); 
			  $('#dataTable').closest(".ui-dialog-content").dialog('close');
			   
			      },
			    error: function (data)
			    {
			    	alert("error");
			  //  $('#dep').html(data.message); 
			    	$('#dataTable').closest(".ui-dialog-content").dialog('close');
			    },
			   
			  });
}

//Decimal
 function isDecimalKey(el, evt) {
	 var spanid=el.id+'_output';
	  //var h = document.getElementById(el.id);
	     var charCode = (evt.which) ? evt.which : event.keyCode;
	     var number = el.value.split('.');
	     if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {

	         document.getElementById(spanid).innerHTML='<span style="background: #fee;width: 200px;height: 25px;margin: 15px 0;color: #a33;">Only number and point allowed</span>';
	      
	 return false;
	     }
	 else
	 {
	 document.getElementById(spanid).innerHTML="";
	 }
	     //just one dot
	     if(number.length>1 && charCode == 46){

	 document.getElementById(spanid).innerHTML='<span style="background: #fee;width: 200px;height: 25px;margin: 15px 0;color: #a33;">Not a valid number</span>';

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
	//INTEGER
	
function isNumberKey(txtvalue,evt){
		 var spanid=txtvalue.id+'_output';

		     var charCode = (evt.which) ? evt.which : event.keyCode
		     if (charCode > 31 && (charCode < 48 || charCode > 57))
		     {
		      document.getElementById(spanid).innerHTML='<span style="background: #fee;width: 200px;height: 25px;margin:15px 0;color: #a33;">Only number allowed</span>';
		      return false
		       }
		        else
		      {
		       document.getElementById(spanid).innerHTML='';
		     return true;
		     }
		 }


</script>
</head>
<body>
<div id="dataTable">
<form name="dataTables1" id="dataTables1">
<%

String assetId=request.getParameter("assetId");
String coachType=request.getParameter("coachType");
String tstatus="";
String coachNo1=null;
String shellNo1=null;
String validationRule=null;
String count=null;

//String subPara="";
String[] subParaNameArray=null;


%>


<% 
try {
	
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and 
database name is student. */
//String connectionURL = "jdbc:postgresql://localhost/MCFRBL";

// declare a connection by using Connection interface
DbConnection db=new DbConnection();

Connection connection = null;
connection=db.getConnection();
/* declare object of Statement interface that is used for executing sql 
statements. */



Statement st_coach_shell=connection.createStatement();
Statement st_count_para=connection.createStatement();
Statement st_primary_data=connection.createStatement();
Statement st_para_master=connection.createStatement();
Statement st_t_data=connection.createStatement();
Statement st_observed_value=connection.createStatement();
		// declare a resultset that uses as a table for output data from tha table.

ResultSet r_coach_shell;
ResultSet r_count_para;
ResultSet r_primary_data;
ResultSet r_para_master;
ResultSet r_t_data;
ResultSet r_observed_value;



String queryForPrimaryData ="select shift_of_testing,testing_date,testing_status, electrical_doc_no, doc_date from elect_test_transaction_primary_data where asset_id="+assetId+" and electrical_testing_type='"+testingType+"'";

System.out.println("Output of Query2: "+queryForPrimaryData);
r_primary_data = st_primary_data.executeQuery(queryForPrimaryData);

String shiftOfTesting="" , td=null, docDate=""; 
if(r_primary_data.next()){
	shiftOfTesting=r_primary_data.getString(1);	if(shiftOfTesting==null)  {shiftOfTesting="";}
	td=r_primary_data.getString(2);
	tstatus= r_primary_data.getString(3);
	if(r_primary_data.getString(4)!=null) { docNo=r_primary_data.getString(4);}	
	if(r_primary_data.getString(5)!=null) { docDate=r_primary_data.getString(5);}
}

 String count_para="SELECT count(*) FROM elect_test_para_m WHERE coach_type='"+coachType+"' AND testing_type='"+testingType+"' AND heading_flag='N'";
System.out.println("Parameter Count:"+count_para);
 r_count_para=st_count_para.executeQuery(count_para);
if(r_count_para.next())
{
 count=r_count_para.getString(1); 
}


// retrieve coach no and shell no
String retrieveCoachShell="select f.coach_number,s.shell_no from furnishing_tran f,shell_tran s where f.furnishing_asset_id="+assetId+" and f.shell_asset_id=s.shell_asset_id";
r_coach_shell = st_coach_shell.executeQuery(retrieveCoachShell);

while(r_coach_shell.next()){
	coachNo1=r_coach_shell.getString("coach_number"); if(coachNo1==null) {coachNo1="";}
	shellNo1=r_coach_shell.getString(2); if(shellNo1==null) {shellNo1="";}
}
	 %>
<table border="1" cellspacing="0" cellpadding="0">
<tr>
<td  rowspan="6" align="center"><h2>MODERN COACH FACTORY RAEBARELI</h2></td>
<th>DOC NO/Doc Date:</th><td><input type="text" style="width:100%;" id="electricalDocNo" value=<%=docNo%> placeholder="Doc No">&nbsp;&nbsp;<input type="text" style="width:100%;" id="electricalDocDate" value=<%=docDate%> placeholder="Doc Creation Date"></td>
<th>DATE</th><td><input type="date" style="width:100%;" id="electTestingDate" value="<%=td%>"></td>
<th>SHIFT</th>
<td>
<select name="electTestingShift" id="electTestingShift">
<option value="">Select</option>
<% 
if(shiftOfTesting.equals("general"))
{%>
<option value="general" selected>General</option>

<%}
else
{%>
	<option value="general">General</option>
<% }
if(shiftOfTesting.equals("morning"))
{
%>
<option value="morning" selected>Shift-I</option>
<%}
else
{
%>
<option value="morning">Shift-I</option>

<%} 
if(shiftOfTesting.equals("evening"))
{
%>
<option value="evening" selected>Shift-II</option>
<%}
else
{%>
	<option value="evening">Shift-II</option>
<% }
if(shiftOfTesting.equals("night"))
{
	%>
<option value="night" selected>Shift-III</option>
<%}
else
{%>
	<option value="night">Shift-III</option>
<% }

%>
</select>
</td>
</tr>

<tr><th>COACH NO</th><td><input type="text" style="width:100%;" id="coachNo" value="<%=coachNo1%>"></td>
<th>TYPE OF COACH</th><td><input type="text" style="width:100%;" id="coachType1" value="<%=coachType%>"></td>
<th>SHELL NO</th><td><input type="text" style="width:100%;" id="shellNo" value="<%=shellNo1%>"></td>

</tr>
</table>


<%
String queryString_para_master = "SELECT sr_no,para_name,specified_desc,list_value_observed,default_value_observed,default_value_remark,list_value_remark,heading_flag,validation_rule,sub_para FROM elect_test_para_m WHERE coach_type='"+coachType+"' AND testing_type='"+testingType+"' ORDER BY seq_no";
System.out.println("Query :>"+queryString_para_master);

r_para_master = st_para_master.executeQuery(queryString_para_master);
 %>
<hr />
<TABLE cellspacing="0" cellpadding="0" border="1">
<TR>
<TH>Sr no</TH>
<TH>Description of items</TH> 
<TH>Specified</TH>
<TH>Actual Observed</TH>
<TH>Actual Remarks</TH>
</TR>
<%
boolean flg=true;
while (r_para_master.next())
{
String srno=r_para_master.getString(1); if(srno==null){srno="";}
String paraName=r_para_master.getString(2);
String specifiedDesc=r_para_master.getString(3); if(specifiedDesc==null) {specifiedDesc="";}
String listValueObserved=r_para_master.getString(4); if(listValueObserved==null) {listValueObserved="";}
String defaultValueObserved=r_para_master.getString(5); if(defaultValueObserved==null) {defaultValueObserved="";}
String defaultValueRemarks=r_para_master.getString(6);if(defaultValueRemarks==null){defaultValueRemarks="";}
String listValueRemarks=r_para_master.getString(7);if(listValueRemarks==null){listValueRemarks="";}
String headingFlag=r_para_master.getString(8);
 validationRule=r_para_master.getString(9);if(validationRule==null){validationRule="";}
 String subParaName=r_para_master.getString(10);if(subParaName==null){subParaName="";}
 
 
    if(headingFlag.equals("Y"))
    {
    %>
<TR><TD colspan="5" align="center"><b><%=paraName%></b></TD></TR>
<%} 
else
{
	String obsValue="", remarks="";
String sqlQuery_t_data="select observed_value,remarks from elect_test_transaction where furnishing_asset_id='"+assetId+"' and coach_type='"+coachType+"' and testing_type='"+testingType+"' and para_name='"+paraName+"' and sub_para='0'";
System.out.println("Loop no"+sqlQuery_t_data);
r_t_data=st_t_data.executeQuery(sqlQuery_t_data);
//System.out.println("resultset"+r.getString(1));
while(r_t_data.next())
{
	obsValue= r_t_data.getString(1); if(obsValue==null) {obsValue="";}
	remarks=r_t_data.getString(2);  if(remarks==null) {remarks="";}
}
	 
%>
<TR>
<TD><%=srno%></TD>
	   
<TD><%=paraName%>
	<% if(!("".equals(subParaName))){ 
		subParaNameArray=subParaName.split("\\s*,\\s*"); %>
	<table>
	<% 
	String subParaValue="";
	for (int i=0; i<subParaNameArray.length;i++){
		if(!("0".equals(subParaNameArray[i]))){ 
		String query_observed_value="SELECT observed_value FROM elect_test_transaction WHERE coach_type='"+coachType+"' AND testing_type='"+testingType+"' AND furnishing_asset_id="+assetId+" AND sub_para='"+subParaNameArray[i]+"', and para_name='"+paraName+"' ";
		r_observed_value= st_observed_value.executeQuery(query_observed_value);
		while(r_observed_value.next()){
			subParaValue=r_observed_value.getString("observed_value");if(subParaValue==null){subParaValue="";}
		}
		
			
		%>
		<tr><td><%=subParaNameArray[i]%></td><td><input type="text" id="subParaName" onblur="saveElecTest('<%=assetId%>','<%=coachType%>','<%=testingType%>','<%=paraName%>','<%=subParaNameArray[i]%>','observed_value',this.value)" value="<%=subParaValue%>"></td></tr>
	<% }
		
	}%>
	</table>
	</TD>
	<%}
 
 if(testingType.equals("STAGE TESTING")&& flg){
%>
<TD rowspan="<%=count%>" style="text-align:center;font-size:15px;"><b>All <br>EQUIPMETS<br> AND CIRCUITS <br>SHOULD<br> WORK<br> SATISFACTORY</b></TD>

<%
flg=false;
 }
else if(testingType.equals("STAGE TESTING")&& flg==false)
{%>
<% }
else{
%>  
<TD><%=specifiedDesc%></TD>
<% }


if(!listValueObserved.equals(""))
{
String[] listObservedValueArray=listValueObserved.split("\\s*,\\s*");
%>
<TD>
<select name="observedValue" id="observedValue"  onblur="saveElecTest('<%=assetId%>','<%=coachType%>','<%=testingType%>','<%=paraName%>','observed_value',this.value)">


<option value="">Select</option>
<%

for (int i=0; i<listObservedValueArray.length;i++)
{
	if(obsValue.equals(listObservedValueArray[i]))
	{	
%>
<option value="<%=listObservedValueArray[i]%>" selected><%=listObservedValueArray[i]%></option>
<% }
	else
		
	{  %>
		<option value="<%=listObservedValueArray[i]%>"><%=listObservedValueArray[i]%></option> 
 <% }

}  %>
</select></TD>
<% }
else
{ 
	 
	 if(validationRule.equals("Integer")){
%>
<TD><input type="text" style="width:100%;" name="observedValue" id="observedValue"  value="<%=obsValue%>" onblur="saveElecTest('<%=assetId%>','<%=coachType%>','<%=testingType%>','<%=paraName%>','<%=""%>','observed_value',this.value)" onkeypress="return isNumberKey(this, event)">
<span id="observedValue_output"></span></TD>
<%}
else if(validationRule.equals("Decimal")){%>
<TD><input type="text" style="width:100%;" name="observedValue" id="observedValue"  value="<%=obsValue%>" onblur="saveElecTest('<%=assetId%>','<%=coachType%>','<%=testingType%>','<%=paraName%>','<%=""%>','observed_value',this.value)" onkeypress="return isDecimalKey(this, event)">
<span id="observedValue_output"></span></TD>
<% }
else{%>	 
	<TD><input type="text" style="width:100%;" name="observedValue" id="observedValue"  value="<%=obsValue%>" onblur="saveElecTest('<%=assetId%>','<%=coachType%>','<%=testingType%>','<%=paraName%>','<%=""%>','observed_value',this.value)"> 
	<% 
}
}
%>

<%
if(!listValueRemarks.equals(""))
{
String[] listRemarksArray=listValueRemarks.split("\\s*,\\s*");%>
<TD>
<select name="observedRemarks" onblur="saveElecTest('<%=assetId%>','<%=coachType%>','<%=testingType%>','<%=paraName%>','<%=""%>','remarks',this.value)">
<option value="">Select</option>
<%
for (int i=0; i<listRemarksArray.length;i++)
{
	if(remarks.equals(listRemarksArray[i]))
	{
%>
<option value="<%=listRemarksArray[i]%>" selected><%=listRemarksArray[i]%></option>
<% }
	else
	{  %>
	 <option value="<%=listRemarksArray[i]%>" ><%=listRemarksArray[i]%></option> 
<% } 
   }%>
</select></TD>
<% }
else
{

%>
<TD><input type="text" name="observedRemarks" style="width:100%;" value="<%=remarks%>" onblur="saveElecTest('<%=assetId%>','<%=coachType%>','<%=testingType%>','<%=paraName%>','<%=""%>','remarks',this.value)" ></TD>
<%} %>

</TR>
<%} 
}
// close all the connections.

connection.close();
}
catch (Exception ex) 
{
	//out.println(ex.printStackTrace());
out.println("Unable to connect to database.");
}%>
</TABLE>
<p>Testing Status:</p>
<select id="elecTestingStatus">
<% 
System.out.println("Tstatus value:>"+tstatus);
if("".equals(tstatus))
	{%>
<option value="" selected>Select</option>
<%}
else
{%>
<option value="">Select</option>	
<% }
if(tstatus.equals("Conforming"))
{	%>
<option value="Conforming" selected>Conforming</option>
<% }
else
{%>
<option value="Conforming">Conforming</option>
<%}
 if(tstatus.equals("Non Conforming"))
	{%>
<option value="Non Conforming" selected>Non Conforming</option>
<% 
	}
 else
{%>
	<option value="Non Conforming">Non Conforming</option>	
<% }%>

</select><br>
<button type="button" id="button" align="center" onclick="buttonClick('<%=assetId%>','<%=testingType%>', '<%=coachType%>')">SUBMIT</button>
</form>
</div>
</body>
</html>