package beans;
//Generated 12 Mar, 2020 1:13:15 PM by Hibernate Tools 4.0.1.Final

import java.util.Date;

/**
* QciPaintTrans generated by hbm2java
*/
public class CrossCheckinTrans implements java.io.Serializable {

	private int furnishingAssetId;
	private String textGeneral;
	private Date docDate;
	private Date dateOfTesting;
	private String shiftOfTesting;
	private String textFpvc;
	private String textParitionFrame;
	private String textPanel;
	private String textWindowCelling;
	private String textMoulding;
	private String textSeatBerth;
	private String textLavatory;
	private String textPlumbing;
	private String textAirBrake;
	private String textCoachLowering;
	private String textPaint;
	private String textCoachCleaning;
	private Integer fpvcflag;
	private Integer partitionFrameFlag;
	private Integer panelFlag;
	private Integer windowCellingFlag;
	private Integer mouldingFlag;
	private Integer seatBerthFlag;
	private Integer lavatoryFlag;
	private Integer plumbingFlag;
	private Integer airBrakeFlag;
	private Integer coachLoweringFlag;
	private Integer paintFlag;
	private Integer coachCleaningFlag;

	public CrossCheckinTrans() {
	}

	public CrossCheckinTrans(int furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public CrossCheckinTrans(int furnishingAssetId, String textGeneral, Date docDate, Date dateOfTesting, String shiftOfTesting, String textFpvc, String textParitionFrame, String textPanel,
							String textWindowCelling, String textMoulding, String textSeatBerth, String textLavatory, String textPlumbing,
							String textAirBrake, String textCoachLowering, String textPaint, String textCoachCleaning,
							Integer fpvcflag,Integer partitionFrameFlag,Integer panelFlag,
							Integer windowCellingFlag,Integer mouldingFlag,Integer seatBerthFlag,
							Integer lavatoryFlag,Integer plumbingFlag,Integer airBrakeFlag,
							Integer coachLoweringFlag,Integer paintFlag,Integer coachCleaningFlag) {
		this.furnishingAssetId = furnishingAssetId;
		this.textGeneral = textGeneral;
		this.docDate = docDate;
		this.dateOfTesting = dateOfTesting;
		this.shiftOfTesting = shiftOfTesting;
		this.textFpvc = textFpvc;
		this.textParitionFrame = textParitionFrame;
		this.textPanel = textPanel;
		this.textWindowCelling = textWindowCelling;
		this.textMoulding = textMoulding;
		this.textSeatBerth = textSeatBerth;
		this.textLavatory = textLavatory;
		this.textPlumbing = textPlumbing;
		this.textAirBrake = textAirBrake;
		this.textCoachLowering = textCoachLowering;
		this.textPaint = textPaint;
		this.textCoachCleaning = textCoachCleaning;
		this.fpvcflag=fpvcflag;
		this.partitionFrameFlag=partitionFrameFlag;
		this.panelFlag=panelFlag;
		this.windowCellingFlag=windowCellingFlag;
		this.mouldingFlag=mouldingFlag;
		this.seatBerthFlag=seatBerthFlag;
		this.lavatoryFlag=lavatoryFlag;
		this.plumbingFlag=plumbingFlag;
		this.airBrakeFlag=airBrakeFlag;
		this.coachLoweringFlag=coachLoweringFlag;
		this.paintFlag=paintFlag;
		this.coachCleaningFlag=coachCleaningFlag;
	}

	public int getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(int furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getTextGeneral() {
		return textGeneral;
	}

	public void setTextGeneral(String textGeneral) {
		this.textGeneral = textGeneral;
	}

	public Date getDocDate() {
		return docDate;
	}

	public void setDocDate(Date docDate) {
		this.docDate = docDate;
	}

	public Date getDateOfTesting() {
		return dateOfTesting;
	}

	public void setDateOfTesting(Date dateOfTesting) {
		this.dateOfTesting = dateOfTesting;
	}

	public String getShiftOfTesting() {
		return shiftOfTesting;
	}

	public void setShiftOfTesting(String shiftOfTesting) {
		this.shiftOfTesting = shiftOfTesting;
	}

	public String getTextFpvc() {
		return textFpvc;
	}

	public void setTextFpvc(String textFpvc) {
		this.textFpvc = textFpvc;
	}

	public String getTextParitionFrame() {
		return textParitionFrame;
	}

	public void setTextParitionFrame(String textParitionFrame) {
		this.textParitionFrame = textParitionFrame;
	}

	public String getTextPanel() {
		return textPanel;
	}

	public void setTextPanel(String textPanel) {
		this.textPanel = textPanel;
	}

	public String getTextWindowCelling() {
		return textWindowCelling;
	}

	public void setTextWindowCelling(String textWindowCelling) {
		this.textWindowCelling = textWindowCelling;
	}

	public String getTextMoulding() {
		return textMoulding;
	}

	public void setTextMoulding(String textMoulding) {
		this.textMoulding = textMoulding;
	}

	public String getTextSeatBerth() {
		return textSeatBerth;
	}

	public void setTextSeatBerth(String textSeatBerth) {
		this.textSeatBerth = textSeatBerth;
	}

	public String getTextLavatory() {
		return textLavatory;
	}

	public void setTextLavatory(String textLavatory) {
		this.textLavatory = textLavatory;
	}

	public String getTextPlumbing() {
		return textPlumbing;
	}

	public void setTextPlumbing(String textPlumbing) {
		this.textPlumbing = textPlumbing;
	}

	public String getTextAirBrake() {
		return textAirBrake;
	}

	public void setTextAirBrake(String textAirBrake) {
		this.textAirBrake = textAirBrake;
	}

	public String getTextCoachLowering() {
		return textCoachLowering;
	}

	public void setTextCoachLowering(String textCoachLowering) {
		this.textCoachLowering = textCoachLowering;
	}

	public String getTextPaint() {
		return textPaint;
	}

	public void setTextPaint(String textPaint) {
		this.textPaint = textPaint;
	}

	public String getTextCoachCleaning() {
		return textCoachCleaning;
	}

	public void setTextCoachCleaning(String textCoachCleaning) {
		this.textCoachCleaning = textCoachCleaning;
	}

	public Integer getFpvcflag() {
		return fpvcflag;
	}

	public void setFpvcflag(Integer fpvcflag) {
		this.fpvcflag = fpvcflag;
	}

	public Integer getPartitionFrameFlag() {
		return partitionFrameFlag;
	}

	public void setPartitionFrameFlag(Integer partitionFrameFlag) {
		this.partitionFrameFlag = partitionFrameFlag;
	}

	public Integer getPanelFlag() {
		return panelFlag;
	}

	public void setPanelFlag(Integer panelFlag) {
		this.panelFlag = panelFlag;
	}

	public Integer getWindowCellingFlag() {
		return windowCellingFlag;
	}

	public void setWindowCellingFlag(Integer windowCellingFlag) {
		this.windowCellingFlag = windowCellingFlag;
	}

	public Integer getMouldingFlag() {
		return mouldingFlag;
	}

	public void setMouldingFlag(Integer mouldingFlag) {
		this.mouldingFlag = mouldingFlag;
	}

	public Integer getSeatBerthFlag() {
		return seatBerthFlag;
	}

	public void setSeatBerthFlag(Integer seatBerthFlag) {
		this.seatBerthFlag = seatBerthFlag;
	}

	public Integer getLavatoryFlag() {
		return lavatoryFlag;
	}

	public void setLavatoryFlag(Integer lavatoryFlag) {
		this.lavatoryFlag = lavatoryFlag;
	}

	public Integer getPlumbingFlag() {
		return plumbingFlag;
	}

	public void setPlumbingFlag(Integer plumbingFlag) {
		this.plumbingFlag = plumbingFlag;
	}

	public Integer getAirBrakeFlag() {
		return airBrakeFlag;
	}

	public void setAirBrakeFlag(Integer airBrakeFlag) {
		this.airBrakeFlag = airBrakeFlag;
	}

	public Integer getCoachLoweringFlag() {
		return coachLoweringFlag;
	}

	public void setCoachLoweringFlag(Integer coachLoweringFlag) {
		this.coachLoweringFlag = coachLoweringFlag;
	}

	public Integer getPaintFlag() {
		return paintFlag;
	}

	public void setPaintFlag(Integer paintFlag) {
		this.paintFlag = paintFlag;
	}

	public Integer getCoachCleaningFlag() {
		return coachCleaningFlag;
	}

	public void setCoachCleaningFlag(Integer coachCleaningFlag) {
		this.coachCleaningFlag = coachCleaningFlag;
	}
		

}
