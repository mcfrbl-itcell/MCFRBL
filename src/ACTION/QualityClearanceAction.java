package ACTION;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;



import org.hibernate.Query;
import org.hibernate.Session;
import hibernateConnect.HibernateConfig;
//import beans.WheelsetTransaction;
public class QualityClearanceAction {
private Map<Integer,String> cctvList;
private Map<Integer,String> ShowerTestList;
private Map<Integer,String> PlumbingTestList;
private Map<Integer,String> BiotankTestList;
private Map<Integer,String> AirBrakeTestList;
private Map<Integer,String> FibaTestList;
private Map<Integer,String> CbcHeightList;
private Map<Integer,String> fireSmokeList;
private List <String> railway;

	
	
	
	
	



	@SuppressWarnings("unchecked")
	public String getAssetType()
	{
		Session session =  null;
	
	session = HibernateConfig.getSession();
	
		try {

			
			session.beginTransaction();
			Query query1=null;
			query1 = session.createSQLQuery("select f.furnishing_asset_id,p.furnishing_no from paint_tran as p inner join furnishing_tran as f on f.paint_asset_id=p.paint_asset_id where f.cctv_testing_flag=1");
			List<Object[]> rowList1 =  query1.list();
			cctvList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList1)
			{
				cctvList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}//end of Cctv
			
			Query query2=null;
			query2 = session.createSQLQuery("select f.furnishing_asset_id,p.furnishing_no from paint_tran as p inner join furnishing_tran as f on f.paint_asset_id=p.paint_asset_id where f.shower_testing_flag=1");
			List<Object[]> rowList2 =  query2.list();
			ShowerTestList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList2)
			{
				ShowerTestList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}//end of showerTest
			
			Query query3=null;
			query3 = session.createSQLQuery("select f.furnishing_asset_id,p.furnishing_no from paint_tran as p inner join furnishing_tran as f on f.paint_asset_id=p.paint_asset_id where f.plumbing_testing_flag=1");
			List<Object[]> rowList3 =  query3.list();
			PlumbingTestList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList3)
			{
				PlumbingTestList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}//end of plumbingTest
			
			Query query4=null;
			query4 = session.createSQLQuery("select f.furnishing_asset_id,p.furnishing_no from paint_tran as p inner join furnishing_tran as f on f.paint_asset_id=p.paint_asset_id where f.biotank_testing_flag=1");
			List<Object[]> rowList4 =  query4.list();
			BiotankTestList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList4)
			{
				BiotankTestList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}//end of BiotankTest
			
			Query query5=null;
			query5 = session.createSQLQuery("select f.furnishing_asset_id,p.furnishing_no from paint_tran as p inner join furnishing_tran as f on f.paint_asset_id=p.paint_asset_id where f.air_brake_testing_flag=1");
			List<Object[]> rowList5 =  query5.list();
			AirBrakeTestList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList5)
			{
				AirBrakeTestList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}//end of AirBrakeTest
			
			Query query6=null;
			query6 = session.createSQLQuery("select f.furnishing_asset_id,p.furnishing_no from paint_tran as p inner join furnishing_tran as f on f.paint_asset_id=p.paint_asset_id where f.fiba_testing_flag=1");
			List<Object[]> rowList6 =  query6.list();
			FibaTestList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList6)
			{
				FibaTestList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}//end of AirBrakeTest
			
			Query query7=null;
			query7 = session.createSQLQuery("select f.furnishing_asset_id,p.furnishing_no from paint_tran as p inner join furnishing_tran as f on f.paint_asset_id=p.paint_asset_id where f.cbc_testing_flag=1");
			List<Object[]> rowList7 =  query7.list();
			CbcHeightList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList7)
			{
				CbcHeightList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}//end of AirBrakeTest
			Query query8=null;
			query8= session.createSQLQuery("select f.furnishing_asset_id,p.furnishing_no from paint_tran as p inner join furnishing_tran as f on f.paint_asset_id=p.paint_asset_id where f.fire_smoke_testing_flag=1");
			List<Object[]> rowList8=  query8.list();
			CbcHeightList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList8)
			{
				fireSmokeList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}//end of 
			
			
			Query query=null;
			 
			
			  
			  query = session.createSQLQuery("select railway_code from public.railway_master");
			  railway=  (List<String>)query.list();
			
			//end of query
		
			return "success";
		} 
		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{session.close(); }
	}
	

	

	public List<String> getRailway() {
		return railway;
	}


	public void setRailway(List<String> railway) {
		this.railway = railway;
	}




	public Map<Integer, String> getCctvList() {
		return cctvList;
	}




	public void setCctvList(Map<Integer, String> cctvList) {
		this.cctvList = cctvList;
	}




	public Map<Integer, String> getPlumbingTestList() {
		return PlumbingTestList;
	}




	public void setPlumbingTestList(Map<Integer, String> plumbingTestList) {
		PlumbingTestList = plumbingTestList;
	}




	public Map<Integer, String> getBiotankTestList() {
		return BiotankTestList;
	}




	public void setBiotankTestList(Map<Integer, String> biotankTestList) {
		BiotankTestList = biotankTestList;
	}

	public Map<Integer, String> getShowerTestList() {
		return ShowerTestList;
	}




	public void setShowerTestList(Map<Integer, String> showerTestList) {
		ShowerTestList = showerTestList;
	}




	public Map<Integer, String> getAirBrakeTestList() {
		return AirBrakeTestList;
	}




	public void setAirBrakeTestList(Map<Integer, String> airBrakeTestList) {
		AirBrakeTestList = airBrakeTestList;
	}




	public Map<Integer, String> getFibaTestList() {
		return FibaTestList;
	}




	public void setFibaTestList(Map<Integer, String> fibaTestList) {
		FibaTestList = fibaTestList;
	}




	public Map<Integer, String> getCbcHeightList() {
		return CbcHeightList;
	}




	public void setCbcHeightList(Map<Integer, String> cbcHeightList) {
		CbcHeightList = cbcHeightList;
	}




	public Map<Integer, String> getFireSmokeList() {
		return fireSmokeList;
	}




	public void setFireSmokeList(Map<Integer, String> fireSmokeList) {
		this.fireSmokeList = fireSmokeList;
	}


	
	}

