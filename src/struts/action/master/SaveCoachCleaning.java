package struts.action.master;
import java.util.Date;

import org.hibernate.Session;
import dao.DaoQCI;
import beans.FurnishingTransaction;
import beans.QciAirBrakeTrans;
import beans.QciCoachCleaningTrans;
import beans.QciFPvcTrans;
import common.DateUtil;

import hibernateConnect.HibernateConfig;

public class SaveCoachCleaning {
	private String furnishingAssetId;
	private String floorDirty;
	private String lavatoryDirty;
	private String ceilingDirty;
	private String seatBerthDirty;
	private String panelDirty;
	private String storeroomPantryLinenDirty;
	private String railsSlidingDoorDirty;
	private String windowGlassDirty;
	private String plasticFilmRemoved;
	private String doorDirty;
	private String testingObservationRemark;
	
	public String saveData12()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciCoachCleaningFlag(1);
		
		
		}
		else
		{
			
			qciFPvcTransSave.setQciCoachCleaningFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
	
		
		QciCoachCleaningTrans qciCoachCleaningTransSave=new QciCoachCleaningTrans();
		QciCoachCleaningTrans qciCoachCleaningTrans= (QciCoachCleaningTrans) session.get(QciCoachCleaningTrans.class, furnishingAssetIdAsInt);
		
		if(qciCoachCleaningTrans!=null){
			
			qciCoachCleaningTrans.setFloorDirty(floorDirty);
			System.out.println(floorDirty);
			qciCoachCleaningTrans.setLavatoryDirty(lavatoryDirty);
			qciCoachCleaningTrans.setCeilingDirty(ceilingDirty);
			qciCoachCleaningTrans.setSeatBerthDirty(seatBerthDirty);
			qciCoachCleaningTrans.setPanelDirty(panelDirty);
			qciCoachCleaningTrans.setStoreroomPantryLinenDirty(storeroomPantryLinenDirty);
			qciCoachCleaningTrans.setRailsSlidingDoorDirty(railsSlidingDoorDirty);
			qciCoachCleaningTrans.setWindowGlassDirty(windowGlassDirty);
			qciCoachCleaningTrans.setPlasticFilmRemoved(plasticFilmRemoved);
			qciCoachCleaningTrans.setDoorDirty(doorDirty);
			qciCoachCleaningTrans.setTestingObservationRemark(testingObservationRemark);
		
		}
		else
		{
			qciCoachCleaningTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
			qciCoachCleaningTransSave.setFloorDirty(floorDirty);
			qciCoachCleaningTransSave.setLavatoryDirty(lavatoryDirty);
			qciCoachCleaningTransSave.setCeilingDirty(ceilingDirty);
			qciCoachCleaningTransSave.setSeatBerthDirty(seatBerthDirty);
			qciCoachCleaningTransSave.setPanelDirty(panelDirty);
			qciCoachCleaningTransSave.setStoreroomPantryLinenDirty(storeroomPantryLinenDirty);
			qciCoachCleaningTransSave.setRailsSlidingDoorDirty(railsSlidingDoorDirty);
			qciCoachCleaningTransSave.setWindowGlassDirty(windowGlassDirty);
			qciCoachCleaningTransSave.setPlasticFilmRemoved(plasticFilmRemoved);
			qciCoachCleaningTransSave.setDoorDirty(doorDirty);
			qciCoachCleaningTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
		
		
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData12(qciCoachCleaningTrans, qciFPvcTrans, qciCoachCleaningTransSave, qciFPvcTransSave);
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
	public String getFloorDirty() {
		return floorDirty;
	}
	public void setFloorDirty(String floorDirty) {
		this.floorDirty = floorDirty;
	}
	public String getLavatoryDirty() {
		return lavatoryDirty;
	}
	public void setLavatoryDirty(String lavatoryDirty) {
		this.lavatoryDirty = lavatoryDirty;
	}
	public String getCeilingDirty() {
		return ceilingDirty;
	}
	public void setCeilingDirty(String ceilingDirty) {
		this.ceilingDirty = ceilingDirty;
	}
	public String getSeatBerthDirty() {
		return seatBerthDirty;
	}
	public void setSeatBerthDirty(String seatBerthDirty) {
		this.seatBerthDirty = seatBerthDirty;
	}
	public String getPanelDirty() {
		return panelDirty;
	}
	public void setPanelDirty(String panelDirty) {
		this.panelDirty = panelDirty;
	}
	public String getStoreroomPantryLinenDirty() {
		return storeroomPantryLinenDirty;
	}
	public void setStoreroomPantryLinenDirty(String storeroomPantryLinenDirty) {
		this.storeroomPantryLinenDirty = storeroomPantryLinenDirty;
	}
	public String getRailsSlidingDoorDirty() {
		return railsSlidingDoorDirty;
	}
	public void setRailsSlidingDoorDirty(String railsSlidingDoorDirty) {
		this.railsSlidingDoorDirty = railsSlidingDoorDirty;
	}
	public String getWindowGlassDirty() {
		return windowGlassDirty;
	}
	public void setWindowGlassDirty(String windowGlassDirty) {
		this.windowGlassDirty = windowGlassDirty;
	}
	public String getPlasticFilmRemoved() {
		return plasticFilmRemoved;
	}
	public void setPlasticFilmRemoved(String plasticFilmRemoved) {
		this.plasticFilmRemoved = plasticFilmRemoved;
	}
	public String getDoorDirty() {
		return doorDirty;
	}
	public void setDoorDirty(String doorDirty) {
		this.doorDirty = doorDirty;
	}
	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}
	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}
	
}
