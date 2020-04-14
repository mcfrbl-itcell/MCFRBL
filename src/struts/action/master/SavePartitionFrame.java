package struts.action.master;
import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciPartitionFrameTrans;
import beans.FurnishingTransaction;
import beans.QciFPvcTrans;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SavePartitionFrame {
	private String furnishingAssetId;
	private String dentMarkPartitionBn;
	private String dentMarkPartitionExceesCut;
	private String excessGapUmouldingPartitionpillar;
	private String middleBearthStopperMissing;
	private String middleBearthStopperLoose;
	private String middleBearthStopperRubberPad;
	private String partitionPillarHardwareLoose;
	private String partitionPillarHardwareMissing;
	private String partitionPillarHardwareTaper;
	private String unwantedHolesPartitionBn;
	private String plasticFilmRemovedPartition;
	private String roughlyPuttyPartition;
	private String partitionPillarZigzag;
	private String partitionPillarProperlySited;
	private String burrFoundPartitionPillar;
	private String burrFoundBerthHoldingBkt;
	private String testingObservationRemark;

	public String saveData2()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		QciPartitionFrameTrans qciPartitionFrameTransSave=new QciPartitionFrameTrans();
		QciPartitionFrameTrans qciPartitionFrameTrans= (QciPartitionFrameTrans) session.get(QciPartitionFrameTrans.class, furnishingAssetIdAsInt);
		
		
		
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
			qciFPvcTrans.setQciPartitionFrameFlag(1);
		
		
		}
		else
		{
			
			qciFPvcTransSave.setQciPartitionFrameFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		
		if(qciPartitionFrameTrans!=null){
			qciPartitionFrameTrans.setDentMarkPartitionBn(dentMarkPartitionBn);
			System.out.println(dentMarkPartitionBn);
			qciPartitionFrameTrans.setDentMarkPartitionExceesCut(dentMarkPartitionExceesCut);
			System.out.println(dentMarkPartitionExceesCut);
			qciPartitionFrameTrans.setExcessGapUmouldingPartitionpillar(excessGapUmouldingPartitionpillar);
			System.out.println(excessGapUmouldingPartitionpillar);
			qciPartitionFrameTrans.setMiddleBearthStopperMissing(middleBearthStopperMissing);
			System.out.println(middleBearthStopperMissing);
			qciPartitionFrameTrans.setMiddleBearthStopperLoose(middleBearthStopperLoose);
			qciPartitionFrameTrans.setMiddleBearthStopperRubberPad(middleBearthStopperRubberPad);
			qciPartitionFrameTrans.setPartitionPillarHardwareLoose(partitionPillarHardwareLoose);
			qciPartitionFrameTrans.setPartitionPillarHardwareMissing(partitionPillarHardwareMissing);
			qciPartitionFrameTrans.setPartitionPillarHardwareTaper(partitionPillarHardwareTaper);
			qciPartitionFrameTrans.setUnwantedHolesPartitionBn(unwantedHolesPartitionBn);
			qciPartitionFrameTrans.setPlasticFilmRemovedPartition(plasticFilmRemovedPartition);
			qciPartitionFrameTrans.setRoughlyPuttyPartition(roughlyPuttyPartition);
			qciPartitionFrameTrans.setPartitionPillarZigzag(partitionPillarZigzag);
			qciPartitionFrameTrans.setPartitionPillarProperlySited(partitionPillarProperlySited);
			qciPartitionFrameTrans.setBurrFoundPartitionPillar(burrFoundPartitionPillar);
			qciPartitionFrameTrans.setBurrFoundBerthHoldingBkt(burrFoundBerthHoldingBkt);
			qciPartitionFrameTrans.setTestingObservationRemark(testingObservationRemark);
		
		}
		else
		{
			qciPartitionFrameTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			qciPartitionFrameTransSave.setDentMarkPartitionBn(dentMarkPartitionBn);
			System.out.println(dentMarkPartitionBn);
			qciPartitionFrameTransSave.setDentMarkPartitionExceesCut(dentMarkPartitionExceesCut);
			System.out.println(dentMarkPartitionExceesCut);
			qciPartitionFrameTransSave.setExcessGapUmouldingPartitionpillar(excessGapUmouldingPartitionpillar);
			System.out.println(excessGapUmouldingPartitionpillar);
			qciPartitionFrameTransSave.setMiddleBearthStopperMissing(middleBearthStopperMissing);
			System.out.println(middleBearthStopperMissing);
			qciPartitionFrameTransSave.setMiddleBearthStopperLoose(middleBearthStopperLoose);
			qciPartitionFrameTransSave.setMiddleBearthStopperRubberPad(middleBearthStopperRubberPad);
			qciPartitionFrameTransSave.setPartitionPillarHardwareLoose(partitionPillarHardwareLoose);
			qciPartitionFrameTransSave.setPartitionPillarHardwareMissing(partitionPillarHardwareMissing);
			qciPartitionFrameTransSave.setPartitionPillarHardwareTaper(partitionPillarHardwareTaper);
			qciPartitionFrameTransSave.setUnwantedHolesPartitionBn(unwantedHolesPartitionBn);
			qciPartitionFrameTransSave.setPlasticFilmRemovedPartition(plasticFilmRemovedPartition);
			qciPartitionFrameTransSave.setRoughlyPuttyPartition(roughlyPuttyPartition);
			qciPartitionFrameTransSave.setPartitionPillarZigzag(partitionPillarZigzag);
			qciPartitionFrameTransSave.setPartitionPillarProperlySited(partitionPillarProperlySited);
			qciPartitionFrameTransSave.setBurrFoundPartitionPillar(burrFoundPartitionPillar);
			qciPartitionFrameTransSave.setBurrFoundBerthHoldingBkt(burrFoundBerthHoldingBkt);
			qciPartitionFrameTransSave.setTestingObservationRemark(testingObservationRemark);
		}
		
		
		
		
		
		
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData2(qciPartitionFrameTrans, qciFPvcTrans, qciPartitionFrameTransSave, qciFPvcTransSave);
				System.out.println(dentMarkPartitionBn);
				System.out.println(dentMarkPartitionExceesCut);
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

	public String getDentMarkPartitionBn() {
		return dentMarkPartitionBn;
	}

	public void setDentMarkPartitionBn(String dentMarkPartitionBn) {
		this.dentMarkPartitionBn = dentMarkPartitionBn;
	}

	public String getDentMarkPartitionExceesCut() {
		return dentMarkPartitionExceesCut;
	}

	public void setDentMarkPartitionExceesCut(String dentMarkPartitionExceesCut) {
		this.dentMarkPartitionExceesCut = dentMarkPartitionExceesCut;
	}

	public String getExcessGapUmouldingPartitionpillar() {
		return excessGapUmouldingPartitionpillar;
	}

	public void setExcessGapUmouldingPartitionpillar(String excessGapUmouldingPartitionpillar) {
		this.excessGapUmouldingPartitionpillar = excessGapUmouldingPartitionpillar;
	}

	public String getMiddleBearthStopperMissing() {
		return middleBearthStopperMissing;
	}

	public void setMiddleBearthStopperMissing(String middleBearthStopperMissing) {
		this.middleBearthStopperMissing = middleBearthStopperMissing;
	}

	public String getMiddleBearthStopperLoose() {
		return middleBearthStopperLoose;
	}

	public void setMiddleBearthStopperLoose(String middleBearthStopperLoose) {
		this.middleBearthStopperLoose = middleBearthStopperLoose;
	}

	public String getMiddleBearthStopperRubberPad() {
		return middleBearthStopperRubberPad;
	}

	public void setMiddleBearthStopperRubberPad(String middleBearthStopperRubberPad) {
		this.middleBearthStopperRubberPad = middleBearthStopperRubberPad;
	}

	public String getPartitionPillarHardwareLoose() {
		return partitionPillarHardwareLoose;
	}

	public void setPartitionPillarHardwareLoose(String partitionPillarHardwareLoose) {
		this.partitionPillarHardwareLoose = partitionPillarHardwareLoose;
	}

	public String getPartitionPillarHardwareMissing() {
		return partitionPillarHardwareMissing;
	}

	public void setPartitionPillarHardwareMissing(String partitionPillarHardwareMissing) {
		this.partitionPillarHardwareMissing = partitionPillarHardwareMissing;
	}

	public String getPartitionPillarHardwareTaper() {
		return partitionPillarHardwareTaper;
	}

	public void setPartitionPillarHardwareTaper(String partitionPillarHardwareTaper) {
		this.partitionPillarHardwareTaper = partitionPillarHardwareTaper;
	}

	public String getUnwantedHolesPartitionBn() {
		return unwantedHolesPartitionBn;
	}

	public void setUnwantedHolesPartitionBn(String unwantedHolesPartitionBn) {
		this.unwantedHolesPartitionBn = unwantedHolesPartitionBn;
	}

	public String getPlasticFilmRemovedPartition() {
		return plasticFilmRemovedPartition;
	}

	public void setPlasticFilmRemovedPartition(String plasticFilmRemovedPartition) {
		this.plasticFilmRemovedPartition = plasticFilmRemovedPartition;
	}

	public String getRoughlyPuttyPartition() {
		return roughlyPuttyPartition;
	}

	public void setRoughlyPuttyPartition(String roughlyPuttyPartition) {
		this.roughlyPuttyPartition = roughlyPuttyPartition;
	}

	public String getPartitionPillarZigzag() {
		return partitionPillarZigzag;
	}

	public void setPartitionPillarZigzag(String partitionPillarZigzag) {
		this.partitionPillarZigzag = partitionPillarZigzag;
	}

	public String getPartitionPillarProperlySited() {
		return partitionPillarProperlySited;
	}

	public void setPartitionPillarProperlySited(String partitionPillarProperlySited) {
		this.partitionPillarProperlySited = partitionPillarProperlySited;
	}

	public String getBurrFoundPartitionPillar() {
		return burrFoundPartitionPillar;
	}

	public void setBurrFoundPartitionPillar(String burrFoundPartitionPillar) {
		this.burrFoundPartitionPillar = burrFoundPartitionPillar;
	}

	public String getBurrFoundBerthHoldingBkt() {
		return burrFoundBerthHoldingBkt;
	}

	public void setBurrFoundBerthHoldingBkt(String burrFoundBerthHoldingBkt) {
		this.burrFoundBerthHoldingBkt = burrFoundBerthHoldingBkt;
	}

	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}

	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}


}
