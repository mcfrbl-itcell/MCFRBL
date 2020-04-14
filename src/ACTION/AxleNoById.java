package ACTION;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import beans.WheelsetTransaction;
import hibernateConnect.HibernateConfig;

public class AxleNoById {
	private Map<Integer,String> axleNoForClearanceMemo;
	private Map<Integer,String> axleNoForCTRBTest;
	private Map<Integer,String> axleNumberListForAxleSIP;

	public String getAxleNo()
	{
		Session session =  null;
		
		session = HibernateConfig.getSession();
		try
		{
		Criteria cr=session.createCriteria(WheelsetTransaction.class);
		cr.add(Restrictions.eq("sipWheelAssemblyFlag", 1));
		cr.add(Restrictions.eq("sipWheelCtrbFlag", 1));
		cr.add(Restrictions.eq("testingClearanceMemoFlag", 1));
		cr.addOrder(Order.asc("axleNumber"));
		List<WheelsetTransaction> wheelSetForClearanceReport=cr.list();
		axleNoForClearanceMemo= new LinkedHashMap<Integer,String>();
		for(WheelsetTransaction w:wheelSetForClearanceReport)
		{
			axleNoForClearanceMemo.put(w.getWheelsetAssetId(), w.getAxleNumber());
		}
		// retrieve axleNoForCTRBTest
		Criteria cr1=session.createCriteria(WheelsetTransaction.class);
		cr1.add(Restrictions.eq("sipWheelCtrbFlag", 1));
		cr1.addOrder(Order.asc("axleNumber"));
		List<WheelsetTransaction> wheelSetForCTRBReport=cr1.list();
		axleNoForCTRBTest=new LinkedHashMap<Integer, String>();
		for(WheelsetTransaction w:wheelSetForCTRBReport)
		{
			axleNoForCTRBTest.put(w.getWheelsetAssetId(), w.getAxleNumber());
		}
		// end of axleNoForCTRBTest
		
		// retrieve axleNoForAxleSIP
				Criteria cr2=session.createCriteria(WheelsetTransaction.class);
				cr2.add(Restrictions.eq("sipWheelAssemblyFlag", 1));
				cr2.addOrder(Order.asc("axleNumber"));
				List<WheelsetTransaction> wheelSetForAxleReport=cr1.list();
				axleNumberListForAxleSIP=new LinkedHashMap<Integer, String>();
				for(WheelsetTransaction w:wheelSetForAxleReport)
				{
					axleNumberListForAxleSIP.put(w.getWheelsetAssetId(), w.getAxleNumber());
				}
				// end of axleNoForAxleSIP
		
		return "success";
	}
	
	catch(Exception ex)
	{
		ex.printStackTrace();
		return  null;
	}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}


	public Map<Integer, String> getAxleNoForClearanceMemo() {
		return axleNoForClearanceMemo;
	}


	public void setAxleNoForClearanceMemo(Map<Integer, String> axleNoForClearanceMemo) {
		this.axleNoForClearanceMemo = axleNoForClearanceMemo;
	}


	public Map<Integer, String> getAxleNoForCTRBTest() {
		return axleNoForCTRBTest;
	}


	public void setAxleNoForCTRBTest(Map<Integer, String> axleNoForCTRBTest) {
		this.axleNoForCTRBTest = axleNoForCTRBTest;
	}


	public Map<Integer, String> getAxleNumberListForAxleSIP() {
		return axleNumberListForAxleSIP;
	}


	public void setAxleNumberListForAxleSIP(Map<Integer, String> axleNumberListForAxleSIP) {
		this.axleNumberListForAxleSIP = axleNumberListForAxleSIP;
	}
	
}
