package struts.action.master;
import java.util.Date;

import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciPlumbingTrans;
import beans.FurnishingTransaction;
import beans.QciFPvcTrans;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SavePlumbing {
	private String furnishingAssetId;
	private String readingWaterLevelGauge;
	private String isOsWashbasinTapLoose;
	private String showerHandleLoose;
	private String showerHandleBroken;
	private String showerHandleStandScrewLoose;
	private String upperTankUclampRubberMissingLoose;
	private String testingObservationRemark;
	
	public String saveData8()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		QciPlumbingTrans qciPlumbingTransSave=new QciPlumbingTrans();
		QciPlumbingTrans qciPlumbingTrans= (QciPlumbingTrans) session.get(QciPlumbingTrans.class, furnishingAssetIdAsInt);
		
		
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciPlumbingFlag(1);
		
		
		}
		else
		{
			
			qciFPvcTransSave.setQciPlumbingFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		
		if(qciPlumbingTrans!=null){
			qciPlumbingTrans.setReadingWaterLevelGauge(readingWaterLevelGauge);
			qciPlumbingTrans.setIsOsWashbasinTapLoose(isOsWashbasinTapLoose);
			qciPlumbingTrans.setShowerHandleLoose(showerHandleLoose);
			qciPlumbingTrans.setShowerHandleBroken(showerHandleBroken);
			qciPlumbingTrans.setShowerHandleStandScrewLoose(showerHandleStandScrewLoose);
			qciPlumbingTrans.setUpperTankUclampRubberMissingLoose(upperTankUclampRubberMissingLoose);
			qciPlumbingTrans.setTestingObservationRemark(testingObservationRemark);
		
		}
		else
		{
			qciPlumbingTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			qciPlumbingTransSave.setReadingWaterLevelGauge(readingWaterLevelGauge);
			qciPlumbingTransSave.setIsOsWashbasinTapLoose(isOsWashbasinTapLoose);
			qciPlumbingTransSave.setShowerHandleLoose(showerHandleLoose);
			qciPlumbingTransSave.setShowerHandleBroken(showerHandleBroken);
			qciPlumbingTransSave.setShowerHandleStandScrewLoose(showerHandleStandScrewLoose);
			qciPlumbingTransSave.setUpperTankUclampRubberMissingLoose(upperTankUclampRubberMissingLoose);
			qciPlumbingTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
		
		
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData8(qciPlumbingTrans, qciFPvcTrans, qciPlumbingTransSave, qciFPvcTrans);
				System.out.println(readingWaterLevelGauge);
				System.out.println(isOsWashbasinTapLoose);
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
	public String getReadingWaterLevelGauge() {
		return readingWaterLevelGauge;
	}
	public void setReadingWaterLevelGauge(String readingWaterLevelGauge) {
		this.readingWaterLevelGauge = readingWaterLevelGauge;
	}
	public String getIsOsWashbasinTapLoose() {
		return isOsWashbasinTapLoose;
	}
	public void setIsOsWashbasinTapLoose(String isOsWashbasinTapLoose) {
		this.isOsWashbasinTapLoose = isOsWashbasinTapLoose;
	}
	public String getShowerHandleLoose() {
		return showerHandleLoose;
	}
	public void setShowerHandleLoose(String showerHandleLoose) {
		this.showerHandleLoose = showerHandleLoose;
	}
	public String getShowerHandleBroken() {
		return showerHandleBroken;
	}
	public void setShowerHandleBroken(String showerHandleBroken) {
		this.showerHandleBroken = showerHandleBroken;
	}
	public String getShowerHandleStandScrewLoose() {
		return showerHandleStandScrewLoose;
	}
	public void setShowerHandleStandScrewLoose(String showerHandleStandScrewLoose) {
		this.showerHandleStandScrewLoose = showerHandleStandScrewLoose;
	}
	public String getUpperTankUclampRubberMissingLoose() {
		return upperTankUclampRubberMissingLoose;
	}
	public void setUpperTankUclampRubberMissingLoose(String upperTankUclampRubberMissingLoose) {
		this.upperTankUclampRubberMissingLoose = upperTankUclampRubberMissingLoose;
	}
	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}
	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}
	
}
