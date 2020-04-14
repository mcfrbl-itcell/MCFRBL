package struts.action.master;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernateConnect.HibernateConfig;

public class GetDivDepot {

	  public String zone;
	  public List<String> divList;
	
	public String showData()
	{
		Session session =  null;
		
		session = HibernateConfig.getSession();
		try
		{
			Query queryForDiv = session.createSQLQuery("select distinct div_code from public.depot_master where zone_code='"+zone+"'");
			System.out.println("Zone Vaule :"+zone);
			divList=queryForDiv.list();
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
   
	public String getZone() {
		return zone;
	}


	public void setZone(String zone) {
		this.zone = zone;
	}


	public List<String> getDivList() {
		return divList;
	}

	public void setDivList(List<String> divList) {
		this.divList = divList;
	}
	
}
