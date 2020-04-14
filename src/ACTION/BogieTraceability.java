package ACTION;

import java.util.LinkedHashMap;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import beans.BogiesetTransaction;
import hibernateConnect.HibernateConfig;

public class BogieTraceability{
	private Map<Integer,String> bogieNumberList;
	private List <String> railway;
    
	@SuppressWarnings("unchecked")
	public String getAssetType()
	{
		Session session =  null;
	
	    session = HibernateConfig.getSession();
	
		try {

			
			session.beginTransaction();
			Query query1=null;
			Criteria cr1 = session.createCriteria(BogiesetTransaction.class);
			
			cr1.add(Restrictions.isNotNull("bogieNumber"));
			
			List<BogiesetTransaction> obj1=cr1.list();
			//abnormalityList=new ArrayList<String>();
			bogieNumberList= new LinkedHashMap<Integer,String>();
			for(BogiesetTransaction a:obj1)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				bogieNumberList.put(a.getBogieAssetId(),a.getBogieNumber());
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

	public Map<Integer, String> getBogieNumberList() {
		return bogieNumberList;
	}

	public void setBogieNumberList(Map<Integer, String> bogieNumberList) {
		this.bogieNumberList = bogieNumberList;
	}

	public List<String> getRailway() {
		return railway;
	}

	public void setRailway(List<String> railway) {
		this.railway = railway;
	}

	

	
	}
