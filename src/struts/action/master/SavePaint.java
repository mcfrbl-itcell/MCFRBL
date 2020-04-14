package struts.action.master;
import java.util.Date;

import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciPaintTrans;
import beans.FurnishingTransaction;
import beans.QciFPvcTrans;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SavePaint {
	private String furnishingAssetId;
	private String fitmentDestinationboardNoPlate;
	private String properStencillingLettering;
	private String burrBraileSticker;
	private String testingObservationRemark;
	
	public String saveData11()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		QciPaintTrans qciPaintTransSave=new QciPaintTrans();
		QciPaintTrans qciPaintTrans= (QciPaintTrans) session.get(QciPaintTrans.class, furnishingAssetIdAsInt);
		
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciPaintFlag(1);
		
		
		}
		else
		{
			
			qciFPvcTransSave.setQciPaintFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		if(qciPaintTrans!=null){
			qciPaintTrans.setFitmentDestinationboardNoPlate(fitmentDestinationboardNoPlate);
			System.out.println(fitmentDestinationboardNoPlate);
			qciPaintTrans.setProperStencillingLettering(properStencillingLettering);
			qciPaintTrans.setBurrBraileSticker(burrBraileSticker);
			qciPaintTrans.setTestingObservationRemark(testingObservationRemark);
		}
		else
		{
			qciPaintTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			qciPaintTransSave.setFitmentDestinationboardNoPlate(fitmentDestinationboardNoPlate);
			System.out.println(fitmentDestinationboardNoPlate);
			qciPaintTransSave.setProperStencillingLettering(properStencillingLettering);
			qciPaintTransSave.setBurrBraileSticker(burrBraileSticker);
			qciPaintTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
				
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData11(qciPaintTrans, qciFPvcTrans, qciPaintTransSave, qciFPvcTransSave);
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
	public String getFitmentDestinationboardNoPlate() {
		return fitmentDestinationboardNoPlate;
	}
	public void setFitmentDestinationboardNoPlate(String fitmentDestinationboardNoPlate) {
		this.fitmentDestinationboardNoPlate = fitmentDestinationboardNoPlate;
	}
	public String getProperStencillingLettering() {
		return properStencillingLettering;
	}
	public void setProperStencillingLettering(String properStencillingLettering) {
		this.properStencillingLettering = properStencillingLettering;
	}
	public String getBurrBraileSticker() {
		return burrBraileSticker;
	}
	public void setBurrBraileSticker(String burrBraileSticker) {
		this.burrBraileSticker = burrBraileSticker;
	}
	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}
	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}
	
}
