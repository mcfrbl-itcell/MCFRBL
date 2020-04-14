package struts.action.master;
import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciPanelTrans;
import beans.FurnishingTransaction;
import beans.QciFPvcTrans;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SavePanel {
	private String furnishingAssetId;
	private String acAirGrillScrewTighten;
	private String acAirGrillScrewMissing;
	private String gapPartitionPanel;
	private String cutMarkPanelCorner;
	private String panelCrackNear;
	private String panelDentNear;
	private String magazineBagScrewLoose;
	private String magazineBagScrewNotFitted;
	private String magazineTaperFitted;
	private String magazineTaperBulged;
	private String magazineTaperDamage;
	private String holePanelPartition;
	private String panelNotLocked;
	private String excessGapPanelPartition;
	private String windowRubberExcessLength;
	private String windowRubberShortLength;
	private String windowRubberUprooted;
	private String testingObservationRemark;
	
	public String saveData3()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		QciPanelTrans qciPanelTransSave=new QciPanelTrans();
		QciPanelTrans qciPanelTrans= (QciPanelTrans) session.get(QciPanelTrans.class, furnishingAssetIdAsInt);
		
		
		
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciPanelFlag(1);
		
		
		}
		else
		{
			
			qciFPvcTransSave.setQciPanelFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		if(qciPanelTrans!=null){
			qciPanelTrans.setAcAirGrillScrewTighten(acAirGrillScrewTighten);
			System.out.println(acAirGrillScrewTighten);
			qciPanelTrans.setAcAirGrillScrewMissing(acAirGrillScrewMissing);
			System.out.println(acAirGrillScrewMissing);
			qciPanelTrans.setGapPartitionPanel(gapPartitionPanel);
			System.out.println(gapPartitionPanel);
			qciPanelTrans.setCutMarkPanelCorner(cutMarkPanelCorner);
			qciPanelTrans.setPanelCrackNear(panelCrackNear);
			qciPanelTrans.setPanelDentNear(panelDentNear);
			qciPanelTrans.setMagazineBagScrewLoose(magazineBagScrewLoose);
			qciPanelTrans.setMagazineBagScrewNotFitted(magazineBagScrewNotFitted);
			qciPanelTrans.setMagazineTaperFitted(magazineTaperFitted);
			qciPanelTrans.setMagazineTaperBulged(magazineTaperBulged);
			qciPanelTrans.setMagazineTaperDamage(magazineTaperDamage);
			qciPanelTrans.setHolePanelPartition(holePanelPartition);
			qciPanelTrans.setPanelNotLocked(panelNotLocked);
			qciPanelTrans.setExcessGapPanelPartition(excessGapPanelPartition);
			qciPanelTrans.setWindowRubberExcessLength(windowRubberExcessLength);
			qciPanelTrans.setWindowRubberShortLength(windowRubberShortLength);
			qciPanelTrans.setWindowRubberUprooted(windowRubberUprooted);
			qciPanelTrans.setTestingObservationRemark(testingObservationRemark);
		
		}
		else
		{
			qciPanelTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			qciPanelTransSave.setAcAirGrillScrewTighten(acAirGrillScrewTighten);
			System.out.println(acAirGrillScrewTighten);
			qciPanelTransSave.setAcAirGrillScrewMissing(acAirGrillScrewMissing);
			System.out.println(acAirGrillScrewMissing);
			qciPanelTransSave.setGapPartitionPanel(gapPartitionPanel);
			System.out.println(gapPartitionPanel);
			qciPanelTransSave.setCutMarkPanelCorner(cutMarkPanelCorner);
			qciPanelTransSave.setPanelCrackNear(panelCrackNear);
			qciPanelTransSave.setPanelDentNear(panelDentNear);
			qciPanelTransSave.setMagazineBagScrewLoose(magazineBagScrewLoose);
			qciPanelTransSave.setMagazineBagScrewNotFitted(magazineBagScrewNotFitted);
			qciPanelTransSave.setMagazineTaperFitted(magazineTaperFitted);
			qciPanelTransSave.setMagazineTaperBulged(magazineTaperBulged);
			qciPanelTransSave.setMagazineTaperDamage(magazineTaperDamage);
			qciPanelTransSave.setHolePanelPartition(holePanelPartition);
			qciPanelTransSave.setPanelNotLocked(panelNotLocked);
			qciPanelTransSave.setExcessGapPanelPartition(excessGapPanelPartition);
			qciPanelTransSave.setWindowRubberExcessLength(windowRubberExcessLength);
			qciPanelTransSave.setWindowRubberShortLength(windowRubberShortLength);
			qciPanelTransSave.setWindowRubberUprooted(windowRubberUprooted);
			qciPanelTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
		
		
		
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData3(qciPanelTrans, qciFPvcTrans, qciPanelTransSave, qciFPvcTransSave);
				System.out.println(acAirGrillScrewTighten);
				System.out.println(acAirGrillScrewMissing);
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
	public String getAcAirGrillScrewTighten() {
		return acAirGrillScrewTighten;
	}
	public void setAcAirGrillScrewTighten(String acAirGrillScrewTighten) {
		this.acAirGrillScrewTighten = acAirGrillScrewTighten;
	}
	public String getAcAirGrillScrewMissing() {
		return acAirGrillScrewMissing;
	}
	public void setAcAirGrillScrewMissing(String acAirGrillScrewMissing) {
		this.acAirGrillScrewMissing = acAirGrillScrewMissing;
	}
	public String getGapPartitionPanel() {
		return gapPartitionPanel;
	}
	public void setGapPartitionPanel(String gapPartitionPanel) {
		this.gapPartitionPanel = gapPartitionPanel;
	}
	public String getCutMarkPanelCorner() {
		return cutMarkPanelCorner;
	}
	public void setCutMarkPanelCorner(String cutMarkPanelCorner) {
		this.cutMarkPanelCorner = cutMarkPanelCorner;
	}
	public String getPanelCrackNear() {
		return panelCrackNear;
	}
	public void setPanelCrackNear(String panelCrackNear) {
		this.panelCrackNear = panelCrackNear;
	}
	public String getPanelDentNear() {
		return panelDentNear;
	}
	public void setPanelDentNear(String panelDentNear) {
		this.panelDentNear = panelDentNear;
	}
	public String getMagazineBagScrewLoose() {
		return magazineBagScrewLoose;
	}
	public void setMagazineBagScrewLoose(String magazineBagScrewLoose) {
		this.magazineBagScrewLoose = magazineBagScrewLoose;
	}
	public String getMagazineBagScrewNotFitted() {
		return magazineBagScrewNotFitted;
	}
	public void setMagazineBagScrewNotFitted(String magazineBagScrewNotFitted) {
		this.magazineBagScrewNotFitted = magazineBagScrewNotFitted;
	}
	public String getMagazineTaperFitted() {
		return magazineTaperFitted;
	}
	public void setMagazineTaperFitted(String magazineTaperFitted) {
		this.magazineTaperFitted = magazineTaperFitted;
	}
	public String getMagazineTaperBulged() {
		return magazineTaperBulged;
	}
	public void setMagazineTaperBulged(String magazineTaperBulged) {
		this.magazineTaperBulged = magazineTaperBulged;
	}
	public String getMagazineTaperDamage() {
		return magazineTaperDamage;
	}
	public void setMagazineTaperDamage(String magazineTaperDamage) {
		this.magazineTaperDamage = magazineTaperDamage;
	}
	public String getHolePanelPartition() {
		return holePanelPartition;
	}
	public void setHolePanelPartition(String holePanelPartition) {
		this.holePanelPartition = holePanelPartition;
	}
	public String getPanelNotLocked() {
		return panelNotLocked;
	}
	public void setPanelNotLocked(String panelNotLocked) {
		this.panelNotLocked = panelNotLocked;
	}
	public String getExcessGapPanelPartition() {
		return excessGapPanelPartition;
	}
	public void setExcessGapPanelPartition(String excessGapPanelPartition) {
		this.excessGapPanelPartition = excessGapPanelPartition;
	}
	public String getWindowRubberExcessLength() {
		return windowRubberExcessLength;
	}
	public void setWindowRubberExcessLength(String windowRubberExcessLength) {
		this.windowRubberExcessLength = windowRubberExcessLength;
	}
	public String getWindowRubberShortLength() {
		return windowRubberShortLength;
	}
	public void setWindowRubberShortLength(String windowRubberShortLength) {
		this.windowRubberShortLength = windowRubberShortLength;
	}
	public String getWindowRubberUprooted() {
		return windowRubberUprooted;
	}
	public void setWindowRubberUprooted(String windowRubberUprooted) {
		this.windowRubberUprooted = windowRubberUprooted;
	}
	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}
	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}
	
	
	
	
	
}
