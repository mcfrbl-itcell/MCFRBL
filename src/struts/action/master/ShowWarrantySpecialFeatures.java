package struts.action.master;
import org.hibernate.Session;

import beans.CoachWarrantySplFeatures;
import hibernateConnect.HibernateConfig;
public class ShowWarrantySpecialFeatures {
 private String coachType;
private CoachWarrantySplFeatures coachWarrantySplFeatures;
	
	public String getData()
	{
		Session session=null;
		try
		{
			session=HibernateConfig.getSession();
	 coachWarrantySplFeatures=(CoachWarrantySplFeatures) session.get(CoachWarrantySplFeatures.class, coachType);
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

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public CoachWarrantySplFeatures getCoachWarrantySplFeatures() {
		return coachWarrantySplFeatures;
	}

	public void setCoachWarrantySplFeatures(CoachWarrantySplFeatures coachWarrantySplFeatures) {
		this.coachWarrantySplFeatures = coachWarrantySplFeatures;
	}
	
}
