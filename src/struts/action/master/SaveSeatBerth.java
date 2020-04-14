package struts.action.master;
import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciSeatBerthTrans;
import beans.FurnishingTransaction;
import beans.QciFPvcTrans;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveSeatBerth {
	private String furnishingAssetId;
	private String protectionWallHardwareLoose;
	private String protectionWallHardwareMissing;
	private String luggageRackLoose;
	private String luggageRackTaper;
	private String luggageRackMissing;
	private String mirrorNotPasted;
	private String mirrorRubberUprooted;
	private String coatHookLoose;
	private String coatHookMissing;
	private String coatHookApdDone;
	private String coatHookApdRoughly;
	private String curtainMovementSmooth;
	private String curtainRunnerCameOut;
	private String curtainRunnerStopperFitted;
	private String snackTableLoose;
	private String snackTableTapper;
	private String snackTableScrewMissing;
	private String safetyRailTaper;
	private String safetyRailLoose;
	private String safetyRailBktLoose;
	private String safetyRailBktTighten;
	private String safetyRailBktTaper;
	private String berthChainLoose;
	private String berthChainHardwareLoose;
	private String berthChainHardwareMissing;
	private String bottleHolderLoose;
	private String bottleHolderTaper;
	private String bottoleHolderScrewMissing;
	private String bottoleHolderScrewDamage;
	private String berthMountingHardwareSidewallLoose;
	private String berthMountingHardwareSidewallTaper;
	private String berthMountingHardwareSidewallMissing;
	private String berthMountingHardwarePillarLoose;
	private String berthMountingHardwarePillarTaper;
	private String berthMountingHardwarePillarMissing;
	private String berthTapper;
	private String berthFlapLoose;
	private String berthFlapBulge;
	private String flapAlStripExcessLength;
	private String flapAlHardwareExcessLength;
	private String transverseBerthLevel;
	private String gapBackrestBerth;
	private String backrestMovement;
	private String backrestGrazingLadder;
	private String backrestGrazingPanelseat;
	private String latchCatchMissmatch;
	private String burrLatchSeat;
	private String burrCatchSeat;
	private String holePartitionLatchSeat;
	private String rexineTornBackrestSeat;
	private String rexineTornBerth;
	private String almirahHardwareLoose;
	private String almirahHardwareMissing;
	private String towerWorking;
	private String almirahWorking;
	private String almirahHole;
	private String holeNearBottleHolder;
	private String holeNearLatchSeat;
	private String holeNearCatchSeat;
	private String rexineTornBerthArmrest;
	private String builderPlateScrewMissing;
	private String builderPlateScrewMissmatch;
	private String rexenePastedBacksideBerth;
	private String testingObservationRemark;
	
	public String saveData6()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		QciSeatBerthTrans qciSeatBerthTransSave=new QciSeatBerthTrans();
		QciSeatBerthTrans qciSeatBerthTrans= (QciSeatBerthTrans) session.get(QciSeatBerthTrans.class, furnishingAssetIdAsInt);
		
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciSeatBerthFlag(1);
		
		}
		else
		{
			
			qciFPvcTransSave.setQciSeatBerthFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		
		if(qciSeatBerthTrans!=null){
			qciSeatBerthTrans.setProtectionWallHardwareLoose(protectionWallHardwareLoose);
			System.out.println(protectionWallHardwareLoose);
			qciSeatBerthTrans.setProtectionWallHardwareMissing(protectionWallHardwareMissing);
			System.out.println(protectionWallHardwareMissing);
			qciSeatBerthTrans.setLuggageRackLoose(luggageRackLoose);
			System.out.println(luggageRackLoose);
			qciSeatBerthTrans.setLuggageRackTaper(luggageRackTaper);
			System.out.println(luggageRackTaper);
			qciSeatBerthTrans.setLuggageRackMissing(luggageRackMissing);
			qciSeatBerthTrans.setMirrorNotPasted(mirrorNotPasted);
			qciSeatBerthTrans.setMirrorRubberUprooted(mirrorRubberUprooted);
			qciSeatBerthTrans.setCoatHookLoose(coatHookLoose);
			qciSeatBerthTrans.setCoatHookMissing(coatHookMissing);
			qciSeatBerthTrans.setCoatHookApdDone(coatHookApdDone);
			qciSeatBerthTrans.setCoatHookApdRoughly(coatHookApdRoughly);
			qciSeatBerthTrans.setCurtainMovementSmooth(curtainMovementSmooth);
			qciSeatBerthTrans.setCurtainRunnerCameOut(curtainRunnerCameOut);
			qciSeatBerthTrans.setCurtainRunnerStopperFitted(curtainRunnerStopperFitted);
			qciSeatBerthTrans.setSnackTableLoose(snackTableLoose);
			qciSeatBerthTrans.setSnackTableTapper(snackTableTapper);
			qciSeatBerthTrans.setSnackTableScrewMissing(snackTableScrewMissing);
			qciSeatBerthTrans.setSafetyRailTaper(safetyRailTaper);
			qciSeatBerthTrans.setSafetyRailLoose(safetyRailLoose);
			qciSeatBerthTrans.setSafetyRailBktLoose(safetyRailBktLoose);
			qciSeatBerthTrans.setSafetyRailBktTighten(safetyRailBktTighten);
			qciSeatBerthTrans.setSafetyRailBktTaper(safetyRailBktTaper);
			qciSeatBerthTrans.setBerthChainLoose(berthChainLoose);
			qciSeatBerthTrans.setBerthChainHardwareLoose(berthChainHardwareLoose);
			qciSeatBerthTrans.setBerthChainHardwareMissing(berthChainHardwareMissing);
			qciSeatBerthTrans.setBottleHolderLoose(bottleHolderLoose);
			qciSeatBerthTrans.setBottleHolderTaper(bottleHolderTaper);
			qciSeatBerthTrans.setBottoleHolderScrewMissing(bottoleHolderScrewMissing);
			qciSeatBerthTrans.setBottoleHolderScrewDamage(bottoleHolderScrewDamage);
			qciSeatBerthTrans.setBerthMountingHardwareSidewallLoose(berthMountingHardwareSidewallLoose);
			qciSeatBerthTrans.setBerthMountingHardwareSidewallTaper(berthMountingHardwareSidewallTaper);
			qciSeatBerthTrans.setBerthMountingHardwareSidewallMissing(berthMountingHardwareSidewallMissing);
			qciSeatBerthTrans.setBerthMountingHardwarePillarLoose(berthMountingHardwarePillarLoose);
			qciSeatBerthTrans.setBerthMountingHardwarePillarTaper(berthMountingHardwarePillarTaper);
			qciSeatBerthTrans.setBerthMountingHardwarePillarMissing(berthMountingHardwarePillarMissing);
			qciSeatBerthTrans.setBerthTapper(berthTapper);
			qciSeatBerthTrans.setBerthFlapLoose(berthFlapLoose);
			qciSeatBerthTrans.setBerthFlapBulge(berthFlapBulge);
			qciSeatBerthTrans.setFlapAlStripExcessLength(flapAlStripExcessLength);
			qciSeatBerthTrans.setFlapAlHardwareExcessLength(flapAlHardwareExcessLength);
			qciSeatBerthTrans.setTransverseBerthLevel(transverseBerthLevel);
			qciSeatBerthTrans.setGapBackrestBerth(gapBackrestBerth);
			qciSeatBerthTrans.setBackrestMovement(backrestMovement);
			qciSeatBerthTrans.setBackrestGrazingLadder(backrestGrazingLadder);
			qciSeatBerthTrans.setBackrestGrazingPanelseat(backrestGrazingPanelseat);
			qciSeatBerthTrans.setLatchCatchMissmatch(latchCatchMissmatch);
			qciSeatBerthTrans.setBurrLatchSeat(burrLatchSeat);
			qciSeatBerthTrans.setBurrCatchSeat(burrCatchSeat);
			qciSeatBerthTrans.setHolePartitionLatchSeat(holePartitionLatchSeat);
			qciSeatBerthTrans.setRexineTornBackrestSeat(rexineTornBackrestSeat);
			qciSeatBerthTrans.setRexineTornBerth(rexineTornBerth);
			qciSeatBerthTrans.setAlmirahHardwareLoose(almirahHardwareLoose);
			qciSeatBerthTrans.setAlmirahHardwareMissing(almirahHardwareMissing);
			qciSeatBerthTrans.setTowerWorking(towerWorking);
			qciSeatBerthTrans.setAlmirahWorking(almirahWorking);
			qciSeatBerthTrans.setAlmirahHole(almirahHole);
			qciSeatBerthTrans.setHoleNearBottleHolder(holeNearBottleHolder);
			qciSeatBerthTrans.setHoleNearLatchSeat(holeNearLatchSeat);
			qciSeatBerthTrans.setHoleNearCatchSeat(holeNearCatchSeat);
			qciSeatBerthTrans.setRexineTornBerthArmrest(rexineTornBerthArmrest);
			qciSeatBerthTrans.setBuilderPlateScrewMissing(builderPlateScrewMissing);
			qciSeatBerthTrans.setBuilderPlateScrewMissmatch(builderPlateScrewMissmatch);
			qciSeatBerthTrans.setRexenePastedBacksideBerth(rexenePastedBacksideBerth);
			qciSeatBerthTrans.setTestingObservationRemark(testingObservationRemark);
		}
		else
		{
			qciSeatBerthTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			qciSeatBerthTransSave.setProtectionWallHardwareLoose(protectionWallHardwareLoose);
			System.out.println(protectionWallHardwareLoose);
			qciSeatBerthTransSave.setProtectionWallHardwareMissing(protectionWallHardwareMissing);
			System.out.println(protectionWallHardwareMissing);
			qciSeatBerthTransSave.setLuggageRackLoose(luggageRackLoose);
			System.out.println(luggageRackLoose);
			qciSeatBerthTransSave.setLuggageRackTaper(luggageRackTaper);
			System.out.println(luggageRackTaper);
			qciSeatBerthTransSave.setLuggageRackMissing(luggageRackMissing);
			qciSeatBerthTransSave.setMirrorNotPasted(mirrorNotPasted);
			qciSeatBerthTransSave.setMirrorRubberUprooted(mirrorRubberUprooted);
			qciSeatBerthTransSave.setCoatHookLoose(coatHookLoose);
			qciSeatBerthTransSave.setCoatHookMissing(coatHookMissing);
			qciSeatBerthTransSave.setCoatHookApdDone(coatHookApdDone);
			qciSeatBerthTransSave.setCoatHookApdRoughly(coatHookApdRoughly);
			qciSeatBerthTransSave.setCurtainMovementSmooth(curtainMovementSmooth);
			qciSeatBerthTransSave.setCurtainRunnerCameOut(curtainRunnerCameOut);
			qciSeatBerthTransSave.setCurtainRunnerStopperFitted(curtainRunnerStopperFitted);
			qciSeatBerthTransSave.setSnackTableLoose(snackTableLoose);
			qciSeatBerthTransSave.setSnackTableTapper(snackTableTapper);
			qciSeatBerthTransSave.setSnackTableScrewMissing(snackTableScrewMissing);
			qciSeatBerthTransSave.setSafetyRailTaper(safetyRailTaper);
			qciSeatBerthTransSave.setSafetyRailLoose(safetyRailLoose);
			qciSeatBerthTransSave.setSafetyRailBktLoose(safetyRailBktLoose);
			qciSeatBerthTransSave.setSafetyRailBktTighten(safetyRailBktTighten);
			qciSeatBerthTransSave.setSafetyRailBktTaper(safetyRailBktTaper);
			qciSeatBerthTransSave.setBerthChainLoose(berthChainLoose);
			qciSeatBerthTransSave.setBerthChainHardwareLoose(berthChainHardwareLoose);
			qciSeatBerthTransSave.setBerthChainHardwareMissing(berthChainHardwareMissing);
			qciSeatBerthTransSave.setBottleHolderLoose(bottleHolderLoose);
			qciSeatBerthTransSave.setBottleHolderTaper(bottleHolderTaper);
			qciSeatBerthTransSave.setBottoleHolderScrewMissing(bottoleHolderScrewMissing);
			qciSeatBerthTransSave.setBottoleHolderScrewDamage(bottoleHolderScrewDamage);
			qciSeatBerthTransSave.setBerthMountingHardwareSidewallLoose(berthMountingHardwareSidewallLoose);
			qciSeatBerthTransSave.setBerthMountingHardwareSidewallTaper(berthMountingHardwareSidewallTaper);
			qciSeatBerthTransSave.setBerthMountingHardwareSidewallMissing(berthMountingHardwareSidewallMissing);
			qciSeatBerthTransSave.setBerthMountingHardwarePillarLoose(berthMountingHardwarePillarLoose);
			qciSeatBerthTransSave.setBerthMountingHardwarePillarTaper(berthMountingHardwarePillarTaper);
			qciSeatBerthTransSave.setBerthMountingHardwarePillarMissing(berthMountingHardwarePillarMissing);
			qciSeatBerthTransSave.setBerthTapper(berthTapper);
			qciSeatBerthTransSave.setBerthFlapLoose(berthFlapLoose);
			qciSeatBerthTransSave.setBerthFlapBulge(berthFlapBulge);
			qciSeatBerthTransSave.setFlapAlStripExcessLength(flapAlStripExcessLength);
			qciSeatBerthTransSave.setFlapAlHardwareExcessLength(flapAlHardwareExcessLength);
			qciSeatBerthTransSave.setTransverseBerthLevel(transverseBerthLevel);
			qciSeatBerthTransSave.setGapBackrestBerth(gapBackrestBerth);
			qciSeatBerthTransSave.setBackrestMovement(backrestMovement);
			qciSeatBerthTransSave.setBackrestGrazingLadder(backrestGrazingLadder);
			qciSeatBerthTransSave.setBackrestGrazingPanelseat(backrestGrazingPanelseat);
			qciSeatBerthTransSave.setLatchCatchMissmatch(latchCatchMissmatch);
			qciSeatBerthTransSave.setBurrLatchSeat(burrLatchSeat);
			qciSeatBerthTransSave.setBurrCatchSeat(burrCatchSeat);
			qciSeatBerthTransSave.setHolePartitionLatchSeat(holePartitionLatchSeat);
			qciSeatBerthTransSave.setRexineTornBackrestSeat(rexineTornBackrestSeat);
			qciSeatBerthTransSave.setRexineTornBerth(rexineTornBerth);
			qciSeatBerthTransSave.setAlmirahHardwareLoose(almirahHardwareLoose);
			qciSeatBerthTransSave.setAlmirahHardwareMissing(almirahHardwareMissing);
			qciSeatBerthTransSave.setTowerWorking(towerWorking);
			qciSeatBerthTransSave.setAlmirahWorking(almirahWorking);
			qciSeatBerthTransSave.setAlmirahHole(almirahHole);
			qciSeatBerthTransSave.setHoleNearBottleHolder(holeNearBottleHolder);
			qciSeatBerthTransSave.setHoleNearLatchSeat(holeNearLatchSeat);
			qciSeatBerthTransSave.setHoleNearCatchSeat(holeNearCatchSeat);
			qciSeatBerthTransSave.setRexineTornBerthArmrest(rexineTornBerthArmrest);
			qciSeatBerthTransSave.setBuilderPlateScrewMissing(builderPlateScrewMissing);
			qciSeatBerthTransSave.setBuilderPlateScrewMissmatch(builderPlateScrewMissmatch);
			qciSeatBerthTransSave.setRexenePastedBacksideBerth(rexenePastedBacksideBerth);
			qciSeatBerthTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
		
		
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData6(qciSeatBerthTrans, qciFPvcTrans, qciSeatBerthTransSave, qciFPvcTransSave);
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
	public String getProtectionWallHardwareLoose() {
		return protectionWallHardwareLoose;
	}
	public void setProtectionWallHardwareLoose(String protectionWallHardwareLoose) {
		this.protectionWallHardwareLoose = protectionWallHardwareLoose;
	}
	public String getProtectionWallHardwareMissing() {
		return protectionWallHardwareMissing;
	}
	public void setProtectionWallHardwareMissing(String protectionWallHardwareMissing) {
		this.protectionWallHardwareMissing = protectionWallHardwareMissing;
	}
	public String getLuggageRackLoose() {
		return luggageRackLoose;
	}
	public void setLuggageRackLoose(String luggageRackLoose) {
		this.luggageRackLoose = luggageRackLoose;
	}
	public String getLuggageRackTaper() {
		return luggageRackTaper;
	}
	public void setLuggageRackTaper(String luggageRackTaper) {
		this.luggageRackTaper = luggageRackTaper;
	}
	public String getLuggageRackMissing() {
		return luggageRackMissing;
	}
	public void setLuggageRackMissing(String luggageRackMissing) {
		this.luggageRackMissing = luggageRackMissing;
	}
	public String getMirrorNotPasted() {
		return mirrorNotPasted;
	}
	public void setMirrorNotPasted(String mirrorNotPasted) {
		this.mirrorNotPasted = mirrorNotPasted;
	}
	public String getMirrorRubberUprooted() {
		return mirrorRubberUprooted;
	}
	public void setMirrorRubberUprooted(String mirrorRubberUprooted) {
		this.mirrorRubberUprooted = mirrorRubberUprooted;
	}
	public String getCoatHookLoose() {
		return coatHookLoose;
	}
	public void setCoatHookLoose(String coatHookLoose) {
		this.coatHookLoose = coatHookLoose;
	}
	public String getCoatHookMissing() {
		return coatHookMissing;
	}
	public void setCoatHookMissing(String coatHookMissing) {
		this.coatHookMissing = coatHookMissing;
	}
	public String getCoatHookApdDone() {
		return coatHookApdDone;
	}
	public void setCoatHookApdDone(String coatHookApdDone) {
		this.coatHookApdDone = coatHookApdDone;
	}
	public String getCoatHookApdRoughly() {
		return coatHookApdRoughly;
	}
	public void setCoatHookApdRoughly(String coatHookApdRoughly) {
		this.coatHookApdRoughly = coatHookApdRoughly;
	}
	public String getCurtainMovementSmooth() {
		return curtainMovementSmooth;
	}
	public void setCurtainMovementSmooth(String curtainMovementSmooth) {
		this.curtainMovementSmooth = curtainMovementSmooth;
	}
	public String getCurtainRunnerCameOut() {
		return curtainRunnerCameOut;
	}
	public void setCurtainRunnerCameOut(String curtainRunnerCameOut) {
		this.curtainRunnerCameOut = curtainRunnerCameOut;
	}
	public String getCurtainRunnerStopperFitted() {
		return curtainRunnerStopperFitted;
	}
	public void setCurtainRunnerStopperFitted(String curtainRunnerStopperFitted) {
		this.curtainRunnerStopperFitted = curtainRunnerStopperFitted;
	}
	public String getSnackTableLoose() {
		return snackTableLoose;
	}
	public void setSnackTableLoose(String snackTableLoose) {
		this.snackTableLoose = snackTableLoose;
	}
	public String getSnackTableTapper() {
		return snackTableTapper;
	}
	public void setSnackTableTapper(String snackTableTapper) {
		this.snackTableTapper = snackTableTapper;
	}
	public String getSnackTableScrewMissing() {
		return snackTableScrewMissing;
	}
	public void setSnackTableScrewMissing(String snackTableScrewMissing) {
		this.snackTableScrewMissing = snackTableScrewMissing;
	}
	public String getSafetyRailTaper() {
		return safetyRailTaper;
	}
	public void setSafetyRailTaper(String safetyRailTaper) {
		this.safetyRailTaper = safetyRailTaper;
	}
	public String getSafetyRailLoose() {
		return safetyRailLoose;
	}
	public void setSafetyRailLoose(String safetyRailLoose) {
		this.safetyRailLoose = safetyRailLoose;
	}
	public String getSafetyRailBktLoose() {
		return safetyRailBktLoose;
	}
	public void setSafetyRailBktLoose(String safetyRailBktLoose) {
		this.safetyRailBktLoose = safetyRailBktLoose;
	}
	public String getSafetyRailBktTighten() {
		return safetyRailBktTighten;
	}
	public void setSafetyRailBktTighten(String safetyRailBktTighten) {
		this.safetyRailBktTighten = safetyRailBktTighten;
	}
	public String getSafetyRailBktTaper() {
		return safetyRailBktTaper;
	}
	public void setSafetyRailBktTaper(String safetyRailBktTaper) {
		this.safetyRailBktTaper = safetyRailBktTaper;
	}
	public String getBerthChainLoose() {
		return berthChainLoose;
	}
	public void setBerthChainLoose(String berthChainLoose) {
		this.berthChainLoose = berthChainLoose;
	}
	public String getBerthChainHardwareLoose() {
		return berthChainHardwareLoose;
	}
	public void setBerthChainHardwareLoose(String berthChainHardwareLoose) {
		this.berthChainHardwareLoose = berthChainHardwareLoose;
	}
	public String getBerthChainHardwareMissing() {
		return berthChainHardwareMissing;
	}
	public void setBerthChainHardwareMissing(String berthChainHardwareMissing) {
		this.berthChainHardwareMissing = berthChainHardwareMissing;
	}
	public String getBottleHolderLoose() {
		return bottleHolderLoose;
	}
	public void setBottleHolderLoose(String bottleHolderLoose) {
		this.bottleHolderLoose = bottleHolderLoose;
	}
	public String getBottleHolderTaper() {
		return bottleHolderTaper;
	}
	public void setBottleHolderTaper(String bottleHolderTaper) {
		this.bottleHolderTaper = bottleHolderTaper;
	}
	public String getBottoleHolderScrewMissing() {
		return bottoleHolderScrewMissing;
	}
	public void setBottoleHolderScrewMissing(String bottoleHolderScrewMissing) {
		this.bottoleHolderScrewMissing = bottoleHolderScrewMissing;
	}
	public String getBottoleHolderScrewDamage() {
		return bottoleHolderScrewDamage;
	}
	public void setBottoleHolderScrewDamage(String bottoleHolderScrewDamage) {
		this.bottoleHolderScrewDamage = bottoleHolderScrewDamage;
	}
	public String getBerthMountingHardwareSidewallLoose() {
		return berthMountingHardwareSidewallLoose;
	}
	public void setBerthMountingHardwareSidewallLoose(String berthMountingHardwareSidewallLoose) {
		this.berthMountingHardwareSidewallLoose = berthMountingHardwareSidewallLoose;
	}
	public String getBerthMountingHardwareSidewallTaper() {
		return berthMountingHardwareSidewallTaper;
	}
	public void setBerthMountingHardwareSidewallTaper(String berthMountingHardwareSidewallTaper) {
		this.berthMountingHardwareSidewallTaper = berthMountingHardwareSidewallTaper;
	}
	public String getBerthMountingHardwareSidewallMissing() {
		return berthMountingHardwareSidewallMissing;
	}
	public void setBerthMountingHardwareSidewallMissing(String berthMountingHardwareSidewallMissing) {
		this.berthMountingHardwareSidewallMissing = berthMountingHardwareSidewallMissing;
	}
	public String getBerthMountingHardwarePillarLoose() {
		return berthMountingHardwarePillarLoose;
	}
	public void setBerthMountingHardwarePillarLoose(String berthMountingHardwarePillarLoose) {
		this.berthMountingHardwarePillarLoose = berthMountingHardwarePillarLoose;
	}
	public String getBerthMountingHardwarePillarTaper() {
		return berthMountingHardwarePillarTaper;
	}
	public void setBerthMountingHardwarePillarTaper(String berthMountingHardwarePillarTaper) {
		this.berthMountingHardwarePillarTaper = berthMountingHardwarePillarTaper;
	}
	public String getBerthMountingHardwarePillarMissing() {
		return berthMountingHardwarePillarMissing;
	}
	public void setBerthMountingHardwarePillarMissing(String berthMountingHardwarePillarMissing) {
		this.berthMountingHardwarePillarMissing = berthMountingHardwarePillarMissing;
	}
	public String getBerthTapper() {
		return berthTapper;
	}
	public void setBerthTapper(String berthTapper) {
		this.berthTapper = berthTapper;
	}
	public String getBerthFlapLoose() {
		return berthFlapLoose;
	}
	public void setBerthFlapLoose(String berthFlapLoose) {
		this.berthFlapLoose = berthFlapLoose;
	}
	public String getBerthFlapBulge() {
		return berthFlapBulge;
	}
	public void setBerthFlapBulge(String berthFlapBulge) {
		this.berthFlapBulge = berthFlapBulge;
	}
	public String getFlapAlStripExcessLength() {
		return flapAlStripExcessLength;
	}
	public void setFlapAlStripExcessLength(String flapAlStripExcessLength) {
		this.flapAlStripExcessLength = flapAlStripExcessLength;
	}
	public String getFlapAlHardwareExcessLength() {
		return flapAlHardwareExcessLength;
	}
	public void setFlapAlHardwareExcessLength(String flapAlHardwareExcessLength) {
		this.flapAlHardwareExcessLength = flapAlHardwareExcessLength;
	}
	public String getTransverseBerthLevel() {
		return transverseBerthLevel;
	}
	public void setTransverseBerthLevel(String transverseBerthLevel) {
		this.transverseBerthLevel = transverseBerthLevel;
	}
	public String getGapBackrestBerth() {
		return gapBackrestBerth;
	}
	public void setGapBackrestBerth(String gapBackrestBerth) {
		this.gapBackrestBerth = gapBackrestBerth;
	}
	public String getBackrestMovement() {
		return backrestMovement;
	}
	public void setBackrestMovement(String backrestMovement) {
		this.backrestMovement = backrestMovement;
	}
	public String getBackrestGrazingLadder() {
		return backrestGrazingLadder;
	}
	public void setBackrestGrazingLadder(String backrestGrazingLadder) {
		this.backrestGrazingLadder = backrestGrazingLadder;
	}
	public String getBackrestGrazingPanelseat() {
		return backrestGrazingPanelseat;
	}
	public void setBackrestGrazingPanelseat(String backrestGrazingPanelseat) {
		this.backrestGrazingPanelseat = backrestGrazingPanelseat;
	}
	public String getLatchCatchMissmatch() {
		return latchCatchMissmatch;
	}
	public void setLatchCatchMissmatch(String latchCatchMissmatch) {
		this.latchCatchMissmatch = latchCatchMissmatch;
	}
	public String getBurrLatchSeat() {
		return burrLatchSeat;
	}
	public void setBurrLatchSeat(String burrLatchSeat) {
		this.burrLatchSeat = burrLatchSeat;
	}
	public String getBurrCatchSeat() {
		return burrCatchSeat;
	}
	public void setBurrCatchSeat(String burrCatchSeat) {
		this.burrCatchSeat = burrCatchSeat;
	}
	public String getHolePartitionLatchSeat() {
		return holePartitionLatchSeat;
	}
	public void setHolePartitionLatchSeat(String holePartitionLatchSeat) {
		this.holePartitionLatchSeat = holePartitionLatchSeat;
	}
	public String getRexineTornBackrestSeat() {
		return rexineTornBackrestSeat;
	}
	public void setRexineTornBackrestSeat(String rexineTornBackrestSeat) {
		this.rexineTornBackrestSeat = rexineTornBackrestSeat;
	}
	public String getRexineTornBerth() {
		return rexineTornBerth;
	}
	public void setRexineTornBerth(String rexineTornBerth) {
		this.rexineTornBerth = rexineTornBerth;
	}
	public String getAlmirahHardwareLoose() {
		return almirahHardwareLoose;
	}
	public void setAlmirahHardwareLoose(String almirahHardwareLoose) {
		this.almirahHardwareLoose = almirahHardwareLoose;
	}
	public String getAlmirahHardwareMissing() {
		return almirahHardwareMissing;
	}
	public void setAlmirahHardwareMissing(String almirahHardwareMissing) {
		this.almirahHardwareMissing = almirahHardwareMissing;
	}
	public String getTowerWorking() {
		return towerWorking;
	}
	public void setTowerWorking(String towerWorking) {
		this.towerWorking = towerWorking;
	}
	public String getAlmirahWorking() {
		return almirahWorking;
	}
	public void setAlmirahWorking(String almirahWorking) {
		this.almirahWorking = almirahWorking;
	}
	public String getAlmirahHole() {
		return almirahHole;
	}
	public void setAlmirahHole(String almirahHole) {
		this.almirahHole = almirahHole;
	}
	public String getHoleNearBottleHolder() {
		return holeNearBottleHolder;
	}
	public void setHoleNearBottleHolder(String holeNearBottleHolder) {
		this.holeNearBottleHolder = holeNearBottleHolder;
	}
	public String getHoleNearLatchSeat() {
		return holeNearLatchSeat;
	}
	public void setHoleNearLatchSeat(String holeNearLatchSeat) {
		this.holeNearLatchSeat = holeNearLatchSeat;
	}
	public String getHoleNearCatchSeat() {
		return holeNearCatchSeat;
	}
	public void setHoleNearCatchSeat(String holeNearCatchSeat) {
		this.holeNearCatchSeat = holeNearCatchSeat;
	}
	public String getRexineTornBerthArmrest() {
		return rexineTornBerthArmrest;
	}
	public void setRexineTornBerthArmrest(String rexineTornBerthArmrest) {
		this.rexineTornBerthArmrest = rexineTornBerthArmrest;
	}
	public String getBuilderPlateScrewMissing() {
		return builderPlateScrewMissing;
	}
	public void setBuilderPlateScrewMissing(String builderPlateScrewMissing) {
		this.builderPlateScrewMissing = builderPlateScrewMissing;
	}
	public String getBuilderPlateScrewMissmatch() {
		return builderPlateScrewMissmatch;
	}
	public void setBuilderPlateScrewMissmatch(String builderPlateScrewMissmatch) {
		this.builderPlateScrewMissmatch = builderPlateScrewMissmatch;
	}
	public String getRexenePastedBacksideBerth() {
		return rexenePastedBacksideBerth;
	}
	public void setRexenePastedBacksideBerth(String rexenePastedBacksideBerth) {
		this.rexenePastedBacksideBerth = rexenePastedBacksideBerth;
	}
	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}
	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}
	
	
}
