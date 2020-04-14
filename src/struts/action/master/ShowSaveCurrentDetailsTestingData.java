package struts.action.master;

import org.hibernate.Session;

import beans.CurrentDetailsTesting;
import hibernateConnect.HibernateConfig;

public class ShowSaveCurrentDetailsTestingData {
	private String furnishingAssetId;
	private CurrentDetailsTesting currentDetailsTesting;
	
	public String showSaveCurrentData(){
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		
		try
		{
			setCurrentDetailsTesting((CurrentDetailsTesting) session.get(CurrentDetailsTesting.class,furnishingAssetIdAsInt));
			
			System.out.println(furnishingAssetIdAsInt);
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}

	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public CurrentDetailsTesting getCurrentDetailsTesting() {
		return currentDetailsTesting;
	}

	public void setCurrentDetailsTesting(CurrentDetailsTesting currentDetailsTesting) {
		this.currentDetailsTesting = currentDetailsTesting;
	}

}
