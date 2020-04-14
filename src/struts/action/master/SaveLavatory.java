package struts.action.master;
import java.util.Date;

import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciLavatoryTrans;
import beans.QciFPvcTrans;
import hibernateConnect.HibernateConfig;
public class SaveLavatory {
	private String furnishingAssetId;
	private String loroPipeLoose;
	private String loroPipeMissing;
	private String attachmentWailHingeLoose;
	private String attachmentWailHingeMissing;
	private String attachmentWailHingeDent;
	private String attachmentWallTowerScrewMissing;
	private String attachmentWallTowerBoltDamage;
	private String towerBoltFitted;
	private String towerBoltHole;
	private String soapCaseScrewMissing;
	private String soapCaseScrewLoose;
	private String soapCaseScrewTaper;
	private String lavWashBasinSealed;
	private String lavWashBasinOutside;
	private String avWashBasinInside;
	private String lavWashBasinRoughlySealed;
	private String lavWashBasinRoughlyOutside;
	private String lavWashBasinRoughlyInside;
	private String dustbinBoxProvided;
	private String dustbinBoxUnlocked;
	private String dustbinBktLoose;
	private String dustbikBktScrewMissing;
	private String steelDustbinBktLoose;
	private String wasteBinLoose;
	private String wasteBinScrewMissing;
	private String wasteBinScrewDent;
	private String wasteBinCoverPlateRusted;
	private String wasteBinCoverMagnet;
	private String lessScrewWasteBinCover;
	private String lessScrewWasteBinCoverGrazing;
	private String outsideWasteBinLoose;
	private String outsideWasteBinNotTighten;
	private String sleeveScrewMissing;
	private String sleeveScrewLevel;
	private String sleeveScrewSited;
	private String drainPipeLeakage;
	private String drainPipeSealed;
	private String outsideDrainPipeSleeveSited;
	private String loroPipehardwareLoose;
	private String lavatoryDoorPivotLoose;
	private String lavatoryDoorScrewMissing;
	private String lavatoryDoorScrewSited;
	private String lavatoryDoorTaperFitted;
	private String lavatoryDoorTaperSound;
	private String lavatoryDoorFrameCornerSited;
	private String lavatoryDoorFrameCornerGap;
	private String lavatoryDoorHandleLoose;
	private String lavatoryDoorHandleMissing;
	private String coathookLavatoryLoose;
	private String coathookLavatoryMissing;
	private String engageVacantLockWorking;
	private String engageVacantLockMaleFemaleMismatch;
	private String engageVacantLockFemaleLoose;
	private String engageVacantLockFemaleMissing;
	private String engageVacantLockMaleLoose;
	private String engageVacantLockMaleMissing;
	private String swingLockCatchLoose;
	private String swingLockCatchLatch;
	private String swingLockCatchHardwareExcessLength;
	private String swingLockCatchHardwareBurr;
	private String lavatoryDoorCloserScrewTighten;
	private String lavatoryDoorCloserScrewRusted;
	private String lavatoryDoorCloserScrewMovement;
	private String soapDispenserLoose;
	private String soapDispenserTaper;
	private String soapDispenserMissing;
	private String bracketSoapDispenser;
	private String lotahTapStrainerLevel;
	private String lotahTapStrainerSealed;
	private String lotahTapStrainerRoughlySealed;
	private String lotahTapStrainerScrewMissing;
	private String wallHandleCapPasted;
	private String wallHandleScrewLoose;
	private String panLevelFloorLevel;
	private String panLevelFloorLevelRoughlySealed;
	private String washBasinHardwareMissing;
	private String washBasinHardwareTighten;
	private String washBasinHardwareLoose;
	private String dentOnModule;
	private String dentOnHplSheet;
	private String moduleJointNotSealed;
	private String moduleJointRoughlySealed;
	private String commodeHardwareLoose;
	private String commodeHardwareMissing;
	private String plasticFilmRemovedCeilingDoor;
	private String ceilingNotLevel;
	private String ceilingHardwareLoose;
	private String ceilingHardwareDent;
	private String moduleHardwareSidewallLoose;
	private String mirrorHolderLoose;
	private String mirrorHolderTaper;
	private String mirrorHolderApdDone;
	private String hopperWindowFrameSited;
	private String hopperWindowFrameShort;
	private String hopperWindowFrameExcess;
	private String hopperWindowRubberUprooted;
	private String hopperWindowGlassCrack;
	private String conditionLavatoryFloorLevel;
	private String testingObservationRemark;
	
	public String saveData7()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		QciLavatoryTrans qciLavatoryTransSave=new QciLavatoryTrans();
		QciLavatoryTrans qciLavatoryTrans= (QciLavatoryTrans) session.get(QciLavatoryTrans.class, furnishingAssetIdAsInt);
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciLavatoryFlag(1);
		
		
		}
		else
		{
			qciFPvcTransSave.setQciLavatoryFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		if(qciLavatoryTrans!=null){
			
			qciLavatoryTrans.setLoroPipeLoose(loroPipeLoose);
			System.out.println(loroPipeLoose);
			qciLavatoryTrans.setLoroPipeMissing(loroPipeMissing);
			System.out.println(loroPipeMissing);
			qciLavatoryTrans.setAttachmentWailHingeLoose(attachmentWailHingeLoose);
			System.out.println(attachmentWailHingeLoose);
			qciLavatoryTrans.setAttachmentWailHingeMissing(attachmentWailHingeMissing);
			System.out.println(attachmentWailHingeMissing);
			qciLavatoryTrans.setAttachmentWailHingeDent(attachmentWailHingeDent);
			qciLavatoryTrans.setAttachmentWallTowerScrewMissing(attachmentWallTowerScrewMissing);
			qciLavatoryTrans.setAttachmentWallTowerBoltDamage(attachmentWallTowerBoltDamage);
			qciLavatoryTrans.setTowerBoltFitted(towerBoltFitted);
			qciLavatoryTrans.setTowerBoltHole(towerBoltHole);
			qciLavatoryTrans.setSoapCaseScrewMissing(soapCaseScrewMissing);
			qciLavatoryTrans.setSoapCaseScrewLoose(soapCaseScrewLoose);
			qciLavatoryTrans.setSoapCaseScrewTaper(soapCaseScrewTaper);
			qciLavatoryTrans.setLavWashBasinSealed(lavWashBasinSealed);
			qciLavatoryTrans.setLavWashBasinOutside(lavWashBasinOutside);
			qciLavatoryTrans.setAvWashBasinInside(avWashBasinInside);
			qciLavatoryTrans.setLavWashBasinRoughlySealed(lavWashBasinRoughlySealed);
			qciLavatoryTrans.setLavWashBasinRoughlyOutside(lavWashBasinRoughlyOutside);
			qciLavatoryTrans.setLavWashBasinRoughlyInside(lavWashBasinRoughlyInside);
			qciLavatoryTrans.setDustbinBoxProvided(dustbinBoxProvided);
			qciLavatoryTrans.setDustbinBoxUnlocked(dustbinBoxUnlocked);
			qciLavatoryTrans.setDustbinBktLoose(dustbinBktLoose);
			qciLavatoryTrans.setDustbikBktScrewMissing(dustbikBktScrewMissing);
			qciLavatoryTrans.setSteelDustbinBktLoose(steelDustbinBktLoose);
			qciLavatoryTrans.setWasteBinLoose(wasteBinLoose);
			qciLavatoryTrans.setWasteBinScrewMissing(wasteBinScrewMissing);
			qciLavatoryTrans.setWasteBinScrewDent(wasteBinScrewDent);
			qciLavatoryTrans.setWasteBinCoverPlateRusted(wasteBinCoverPlateRusted);
			qciLavatoryTrans.setWasteBinCoverMagnet(wasteBinCoverMagnet);
			qciLavatoryTrans.setLessScrewWasteBinCover(lessScrewWasteBinCover);
			qciLavatoryTrans.setLessScrewWasteBinCoverGrazing(lessScrewWasteBinCoverGrazing);
			qciLavatoryTrans.setOutsideWasteBinLoose(outsideWasteBinLoose);
			qciLavatoryTrans.setOutsideWasteBinNotTighten(outsideWasteBinNotTighten);
			qciLavatoryTrans.setSleeveScrewMissing(sleeveScrewMissing);
			qciLavatoryTrans.setSleeveScrewLevel(sleeveScrewLevel);
			qciLavatoryTrans.setSleeveScrewSited(sleeveScrewSited);
			qciLavatoryTrans.setDrainPipeLeakage(drainPipeLeakage);
			qciLavatoryTrans.setDrainPipeSealed(drainPipeSealed);
			qciLavatoryTrans.setOutsideDrainPipeSleeveSited(outsideDrainPipeSleeveSited);
			qciLavatoryTrans.setLoroPipehardwareLoose(loroPipehardwareLoose);
			qciLavatoryTrans.setLavatoryDoorPivotLoose(lavatoryDoorPivotLoose);
			qciLavatoryTrans.setLavatoryDoorScrewMissing(lavatoryDoorScrewMissing);
			qciLavatoryTrans.setLavatoryDoorScrewSited(lavatoryDoorScrewSited);
			qciLavatoryTrans.setLavatoryDoorTaperFitted(lavatoryDoorTaperFitted);
			qciLavatoryTrans.setLavatoryDoorTaperSound(lavatoryDoorTaperSound);
			qciLavatoryTrans.setLavatoryDoorFrameCornerSited(lavatoryDoorFrameCornerSited);
			qciLavatoryTrans.setLavatoryDoorFrameCornerGap(lavatoryDoorFrameCornerGap);
			qciLavatoryTrans.setLavatoryDoorHandleLoose(lavatoryDoorHandleLoose);
			qciLavatoryTrans.setLavatoryDoorHandleMissing(lavatoryDoorHandleMissing);
			qciLavatoryTrans.setCoathookLavatoryLoose(coathookLavatoryLoose);
			qciLavatoryTrans.setCoathookLavatoryMissing(coathookLavatoryMissing);
			qciLavatoryTrans.setEngageVacantLockWorking(engageVacantLockWorking);
			qciLavatoryTrans.setEngageVacantLockMaleFemaleMismatch(engageVacantLockMaleFemaleMismatch);
			qciLavatoryTrans.setEngageVacantLockFemaleLoose(engageVacantLockFemaleLoose);
			qciLavatoryTrans.setEngageVacantLockFemaleMissing(engageVacantLockFemaleMissing);
			qciLavatoryTrans.setEngageVacantLockMaleLoose(engageVacantLockMaleLoose);
			qciLavatoryTrans.setEngageVacantLockMaleMissing(engageVacantLockMaleMissing);
			qciLavatoryTrans.setSwingLockCatchLoose(swingLockCatchLoose);
			qciLavatoryTrans.setSwingLockCatchLatch(swingLockCatchLatch);
			qciLavatoryTrans.setSwingLockCatchHardwareExcessLength(swingLockCatchHardwareExcessLength);
			qciLavatoryTrans.setSwingLockCatchHardwareBurr(swingLockCatchHardwareBurr);
			qciLavatoryTrans.setLavatoryDoorCloserScrewTighten(lavatoryDoorCloserScrewTighten);
			qciLavatoryTrans.setLavatoryDoorCloserScrewRusted(lavatoryDoorCloserScrewRusted);
			qciLavatoryTrans.setLavatoryDoorCloserScrewMovement(lavatoryDoorCloserScrewMovement);
			qciLavatoryTrans.setSoapDispenserLoose(soapDispenserLoose);
			qciLavatoryTrans.setSoapDispenserTaper(soapDispenserTaper);
			qciLavatoryTrans.setSoapDispenserMissing(soapDispenserMissing);
			qciLavatoryTrans.setBracketSoapDispenser(bracketSoapDispenser);
			qciLavatoryTrans.setLotahTapStrainerLevel(lotahTapStrainerLevel);
			qciLavatoryTrans.setLotahTapStrainerSealed(lotahTapStrainerSealed);
			qciLavatoryTrans.setLotahTapStrainerRoughlySealed(lotahTapStrainerRoughlySealed);
			qciLavatoryTrans.setLotahTapStrainerScrewMissing(lotahTapStrainerScrewMissing);
			qciLavatoryTrans.setWallHandleCapPasted(wallHandleCapPasted);
			qciLavatoryTrans.setWallHandleScrewLoose(wallHandleScrewLoose);
			qciLavatoryTrans.setPanLevelFloorLevel(panLevelFloorLevel);
			qciLavatoryTrans.setPanLevelFloorLevelRoughlySealed(panLevelFloorLevelRoughlySealed);
			qciLavatoryTrans.setWashBasinHardwareMissing(washBasinHardwareMissing);
			qciLavatoryTrans.setWashBasinHardwareTighten(washBasinHardwareTighten);
			qciLavatoryTrans.setWashBasinHardwareLoose(washBasinHardwareLoose);
			qciLavatoryTrans.setDentOnModule(dentOnModule);
			qciLavatoryTrans.setDentOnHplSheet(dentOnHplSheet);
			qciLavatoryTrans.setModuleJointNotSealed(moduleJointNotSealed);
			qciLavatoryTrans.setModuleJointRoughlySealed(moduleJointRoughlySealed);
			qciLavatoryTrans.setCommodeHardwareLoose(commodeHardwareLoose);
			qciLavatoryTrans.setCommodeHardwareMissing(commodeHardwareMissing);
			qciLavatoryTrans.setPlasticFilmRemovedCeilingDoor(plasticFilmRemovedCeilingDoor);
			qciLavatoryTrans.setCeilingNotLevel(ceilingNotLevel);
			qciLavatoryTrans.setCeilingHardwareLoose(ceilingHardwareLoose);
			qciLavatoryTrans.setCeilingHardwareDent(ceilingHardwareDent);
			qciLavatoryTrans.setModuleHardwareSidewallLoose(moduleHardwareSidewallLoose);
			qciLavatoryTrans.setMirrorHolderLoose(mirrorHolderLoose);
			qciLavatoryTrans.setMirrorHolderTaper(mirrorHolderTaper);
			qciLavatoryTrans.setMirrorHolderApdDone(mirrorHolderApdDone);
			qciLavatoryTrans.setHopperWindowFrameSited(hopperWindowFrameSited);
			qciLavatoryTrans.setHopperWindowFrameShort(hopperWindowFrameShort);
			qciLavatoryTrans.setHopperWindowFrameExcess(hopperWindowFrameExcess);
			qciLavatoryTrans.setHopperWindowRubberUprooted(hopperWindowRubberUprooted);
			qciLavatoryTrans.setHopperWindowGlassCrack(hopperWindowGlassCrack);
			qciLavatoryTrans.setConditionLavatoryFloorLevel(conditionLavatoryFloorLevel);
			qciLavatoryTrans.setTestingObservationRemark(testingObservationRemark);
		
		}
		else
		{
			qciLavatoryTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			qciLavatoryTransSave.setLoroPipeLoose(loroPipeLoose);
			System.out.println(loroPipeLoose);
			qciLavatoryTransSave.setLoroPipeMissing(loroPipeMissing);
			System.out.println(loroPipeMissing);
			qciLavatoryTransSave.setAttachmentWailHingeLoose(attachmentWailHingeLoose);
			System.out.println(attachmentWailHingeLoose);
			qciLavatoryTransSave.setAttachmentWailHingeMissing(attachmentWailHingeMissing);
			System.out.println(attachmentWailHingeMissing);
			qciLavatoryTransSave.setAttachmentWailHingeDent(attachmentWailHingeDent);
			qciLavatoryTransSave.setAttachmentWallTowerScrewMissing(attachmentWallTowerScrewMissing);
			qciLavatoryTransSave.setAttachmentWallTowerBoltDamage(attachmentWallTowerBoltDamage);
			qciLavatoryTransSave.setTowerBoltFitted(towerBoltFitted);
			qciLavatoryTransSave.setTowerBoltHole(towerBoltHole);
			qciLavatoryTransSave.setSoapCaseScrewMissing(soapCaseScrewMissing);
			qciLavatoryTransSave.setSoapCaseScrewLoose(soapCaseScrewLoose);
			qciLavatoryTransSave.setSoapCaseScrewTaper(soapCaseScrewTaper);
			qciLavatoryTransSave.setLavWashBasinSealed(lavWashBasinSealed);
			qciLavatoryTransSave.setLavWashBasinOutside(lavWashBasinOutside);
			qciLavatoryTransSave.setAvWashBasinInside(avWashBasinInside);
			qciLavatoryTransSave.setLavWashBasinRoughlySealed(lavWashBasinRoughlySealed);
			qciLavatoryTransSave.setLavWashBasinRoughlyOutside(lavWashBasinRoughlyOutside);
			qciLavatoryTransSave.setLavWashBasinRoughlyInside(lavWashBasinRoughlyInside);
			qciLavatoryTransSave.setDustbinBoxProvided(dustbinBoxProvided);
			qciLavatoryTransSave.setDustbinBoxUnlocked(dustbinBoxUnlocked);
			qciLavatoryTransSave.setDustbinBktLoose(dustbinBktLoose);
			qciLavatoryTransSave.setDustbikBktScrewMissing(dustbikBktScrewMissing);
			qciLavatoryTransSave.setSteelDustbinBktLoose(steelDustbinBktLoose);
			qciLavatoryTransSave.setWasteBinLoose(wasteBinLoose);
			qciLavatoryTransSave.setWasteBinScrewMissing(wasteBinScrewMissing);
			qciLavatoryTransSave.setWasteBinScrewDent(wasteBinScrewDent);
			qciLavatoryTransSave.setWasteBinCoverPlateRusted(wasteBinCoverPlateRusted);
			qciLavatoryTransSave.setWasteBinCoverMagnet(wasteBinCoverMagnet);
			qciLavatoryTransSave.setLessScrewWasteBinCover(lessScrewWasteBinCover);
			qciLavatoryTransSave.setLessScrewWasteBinCoverGrazing(lessScrewWasteBinCoverGrazing);
			qciLavatoryTransSave.setOutsideWasteBinLoose(outsideWasteBinLoose);
			qciLavatoryTransSave.setOutsideWasteBinNotTighten(outsideWasteBinNotTighten);
			qciLavatoryTransSave.setSleeveScrewMissing(sleeveScrewMissing);
			qciLavatoryTransSave.setSleeveScrewLevel(sleeveScrewLevel);
			qciLavatoryTransSave.setSleeveScrewSited(sleeveScrewSited);
			qciLavatoryTransSave.setDrainPipeLeakage(drainPipeLeakage);
			qciLavatoryTransSave.setDrainPipeSealed(drainPipeSealed);
			qciLavatoryTransSave.setOutsideDrainPipeSleeveSited(outsideDrainPipeSleeveSited);
			qciLavatoryTransSave.setLoroPipehardwareLoose(loroPipehardwareLoose);
			qciLavatoryTransSave.setLavatoryDoorPivotLoose(lavatoryDoorPivotLoose);
			qciLavatoryTransSave.setLavatoryDoorScrewMissing(lavatoryDoorScrewMissing);
			qciLavatoryTransSave.setLavatoryDoorScrewSited(lavatoryDoorScrewSited);
			qciLavatoryTransSave.setLavatoryDoorTaperFitted(lavatoryDoorTaperFitted);
			qciLavatoryTransSave.setLavatoryDoorTaperSound(lavatoryDoorTaperSound);
			qciLavatoryTransSave.setLavatoryDoorFrameCornerSited(lavatoryDoorFrameCornerSited);
			qciLavatoryTransSave.setLavatoryDoorFrameCornerGap(lavatoryDoorFrameCornerGap);
			qciLavatoryTransSave.setLavatoryDoorHandleLoose(lavatoryDoorHandleLoose);
			qciLavatoryTransSave.setLavatoryDoorHandleMissing(lavatoryDoorHandleMissing);
			qciLavatoryTransSave.setCoathookLavatoryLoose(coathookLavatoryLoose);
			qciLavatoryTransSave.setCoathookLavatoryMissing(coathookLavatoryMissing);
			qciLavatoryTransSave.setEngageVacantLockWorking(engageVacantLockWorking);
			qciLavatoryTransSave.setEngageVacantLockMaleFemaleMismatch(engageVacantLockMaleFemaleMismatch);
			qciLavatoryTransSave.setEngageVacantLockFemaleLoose(engageVacantLockFemaleLoose);
			qciLavatoryTransSave.setEngageVacantLockFemaleMissing(engageVacantLockFemaleMissing);
			qciLavatoryTransSave.setEngageVacantLockMaleLoose(engageVacantLockMaleLoose);
			qciLavatoryTransSave.setEngageVacantLockMaleMissing(engageVacantLockMaleMissing);
			qciLavatoryTransSave.setSwingLockCatchLoose(swingLockCatchLoose);
			qciLavatoryTransSave.setSwingLockCatchLatch(swingLockCatchLatch);
			qciLavatoryTransSave.setSwingLockCatchHardwareExcessLength(swingLockCatchHardwareExcessLength);
			qciLavatoryTransSave.setSwingLockCatchHardwareBurr(swingLockCatchHardwareBurr);
			qciLavatoryTransSave.setLavatoryDoorCloserScrewTighten(lavatoryDoorCloserScrewTighten);
			qciLavatoryTransSave.setLavatoryDoorCloserScrewRusted(lavatoryDoorCloserScrewRusted);
			qciLavatoryTransSave.setLavatoryDoorCloserScrewMovement(lavatoryDoorCloserScrewMovement);
			qciLavatoryTransSave.setSoapDispenserLoose(soapDispenserLoose);
			qciLavatoryTransSave.setSoapDispenserTaper(soapDispenserTaper);
			qciLavatoryTransSave.setSoapDispenserMissing(soapDispenserMissing);
			qciLavatoryTransSave.setBracketSoapDispenser(bracketSoapDispenser);
			qciLavatoryTransSave.setLotahTapStrainerLevel(lotahTapStrainerLevel);
			qciLavatoryTransSave.setLotahTapStrainerSealed(lotahTapStrainerSealed);
			qciLavatoryTransSave.setLotahTapStrainerRoughlySealed(lotahTapStrainerRoughlySealed);
			qciLavatoryTransSave.setLotahTapStrainerScrewMissing(lotahTapStrainerScrewMissing);
			qciLavatoryTransSave.setWallHandleCapPasted(wallHandleCapPasted);
			qciLavatoryTransSave.setWallHandleScrewLoose(wallHandleScrewLoose);
			qciLavatoryTransSave.setPanLevelFloorLevel(panLevelFloorLevel);
			qciLavatoryTransSave.setPanLevelFloorLevelRoughlySealed(panLevelFloorLevelRoughlySealed);
			qciLavatoryTransSave.setWashBasinHardwareMissing(washBasinHardwareMissing);
			qciLavatoryTransSave.setWashBasinHardwareTighten(washBasinHardwareTighten);
			qciLavatoryTransSave.setWashBasinHardwareLoose(washBasinHardwareLoose);
			qciLavatoryTransSave.setDentOnModule(dentOnModule);
			qciLavatoryTransSave.setDentOnHplSheet(dentOnHplSheet);
			qciLavatoryTransSave.setModuleJointNotSealed(moduleJointNotSealed);
			qciLavatoryTransSave.setModuleJointRoughlySealed(moduleJointRoughlySealed);
			qciLavatoryTransSave.setCommodeHardwareLoose(commodeHardwareLoose);
			qciLavatoryTransSave.setCommodeHardwareMissing(commodeHardwareMissing);
			qciLavatoryTransSave.setPlasticFilmRemovedCeilingDoor(plasticFilmRemovedCeilingDoor);
			qciLavatoryTransSave.setCeilingNotLevel(ceilingNotLevel);
			qciLavatoryTransSave.setCeilingHardwareLoose(ceilingHardwareLoose);
			qciLavatoryTransSave.setCeilingHardwareDent(ceilingHardwareDent);
			qciLavatoryTransSave.setModuleHardwareSidewallLoose(moduleHardwareSidewallLoose);
			qciLavatoryTransSave.setMirrorHolderLoose(mirrorHolderLoose);
			qciLavatoryTransSave.setMirrorHolderTaper(mirrorHolderTaper);
			qciLavatoryTransSave.setMirrorHolderApdDone(mirrorHolderApdDone);
			qciLavatoryTransSave.setHopperWindowFrameSited(hopperWindowFrameSited);
			qciLavatoryTransSave.setHopperWindowFrameShort(hopperWindowFrameShort);
			qciLavatoryTransSave.setHopperWindowFrameExcess(hopperWindowFrameExcess);
			qciLavatoryTransSave.setHopperWindowRubberUprooted(hopperWindowRubberUprooted);
			qciLavatoryTransSave.setHopperWindowGlassCrack(hopperWindowGlassCrack);
			qciLavatoryTransSave.setConditionLavatoryFloorLevel(conditionLavatoryFloorLevel);
			qciLavatoryTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
		
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData7(qciLavatoryTrans, qciFPvcTrans, qciLavatoryTransSave, qciFPvcTransSave);
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

	public String getLoroPipeLoose() {
		return loroPipeLoose;
	}
	public void setLoroPipeLoose(String loroPipeLoose) {
		this.loroPipeLoose = loroPipeLoose;
	}
	public String getLoroPipeMissing() {
		return loroPipeMissing;
	}
	public void setLoroPipeMissing(String loroPipeMissing) {
		this.loroPipeMissing = loroPipeMissing;
	}
	public String getAttachmentWailHingeLoose() {
		return attachmentWailHingeLoose;
	}
	public void setAttachmentWailHingeLoose(String attachmentWailHingeLoose) {
		this.attachmentWailHingeLoose = attachmentWailHingeLoose;
	}
	public String getAttachmentWailHingeMissing() {
		return attachmentWailHingeMissing;
	}
	public void setAttachmentWailHingeMissing(String attachmentWailHingeMissing) {
		this.attachmentWailHingeMissing = attachmentWailHingeMissing;
	}
	public String getAttachmentWailHingeDent() {
		return attachmentWailHingeDent;
	}
	public void setAttachmentWailHingeDent(String attachmentWailHingeDent) {
		this.attachmentWailHingeDent = attachmentWailHingeDent;
	}
	public String getTowerBoltFitted() {
		return towerBoltFitted;
	}
	public void setTowerBoltFitted(String towerBoltFitted) {
		this.towerBoltFitted = towerBoltFitted;
	}
	public String getTowerBoltHole() {
		return towerBoltHole;
	}
	public void setTowerBoltHole(String towerBoltHole) {
		this.towerBoltHole = towerBoltHole;
	}
	public String getSoapCaseScrewMissing() {
		return soapCaseScrewMissing;
	}
	public void setSoapCaseScrewMissing(String soapCaseScrewMissing) {
		this.soapCaseScrewMissing = soapCaseScrewMissing;
	}
	public String getSoapCaseScrewLoose() {
		return soapCaseScrewLoose;
	}
	public void setSoapCaseScrewLoose(String soapCaseScrewLoose) {
		this.soapCaseScrewLoose = soapCaseScrewLoose;
	}
	public String getSoapCaseScrewTaper() {
		return soapCaseScrewTaper;
	}
	public void setSoapCaseScrewTaper(String soapCaseScrewTaper) {
		this.soapCaseScrewTaper = soapCaseScrewTaper;
	}
	public String getLavWashBasinSealed() {
		return lavWashBasinSealed;
	}
	public void setLavWashBasinSealed(String lavWashBasinSealed) {
		this.lavWashBasinSealed = lavWashBasinSealed;
	}
	public String getLavWashBasinOutside() {
		return lavWashBasinOutside;
	}
	public void setLavWashBasinOutside(String lavWashBasinOutside) {
		this.lavWashBasinOutside = lavWashBasinOutside;
	}
	public String getAvWashBasinInside() {
		return avWashBasinInside;
	}
	public void setAvWashBasinInside(String avWashBasinInside) {
		this.avWashBasinInside = avWashBasinInside;
	}
	public String getLavWashBasinRoughlySealed() {
		return lavWashBasinRoughlySealed;
	}
	public void setLavWashBasinRoughlySealed(String lavWashBasinRoughlySealed) {
		this.lavWashBasinRoughlySealed = lavWashBasinRoughlySealed;
	}
	public String getLavWashBasinRoughlyOutside() {
		return lavWashBasinRoughlyOutside;
	}
	public void setLavWashBasinRoughlyOutside(String lavWashBasinRoughlyOutside) {
		this.lavWashBasinRoughlyOutside = lavWashBasinRoughlyOutside;
	}
	public String getLavWashBasinRoughlyInside() {
		return lavWashBasinRoughlyInside;
	}
	public void setLavWashBasinRoughlyInside(String lavWashBasinRoughlyInside) {
		this.lavWashBasinRoughlyInside = lavWashBasinRoughlyInside;
	}
	public String getDustbinBoxProvided() {
		return dustbinBoxProvided;
	}
	public void setDustbinBoxProvided(String dustbinBoxProvided) {
		this.dustbinBoxProvided = dustbinBoxProvided;
	}
	public String getDustbinBoxUnlocked() {
		return dustbinBoxUnlocked;
	}
	public void setDustbinBoxUnlocked(String dustbinBoxUnlocked) {
		this.dustbinBoxUnlocked = dustbinBoxUnlocked;
	}
	public String getDustbinBktLoose() {
		return dustbinBktLoose;
	}
	public void setDustbinBktLoose(String dustbinBktLoose) {
		this.dustbinBktLoose = dustbinBktLoose;
	}
	public String getDustbikBktScrewMissing() {
		return dustbikBktScrewMissing;
	}
	public void setDustbikBktScrewMissing(String dustbikBktScrewMissing) {
		this.dustbikBktScrewMissing = dustbikBktScrewMissing;
	}
	public String getSteelDustbinBktLoose() {
		return steelDustbinBktLoose;
	}
	public void setSteelDustbinBktLoose(String steelDustbinBktLoose) {
		this.steelDustbinBktLoose = steelDustbinBktLoose;
	}
	public String getWasteBinLoose() {
		return wasteBinLoose;
	}
	public void setWasteBinLoose(String wasteBinLoose) {
		this.wasteBinLoose = wasteBinLoose;
	}
	public String getWasteBinScrewMissing() {
		return wasteBinScrewMissing;
	}
	public void setWasteBinScrewMissing(String wasteBinScrewMissing) {
		this.wasteBinScrewMissing = wasteBinScrewMissing;
	}
	public String getWasteBinScrewDent() {
		return wasteBinScrewDent;
	}
	public void setWasteBinScrewDent(String wasteBinScrewDent) {
		this.wasteBinScrewDent = wasteBinScrewDent;
	}
	public String getWasteBinCoverPlateRusted() {
		return wasteBinCoverPlateRusted;
	}
	public void setWasteBinCoverPlateRusted(String wasteBinCoverPlateRusted) {
		this.wasteBinCoverPlateRusted = wasteBinCoverPlateRusted;
	}
	public String getWasteBinCoverMagnet() {
		return wasteBinCoverMagnet;
	}
	public void setWasteBinCoverMagnet(String wasteBinCoverMagnet) {
		this.wasteBinCoverMagnet = wasteBinCoverMagnet;
	}
	public String getLessScrewWasteBinCover() {
		return lessScrewWasteBinCover;
	}
	public void setLessScrewWasteBinCover(String lessScrewWasteBinCover) {
		this.lessScrewWasteBinCover = lessScrewWasteBinCover;
	}
	public String getLessScrewWasteBinCoverGrazing() {
		return lessScrewWasteBinCoverGrazing;
	}
	public void setLessScrewWasteBinCoverGrazing(String lessScrewWasteBinCoverGrazing) {
		this.lessScrewWasteBinCoverGrazing = lessScrewWasteBinCoverGrazing;
	}
	public String getOutsideWasteBinLoose() {
		return outsideWasteBinLoose;
	}
	public void setOutsideWasteBinLoose(String outsideWasteBinLoose) {
		this.outsideWasteBinLoose = outsideWasteBinLoose;
	}
	public String getOutsideWasteBinNotTighten() {
		return outsideWasteBinNotTighten;
	}
	public void setOutsideWasteBinNotTighten(String outsideWasteBinNotTighten) {
		this.outsideWasteBinNotTighten = outsideWasteBinNotTighten;
	}
	public String getSleeveScrewMissing() {
		return sleeveScrewMissing;
	}
	public void setSleeveScrewMissing(String sleeveScrewMissing) {
		this.sleeveScrewMissing = sleeveScrewMissing;
	}
	public String getSleeveScrewLevel() {
		return sleeveScrewLevel;
	}
	public void setSleeveScrewLevel(String sleeveScrewLevel) {
		this.sleeveScrewLevel = sleeveScrewLevel;
	}
	public String getSleeveScrewSited() {
		return sleeveScrewSited;
	}
	public void setSleeveScrewSited(String sleeveScrewSited) {
		this.sleeveScrewSited = sleeveScrewSited;
	}
	public String getDrainPipeLeakage() {
		return drainPipeLeakage;
	}
	public void setDrainPipeLeakage(String drainPipeLeakage) {
		this.drainPipeLeakage = drainPipeLeakage;
	}
	public String getDrainPipeSealed() {
		return drainPipeSealed;
	}
	public void setDrainPipeSealed(String drainPipeSealed) {
		this.drainPipeSealed = drainPipeSealed;
	}
	public String getOutsideDrainPipeSleeveSited() {
		return outsideDrainPipeSleeveSited;
	}
	public void setOutsideDrainPipeSleeveSited(String outsideDrainPipeSleeveSited) {
		this.outsideDrainPipeSleeveSited = outsideDrainPipeSleeveSited;
	}
	public String getLoroPipehardwareLoose() {
		return loroPipehardwareLoose;
	}
	public void setLoroPipehardwareLoose(String loroPipehardwareLoose) {
		this.loroPipehardwareLoose = loroPipehardwareLoose;
	}
	public String getLavatoryDoorTaperFitted() {
		return lavatoryDoorTaperFitted;
	}
	public void setLavatoryDoorTaperFitted(String lavatoryDoorTaperFitted) {
		this.lavatoryDoorTaperFitted = lavatoryDoorTaperFitted;
	}
	public String getLavatoryDoorTaperSound() {
		return lavatoryDoorTaperSound;
	}
	public void setLavatoryDoorTaperSound(String lavatoryDoorTaperSound) {
		this.lavatoryDoorTaperSound = lavatoryDoorTaperSound;
	}
	public String getLavatoryDoorFrameCornerSited() {
		return lavatoryDoorFrameCornerSited;
	}
	public void setLavatoryDoorFrameCornerSited(String lavatoryDoorFrameCornerSited) {
		this.lavatoryDoorFrameCornerSited = lavatoryDoorFrameCornerSited;
	}
	public String getLavatoryDoorFrameCornerGap() {
		return lavatoryDoorFrameCornerGap;
	}
	public void setLavatoryDoorFrameCornerGap(String lavatoryDoorFrameCornerGap) {
		this.lavatoryDoorFrameCornerGap = lavatoryDoorFrameCornerGap;
	}
	public String getLavatoryDoorHandleLoose() {
		return lavatoryDoorHandleLoose;
	}
	public void setLavatoryDoorHandleLoose(String lavatoryDoorHandleLoose) {
		this.lavatoryDoorHandleLoose = lavatoryDoorHandleLoose;
	}
	public String getLavatoryDoorHandleMissing() {
		return lavatoryDoorHandleMissing;
	}
	public void setLavatoryDoorHandleMissing(String lavatoryDoorHandleMissing) {
		this.lavatoryDoorHandleMissing = lavatoryDoorHandleMissing;
	}
	public String getCoathookLavatoryLoose() {
		return coathookLavatoryLoose;
	}
	public void setCoathookLavatoryLoose(String coathookLavatoryLoose) {
		this.coathookLavatoryLoose = coathookLavatoryLoose;
	}
	public String getCoathookLavatoryMissing() {
		return coathookLavatoryMissing;
	}
	public void setCoathookLavatoryMissing(String coathookLavatoryMissing) {
		this.coathookLavatoryMissing = coathookLavatoryMissing;
	}
	public String getEngageVacantLockWorking() {
		return engageVacantLockWorking;
	}
	public void setEngageVacantLockWorking(String engageVacantLockWorking) {
		this.engageVacantLockWorking = engageVacantLockWorking;
	}
	public String getEngageVacantLockMaleFemaleMismatch() {
		return engageVacantLockMaleFemaleMismatch;
	}
	public void setEngageVacantLockMaleFemaleMismatch(String engageVacantLockMaleFemaleMismatch) {
		this.engageVacantLockMaleFemaleMismatch = engageVacantLockMaleFemaleMismatch;
	}
	public String getEngageVacantLockFemaleLoose() {
		return engageVacantLockFemaleLoose;
	}
	public void setEngageVacantLockFemaleLoose(String engageVacantLockFemaleLoose) {
		this.engageVacantLockFemaleLoose = engageVacantLockFemaleLoose;
	}
	public String getEngageVacantLockFemaleMissing() {
		return engageVacantLockFemaleMissing;
	}
	public void setEngageVacantLockFemaleMissing(String engageVacantLockFemaleMissing) {
		this.engageVacantLockFemaleMissing = engageVacantLockFemaleMissing;
	}
	public String getEngageVacantLockMaleLoose() {
		return engageVacantLockMaleLoose;
	}
	public void setEngageVacantLockMaleLoose(String engageVacantLockMaleLoose) {
		this.engageVacantLockMaleLoose = engageVacantLockMaleLoose;
	}
	public String getEngageVacantLockMaleMissing() {
		return engageVacantLockMaleMissing;
	}
	public void setEngageVacantLockMaleMissing(String engageVacantLockMaleMissing) {
		this.engageVacantLockMaleMissing = engageVacantLockMaleMissing;
	}
	public String getSwingLockCatchLoose() {
		return swingLockCatchLoose;
	}
	public void setSwingLockCatchLoose(String swingLockCatchLoose) {
		this.swingLockCatchLoose = swingLockCatchLoose;
	}
	public String getSwingLockCatchLatch() {
		return swingLockCatchLatch;
	}
	public void setSwingLockCatchLatch(String swingLockCatchLatch) {
		this.swingLockCatchLatch = swingLockCatchLatch;
	}
	public String getSwingLockCatchHardwareExcessLength() {
		return swingLockCatchHardwareExcessLength;
	}
	public void setSwingLockCatchHardwareExcessLength(String swingLockCatchHardwareExcessLength) {
		this.swingLockCatchHardwareExcessLength = swingLockCatchHardwareExcessLength;
	}
	public String getSwingLockCatchHardwareBurr() {
		return swingLockCatchHardwareBurr;
	}
	public void setSwingLockCatchHardwareBurr(String swingLockCatchHardwareBurr) {
		this.swingLockCatchHardwareBurr = swingLockCatchHardwareBurr;
	}
	public String getLavatoryDoorCloserScrewTighten() {
		return lavatoryDoorCloserScrewTighten;
	}
	public void setLavatoryDoorCloserScrewTighten(String lavatoryDoorCloserScrewTighten) {
		this.lavatoryDoorCloserScrewTighten = lavatoryDoorCloserScrewTighten;
	}
	public String getLavatoryDoorCloserScrewRusted() {
		return lavatoryDoorCloserScrewRusted;
	}
	public void setLavatoryDoorCloserScrewRusted(String lavatoryDoorCloserScrewRusted) {
		this.lavatoryDoorCloserScrewRusted = lavatoryDoorCloserScrewRusted;
	}
	public String getLavatoryDoorCloserScrewMovement() {
		return lavatoryDoorCloserScrewMovement;
	}
	public void setLavatoryDoorCloserScrewMovement(String lavatoryDoorCloserScrewMovement) {
		this.lavatoryDoorCloserScrewMovement = lavatoryDoorCloserScrewMovement;
	}
	public String getSoapDispenserLoose() {
		return soapDispenserLoose;
	}
	public void setSoapDispenserLoose(String soapDispenserLoose) {
		this.soapDispenserLoose = soapDispenserLoose;
	}
	public String getSoapDispenserTaper() {
		return soapDispenserTaper;
	}
	public void setSoapDispenserTaper(String soapDispenserTaper) {
		this.soapDispenserTaper = soapDispenserTaper;
	}
	public String getSoapDispenserMissing() {
		return soapDispenserMissing;
	}
	public void setSoapDispenserMissing(String soapDispenserMissing) {
		this.soapDispenserMissing = soapDispenserMissing;
	}
	public String getBracketSoapDispenser() {
		return bracketSoapDispenser;
	}
	public void setBracketSoapDispenser(String bracketSoapDispenser) {
		this.bracketSoapDispenser = bracketSoapDispenser;
	}
	public String getLotahTapStrainerLevel() {
		return lotahTapStrainerLevel;
	}
	public void setLotahTapStrainerLevel(String lotahTapStrainerLevel) {
		this.lotahTapStrainerLevel = lotahTapStrainerLevel;
	}
	public String getLotahTapStrainerSealed() {
		return lotahTapStrainerSealed;
	}
	public void setLotahTapStrainerSealed(String lotahTapStrainerSealed) {
		this.lotahTapStrainerSealed = lotahTapStrainerSealed;
	}
	public String getLotahTapStrainerRoughlySealed() {
		return lotahTapStrainerRoughlySealed;
	}
	public void setLotahTapStrainerRoughlySealed(String lotahTapStrainerRoughlySealed) {
		this.lotahTapStrainerRoughlySealed = lotahTapStrainerRoughlySealed;
	}
	public String getLotahTapStrainerScrewMissing() {
		return lotahTapStrainerScrewMissing;
	}
	public void setLotahTapStrainerScrewMissing(String lotahTapStrainerScrewMissing) {
		this.lotahTapStrainerScrewMissing = lotahTapStrainerScrewMissing;
	}
	public String getWallHandleCapPasted() {
		return wallHandleCapPasted;
	}
	public void setWallHandleCapPasted(String wallHandleCapPasted) {
		this.wallHandleCapPasted = wallHandleCapPasted;
	}
	public String getWallHandleScrewLoose() {
		return wallHandleScrewLoose;
	}
	public void setWallHandleScrewLoose(String wallHandleScrewLoose) {
		this.wallHandleScrewLoose = wallHandleScrewLoose;
	}
	public String getPanLevelFloorLevel() {
		return panLevelFloorLevel;
	}
	public void setPanLevelFloorLevel(String panLevelFloorLevel) {
		this.panLevelFloorLevel = panLevelFloorLevel;
	}
	public String getPanLevelFloorLevelRoughlySealed() {
		return panLevelFloorLevelRoughlySealed;
	}
	public void setPanLevelFloorLevelRoughlySealed(String panLevelFloorLevelRoughlySealed) {
		this.panLevelFloorLevelRoughlySealed = panLevelFloorLevelRoughlySealed;
	}
	public String getWashBasinHardwareMissing() {
		return washBasinHardwareMissing;
	}
	public void setWashBasinHardwareMissing(String washBasinHardwareMissing) {
		this.washBasinHardwareMissing = washBasinHardwareMissing;
	}
	public String getWashBasinHardwareTighten() {
		return washBasinHardwareTighten;
	}
	public void setWashBasinHardwareTighten(String washBasinHardwareTighten) {
		this.washBasinHardwareTighten = washBasinHardwareTighten;
	}
	public String getWashBasinHardwareLoose() {
		return washBasinHardwareLoose;
	}
	public void setWashBasinHardwareLoose(String washBasinHardwareLoose) {
		this.washBasinHardwareLoose = washBasinHardwareLoose;
	}
	public String getDentOnModule() {
		return dentOnModule;
	}
	public void setDentOnModule(String dentOnModule) {
		this.dentOnModule = dentOnModule;
	}
	public String getDentOnHplSheet() {
		return dentOnHplSheet;
	}
	public void setDentOnHplSheet(String dentOnHplSheet) {
		this.dentOnHplSheet = dentOnHplSheet;
	}
	public String getModuleJointNotSealed() {
		return moduleJointNotSealed;
	}
	public void setModuleJointNotSealed(String moduleJointNotSealed) {
		this.moduleJointNotSealed = moduleJointNotSealed;
	}
	public String getModuleJointRoughlySealed() {
		return moduleJointRoughlySealed;
	}
	public void setModuleJointRoughlySealed(String moduleJointRoughlySealed) {
		this.moduleJointRoughlySealed = moduleJointRoughlySealed;
	}
	public String getCommodeHardwareLoose() {
		return commodeHardwareLoose;
	}
	public void setCommodeHardwareLoose(String commodeHardwareLoose) {
		this.commodeHardwareLoose = commodeHardwareLoose;
	}
	public String getCommodeHardwareMissing() {
		return commodeHardwareMissing;
	}
	public void setCommodeHardwareMissing(String commodeHardwareMissing) {
		this.commodeHardwareMissing = commodeHardwareMissing;
	}
	public String getPlasticFilmRemovedCeilingDoor() {
		return plasticFilmRemovedCeilingDoor;
	}
	public void setPlasticFilmRemovedCeilingDoor(String plasticFilmRemovedCeilingDoor) {
		this.plasticFilmRemovedCeilingDoor = plasticFilmRemovedCeilingDoor;
	}
	public String getCeilingNotLevel() {
		return ceilingNotLevel;
	}
	public void setCeilingNotLevel(String ceilingNotLevel) {
		this.ceilingNotLevel = ceilingNotLevel;
	}
	public String getCeilingHardwareLoose() {
		return ceilingHardwareLoose;
	}
	public void setCeilingHardwareLoose(String ceilingHardwareLoose) {
		this.ceilingHardwareLoose = ceilingHardwareLoose;
	}
	public String getCeilingHardwareDent() {
		return ceilingHardwareDent;
	}
	public void setCeilingHardwareDent(String ceilingHardwareDent) {
		this.ceilingHardwareDent = ceilingHardwareDent;
	}
	public String getModuleHardwareSidewallLoose() {
		return moduleHardwareSidewallLoose;
	}
	public void setModuleHardwareSidewallLoose(String moduleHardwareSidewallLoose) {
		this.moduleHardwareSidewallLoose = moduleHardwareSidewallLoose;
	}
	public String getMirrorHolderLoose() {
		return mirrorHolderLoose;
	}
	public void setMirrorHolderLoose(String mirrorHolderLoose) {
		this.mirrorHolderLoose = mirrorHolderLoose;
	}
	public String getMirrorHolderTaper() {
		return mirrorHolderTaper;
	}
	public void setMirrorHolderTaper(String mirrorHolderTaper) {
		this.mirrorHolderTaper = mirrorHolderTaper;
	}
	public String getMirrorHolderApdDone() {
		return mirrorHolderApdDone;
	}
	public void setMirrorHolderApdDone(String mirrorHolderApdDone) {
		this.mirrorHolderApdDone = mirrorHolderApdDone;
	}
	public String getHopperWindowFrameSited() {
		return hopperWindowFrameSited;
	}
	public void setHopperWindowFrameSited(String hopperWindowFrameSited) {
		this.hopperWindowFrameSited = hopperWindowFrameSited;
	}
	public String getHopperWindowFrameShort() {
		return hopperWindowFrameShort;
	}
	public void setHopperWindowFrameShort(String hopperWindowFrameShort) {
		this.hopperWindowFrameShort = hopperWindowFrameShort;
	}
	public String getHopperWindowFrameExcess() {
		return hopperWindowFrameExcess;
	}
	public void setHopperWindowFrameExcess(String hopperWindowFrameExcess) {
		this.hopperWindowFrameExcess = hopperWindowFrameExcess;
	}
	public String getHopperWindowRubberUprooted() {
		return hopperWindowRubberUprooted;
	}
	public void setHopperWindowRubberUprooted(String hopperWindowRubberUprooted) {
		this.hopperWindowRubberUprooted = hopperWindowRubberUprooted;
	}
	public String getHopperWindowGlassCrack() {
		return hopperWindowGlassCrack;
	}
	public void setHopperWindowGlassCrack(String hopperWindowGlassCrack) {
		this.hopperWindowGlassCrack = hopperWindowGlassCrack;
	}
	public String getConditionLavatoryFloorLevel() {
		return conditionLavatoryFloorLevel;
	}
	public void setConditionLavatoryFloorLevel(String conditionLavatoryFloorLevel) {
		this.conditionLavatoryFloorLevel = conditionLavatoryFloorLevel;
	}
	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}
	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}

	public String getAttachmentWallTowerScrewMissing() {
		return attachmentWallTowerScrewMissing;
	}

	public void setAttachmentWallTowerScrewMissing(String attachmentWallTowerScrewMissing) {
		this.attachmentWallTowerScrewMissing = attachmentWallTowerScrewMissing;
	}

	public String getAttachmentWallTowerBoltDamage() {
		return attachmentWallTowerBoltDamage;
	}

	public void setAttachmentWallTowerBoltDamage(String attachmentWallTowerBoltDamage) {
		this.attachmentWallTowerBoltDamage = attachmentWallTowerBoltDamage;
	}

	public String getLavatoryDoorPivotLoose() {
		return lavatoryDoorPivotLoose;
	}

	public void setLavatoryDoorPivotLoose(String lavatoryDoorPivotLoose) {
		this.lavatoryDoorPivotLoose = lavatoryDoorPivotLoose;
	}

	public String getLavatoryDoorScrewMissing() {
		return lavatoryDoorScrewMissing;
	}

	public void setLavatoryDoorScrewMissing(String lavatoryDoorScrewMissing) {
		this.lavatoryDoorScrewMissing = lavatoryDoorScrewMissing;
	}

	public String getLavatoryDoorScrewSited() {
		return lavatoryDoorScrewSited;
	}

	public void setLavatoryDoorScrewSited(String lavatoryDoorScrewSited) {
		this.lavatoryDoorScrewSited = lavatoryDoorScrewSited;
	}
	
}
