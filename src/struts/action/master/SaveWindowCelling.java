package struts.action.master;
import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciWindowCeilingTrans;
import beans.FurnishingTransaction;
import beans.QciFPvcTrans;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveWindowCelling {
	private String furnishingAssetId;
	private String screwMissingLtypeCeiling;
	private String screwMissingChipUp;
	private String doorwayGangwayCeilingAlign;
	private String doorwayGangwayCeilingDent;
	private String chipupDoorwayGangwayCeiling;
	private String excessGapDoorwayLinenroomCeiling;
	private String taperGapCorridorPartition;
	private String nylonRopeDoorwayCeiling;
	private String nylonRopeDoorwayCeilingUnlock;
	private String doorwayGangwayCeilingKnotted;
	private String gapWallceilingPartition;
	private String dentWallceilingPartition;
	private String epSheetWallceilingPartition;
	private String excessCutCeiling;
	private String dentMarkNearB;
	private String screwMissingCeiling;
	private String screwMissingSideCeiling;
	private String screwLooseSideCeiling;
	private String screwUnwantedHole;
	private String screwCeilingLevel;
	private String centreDiffuserLevelMismatch;
	private String centreDiffuserLevelBulge;
	private String centreDiffuserLockedPrperly;
	private String centreDiffuserLockedMissing;
	private String emergencyPullhandlerubbberSited;
	private String windowGlassCracked;
	private String gapCentreDiffuserSideceiling;
	private String gapSidewalceilingCentrediffuser;
	private String testingObservationRemark;
	
	
	public String saveData4()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		
		QciWindowCeilingTrans qciWindowCeilingTransSave=new QciWindowCeilingTrans();
		QciWindowCeilingTrans qciWindowCeilingTrans= (QciWindowCeilingTrans) session.get(QciWindowCeilingTrans.class, furnishingAssetIdAsInt);
		
	
	
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciWindowCellingFlag(1);
		}
		else
		{
			
			qciFPvcTransSave.setQciWindowCellingFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		
		if(qciWindowCeilingTrans!=null){
			qciWindowCeilingTrans.setScrewMissingLtypeCeiling(screwMissingLtypeCeiling);
			qciWindowCeilingTrans.setScrewMissingChipUp(screwMissingChipUp);
			qciWindowCeilingTrans.setDoorwayGangwayCeilingAlign(doorwayGangwayCeilingAlign);
			qciWindowCeilingTrans.setDoorwayGangwayCeilingDent(doorwayGangwayCeilingDent);
			qciWindowCeilingTrans.setChipupDoorwayGangwayCeiling(chipupDoorwayGangwayCeiling);
			qciWindowCeilingTrans.setExcessGapDoorwayLinenroomCeiling(excessGapDoorwayLinenroomCeiling);
			qciWindowCeilingTrans.setTaperGapCorridorPartition(taperGapCorridorPartition);
			qciWindowCeilingTrans.setNylonRopeDoorwayCeiling(nylonRopeDoorwayCeiling);
			qciWindowCeilingTrans.setNylonRopeDoorwayCeilingUnlock(nylonRopeDoorwayCeilingUnlock);
			qciWindowCeilingTrans.setDoorwayGangwayCeilingKnotted(doorwayGangwayCeilingKnotted);
			qciWindowCeilingTrans.setGapWallceilingPartition(gapWallceilingPartition);
			qciWindowCeilingTrans.setDentWallceilingPartition(dentWallceilingPartition);
			qciWindowCeilingTrans.setEpSheetWallceilingPartition(epSheetWallceilingPartition);
			qciWindowCeilingTrans.setExcessCutCeiling(excessCutCeiling);
			qciWindowCeilingTrans.setDentMarkNearB(dentMarkNearB);
			qciWindowCeilingTrans.setScrewMissingCeiling(screwMissingCeiling);
			qciWindowCeilingTrans.setScrewMissingSideCeiling(screwMissingSideCeiling);
			qciWindowCeilingTrans.setScrewLooseSideCeiling(screwLooseSideCeiling);
			qciWindowCeilingTrans.setScrewUnwantedHole(screwUnwantedHole);
			qciWindowCeilingTrans.setScrewCeilingLevel(screwCeilingLevel);
			qciWindowCeilingTrans.setCentreDiffuserLevelMismatch(centreDiffuserLevelMismatch);
			qciWindowCeilingTrans.setCentreDiffuserLevelBulge(centreDiffuserLevelBulge);
			qciWindowCeilingTrans.setCentreDiffuserLockedPrperly(centreDiffuserLockedPrperly);
			qciWindowCeilingTrans.setCentreDiffuserLockedMissing(centreDiffuserLockedMissing);
			qciWindowCeilingTrans.setEmergencyPullhandlerubbberSited(emergencyPullhandlerubbberSited);
			qciWindowCeilingTrans.setWindowGlassCracked(windowGlassCracked);
			qciWindowCeilingTrans.setGapCentreDiffuserSideceiling(gapCentreDiffuserSideceiling);
			qciWindowCeilingTrans.setGapSidewalceilingCentrediffuser(gapSidewalceilingCentrediffuser);
			qciWindowCeilingTrans.setTestingObservationRemark(testingObservationRemark);
		}
		else
		{
			qciWindowCeilingTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			qciWindowCeilingTransSave.setScrewMissingLtypeCeiling(screwMissingLtypeCeiling);
			qciWindowCeilingTransSave.setScrewMissingChipUp(screwMissingChipUp);
			qciWindowCeilingTransSave.setDoorwayGangwayCeilingAlign(doorwayGangwayCeilingAlign);
			qciWindowCeilingTransSave.setDoorwayGangwayCeilingDent(doorwayGangwayCeilingDent);
			qciWindowCeilingTransSave.setChipupDoorwayGangwayCeiling(chipupDoorwayGangwayCeiling);
			qciWindowCeilingTransSave.setExcessGapDoorwayLinenroomCeiling(excessGapDoorwayLinenroomCeiling);
			qciWindowCeilingTransSave.setTaperGapCorridorPartition(taperGapCorridorPartition);
			qciWindowCeilingTransSave.setNylonRopeDoorwayCeiling(nylonRopeDoorwayCeiling);
			qciWindowCeilingTransSave.setNylonRopeDoorwayCeilingUnlock(nylonRopeDoorwayCeilingUnlock);
			qciWindowCeilingTransSave.setDoorwayGangwayCeilingKnotted(doorwayGangwayCeilingKnotted);
			qciWindowCeilingTransSave.setGapWallceilingPartition(gapWallceilingPartition);
			qciWindowCeilingTransSave.setDentWallceilingPartition(dentWallceilingPartition);
			qciWindowCeilingTransSave.setEpSheetWallceilingPartition(epSheetWallceilingPartition);
			qciWindowCeilingTransSave.setExcessCutCeiling(excessCutCeiling);
			qciWindowCeilingTransSave.setDentMarkNearB(dentMarkNearB);
			qciWindowCeilingTransSave.setScrewMissingCeiling(screwMissingCeiling);
			qciWindowCeilingTransSave.setScrewMissingSideCeiling(screwMissingSideCeiling);
			qciWindowCeilingTransSave.setScrewLooseSideCeiling(screwLooseSideCeiling);
			qciWindowCeilingTransSave.setScrewUnwantedHole(screwUnwantedHole);
			qciWindowCeilingTransSave.setScrewCeilingLevel(screwCeilingLevel);
			qciWindowCeilingTransSave.setCentreDiffuserLevelMismatch(centreDiffuserLevelMismatch);
			qciWindowCeilingTransSave.setCentreDiffuserLevelBulge(centreDiffuserLevelBulge);
			qciWindowCeilingTransSave.setCentreDiffuserLockedPrperly(centreDiffuserLockedPrperly);
			qciWindowCeilingTransSave.setCentreDiffuserLockedMissing(centreDiffuserLockedMissing);
			qciWindowCeilingTransSave.setEmergencyPullhandlerubbberSited(emergencyPullhandlerubbberSited);
			qciWindowCeilingTransSave.setWindowGlassCracked(windowGlassCracked);
			qciWindowCeilingTransSave.setGapCentreDiffuserSideceiling(gapCentreDiffuserSideceiling);
			qciWindowCeilingTransSave.setGapSidewalceilingCentrediffuser(gapSidewalceilingCentrediffuser);
			qciWindowCeilingTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
		
				
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData4(qciWindowCeilingTrans, qciFPvcTrans, qciWindowCeilingTransSave, qciFPvcTransSave);
				System.out.println(screwMissingLtypeCeiling);
				System.out.println(screwMissingChipUp);
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


	public String getScrewMissingLtypeCeiling() {
		return screwMissingLtypeCeiling;
	}


	public void setScrewMissingLtypeCeiling(String screwMissingLtypeCeiling) {
		this.screwMissingLtypeCeiling = screwMissingLtypeCeiling;
	}


	public String getScrewMissingChipUp() {
		return screwMissingChipUp;
	}


	public void setScrewMissingChipUp(String screwMissingChipUp) {
		this.screwMissingChipUp = screwMissingChipUp;
	}


	public String getDoorwayGangwayCeilingAlign() {
		return doorwayGangwayCeilingAlign;
	}


	public void setDoorwayGangwayCeilingAlign(String doorwayGangwayCeilingAlign) {
		this.doorwayGangwayCeilingAlign = doorwayGangwayCeilingAlign;
	}


	public String getDoorwayGangwayCeilingDent() {
		return doorwayGangwayCeilingDent;
	}


	public void setDoorwayGangwayCeilingDent(String doorwayGangwayCeilingDent) {
		this.doorwayGangwayCeilingDent = doorwayGangwayCeilingDent;
	}


	public String getChipupDoorwayGangwayCeiling() {
		return chipupDoorwayGangwayCeiling;
	}


	public void setChipupDoorwayGangwayCeiling(String chipupDoorwayGangwayCeiling) {
		this.chipupDoorwayGangwayCeiling = chipupDoorwayGangwayCeiling;
	}


	public String getExcessGapDoorwayLinenroomCeiling() {
		return excessGapDoorwayLinenroomCeiling;
	}


	public void setExcessGapDoorwayLinenroomCeiling(String excessGapDoorwayLinenroomCeiling) {
		this.excessGapDoorwayLinenroomCeiling = excessGapDoorwayLinenroomCeiling;
	}


	public String getTaperGapCorridorPartition() {
		return taperGapCorridorPartition;
	}


	public void setTaperGapCorridorPartition(String taperGapCorridorPartition) {
		this.taperGapCorridorPartition = taperGapCorridorPartition;
	}


	public String getNylonRopeDoorwayCeiling() {
		return nylonRopeDoorwayCeiling;
	}


	public void setNylonRopeDoorwayCeiling(String nylonRopeDoorwayCeiling) {
		this.nylonRopeDoorwayCeiling = nylonRopeDoorwayCeiling;
	}


	public String getNylonRopeDoorwayCeilingUnlock() {
		return nylonRopeDoorwayCeilingUnlock;
	}


	public void setNylonRopeDoorwayCeilingUnlock(String nylonRopeDoorwayCeilingUnlock) {
		this.nylonRopeDoorwayCeilingUnlock = nylonRopeDoorwayCeilingUnlock;
	}


	public String getDoorwayGangwayCeilingKnotted() {
		return doorwayGangwayCeilingKnotted;
	}


	public void setDoorwayGangwayCeilingKnotted(String doorwayGangwayCeilingKnotted) {
		this.doorwayGangwayCeilingKnotted = doorwayGangwayCeilingKnotted;
	}


	public String getGapWallceilingPartition() {
		return gapWallceilingPartition;
	}


	public void setGapWallceilingPartition(String gapWallceilingPartition) {
		this.gapWallceilingPartition = gapWallceilingPartition;
	}


	public String getDentWallceilingPartition() {
		return dentWallceilingPartition;
	}


	public void setDentWallceilingPartition(String dentWallceilingPartition) {
		this.dentWallceilingPartition = dentWallceilingPartition;
	}


	public String getEpSheetWallceilingPartition() {
		return epSheetWallceilingPartition;
	}


	public void setEpSheetWallceilingPartition(String epSheetWallceilingPartition) {
		this.epSheetWallceilingPartition = epSheetWallceilingPartition;
	}


	public String getExcessCutCeiling() {
		return excessCutCeiling;
	}


	public void setExcessCutCeiling(String excessCutCeiling) {
		this.excessCutCeiling = excessCutCeiling;
	}


	public String getDentMarkNearB() {
		return dentMarkNearB;
	}


	public void setDentMarkNearB(String dentMarkNearB) {
		this.dentMarkNearB = dentMarkNearB;
	}


	public String getScrewMissingCeiling() {
		return screwMissingCeiling;
	}


	public void setScrewMissingCeiling(String screwMissingCeiling) {
		this.screwMissingCeiling = screwMissingCeiling;
	}


	public String getScrewMissingSideCeiling() {
		return screwMissingSideCeiling;
	}


	public void setScrewMissingSideCeiling(String screwMissingSideCeiling) {
		this.screwMissingSideCeiling = screwMissingSideCeiling;
	}


	public String getScrewLooseSideCeiling() {
		return screwLooseSideCeiling;
	}


	public void setScrewLooseSideCeiling(String screwLooseSideCeiling) {
		this.screwLooseSideCeiling = screwLooseSideCeiling;
	}


	public String getScrewUnwantedHole() {
		return screwUnwantedHole;
	}


	public void setScrewUnwantedHole(String screwUnwantedHole) {
		this.screwUnwantedHole = screwUnwantedHole;
	}


	public String getScrewCeilingLevel() {
		return screwCeilingLevel;
	}


	public void setScrewCeilingLevel(String screwCeilingLevel) {
		this.screwCeilingLevel = screwCeilingLevel;
	}


	public String getCentreDiffuserLevelMismatch() {
		return centreDiffuserLevelMismatch;
	}


	public void setCentreDiffuserLevelMismatch(String centreDiffuserLevelMismatch) {
		this.centreDiffuserLevelMismatch = centreDiffuserLevelMismatch;
	}


	public String getCentreDiffuserLevelBulge() {
		return centreDiffuserLevelBulge;
	}


	public void setCentreDiffuserLevelBulge(String centreDiffuserLevelBulge) {
		this.centreDiffuserLevelBulge = centreDiffuserLevelBulge;
	}


	public String getCentreDiffuserLockedPrperly() {
		return centreDiffuserLockedPrperly;
	}


	public void setCentreDiffuserLockedPrperly(String centreDiffuserLockedPrperly) {
		this.centreDiffuserLockedPrperly = centreDiffuserLockedPrperly;
	}


	public String getCentreDiffuserLockedMissing() {
		return centreDiffuserLockedMissing;
	}


	public void setCentreDiffuserLockedMissing(String centreDiffuserLockedMissing) {
		this.centreDiffuserLockedMissing = centreDiffuserLockedMissing;
	}


	public String getEmergencyPullhandlerubbberSited() {
		return emergencyPullhandlerubbberSited;
	}


	public void setEmergencyPullhandlerubbberSited(String emergencyPullhandlerubbberSited) {
		this.emergencyPullhandlerubbberSited = emergencyPullhandlerubbberSited;
	}


	public String getWindowGlassCracked() {
		return windowGlassCracked;
	}


	public void setWindowGlassCracked(String windowGlassCracked) {
		this.windowGlassCracked = windowGlassCracked;
	}


	public String getGapCentreDiffuserSideceiling() {
		return gapCentreDiffuserSideceiling;
	}


	public void setGapCentreDiffuserSideceiling(String gapCentreDiffuserSideceiling) {
		this.gapCentreDiffuserSideceiling = gapCentreDiffuserSideceiling;
	}


	public String getGapSidewalceilingCentrediffuser() {
		return gapSidewalceilingCentrediffuser;
	}


	public void setGapSidewalceilingCentrediffuser(String gapSidewalceilingCentrediffuser) {
		this.gapSidewalceilingCentrediffuser = gapSidewalceilingCentrediffuser;
	}


	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}


	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}
	
}
