package struts.action.master;
import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciMouldingTrans;
import beans.FurnishingTransaction;
import beans.QciFPvcTrans;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveMoulding {
	private String furnishingAssetId;
	private String endwallDoorCoverLoose;
	private String endwallDoorCoverMissing;
	private String endwallDoorCoverTighten;
	private String endwallDoorSliding;
	private String endwallRailscrewMissing;
	private String endwallLoose;
	private String endwallDoorlockAlign;
	private String endwallDoorlockBracketLoose;
	private String manualHandleMovementHard;
	private String manualHandleMovementLoose;
	private String manualHandleRusted;
	private String entranceDoorMovement;
	private String entranceDoorPivotLoose;
	private String entranceDoorPivotScrewSited;
	private String entranceDoorLockWorking;
	private String entranceDoorLatchMismatch;
	private String entranceDoorBottomExcessLength;
	private String entranceDoorGrazingChequerSheet;
	private String entranceDoorGrazingRubber;
	private String excessPlayEntranceDoorPivot;
	private String horizontalSteelStripScrewTighten;
	private String horizontalSteelStripScrewMissing;
	private String horizontalSteelStripScrewHole;
	private String verticalSteelStripScrewTighten;
	private String verticalSteelStripScrewMissing;
	private String verticalSteelStripScrewHole;
	private String horizontalVerticalRubberPasted;
	private String tilliPanelLooseFitted;
	private String tilliPanelBulge;
	private String tilliPanelHole;
	private String verticalFrpLooseFitted;
	private String verticalFrpScrewMissing;
	private String verticalFrpHole;
	private String verticalFrpScrewTighten;
	private String horizontalFrpLooseFitted;
	private String horizontalFrpScrewMissing;
	private String horizontalFrpHole;
	private String horizontalFrpScrewTighten;
	private String verticalfrpHorizontalfrpJointMismatch;
	private String horizontalVerticalFrpEdgeUneven;
	private String horizontalVerticalFrpPutty;
	private String gapSelfPartition;
	private String flapDoorMovementHard;
	private String ZMemberHardwareMissing;
	private String ZMemberHardwareBurr;
	private String linenRoomDoorScrewLoose;
	private String linenRoomBinjoScrewMissing;
	private String linenRoomBinjoScrewLoose;
	private String linenRoomHaspStapleMissing;
	private String compartmentDoorframeSited;
	private String compartmentDoorhingeScrewLoose;
	private String compartmentDoorhingeScrewMissing;
	private String compartmentDoorbrushMissing;
	private String compartmentDoorstopperWorking;
	private String compartmentDoorgrazing;
	private String properFitmentEndwallSaloondoor;
	private String maxOpeningForceEndwallSaloondoor;
	private String movementSlidingdoor;
	private String testingObservationRemark;
	
	public String saveData5()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		QciMouldingTrans qciMouldingTransSave=new QciMouldingTrans();
		QciMouldingTrans qciMouldingTrans= (QciMouldingTrans) session.get(QciMouldingTrans.class, furnishingAssetIdAsInt);
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciMouldingFlag(1);
		
		
		}
		else
		{
			
			qciFPvcTransSave.setQciMouldingFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		
		if(qciMouldingTrans!=null){
			qciMouldingTrans.setEndwallDoorCoverLoose(endwallDoorCoverLoose);
			System.out.println(endwallDoorCoverLoose);
			qciMouldingTrans.setEndwallDoorCoverMissing(endwallDoorCoverMissing);
			System.out.println(endwallDoorCoverMissing);
			qciMouldingTrans.setEndwallDoorCoverTighten(endwallDoorCoverTighten);
			System.out.println(endwallDoorCoverTighten);
			qciMouldingTrans.setEndwallDoorSliding(endwallDoorSliding);
			System.out.println(endwallDoorSliding);
			qciMouldingTrans.setEndwallRailscrewMissing(endwallRailscrewMissing);
			qciMouldingTrans.setEndwallLoose(endwallLoose);
			qciMouldingTrans.setEndwallDoorlockAlign(endwallDoorlockAlign);
			qciMouldingTrans.setEndwallDoorlockBracketLoose(endwallDoorlockBracketLoose);
			qciMouldingTrans.setManualHandleMovementHard(manualHandleMovementHard);
			qciMouldingTrans.setManualHandleMovementLoose(manualHandleMovementLoose);
			qciMouldingTrans.setManualHandleRusted(manualHandleRusted);
			qciMouldingTrans.setEntranceDoorMovement(entranceDoorMovement);
			qciMouldingTrans.setEntranceDoorPivotLoose(entranceDoorPivotLoose);
			qciMouldingTrans.setEntranceDoorPivotScrewSited(entranceDoorPivotScrewSited);
			qciMouldingTrans.setEntranceDoorLockWorking(entranceDoorLockWorking);
			qciMouldingTrans.setEntranceDoorLatchMismatch(entranceDoorLatchMismatch);
			qciMouldingTrans.setEntranceDoorBottomExcessLength(entranceDoorBottomExcessLength);
			qciMouldingTrans.setEntranceDoorGrazingChequerSheet(entranceDoorGrazingChequerSheet);
			qciMouldingTrans.setEntranceDoorGrazingRubber(entranceDoorGrazingRubber);
			qciMouldingTrans.setExcessPlayEntranceDoorPivot(excessPlayEntranceDoorPivot);
			qciMouldingTrans.setHorizontalSteelStripScrewTighten(horizontalSteelStripScrewTighten);
			qciMouldingTrans.setHorizontalSteelStripScrewMissing(horizontalSteelStripScrewMissing);
			qciMouldingTrans.setHorizontalSteelStripScrewHole(horizontalSteelStripScrewHole);
			qciMouldingTrans.setVerticalSteelStripScrewTighten(verticalSteelStripScrewTighten);
			qciMouldingTrans.setVerticalSteelStripScrewMissing(verticalSteelStripScrewMissing);
			qciMouldingTrans.setVerticalSteelStripScrewHole(verticalSteelStripScrewHole);
			qciMouldingTrans.setHorizontalVerticalRubberPasted(horizontalVerticalRubberPasted);
			qciMouldingTrans.setTilliPanelLooseFitted(tilliPanelLooseFitted);
			qciMouldingTrans.setTilliPanelBulge(tilliPanelBulge);
			qciMouldingTrans.setTilliPanelHole(tilliPanelHole);
			qciMouldingTrans.setVerticalFrpLooseFitted(verticalFrpLooseFitted);
			qciMouldingTrans.setVerticalFrpScrewMissing(verticalFrpScrewMissing);
			qciMouldingTrans.setVerticalFrpHole(verticalFrpHole);
			qciMouldingTrans.setVerticalFrpScrewTighten(verticalFrpScrewTighten);
			qciMouldingTrans.setHorizontalFrpLooseFitted(horizontalFrpLooseFitted);
			qciMouldingTrans.setHorizontalFrpScrewMissing(horizontalFrpScrewMissing);
			qciMouldingTrans.setHorizontalFrpHole(horizontalFrpHole);
			qciMouldingTrans.setHorizontalFrpScrewTighten(horizontalFrpScrewTighten);
			qciMouldingTrans.setVerticalfrpHorizontalfrpJointMismatch(verticalfrpHorizontalfrpJointMismatch);
			qciMouldingTrans.setHorizontalVerticalFrpEdgeUneven(horizontalVerticalFrpEdgeUneven);
			qciMouldingTrans.setHorizontalVerticalFrpPutty(horizontalVerticalFrpPutty);
			qciMouldingTrans.setGapSelfPartition(gapSelfPartition);
			qciMouldingTrans.setFlapDoorMovementHard(flapDoorMovementHard);
			qciMouldingTrans.setZMemberHardwareMissing(ZMemberHardwareMissing);
			qciMouldingTrans.setZMemberHardwareBurr(ZMemberHardwareBurr);
			qciMouldingTrans.setLinenRoomDoorScrewLoose(linenRoomDoorScrewLoose);
			qciMouldingTrans.setLinenRoomBinjoScrewMissing(linenRoomBinjoScrewMissing);
			qciMouldingTrans.setLinenRoomBinjoScrewLoose(linenRoomBinjoScrewLoose);
			qciMouldingTrans.setLinenRoomHaspStapleMissing(linenRoomHaspStapleMissing);
			qciMouldingTrans.setCompartmentDoorframeSited(compartmentDoorframeSited);
			qciMouldingTrans.setCompartmentDoorhingeScrewLoose(compartmentDoorhingeScrewLoose);
			qciMouldingTrans.setCompartmentDoorhingeScrewMissing(compartmentDoorhingeScrewMissing);
			qciMouldingTrans.setCompartmentDoorbrushMissing(compartmentDoorbrushMissing);
			qciMouldingTrans.setCompartmentDoorstopperWorking(compartmentDoorstopperWorking);
			qciMouldingTrans.setCompartmentDoorgrazing(compartmentDoorgrazing);
			qciMouldingTrans.setProperFitmentEndwallSaloondoor(properFitmentEndwallSaloondoor);
			qciMouldingTrans.setMaxOpeningForceEndwallSaloondoor(maxOpeningForceEndwallSaloondoor);
			qciMouldingTrans.setMovementSlidingdoor(movementSlidingdoor);
			qciMouldingTrans.setTestingObservationRemark(testingObservationRemark);
		
		}
		else
		{
			qciMouldingTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			qciMouldingTransSave.setEndwallDoorCoverLoose(endwallDoorCoverLoose);
			System.out.println(endwallDoorCoverLoose);
			qciMouldingTransSave.setEndwallDoorCoverMissing(endwallDoorCoverMissing);
			System.out.println(endwallDoorCoverMissing);
			qciMouldingTransSave.setEndwallDoorCoverTighten(endwallDoorCoverTighten);
			System.out.println(endwallDoorCoverTighten);
			qciMouldingTransSave.setEndwallDoorSliding(endwallDoorSliding);
			System.out.println(endwallDoorSliding);
			qciMouldingTransSave.setEndwallRailscrewMissing(endwallRailscrewMissing);
			qciMouldingTransSave.setEndwallLoose(endwallLoose);
			qciMouldingTransSave.setEndwallDoorlockAlign(endwallDoorlockAlign);
			qciMouldingTransSave.setEndwallDoorlockBracketLoose(endwallDoorlockBracketLoose);
			qciMouldingTransSave.setManualHandleMovementHard(manualHandleMovementHard);
			qciMouldingTransSave.setManualHandleMovementLoose(manualHandleMovementLoose);
			qciMouldingTransSave.setManualHandleRusted(manualHandleRusted);
			qciMouldingTransSave.setEntranceDoorMovement(entranceDoorMovement);
			qciMouldingTransSave.setEntranceDoorPivotLoose(entranceDoorPivotLoose);
			qciMouldingTransSave.setEntranceDoorPivotScrewSited(entranceDoorPivotScrewSited);
			qciMouldingTransSave.setEntranceDoorLockWorking(entranceDoorLockWorking);
			qciMouldingTransSave.setEntranceDoorLatchMismatch(entranceDoorLatchMismatch);
			qciMouldingTransSave.setEntranceDoorBottomExcessLength(entranceDoorBottomExcessLength);
			qciMouldingTransSave.setEntranceDoorGrazingChequerSheet(entranceDoorGrazingChequerSheet);
			qciMouldingTransSave.setEntranceDoorGrazingRubber(entranceDoorGrazingRubber);
			qciMouldingTransSave.setExcessPlayEntranceDoorPivot(excessPlayEntranceDoorPivot);
			qciMouldingTransSave.setHorizontalSteelStripScrewTighten(horizontalSteelStripScrewTighten);
			qciMouldingTransSave.setHorizontalSteelStripScrewMissing(horizontalSteelStripScrewMissing);
			qciMouldingTransSave.setHorizontalSteelStripScrewHole(horizontalSteelStripScrewHole);
			qciMouldingTransSave.setVerticalSteelStripScrewTighten(verticalSteelStripScrewTighten);
			qciMouldingTransSave.setVerticalSteelStripScrewMissing(verticalSteelStripScrewMissing);
			qciMouldingTransSave.setVerticalSteelStripScrewHole(verticalSteelStripScrewHole);
			qciMouldingTransSave.setHorizontalVerticalRubberPasted(horizontalVerticalRubberPasted);
			qciMouldingTransSave.setTilliPanelLooseFitted(tilliPanelLooseFitted);
			qciMouldingTransSave.setTilliPanelBulge(tilliPanelBulge);
			qciMouldingTransSave.setTilliPanelHole(tilliPanelHole);
			qciMouldingTransSave.setVerticalFrpLooseFitted(verticalFrpLooseFitted);
			qciMouldingTransSave.setVerticalFrpScrewMissing(verticalFrpScrewMissing);
			qciMouldingTransSave.setVerticalFrpHole(verticalFrpHole);
			qciMouldingTransSave.setVerticalFrpScrewTighten(verticalFrpScrewTighten);
			qciMouldingTransSave.setHorizontalFrpLooseFitted(horizontalFrpLooseFitted);
			qciMouldingTransSave.setHorizontalFrpScrewMissing(horizontalFrpScrewMissing);
			qciMouldingTransSave.setHorizontalFrpHole(horizontalFrpHole);
			qciMouldingTransSave.setHorizontalFrpScrewTighten(horizontalFrpScrewTighten);
			qciMouldingTransSave.setVerticalfrpHorizontalfrpJointMismatch(verticalfrpHorizontalfrpJointMismatch);
			qciMouldingTransSave.setHorizontalVerticalFrpEdgeUneven(horizontalVerticalFrpEdgeUneven);
			qciMouldingTransSave.setHorizontalVerticalFrpPutty(horizontalVerticalFrpPutty);
			qciMouldingTransSave.setGapSelfPartition(gapSelfPartition);
			qciMouldingTransSave.setFlapDoorMovementHard(flapDoorMovementHard);
			qciMouldingTransSave.setZMemberHardwareMissing(ZMemberHardwareMissing);
			qciMouldingTransSave.setZMemberHardwareBurr(ZMemberHardwareBurr);
			qciMouldingTransSave.setLinenRoomDoorScrewLoose(linenRoomDoorScrewLoose);
			qciMouldingTransSave.setLinenRoomBinjoScrewMissing(linenRoomBinjoScrewMissing);
			qciMouldingTransSave.setLinenRoomBinjoScrewLoose(linenRoomBinjoScrewLoose);
			qciMouldingTransSave.setLinenRoomHaspStapleMissing(linenRoomHaspStapleMissing);
			qciMouldingTransSave.setCompartmentDoorframeSited(compartmentDoorframeSited);
			qciMouldingTransSave.setCompartmentDoorhingeScrewLoose(compartmentDoorhingeScrewLoose);
			qciMouldingTransSave.setCompartmentDoorhingeScrewMissing(compartmentDoorhingeScrewMissing);
			qciMouldingTransSave.setCompartmentDoorbrushMissing(compartmentDoorbrushMissing);
			qciMouldingTransSave.setCompartmentDoorstopperWorking(compartmentDoorstopperWorking);
			qciMouldingTransSave.setCompartmentDoorgrazing(compartmentDoorgrazing);
			qciMouldingTransSave.setProperFitmentEndwallSaloondoor(properFitmentEndwallSaloondoor);
			qciMouldingTransSave.setMaxOpeningForceEndwallSaloondoor(maxOpeningForceEndwallSaloondoor);
			qciMouldingTransSave.setMovementSlidingdoor(movementSlidingdoor);
			qciMouldingTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
		
		
		
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData5(qciMouldingTrans, qciFPvcTrans, qciMouldingTransSave, qciFPvcTransSave);
				System.out.println();
				System.out.println();
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
	public String getEndwallDoorCoverLoose() {
		return endwallDoorCoverLoose;
	}
	public void setEndwallDoorCoverLoose(String endwallDoorCoverLoose) {
		this.endwallDoorCoverLoose = endwallDoorCoverLoose;
	}
	public String getEndwallDoorCoverMissing() {
		return endwallDoorCoverMissing;
	}
	public void setEndwallDoorCoverMissing(String endwallDoorCoverMissing) {
		this.endwallDoorCoverMissing = endwallDoorCoverMissing;
	}
	public String getEndwallDoorCoverTighten() {
		return endwallDoorCoverTighten;
	}
	public void setEndwallDoorCoverTighten(String endwallDoorCoverTighten) {
		this.endwallDoorCoverTighten = endwallDoorCoverTighten;
	}
	public String getEndwallDoorSliding() {
		return endwallDoorSliding;
	}
	public void setEndwallDoorSliding(String endwallDoorSliding) {
		this.endwallDoorSliding = endwallDoorSliding;
	}
	public String getEndwallRailscrewMissing() {
		return endwallRailscrewMissing;
	}
	public void setEndwallRailscrewMissing(String endwallRailscrewMissing) {
		this.endwallRailscrewMissing = endwallRailscrewMissing;
	}
	public String getEndwallLoose() {
		return endwallLoose;
	}

	public void setEndwallLoose(String endwallLoose) {
		this.endwallLoose = endwallLoose;
	}

	public String getEndwallDoorlockAlign() {
		return endwallDoorlockAlign;
	}
	public void setEndwallDoorlockAlign(String endwallDoorlockAlign) {
		this.endwallDoorlockAlign = endwallDoorlockAlign;
	}
	public String getEndwallDoorlockBracketLoose() {
		return endwallDoorlockBracketLoose;
	}
	public void setEndwallDoorlockBracketLoose(String endwallDoorlockBracketLoose) {
		this.endwallDoorlockBracketLoose = endwallDoorlockBracketLoose;
	}
	public String getManualHandleMovementHard() {
		return manualHandleMovementHard;
	}
	public void setManualHandleMovementHard(String manualHandleMovementHard) {
		this.manualHandleMovementHard = manualHandleMovementHard;
	}
	public String getManualHandleMovementLoose() {
		return manualHandleMovementLoose;
	}
	public void setManualHandleMovementLoose(String manualHandleMovementLoose) {
		this.manualHandleMovementLoose = manualHandleMovementLoose;
	}
	public String getManualHandleRusted() {
		return manualHandleRusted;
	}
	public void setManualHandleRusted(String manualHandleRusted) {
		this.manualHandleRusted = manualHandleRusted;
	}
	public String getEntranceDoorMovement() {
		return entranceDoorMovement;
	}
	public void setEntranceDoorMovement(String entranceDoorMovement) {
		this.entranceDoorMovement = entranceDoorMovement;
	}
	public String getEntranceDoorPivotLoose() {
		return entranceDoorPivotLoose;
	}
	public void setEntranceDoorPivotLoose(String entranceDoorPivotLoose) {
		this.entranceDoorPivotLoose = entranceDoorPivotLoose;
	}
	public String getEntranceDoorPivotScrewSited() {
		return entranceDoorPivotScrewSited;
	}
	public void setEntranceDoorPivotScrewSited(String entranceDoorPivotScrewSited) {
		this.entranceDoorPivotScrewSited = entranceDoorPivotScrewSited;
	}
	public String getEntranceDoorLockWorking() {
		return entranceDoorLockWorking;
	}
	public void setEntranceDoorLockWorking(String entranceDoorLockWorking) {
		this.entranceDoorLockWorking = entranceDoorLockWorking;
	}
	public String getEntranceDoorLatchMismatch() {
		return entranceDoorLatchMismatch;
	}
	public void setEntranceDoorLatchMismatch(String entranceDoorLatchMismatch) {
		this.entranceDoorLatchMismatch = entranceDoorLatchMismatch;
	}
	public String getEntranceDoorBottomExcessLength() {
		return entranceDoorBottomExcessLength;
	}
	public void setEntranceDoorBottomExcessLength(String entranceDoorBottomExcessLength) {
		this.entranceDoorBottomExcessLength = entranceDoorBottomExcessLength;
	}
	public String getEntranceDoorGrazingChequerSheet() {
		return entranceDoorGrazingChequerSheet;
	}
	public void setEntranceDoorGrazingChequerSheet(String entranceDoorGrazingChequerSheet) {
		this.entranceDoorGrazingChequerSheet = entranceDoorGrazingChequerSheet;
	}
	public String getEntranceDoorGrazingRubber() {
		return entranceDoorGrazingRubber;
	}
	public void setEntranceDoorGrazingRubber(String entranceDoorGrazingRubber) {
		this.entranceDoorGrazingRubber = entranceDoorGrazingRubber;
	}
	public String getExcessPlayEntranceDoorPivot() {
		return excessPlayEntranceDoorPivot;
	}
	public void setExcessPlayEntranceDoorPivot(String excessPlayEntranceDoorPivot) {
		this.excessPlayEntranceDoorPivot = excessPlayEntranceDoorPivot;
	}
	public String getHorizontalSteelStripScrewTighten() {
		return horizontalSteelStripScrewTighten;
	}
	public void setHorizontalSteelStripScrewTighten(String horizontalSteelStripScrewTighten) {
		this.horizontalSteelStripScrewTighten = horizontalSteelStripScrewTighten;
	}
	public String getHorizontalSteelStripScrewMissing() {
		return horizontalSteelStripScrewMissing;
	}
	public void setHorizontalSteelStripScrewMissing(String horizontalSteelStripScrewMissing) {
		this.horizontalSteelStripScrewMissing = horizontalSteelStripScrewMissing;
	}
	public String getHorizontalSteelStripScrewHole() {
		return horizontalSteelStripScrewHole;
	}
	public void setHorizontalSteelStripScrewHole(String horizontalSteelStripScrewHole) {
		this.horizontalSteelStripScrewHole = horizontalSteelStripScrewHole;
	}
	public String getVerticalSteelStripScrewTighten() {
		return verticalSteelStripScrewTighten;
	}
	public void setVerticalSteelStripScrewTighten(String verticalSteelStripScrewTighten) {
		this.verticalSteelStripScrewTighten = verticalSteelStripScrewTighten;
	}
	public String getVerticalSteelStripScrewMissing() {
		return verticalSteelStripScrewMissing;
	}
	public void setVerticalSteelStripScrewMissing(String verticalSteelStripScrewMissing) {
		this.verticalSteelStripScrewMissing = verticalSteelStripScrewMissing;
	}
	public String getVerticalSteelStripScrewHole() {
		return verticalSteelStripScrewHole;
	}
	public void setVerticalSteelStripScrewHole(String verticalSteelStripScrewHole) {
		this.verticalSteelStripScrewHole = verticalSteelStripScrewHole;
	}
	public String getHorizontalVerticalRubberPasted() {
		return horizontalVerticalRubberPasted;
	}
	public void setHorizontalVerticalRubberPasted(String horizontalVerticalRubberPasted) {
		this.horizontalVerticalRubberPasted = horizontalVerticalRubberPasted;
	}
	public String getTilliPanelLooseFitted() {
		return tilliPanelLooseFitted;
	}
	public void setTilliPanelLooseFitted(String tilliPanelLooseFitted) {
		this.tilliPanelLooseFitted = tilliPanelLooseFitted;
	}
	public String getTilliPanelBulge() {
		return tilliPanelBulge;
	}
	public void setTilliPanelBulge(String tilliPanelBulge) {
		this.tilliPanelBulge = tilliPanelBulge;
	}
	public String getTilliPanelHole() {
		return tilliPanelHole;
	}
	public void setTilliPanelHole(String tilliPanelHole) {
		this.tilliPanelHole = tilliPanelHole;
	}
	public String getVerticalFrpLooseFitted() {
		return verticalFrpLooseFitted;
	}
	public void setVerticalFrpLooseFitted(String verticalFrpLooseFitted) {
		this.verticalFrpLooseFitted = verticalFrpLooseFitted;
	}
	public String getVerticalFrpScrewMissing() {
		return verticalFrpScrewMissing;
	}
	public void setVerticalFrpScrewMissing(String verticalFrpScrewMissing) {
		this.verticalFrpScrewMissing = verticalFrpScrewMissing;
	}
	public String getVerticalFrpHole() {
		return verticalFrpHole;
	}
	public void setVerticalFrpHole(String verticalFrpHole) {
		this.verticalFrpHole = verticalFrpHole;
	}
	public String getVerticalFrpScrewTighten() {
		return verticalFrpScrewTighten;
	}
	public void setVerticalFrpScrewTighten(String verticalFrpScrewTighten) {
		this.verticalFrpScrewTighten = verticalFrpScrewTighten;
	}
	public String getHorizontalFrpLooseFitted() {
		return horizontalFrpLooseFitted;
	}
	public void setHorizontalFrpLooseFitted(String horizontalFrpLooseFitted) {
		this.horizontalFrpLooseFitted = horizontalFrpLooseFitted;
	}
	public String getHorizontalFrpScrewMissing() {
		return horizontalFrpScrewMissing;
	}
	public void setHorizontalFrpScrewMissing(String horizontalFrpScrewMissing) {
		this.horizontalFrpScrewMissing = horizontalFrpScrewMissing;
	}
	public String getHorizontalFrpHole() {
		return horizontalFrpHole;
	}
	public void setHorizontalFrpHole(String horizontalFrpHole) {
		this.horizontalFrpHole = horizontalFrpHole;
	}
	public String getHorizontalFrpScrewTighten() {
		return horizontalFrpScrewTighten;
	}
	public void setHorizontalFrpScrewTighten(String horizontalFrpScrewTighten) {
		this.horizontalFrpScrewTighten = horizontalFrpScrewTighten;
	}
	public String getVerticalfrpHorizontalfrpJointMismatch() {
		return verticalfrpHorizontalfrpJointMismatch;
	}
	public void setVerticalfrpHorizontalfrpJointMismatch(String verticalfrpHorizontalfrpJointMismatch) {
		this.verticalfrpHorizontalfrpJointMismatch = verticalfrpHorizontalfrpJointMismatch;
	}
	public String getHorizontalVerticalFrpEdgeUneven() {
		return horizontalVerticalFrpEdgeUneven;
	}
	public void setHorizontalVerticalFrpEdgeUneven(String horizontalVerticalFrpEdgeUneven) {
		this.horizontalVerticalFrpEdgeUneven = horizontalVerticalFrpEdgeUneven;
	}
	public String getHorizontalVerticalFrpPutty() {
		return horizontalVerticalFrpPutty;
	}
	public void setHorizontalVerticalFrpPutty(String horizontalVerticalFrpPutty) {
		this.horizontalVerticalFrpPutty = horizontalVerticalFrpPutty;
	}
	public String getGapSelfPartition() {
		return gapSelfPartition;
	}
	public void setGapSelfPartition(String gapSelfPartition) {
		this.gapSelfPartition = gapSelfPartition;
	}
	public String getFlapDoorMovementHard() {
		return flapDoorMovementHard;
	}
	public void setFlapDoorMovementHard(String flapDoorMovementHard) {
		this.flapDoorMovementHard = flapDoorMovementHard;
	}
	public String getZMemberHardwareMissing() {
		return ZMemberHardwareMissing;
	}
	public void setZMemberHardwareMissing(String zMemberHardwareMissing) {
		ZMemberHardwareMissing = zMemberHardwareMissing;
	}
	public String getZMemberHardwareBurr() {
		return ZMemberHardwareBurr;
	}
	public void setZMemberHardwareBurr(String zMemberHardwareBurr) {
		ZMemberHardwareBurr = zMemberHardwareBurr;
	}
	public String getLinenRoomDoorScrewLoose() {
		return linenRoomDoorScrewLoose;
	}
	public void setLinenRoomDoorScrewLoose(String linenRoomDoorScrewLoose) {
		this.linenRoomDoorScrewLoose = linenRoomDoorScrewLoose;
	}
	public String getLinenRoomBinjoScrewMissing() {
		return linenRoomBinjoScrewMissing;
	}
	public void setLinenRoomBinjoScrewMissing(String linenRoomBinjoScrewMissing) {
		this.linenRoomBinjoScrewMissing = linenRoomBinjoScrewMissing;
	}
	public String getLinenRoomBinjoScrewLoose() {
		return linenRoomBinjoScrewLoose;
	}
	public void setLinenRoomBinjoScrewLoose(String linenRoomBinjoScrewLoose) {
		this.linenRoomBinjoScrewLoose = linenRoomBinjoScrewLoose;
	}
	public String getLinenRoomHaspStapleMissing() {
		return linenRoomHaspStapleMissing;
	}
	public void setLinenRoomHaspStapleMissing(String linenRoomHaspStapleMissing) {
		this.linenRoomHaspStapleMissing = linenRoomHaspStapleMissing;
	}
	public String getCompartmentDoorframeSited() {
		return compartmentDoorframeSited;
	}
	public void setCompartmentDoorframeSited(String compartmentDoorframeSited) {
		this.compartmentDoorframeSited = compartmentDoorframeSited;
	}
	public String getCompartmentDoorhingeScrewLoose() {
		return compartmentDoorhingeScrewLoose;
	}
	public void setCompartmentDoorhingeScrewLoose(String compartmentDoorhingeScrewLoose) {
		this.compartmentDoorhingeScrewLoose = compartmentDoorhingeScrewLoose;
	}
	public String getCompartmentDoorhingeScrewMissing() {
		return compartmentDoorhingeScrewMissing;
	}
	public void setCompartmentDoorhingeScrewMissing(String compartmentDoorhingeScrewMissing) {
		this.compartmentDoorhingeScrewMissing = compartmentDoorhingeScrewMissing;
	}
	public String getCompartmentDoorbrushMissing() {
		return compartmentDoorbrushMissing;
	}
	public void setCompartmentDoorbrushMissing(String compartmentDoorbrushMissing) {
		this.compartmentDoorbrushMissing = compartmentDoorbrushMissing;
	}
	public String getCompartmentDoorstopperWorking() {
		return compartmentDoorstopperWorking;
	}
	public void setCompartmentDoorstopperWorking(String compartmentDoorstopperWorking) {
		this.compartmentDoorstopperWorking = compartmentDoorstopperWorking;
	}
	public String getCompartmentDoorgrazing() {
		return compartmentDoorgrazing;
	}
	public void setCompartmentDoorgrazing(String compartmentDoorgrazing) {
		this.compartmentDoorgrazing = compartmentDoorgrazing;
	}
	public String getProperFitmentEndwallSaloondoor() {
		return properFitmentEndwallSaloondoor;
	}
	public void setProperFitmentEndwallSaloondoor(String properFitmentEndwallSaloondoor) {
		this.properFitmentEndwallSaloondoor = properFitmentEndwallSaloondoor;
	}
	public String getMaxOpeningForceEndwallSaloondoor() {
		return maxOpeningForceEndwallSaloondoor;
	}
	public void setMaxOpeningForceEndwallSaloondoor(String maxOpeningForceEndwallSaloondoor) {
		this.maxOpeningForceEndwallSaloondoor = maxOpeningForceEndwallSaloondoor;
	}
	public String getMovementSlidingdoor() {
		return movementSlidingdoor;
	}
	public void setMovementSlidingdoor(String movementSlidingdoor) {
		this.movementSlidingdoor = movementSlidingdoor;
	}
	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}
	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}
	
}
