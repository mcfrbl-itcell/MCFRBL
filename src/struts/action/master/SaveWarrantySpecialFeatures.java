package struts.action.master;
import org.hibernate.Session;
import dao.DaoSaveWarrantySpecialFeatures;
import beans.CoachWarrantySplFeatures;
import hibernateConnect.HibernateConfig;
public class SaveWarrantySpecialFeatures {

	private String coachType;
	private String warrantyHTML;
	private String specialFeatureHTML;
	
	public String saveWarranty()
	{
		CoachWarrantySplFeatures cwsSave=new CoachWarrantySplFeatures();
		Session session=null;
		session=HibernateConfig.getSession();
		CoachWarrantySplFeatures cwsUpdate=(CoachWarrantySplFeatures) session.get(CoachWarrantySplFeatures.class, coachType);
		if(cwsUpdate!=null)
		{
			cwsUpdate.setWarranty(warrantyHTML);
		}
		else
		{
			
			cwsSave.setCoachType(coachType);
			cwsSave.setWarranty(warrantyHTML);
		}
		try
		{
			DaoSaveWarrantySpecialFeatures dao =new DaoSaveWarrantySpecialFeatures();
			dao.saveData(cwsUpdate,cwsSave);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return "success";
	}
	
	public String saveSpecialFeatures()
	{
		CoachWarrantySplFeatures cwsSave=new CoachWarrantySplFeatures();
		Session session=null;
		session=HibernateConfig.getSession();
		CoachWarrantySplFeatures cwsUpdate=(CoachWarrantySplFeatures) session.get(CoachWarrantySplFeatures.class, coachType);
		if(cwsUpdate!=null)
		{
			cwsUpdate.setSpecialFeatures(specialFeatureHTML);
			
		}
		else
		{
			
			cwsSave.setCoachType(coachType);
			cwsSave.setSpecialFeatures(specialFeatureHTML);
		}
		try
		{
			DaoSaveWarrantySpecialFeatures dao =new DaoSaveWarrantySpecialFeatures();
			dao.saveData(cwsUpdate,cwsSave);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return "success";
	}

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public String getWarrantyHTML() {
		return warrantyHTML;
	}

	public void setWarrantyHTML(String warrantyHTML) {
		this.warrantyHTML = warrantyHTML;
	}

	public String getSpecialFeatureHTML() {
		return specialFeatureHTML;
	}

	public void setSpecialFeatureHTML(String specialFeatureHTML) {
		this.specialFeatureHTML = specialFeatureHTML;
	}
	
}
