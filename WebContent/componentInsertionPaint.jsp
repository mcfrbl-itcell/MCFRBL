<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.*" %>
<%@ page import="model.User" %>

<%@ page import="java.util.Map" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Paint Activity insert</title>
</head>
<body>
<%

String username= null;

HttpSession session_http = ServletActionContext.getRequest().getSession(true);
username = (String) session_http.getAttribute("userid");

DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
try
{

Integer componentId= Integer.parseInt(request.getParameter("component_id")) ;
Integer assetId= Integer.parseInt(request.getParameter("assetId"));   //
String inputValue=request.getParameter("qty");
System.out.println("hi"+inputValue);
String column_name =(String)request.getParameter("FIELD");
if(column_name.equals("start_date")||column_name.equals("end_date"))
{
	System.out.println(inputValue);
	SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");  
	//inputValue=inputValue.toUpperCase();
	inputValue=df.parse(inputValue).toString();
}

Statement st_qty, st_row, st_insert, st_update, st_delete;
ResultSet rs_qty, rs_row;
String sql_qty, sql_insert, sql_update, sql_delete, sql_row;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
 sql_row= "select * from public.paint_component_transaction where component_id="+componentId+" and paint_asset_id="+assetId+" " ;

rs_row=st_qty.executeQuery(sql_row);

if(rs_row.next())
{
	
	//if(inputValue.isEmpty())
		if(inputValue.equals("@123@%tyr"))
	{
		sql_delete=	"delete from public.paint_component_transaction where component_id="+componentId+" and paint_asset_id="+assetId+"  " ;
		int i=st_delete.executeUpdate(sql_delete);
		if(i>0)
	    {
	        out.println("<b>Delete Successsfully</b>");
	       
	    }
	    else
	    {
	        out.println("Error While Deleting<br>");
	       
	    }
		
		
	}
	else {
	
		sql_update="update public.paint_component_transaction set "+column_name+"= '"+inputValue+"', entry_by='"+username+"' , entry_time= now() where component_id="+componentId+" and paint_asset_id="+assetId+" " ;		
	
	System.out.println(sql_update);
	int i=st_update.executeUpdate(sql_update);
    if(i>0)
    {
        out.println("<b>Updated Successsfully</b>");
       
    }
    else
    {
        out.println("Error While Updating<br>");
       
    }
	}
}
else
{
sql_insert="insert into public.paint_component_transaction (component_id, paint_asset_id, "+column_name+", entry_by, entry_time) values("+componentId+" , "+assetId+", '"+inputValue+"',  '"+username+"', now() )" ;	
	
	System.out.println(sql_insert);
	int i=st_insert.executeUpdate(sql_insert);
    if(i>0)
    {
        out.println("<b>Saved Successsfully</b>");
       
    }
    else
    {
        out.println("Error While Saving<br>");
        out.println(sql_insert);
    }	
	
	
}

con.close();
}

catch(Exception e)
{
out.println("Exception in do file "+e);
}
finally
{
	if(con!=null)
	{
		con.close();
	}
}
%>
</body>
</html>