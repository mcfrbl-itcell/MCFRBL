package struts.action.master;

import org.hibernate.Session;

import beans.ElectBatteryTestTrans;

import hibernateConnect.HibernateConfig;

public class ShowSaveBatteryTestData {
	private String furnishingAssetId;
	private ElectBatteryTestTrans electBatteryTestTrans;
	
	public String showSaveBatteryData(){
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		
		try
		{
			electBatteryTestTrans= (ElectBatteryTestTrans) session.get(ElectBatteryTestTrans.class,furnishingAssetIdAsInt);
			
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


	public ElectBatteryTestTrans getElectBatteryTestTrans() {
		return electBatteryTestTrans;
	}


	public void setElectBatteryTestTrans(ElectBatteryTestTrans electBatteryTestTrans) {
		this.electBatteryTestTrans = electBatteryTestTrans;
	}


	
	
}
