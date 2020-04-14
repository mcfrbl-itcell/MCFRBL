package common;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;


import org.hibernate.Session;



import beans.BogiesetTransaction;
import hibernateConnect.HibernateConfig;


public class BogieNumById {
	private String bogieAssetId;
	private String bogieNo;
	
	public String getBogieDesc()
	{
		Session session =null;
		session = HibernateConfig.getSession();
		try {
			
			
		Integer	bogieAssetIdAsInt=Integer.parseInt(bogieAssetId);
			
			Criteria cr1 = session.createCriteria(BogiesetTransaction.class);
			
			cr1.add(Restrictions.eq("bogieAssetId", bogieAssetIdAsInt));
			if(cr1.list().size()!=0)
			{
			BogiesetTransaction bogiesetTransaction = (BogiesetTransaction)cr1.list().get(0);
			
			bogieNo=bogiesetTransaction.getBogieNumber();
			System.out.println("Bogie No "+bogieNo);
			}
			else
			{
				bogieNo= "Not Available";
			}
		} catch (Exception e) {
			
			System.err.println(e.getMessage());
		}
		finally{
			if(session!=null)
			{
			session.close();
		}
		}
		
		return "success";
	}
	
	

	public String getBogieAssetId() {
		return bogieAssetId;
	}



	public void setBogieAssetId(String bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
	}



	public String getBogieNo() {
		return bogieNo;
	}
	public void setBogieNo(String bogieNo) {
		this.bogieNo = bogieNo;
	}
	
	
	
}
