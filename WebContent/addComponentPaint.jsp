<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.*" %>
<%@ page import="model.User" %>
<%@ page import="hibernateConnect.HibernateConfig" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
<html>
<head>
<% String contextpath=request.getContextPath();
String startingDate=request.getParameter("startDate");
int[] dayCompostion= {Integer.parseInt(startingDate.substring(0, 4)), Integer.parseInt(startingDate.substring(5, 7)),Integer.parseInt(startingDate.substring(8, 10)) };
%>
 <style>
.hide {
display: none;
}
.customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

.customers td, .customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #8d9c8e;
    color: white;
}
</style> 

<script type="text/javascript">
var req;

$(document).ready(function(){
	var year=<%=dayCompostion[0]%>;
    var month=<%=dayCompostion[1]-1%>;
    var day=<%=dayCompostion[2]%>;

		$(".datePicker").datepicker({
		
		//$("StartDate1").datepicker({
			
		dateFormat: 'dd-mm-yy',
	       
		   changeMonth: true,
		   autoClose: true,
		   minDate:new Date(year,month,day),
		   maxDate: new Date(),
	        beforeShow: function() {
	            setTimeout(function(){
	                $('.ui-datepicker').css('z-index', 99999999999999);
	               
	            }, 0);
	        }
	});
});



function retrieveURLStart(url,v, i)
{
	

	var startDate=convertToDate(v.value);
	//var x=document.getElementById("StartDate"+i).defaultValue;
	var endDate=document.getElementById("EndDate"+i).value;
//	alert("startDate->"+startDate+"  endDate->"+endDate);
	if(endDate!='')
		{
		var endDate1=convertToDate(endDate);
		if(endDate1.getTime()<startDate.getTime())
			{
			alert("Start date shold be less than end date");
			document.getElementById("StartDate"+i).value=v.oldvalue;
		return false;
			}
		
		}
	
    url=url+"&qty="+v.value;
     

  if (window.XMLHttpRequest) { // Non-IE browsers
    req = new XMLHttpRequest();
    req.onreadystatechange = processStateChange;
    try {
      req.open("GET", url, true);
    } catch (e) {
      alert(e);
    }
    req.send(null);
  } else if (window.ActiveXObject) { // IE
    req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
      req.onreadystatechange = processStateChange;
      req.open("GET", url, true);
      req.send();
      //this.oldvalue=this.value;
    }
  }
}
function convertToDate(v)
{
	var day=parseInt(v.substring(0,2));
	var month=parseInt(v.substring(3,5));
	var year=parseInt(v.substring(6,10));
	var date1=new Date(year,month-1,day);
	return date1;
}

function retrieveURLEnd(url,v, i)
{
	
	//var x=document.getElementById("EndDate"+i).defaultValue;
	var endDate=convertToDate(v.value);
	var startDate=document.getElementById("StartDate"+i).value;
	//alert("startDate->"+startDate+"  endDate->"+endDate);
	if(startDate!='')
		{
		var startDate1=convertToDate(startDate);
		//alert("startDate1->"+startDate1);
		var comp=endDate.getTime()<startDate1.getTime();
		//alert("comparing end and start date->"+comp);
		if(endDate.getTime()<startDate1.getTime())
			{
			alert("End date shold be greater than start date");
			document.getElementById("EndDate"+i).value=v.oldvalue;
		return false;
			}
		}
	
    url=url+"&qty="+v.value;
     

  if (window.XMLHttpRequest) { // Non-IE browsers
    req = new XMLHttpRequest();
    req.onreadystatechange = processStateChange;
    try {
      req.open("GET", url, true);
    } catch (e) {
      alert(e);
    }
    req.send(null);
  } else if (window.ActiveXObject) { // IE
    req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
      req.onreadystatechange = processStateChange;
      req.open("GET", url, true);
      req.send();
    }
  }
}
function retrieveURL(url,v)
{
	
    url=url+"&qty="+v;
     

  if (window.XMLHttpRequest) { // Non-IE browsers
    req = new XMLHttpRequest();
    req.onreadystatechange = processStateChange;
    try {
      req.open("GET", url, true);
    } catch (e) {
      alert(e);
    }
    req.send(null);
  } else if (window.ActiveXObject) { // IE
    req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
      req.onreadystatechange = processStateChange;
      req.open("GET", url, true);
      req.send();
    }
  }
}

function processStateChange() {
  if (req.readyState == 4) { // Complete
    if (req.status == 200) { // OK response
      document.getElementById("dep").innerHTML = req.responseText;


    } else {
              document.getElementById("dep").innerHTML = req.responseText;
      alert("Problem: " + req.statusText);
    }
  }

} 
</script>

</head>
<body>
<div id="dep"></div>
<% 
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
String sql_row, sql_column;
Statement st_row= con.createStatement();
Statement st_column=con.createStatement();
ResultSet rs_row, rs_column;
User loginUser = null;
Session session_hibernate = null;
String username= null;
String roles= null;
Integer componentId;
String componentDetails=null;
HttpSession session_http = ServletActionContext.getRequest().getSession(true);
username = (String) session_http.getAttribute("userid");
String assetId= request.getParameter("assetId");

%>
<input type="hidden" id="assetId" value="<%=assetId%>" />
<table class="customers">
<tr> <th>Activity Description</th>
			    <th>Start Date</th>
			    <th>End Date</th>
			    <th>Vendor Alloted</th>
			    <th>Remarks</th>
			</tr> 
<%
sql_row="select component_id, component_details from public.component_master where component_class='Paint'";
rs_row=st_row.executeQuery(sql_row);
int i=1;
while(rs_row.next())
      {
	
 	componentId=Integer.parseInt(rs_row.getString(1));
 	componentDetails=rs_row.getString(2);
	%> 
  <tr>	 
 	<th><%=componentDetails%></th> 
 <%
 String startDate="",endDate="", remarks="", firmName="";
 sql_column= "select start_date, end_date, firm_name, remarks  from public.paint_component_transaction where component_id="+componentId+" and paint_asset_id="+assetId+" " ; 
 rs_column= st_column.executeQuery(sql_column);
 if(rs_column.next())
  {
	 DateFormat from = new SimpleDateFormat("yyyy-MM-dd");  
	 DateFormat to = new SimpleDateFormat("dd-MM-yyyy");  
 startDate=rs_column.getString(1); 
 
if(startDate==null) {startDate="";}
else
{
	startDate=to.format(from.parse(startDate));
}
endDate=rs_column.getString(2);
if(endDate==null){endDate="";}
else
{
	endDate=to.format(from.parse(endDate));
}
firmName=rs_column.getString(3);
if(firmName==null){firmName="";}
remarks=rs_column.getString(4);
if(remarks==null){remarks="";}
 }
 %>
 <td><input type="text" id="StartDate<%=i%>" class="datePicker" autocomplete="off" name="qty" value="<%=startDate%>" onfocus="this.oldvalue=this.value" onchange="retrieveURLStart('componentInsertionPaint.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&FIELD=start_date', this, <%=i%>)"/></td>
 <td><input type="text" id="EndDate<%=i%>" class="datePicker" autocomplete="off" name="qty" value="<%=endDate%>" onfocus="this.oldvalue=this.value" onchange="retrieveURLEnd('componentInsertionPaint.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&FIELD=end_date', this, <%=i%>)"/></td>
<%--  <td><input type="text"  id="StartDate" name="qty" value="<%=startDate%>"   onblur="retrieveURL('componentInsertionPaint.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&FIELD=start_date', this.value)"/></td>  --%>
<%-- <td><input type="text"  name="qty" value="<%=startDate%>" id="EndDate"  onblur="retrieveURL('componentInsertionPaint.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&FIELD=end_date', this.value)"/></td> --%>
 <td><select name="qty"  onchange="retrieveURL('componentInsertionPaint.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&FIELD=firm_name', this.value)">
 <% if(firmName.equals(""))
 { %>
 <option value="" selected>Select</option>
<% }
 else
 { %>
	 <option value="">Select</option>
<% }
if(firmName.equals("VIBGYOR"))
{%>
 <option value="VIBGYOR" selected>VIBGYOR</option>
 <%
 }
else
{ %>
		
	 <option value="VIBGYOR">VIBGYOR</option>
<% }
if(firmName.equals("GS Industries"))
{%>
 
 <option value="GS Industries" selected>GS Industries</option>
 <%} 
else
{%>
		
	  <option value="GS Industries">GS Industries</option>
<%}
if(firmName.equals("Nerolec"))
{%>
 
 <option value="Nerolec" selected>Nerolec</option>
 <%} 
else
{%>
		
	  <option value="Nerolec">Nerolec</option>
<%}
if(firmName.equals("Berger"))
{%>
 
 <option value="Berger" selected>Berger</option>
 <%} 
else
{%>
		
	  <option value="Berger">Berger</option>
<%}
if(firmName.equals("Emprise Pvt Ltd"))
{%>
 
 <option value="Emprise Pvt. Ltd." selected>Emprise Pvt. Ltd.</option>
 <%} 
else
{%>
		
	  <option value="Emprise Pvt. Ltd.">Emprise Pvt. Ltd.</option>
<%}
 %>
 </select></td>
 
<td><input type="text" name="qty" value="<%=remarks%>"  onblur="retrieveURL('componentInsertionPaint.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&FIELD=remarks', this.value)"/></td>
 </tr>
 <% 
 i++;
 	}
con.close();
%>
</table>
</body>
</html>