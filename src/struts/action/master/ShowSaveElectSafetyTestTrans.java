package struts.action.master;
import org.hibernate.Session;
import beans.ElectSafetyTestTrans;
import hibernateConnect.HibernateConfig;

public class ShowSaveElectSafetyTestTrans 
{
	private String furnishingAssetId;
    private ElectSafetyTestTrans electSafetyTestTrans;
   
    public String showSaveElectSafetyTestTrans()
   {
    	System.out.println("showhello");
	Session session=null;
	
	try
	{
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		electSafetyTestTrans= (ElectSafetyTestTrans) session.get(ElectSafetyTestTrans.class, furnishingAssetIdAsInt);
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

	public ElectSafetyTestTrans getElectSafetyTestTrans() {
		return electSafetyTestTrans;
	}

	public void setElectSafetyTestTrans(ElectSafetyTestTrans electSafetyTestTrans) {
		this.electSafetyTestTrans = electSafetyTestTrans;
	}


							
	
}
