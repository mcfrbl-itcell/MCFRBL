package beans;

import java.util.Date;

public class FiresmokeTestingTransaction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer furnishingAssetId;
	private String docNoFiresmoke;
	private Date dateOfFiresmoke;
	private String shiftFiresmoke;
	private String supplierName;
	private String pressureOfNitrogenObservation;
	private String pressureOfNitrogenRemark;
	private String smokeDetecotrPhysicalObservation;
	private String smokeDetecotrPhysicalRemark;
	
	private String gensetASmokeTestObservation;
	private String gensetASmokeTestRemark;
	private String gensetBSmokeTestObservation;
	private String gensetBSmokeTestRemark;
	
	private String gensetAHeatDetectionObservation;
	private String gensetAHeatDetectionRemark;
	private String gensetBHeatDetectionObservation;
	private String gensetBHeatDetectionRemark;
	
	private String conditionPipelineObservation;
	private String conditionPipelineRemark;
	private String instructionStickerObservation;
	private String instructionStickerRemark;
	
	private String suppressionSystemObservation;
	private String suppressionSystemRemark;
	private String entryBy;
	private Date entryDate;
	
	public FiresmokeTestingTransaction()
	{
		
	}

	
	public FiresmokeTestingTransaction(Integer furnishingAssetId, String docNoFiresmoke, Date dateOfFiresmoke,
			String shiftFiresmoke, String supplierName, String pressureOfNitrogenObservation,
			String pressureOfNitrogenRemark, String smokeDetecotrPhysicalObservation,
			String smokeDetecotrPhysicalRemark, String gensetASmokeTestObservation, String gensetASmokeTestRemark,
			String gensetBSmokeTestObservation, String gensetBSmokeTestRemark, String gensetAHeatDetectionObservation,
			String gensetAHeatDetectionRemark, String gensetBHeatDetectionObservation,
			String gensetBHeatDetectionRemark, String conditionPipelineObservation, String conditionPipelineRemark,
			String instructionStickerObservation, String instructionStickerRemark, String suppressionSystemObservation,
			String suppressionSystemRemark, String entryBy, Date entryDate) {
		super();
		this.furnishingAssetId = furnishingAssetId;
		this.docNoFiresmoke = docNoFiresmoke;
		this.dateOfFiresmoke = dateOfFiresmoke;
		this.shiftFiresmoke = shiftFiresmoke;
		this.supplierName = supplierName;
		this.pressureOfNitrogenObservation = pressureOfNitrogenObservation;
		this.pressureOfNitrogenRemark = pressureOfNitrogenRemark;
		this.smokeDetecotrPhysicalObservation = smokeDetecotrPhysicalObservation;
		this.smokeDetecotrPhysicalRemark = smokeDetecotrPhysicalRemark;
		this.gensetASmokeTestObservation = gensetASmokeTestObservation;
		this.gensetASmokeTestRemark = gensetASmokeTestRemark;
		this.gensetBSmokeTestObservation = gensetBSmokeTestObservation;
		this.gensetBSmokeTestRemark = gensetBSmokeTestRemark;
		this.gensetAHeatDetectionObservation = gensetAHeatDetectionObservation;
		this.gensetAHeatDetectionRemark = gensetAHeatDetectionRemark;
		this.gensetBHeatDetectionObservation = gensetBHeatDetectionObservation;
		this.gensetBHeatDetectionRemark = gensetBHeatDetectionRemark;
		this.conditionPipelineObservation = conditionPipelineObservation;
		this.conditionPipelineRemark = conditionPipelineRemark;
		this.instructionStickerObservation = instructionStickerObservation;
		this.instructionStickerRemark = instructionStickerRemark;
		this.suppressionSystemObservation = suppressionSystemObservation;
		this.suppressionSystemRemark = suppressionSystemRemark;
		this.entryBy = entryBy;
		this.entryDate = entryDate;
	}


	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	

	public String getDocNoFiresmoke() {
		return docNoFiresmoke;
	}


	public void setDocNoFiresmoke(String docNoFiresmoke) {
		this.docNoFiresmoke = docNoFiresmoke;
	}


	public Date getDateOfFiresmoke() {
		return dateOfFiresmoke;
	}


	public void setDateOfFiresmoke(Date dateOfFiresmoke) {
		this.dateOfFiresmoke = dateOfFiresmoke;
	}


	public String getShiftFiresmoke() {
		return shiftFiresmoke;
	}


	public void setShiftFiresmoke(String shiftFiresmoke) {
		this.shiftFiresmoke = shiftFiresmoke;
	}


	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getPressureOfNitrogenObservation() {
		return pressureOfNitrogenObservation;
	}

	public void setPressureOfNitrogenObservation(String pressureOfNitrogenObservation) {
		this.pressureOfNitrogenObservation = pressureOfNitrogenObservation;
	}

	public String getPressureOfNitrogenRemark() {
		return pressureOfNitrogenRemark;
	}

	public void setPressureOfNitrogenRemark(String pressureOfNitrogenRemark) {
		this.pressureOfNitrogenRemark = pressureOfNitrogenRemark;
	}

	public String getSmokeDetecotrPhysicalObservation() {
		return smokeDetecotrPhysicalObservation;
	}

	public void setSmokeDetecotrPhysicalObservation(String smokeDetecotrPhysicalObservation) {
		this.smokeDetecotrPhysicalObservation = smokeDetecotrPhysicalObservation;
	}

	public String getSmokeDetecotrPhysicalRemark() {
		return smokeDetecotrPhysicalRemark;
	}

	public void setSmokeDetecotrPhysicalRemark(String smokeDetecotrPhysicalRemark) {
		this.smokeDetecotrPhysicalRemark = smokeDetecotrPhysicalRemark;
	}

	public String getGensetASmokeTestObservation() {
		return gensetASmokeTestObservation;
	}

	public void setGensetASmokeTestObservation(String gensetASmokeTestObservation) {
		this.gensetASmokeTestObservation = gensetASmokeTestObservation;
	}

	public String getGensetASmokeTestRemark() {
		return gensetASmokeTestRemark;
	}

	public void setGensetASmokeTestRemark(String gensetASmokeTestRemark) {
		this.gensetASmokeTestRemark = gensetASmokeTestRemark;
	}

	public String getGensetBSmokeTestObservation() {
		return gensetBSmokeTestObservation;
	}

	public void setGensetBSmokeTestObservation(String gensetBSmokeTestObservation) {
		this.gensetBSmokeTestObservation = gensetBSmokeTestObservation;
	}

	public String getGensetBSmokeTestRemark() {
		return gensetBSmokeTestRemark;
	}

	public void setGensetBSmokeTestRemark(String gensetBSmokeTestRemark) {
		this.gensetBSmokeTestRemark = gensetBSmokeTestRemark;
	}

	public String getGensetAHeatDetectionObservation() {
		return gensetAHeatDetectionObservation;
	}

	public void setGensetAHeatDetectionObservation(String gensetAHeatDetectionObservation) {
		this.gensetAHeatDetectionObservation = gensetAHeatDetectionObservation;
	}

	public String getGensetAHeatDetectionRemark() {
		return gensetAHeatDetectionRemark;
	}

	public void setGensetAHeatDetectionRemark(String gensetAHeatDetectionRemark) {
		this.gensetAHeatDetectionRemark = gensetAHeatDetectionRemark;
	}

	public String getGensetBHeatDetectionObservation() {
		return gensetBHeatDetectionObservation;
	}

	public void setGensetBHeatDetectionObservation(String gensetBHeatDetectionObservation) {
		this.gensetBHeatDetectionObservation = gensetBHeatDetectionObservation;
	}

	public String getGensetBHeatDetectionRemark() {
		return gensetBHeatDetectionRemark;
	}

	public void setGensetBHeatDetectionRemark(String gensetBHeatDetectionRemark) {
		this.gensetBHeatDetectionRemark = gensetBHeatDetectionRemark;
	}

	public String getConditionPipelineObservation() {
		return conditionPipelineObservation;
	}

	public void setConditionPipelineObservation(String conditionPipelineObservation) {
		this.conditionPipelineObservation = conditionPipelineObservation;
	}

	public String getConditionPipelineRemark() {
		return conditionPipelineRemark;
	}

	public void setConditionPipelineRemark(String conditionPipelineRemark) {
		this.conditionPipelineRemark = conditionPipelineRemark;
	}

	public String getInstructionStickerObservation() {
		return instructionStickerObservation;
	}

	public void setInstructionStickerObservation(String instructionStickerObservation) {
		this.instructionStickerObservation = instructionStickerObservation;
	}

	public String getInstructionStickerRemark() {
		return instructionStickerRemark;
	}

	public void setInstructionStickerRemark(String instructionStickerRemark) {
		this.instructionStickerRemark = instructionStickerRemark;
	}

	public String getSuppressionSystemObservation() {
		return suppressionSystemObservation;
	}

	public void setSuppressionSystemObservation(String suppressionSystemObservation) {
		this.suppressionSystemObservation = suppressionSystemObservation;
	}

	public String getSuppressionSystemRemark() {
		return suppressionSystemRemark;
	}

	public void setSuppressionSystemRemark(String suppressionSystemRemark) {
		this.suppressionSystemRemark = suppressionSystemRemark;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	
}
