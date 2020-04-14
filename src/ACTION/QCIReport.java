package ACTION;

import java.util.LinkedHashMap;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import hibernateConnect.HibernateConfig;

public class QCIReport{
	private Map<Integer,String> coachNumberList;
	private List <String> railway;
    
	@SuppressWarnings("unchecked")
	public String getAssetType()
	{
		Session session =  null;
	
	    session = HibernateConfig.getSession();
	
		try {

			
			session.beginTransaction();
			Query query1=null;
			query1 = session.createSQLQuery("select furnishing_asset_id,coach_number from public.furnishing_tran where qci_testing_flag=1");
			List<Object[]> rowList1 =  query1.list();
			coachNumberList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList1)
			{
				coachNumberList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
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

	public Map<Integer, String> getCoachNumberList() {
		return coachNumberList;
	}

	public void setCoachNumberList(Map<Integer, String> coachNumberList) {
		this.coachNumberList = coachNumberList;
	}

	public List<String> getRailway() {
		return railway;
	}

	public void setRailway(List<String> railway) {
		this.railway = railway;
	}


	
	}
