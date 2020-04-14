package ACTION;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernateConnect.HibernateConfig;

public class ElectricSIPFurnNo {
	private Map<Integer,String> furnList;
	
	public String getFurnNo()
	{
		Session session =  null;
		session = HibernateConfig.getSession();
		try{
			session.beginTransaction();
			Query query=null;
			query= session.createSQLQuery("select distinct e.asset_id,p.furnishing_no, f.coach_type  from paint_tran as p, furnishing_tran as f, elect_test_transaction_primary_data e  where e.asset_id=f.furnishing_asset_id and f.paint_asset_id=p.paint_asset_id");
			List<Object[]> rowList =  query.list();
			furnList=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList)
			{
				furnList.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}

		return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		
	}

	public Map<Integer, String> getFurnList() {
		return furnList;
	}

	public void setFurnList(Map<Integer, String> furnList) {
		this.furnList = furnList;
	}
	
}
