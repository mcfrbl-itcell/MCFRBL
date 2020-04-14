package struts.action.master;
import java.util.Date;

import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciCoachLoweringTrans;
import beans.QciFPvcTrans;
import beans.FurnishingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveCoachLowering {
	private String furnishingAssetId;
	private String testingObservationRemark;
	
	public String saveData10()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		QciCoachLoweringTrans qciCoachLoweringTransSave=new QciCoachLoweringTrans();
		QciCoachLoweringTrans qciCoachLoweringTrans= (QciCoachLoweringTrans) session.get(QciCoachLoweringTrans.class, furnishingAssetIdAsInt);
		
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciCoachLoweringFlag(1);
		}
		else
		{
			
			qciFPvcTransSave.setQciCoachCleaningFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		
		if(qciCoachLoweringTrans!=null){
			qciCoachLoweringTrans.setTestingObservationRemark(testingObservationRemark);
		}
		else
		{
			qciCoachLoweringTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
			qciCoachLoweringTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
		
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData10(qciCoachLoweringTrans, qciFPvcTrans, qciCoachLoweringTransSave, qciFPvcTransSave);
				return "success";
				
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
		}
	
	
	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}


	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}


	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}
	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}
	
}
