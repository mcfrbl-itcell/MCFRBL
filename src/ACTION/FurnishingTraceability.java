package ACTION;

import java.util.LinkedHashMap;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernateConnect.HibernateConfig;

public class FurnishingTraceability{
	private Map<Integer,String> furnishingNumberList;
	private List <String> railway;
    
	@SuppressWarnings("unchecked")
	public String getAssetType()
	{
		Session session =  null;
	
	    session = HibernateConfig.getSession();
	
		try {

			
			session.beginTransaction();
			Query query1=null;
			query1 = session.createSQLQuery("select F.furnishing_asset_id,P.furnishing_no from public.furnishing_tran as F,  paint_tran as P where  P.paint_asset_id=F.paint_asset_id and F.coach_type is not null and P.furnishing_no is not null");
			List<Object[]> rowList1 =  query1.list();
			furnishingNumberList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList1)
			{
				furnishingNumberList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}
			
			
			
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



	public Map<Integer, String> getFurnishingNumberList() {
		return furnishingNumberList;
	}



	public void setFurnishingNumberList(Map<Integer, String> furnishingNumberList) {
		this.furnishingNumberList = furnishingNumberList;
	}



	public List<String> getRailway() {
		return railway;
	}

	public void setRailway(List<String> railway) {
		this.railway = railway;
	}

	

	
	}
