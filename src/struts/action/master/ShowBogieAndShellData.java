package struts.action.master;

import java.util.Date;

import org.hibernate.Session;

import beans.ShellTransaction;
import beans.BogiesetTransaction;
import beans.FurnishingTransaction;
import beans.PaintTransaction;
import hibernateConnect.HibernateConfig;

public class ShowBogieAndShellData {
	
	private String furnishingAssetId;
	private String coachNo;
	private String coachType;
	private String fibaDocNo;
	private String biotankDocNo;
	private String bogiePPSideNo;
	private String bogieNPPSideNo;
	private Date bogiePPMfgDate;
	private Date bogieNPPMfgDate;
	private String bogiePPMake;
	private String bogieNPPMake;
	private String shellNo;
	private String shellType;
	private  String furnishingNo;
	private String fibaPPMake;
	private String fibaPPSerial;
	private Date fibaPPMfgDate;
	private String fibaNPPMake;
	private String fibaNPPSerial;
	private Date fibaNPPMfgDate;
	private String indicatorPPMake;
	private String indicatorPPSerial;
	private Date indicatorPPMfgDate;
	private String indicatorNPPMake;
	private String indicatorNPPSerial;
	private Date indicatorNPPMfgDate;
	private String biotankLavatoryMake_1;
	private String biotankLavatoryMake_2;
	private String biotankLavatoryMake_3;
	private String biotankLavatoryMake_4;
	private String biotankBacteriaType;
	private String biotankBacteriaMake;
	private Date biotankBacteriaFeedingDate;
	private String yawDamperPPVertical;
	private String yawDamperPPHorizontal;
	private String yawDamperNPPVertical;
	private String yawDamperNPPHorizontal;
	private String docNoBuffercbcheight;
	private String docNoFiresmoke;
	private String docNoAirbrake;
	private String cbcPPMakeforAirBrake;
	private String cbcPPNoforAirBrake;
	private String cbcNPPMakeforAirBrake;
	private String cbcNPPNoforAirBrake;
	
	private String bufferMake;
	private String bufferNo;
	private String brakePanelMake;
	private String brakePanelNo;
	private String distributorValveMake;
	private String distributorValveNo;
	private String pullBoxMake;
	private String pullBoxNo;
	private String handBrakeMake;
	private String handBrakeNo;
	
	public String showData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt= Integer.parseInt(furnishingAssetId);
		FurnishingTransaction furnishingTransaction =new FurnishingTransaction();
		BogiesetTransaction bogiesetTransactionPP =new BogiesetTransaction();
		BogiesetTransaction bogiesetTransactionNPP =new BogiesetTransaction();
		ShellTransaction shellTransaction= new ShellTransaction();
		PaintTransaction paintTransaction= new PaintTransaction();
		try
		{
			fibaDocNo= "MCF/RBL/QMF 7011a Dt 16-01-19";
			biotankDocNo="MCF/RBL/QMF 7008 Dt 16-01-19";
			docNoBuffercbcheight="MCF/RBL/QMF 7010 Dt 16-01-19";
			docNoFiresmoke="MCF/RBL/QMF/7002A Dt 31-05-19";
			docNoAirbrake="MCF/RBL/QMF 7011/ Dt 16-01-19";
			 furnishingTransaction=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
			 coachNo=furnishingTransaction.getCoachNumber();
			 fibaPPMake=furnishingTransaction.getFibaPPMake();
			 fibaPPSerial=furnishingTransaction.getFibaPPSerial();
			 fibaPPMfgDate=furnishingTransaction.getFibaPPMfgDate();
			 if(fibaPPMfgDate==null) {fibaPPMfgDate=new Date();}
			 fibaNPPMake=furnishingTransaction.getFibaNPPMake();
			 fibaNPPSerial=furnishingTransaction.getFibaNPPSerial();
			 fibaNPPMfgDate=furnishingTransaction.getFibaNPPMfgDate();
			 if(fibaNPPMfgDate==null) {fibaNPPMfgDate=new Date();}
			 indicatorPPMake=furnishingTransaction.getIndicatorPPMake();
			 indicatorPPSerial=furnishingTransaction.getIndicatorPPSerial();
			 indicatorPPMfgDate=furnishingTransaction.getIndicatorPPMfgDate();
			 if(indicatorPPMfgDate==null) {indicatorPPMfgDate=new Date();}
			 indicatorNPPMake=furnishingTransaction.getIndicatorNPPMake();
			 indicatorNPPSerial=furnishingTransaction.getIndicatorNPPSerial();
			 indicatorNPPMfgDate=furnishingTransaction.getIndicatorNPPMfgDate();
			 if(indicatorNPPMfgDate==null) {indicatorNPPMfgDate=new Date();}
			 System.out.println(coachNo);
			 coachType=furnishingTransaction.getCoachType();
			 biotankLavatoryMake_1= furnishingTransaction.getBiotankLavatoryMake_1();
			 biotankLavatoryMake_2= furnishingTransaction.getBiotankLavatoryMake_2();
			 biotankLavatoryMake_3= furnishingTransaction.getBiotankLavatoryMake_3();
			 biotankLavatoryMake_4= furnishingTransaction.getBiotankLavatoryMake_4();
			 biotankBacteriaType=furnishingTransaction.getBiotankBacteriaType();
			 biotankBacteriaMake=furnishingTransaction.getBiotankBacteriaMake();
			 biotankBacteriaFeedingDate=furnishingTransaction.getBiotankBacteriaFeedingDate();
			 if(biotankBacteriaFeedingDate==null) {biotankBacteriaFeedingDate=new Date();}
			 yawDamperPPVertical=furnishingTransaction.getYawDamperPPVertical();
			 yawDamperPPHorizontal=furnishingTransaction.getYawDamperPPHorizontal();
			 yawDamperNPPVertical=furnishingTransaction.getYawDamperNPPVertical();
			 yawDamperNPPHorizontal=furnishingTransaction.getYawDamperNPPHorizontal();
              bufferMake=furnishingTransaction.getBufferMake();
				bufferNo=furnishingTransaction.getBufferSrno();
				brakePanelMake=furnishingTransaction.getBrakePanelMake();
				brakePanelNo=furnishingTransaction.getBrakePanelSrno();
				distributorValveMake=furnishingTransaction.getDistributorValveMake();
				distributorValveNo=furnishingTransaction.getDistributorValveSrno();
				pullBoxMake=furnishingTransaction.getPullBoxMake();
				pullBoxNo=furnishingTransaction.getPullBoxNo();
				handBrakeMake=furnishingTransaction.getHandBrakeMake();
				handBrakeNo=furnishingTransaction.getHandBrakeNo();
			 
			Integer bogiePPId= furnishingTransaction.getBogiePpSideAssetId();
			
			Integer bogieNPPId= furnishingTransaction.getBogieNppSideAssetId();
			Integer shellAssetId= furnishingTransaction.getShellAssetId();
			Integer paintAssetId=furnishingTransaction.getPaintAssetId();
			
			// retrieve pp side bogie details
			bogiesetTransactionPP=(BogiesetTransaction) session.get(BogiesetTransaction.class, bogiePPId);
			bogiePPSideNo= bogiesetTransactionPP.getBogieNumber();
			bogiePPMfgDate= bogiesetTransactionPP.getAssemblyEndDate();
			bogiePPMake="MCF";
			// end of pp side bogie details
			            // retrieve npp side bogie details
			             bogiesetTransactionNPP=(BogiesetTransaction) session.get(BogiesetTransaction.class, bogieNPPId);
						bogieNPPSideNo= bogiesetTransactionNPP.getBogieNumber();
						bogieNPPMfgDate= bogiesetTransactionNPP.getAssemblyEndDate();
						bogieNPPMake="MCF";
						// end of pp side bogie details
		// retrieve sell details
						shellTransaction=(ShellTransaction) session.get(ShellTransaction.class, shellAssetId);
					shellNo= shellTransaction.getShellNumber();
					System.out.println("Shell No"+shellNo);
				    shellType=shellTransaction.getShellType();
				    cbcPPMakeforAirBrake=shellTransaction.getCbcPpEndMake();
				    cbcPPNoforAirBrake=shellTransaction.getCbcPpEndSrno();
				    cbcNPPMakeforAirBrake=shellTransaction.getCbcNppEndMake();
				    cbcNPPNoforAirBrake=shellTransaction.getCbcNppEndSrno();
						
		// end of retrieve shell details
		// retrieving furnishing no
				    paintTransaction= (PaintTransaction) session.get(PaintTransaction.class, paintAssetId) ;  
				    furnishingNo=paintTransaction.getFurnishingNumber();
	    //end of retrieval code
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;	
		}
		finally
		{
			if(session!=null) {session.close();}
		}
	}
	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}
	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}
	public String getCoachNo() {
		return coachNo;
	}
	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}
	public String getCoachType() {
		return coachType;
	}
	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}
	public String getFibaDocNo() {
		return fibaDocNo;
	}
	public void setFibaDocNo(String fibaDocNo) {
		this.fibaDocNo = fibaDocNo;
	}
	public String getBogiePPSideNo() {
		return bogiePPSideNo;
	}
	public void setBogiePPSideNo(String bogiePPSideNo) {
		this.bogiePPSideNo = bogiePPSideNo;
	}
	public String getBogieNPPSideNo() {
		return bogieNPPSideNo;
	}
	public void setBogieNPPSideNo(String bogieNPPSideNo) {
		this.bogieNPPSideNo = bogieNPPSideNo;
	}
	public Date getBogiePPMfgDate() {
		return bogiePPMfgDate;
	}
	public void setBogiePPMfgDate(Date bogiePPMfgDate) {
		this.bogiePPMfgDate = bogiePPMfgDate;
	}
	public Date getBogieNPPMfgDate() {
		return bogieNPPMfgDate;
	}
	public void setBogieNPPMfgDate(Date bogieNPPMfgDate) {
		this.bogieNPPMfgDate = bogieNPPMfgDate;
	}
	public String getBogiePPMake() {
		return bogiePPMake;
	}
	public void setBogiePPMake(String bogiePPMake) {
		this.bogiePPMake = bogiePPMake;
	}
	public String getBogieNPPMake() {
		return bogieNPPMake;
	}
	public void setBogieNPPMake(String bogieNPPMake) {
		this.bogieNPPMake = bogieNPPMake;
	}
	public String getShellNo() {
		return shellNo;
	}
	public void setShellNo(String shellNo) {
		this.shellNo = shellNo;
	}
	public String getShellType() {
		return shellType;
	}
	public void setShellType(String shellType) {
		this.shellType = shellType;
	}
	public String getFurnishingNo() {
		return furnishingNo;
	}
	public void setFurnishingNo(String furnishingNo) {
		this.furnishingNo = furnishingNo;
	}
	public String getFibaPPMake() {
		return fibaPPMake;
	}
	public void setFibaPPMake(String fibaPPMake) {
		this.fibaPPMake = fibaPPMake;
	}
	public String getFibaPPSerial() {
		return fibaPPSerial;
	}
	public void setFibaPPSerial(String fibaPPSerial) {
		this.fibaPPSerial = fibaPPSerial;
	}
	public Date getFibaPPMfgDate() {
		return fibaPPMfgDate;
	}
	public void setFibaPPMfgDate(Date fibaPPMfgDate) {
		this.fibaPPMfgDate = fibaPPMfgDate;
	}
	public String getFibaNPPMake() {
		return fibaNPPMake;
	}
	public void setFibaNPPMake(String fibaNPPMake) {
		this.fibaNPPMake = fibaNPPMake;
	}
	public String getFibaNPPSerial() {
		return fibaNPPSerial;
	}
	public void setFibaNPPSerial(String fibaNPPSerial) {
		this.fibaNPPSerial = fibaNPPSerial;
	}
	public Date getFibaNPPMfgDate() {
		return fibaNPPMfgDate;
	}
	public void setFibaNPPMfgDate(Date fibaNPPMfgDate) {
		this.fibaNPPMfgDate = fibaNPPMfgDate;
	}
	public String getIndicatorPPMake() {
		return indicatorPPMake;
	}
	public void setIndicatorPPMake(String indicatorPPMake) {
		this.indicatorPPMake = indicatorPPMake;
	}
	public String getIndicatorPPSerial() {
		return indicatorPPSerial;
	}
	public void setIndicatorPPSerial(String indicatorPPSerial) {
		this.indicatorPPSerial = indicatorPPSerial;
	}
	public Date getIndicatorPPMfgDate() {
		return indicatorPPMfgDate;
	}
	public void setIndicatorPPMfgDate(Date indicatorPPMfgDate) {
		this.indicatorPPMfgDate = indicatorPPMfgDate;
	}
	public String getIndicatorNPPMake() {
		return indicatorNPPMake;
	}
	public void setIndicatorNPPMake(String indicatorNPPMake) {
		this.indicatorNPPMake = indicatorNPPMake;
	}
	public String getIndicatorNPPSerial() {
		return indicatorNPPSerial;
	}
	public void setIndicatorNPPSerial(String indicatorNPPSerial) {
		this.indicatorNPPSerial = indicatorNPPSerial;
	}
	public Date getIndicatorNPPMfgDate() {
		return indicatorNPPMfgDate;
	}
	public void setIndicatorNPPMfgDate(Date indicatorNPPMfgDate) {
		this.indicatorNPPMfgDate = indicatorNPPMfgDate;
	}
	public String getBiotankDocNo() {
		return biotankDocNo;
	}
	public void setBiotankDocNo(String biotankDocNo) {
		this.biotankDocNo = biotankDocNo;
	}
	public String getBiotankLavatoryMake_1() {
		return biotankLavatoryMake_1;
	}
	public void setBiotankLavatoryMake_1(String biotankLavatoryMake_1) {
		this.biotankLavatoryMake_1 = biotankLavatoryMake_1;
	}
	public String getBiotankLavatoryMake_2() {
		return biotankLavatoryMake_2;
	}
	public void setBiotankLavatoryMake_2(String biotankLavatoryMake_2) {
		this.biotankLavatoryMake_2 = biotankLavatoryMake_2;
	}
	public String getBiotankLavatoryMake_3() {
		return biotankLavatoryMake_3;
	}
	public void setBiotankLavatoryMake_3(String biotankLavatoryMake_3) {
		this.biotankLavatoryMake_3 = biotankLavatoryMake_3;
	}
	public String getBiotankLavatoryMake_4() {
		return biotankLavatoryMake_4;
	}
	public void setBiotankLavatoryMake_4(String biotankLavatoryMake_4) {
		this.biotankLavatoryMake_4 = biotankLavatoryMake_4;
	}
	public String getBiotankBacteriaType() {
		return biotankBacteriaType;
	}
	public void setBiotankBacteriaType(String biotankBacteriaType) {
		this.biotankBacteriaType = biotankBacteriaType;
	}
	public String getBiotankBacteriaMake() {
		return biotankBacteriaMake;
	}
	public void setBiotankBacteriaMake(String biotankBacteriaMake) {
		this.biotankBacteriaMake = biotankBacteriaMake;
	}
	public Date getBiotankBacteriaFeedingDate() {
		return biotankBacteriaFeedingDate;
	}
	public void setBiotankBacteriaFeedingDate(Date biotankBacteriaFeedingDate) {
		this.biotankBacteriaFeedingDate = biotankBacteriaFeedingDate;
	}
	public String getYawDamperPPVertical() {
		return yawDamperPPVertical;
	}
	public void setYawDamperPPVertical(String yawDamperPPVertical) {
		this.yawDamperPPVertical = yawDamperPPVertical;
	}
	public String getYawDamperPPHorizontal() {
		return yawDamperPPHorizontal;
	}
	public void setYawDamperPPHorizontal(String yawDamperPPHorizontal) {
		this.yawDamperPPHorizontal = yawDamperPPHorizontal;
	}
	public String getYawDamperNPPVertical() {
		return yawDamperNPPVertical;
	}
	public void setYawDamperNPPVertical(String yawDamperNPPVertical) {
		this.yawDamperNPPVertical = yawDamperNPPVertical;
	}
	public String getYawDamperNPPHorizontal() {
		return yawDamperNPPHorizontal;
	}
	public void setYawDamperNPPHorizontal(String yawDamperNPPHorizontal) {
		this.yawDamperNPPHorizontal = yawDamperNPPHorizontal;
	}
	public String getDocNoBuffercbcheight() {
		return docNoBuffercbcheight;
	}
	public void setDocNoBuffercbcheight(String docNoBuffercbcheight) {
		this.docNoBuffercbcheight = docNoBuffercbcheight;
	}
	public String getDocNoFiresmoke() {
		return docNoFiresmoke;
	}
	public void setDocNoFiresmoke(String docNoFiresmoke) {
		this.docNoFiresmoke = docNoFiresmoke;
	}
	public String getDocNoAirbrake() {
		return docNoAirbrake;
	}
	public void setDocNoAirbrake(String docNoAirbrake) {
		this.docNoAirbrake = docNoAirbrake;
	}
	public String getCbcPPMakeforAirBrake() {
		return cbcPPMakeforAirBrake;
	}
	public void setCbcPPMakeforAirBrake(String cbcPPMakeforAirBrake) {
		this.cbcPPMakeforAirBrake = cbcPPMakeforAirBrake;
	}
	public String getCbcPPNoforAirBrake() {
		return cbcPPNoforAirBrake;
	}
	public void setCbcPPNoforAirBrake(String cbcPPNoforAirBrake) {
		this.cbcPPNoforAirBrake = cbcPPNoforAirBrake;
	}
	public String getCbcNPPMakeforAirBrake() {
		return cbcNPPMakeforAirBrake;
	}
	public void setCbcNPPMakeforAirBrake(String cbcNPPMakeforAirBrake) {
		this.cbcNPPMakeforAirBrake = cbcNPPMakeforAirBrake;
	}
	public String getCbcNPPNoforAirBrake() {
		return cbcNPPNoforAirBrake;
	}
	public void setCbcNPPNoforAirBrake(String cbcNPPNoforAirBrake) {
		this.cbcNPPNoforAirBrake = cbcNPPNoforAirBrake;
	}
	public String getBufferMake() {
		return bufferMake;
	}
	public void setBufferMake(String bufferMake) {
		this.bufferMake = bufferMake;
	}
	public String getBufferNo() {
		return bufferNo;
	}
	public void setBufferNo(String bufferNo) {
		this.bufferNo = bufferNo;
	}
	public String getBrakePanelMake() {
		return brakePanelMake;
	}
	public void setBrakePanelMake(String brakePanelMake) {
		this.brakePanelMake = brakePanelMake;
	}
	public String getBrakePanelNo() {
		return brakePanelNo;
	}
	public void setBrakePanelNo(String brakePanelNo) {
		this.brakePanelNo = brakePanelNo;
	}
	public String getDistributorValveMake() {
		return distributorValveMake;
	}
	public void setDistributorValveMake(String distributorValveMake) {
		this.distributorValveMake = distributorValveMake;
	}
	public String getDistributorValveNo() {
		return distributorValveNo;
	}
	public void setDistributorValveNo(String distributorValveNo) {
		this.distributorValveNo = distributorValveNo;
	}
	public String getPullBoxMake() {
		return pullBoxMake;
	}
	public void setPullBoxMake(String pullBoxMake) {
		this.pullBoxMake = pullBoxMake;
	}
	public String getPullBoxNo() {
		return pullBoxNo;
	}
	public void setPullBoxNo(String pullBoxNo) {
		this.pullBoxNo = pullBoxNo;
	}
	public String getHandBrakeMake() {
		return handBrakeMake;
	}
	public void setHandBrakeMake(String handBrakeMake) {
		this.handBrakeMake = handBrakeMake;
	}
	public String getHandBrakeNo() {
		return handBrakeNo;
	}
	public void setHandBrakeNo(String handBrakeNo) {
		this.handBrakeNo = handBrakeNo;
	}

	
	
}
