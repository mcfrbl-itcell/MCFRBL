package struts.action.master;

import org.hibernate.Session;

import beans.CrossCheckinTrans;
import hibernateConnect.HibernateConfig;

public class GetCrossData {
	private CrossCheckinTrans crossCheckinTrans;
	private String furnishingAssetId;
	
	public String getData()
	{
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		Session session=null;
		try
		{
			session=HibernateConfig.getSession();
			crossCheckinTrans= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
			
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
	
	public CrossCheckinTrans getCrossCheckinTrans() {
		return crossCheckinTrans;
	}
	public void setCrossCheckinTrans(CrossCheckinTrans crossCheckinTrans) {
		this.crossCheckinTrans = crossCheckinTrans;
	}
	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}
	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}
	
}
