package struts.action.master;


import dao.DaoElectSafetyTestTrans;

import org.hibernate.Session;

import beans.ElecTestTransactionPrimaryData;
import beans.ElecTestTransactionPrimaryDataId;
import beans.ElectSafetyTestTrans;
import beans.FurnishingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;


public class SaveElectSafetyTestTrans {

	private String furnishingAssetId;
	private String safetyEngine;
	private String safetyAlternator;
	private String safetyEngineSlno;
	private String safetyAlternatorSlno;
	private String lowOilPressure;
	private String highWaterEngine;
	private String lowWaterCoolLevel;
	private String airFilterChoke;
	private String altEarthLeak;
	private String feederEarthLeak;
	private String feederOverLoad;
	private String busCouplerPerformance;
	private String safetyHooter;
	private String safetyUvrFunction;
	private String safetyOvrFunction;
	private String safetyAvrFunction;
	private String safetyEmergencyStop;
	private String phaseSequenceTest;
	private String starterBatteryCharger;
	private String radControlPannel;
	private String radFanMotors;
	private String cacControlPannel;
	private String cacMotors;
	private String electronicGovernor;
	private String safetyDcOn;
	private String safetyAel;
	private String safetyFel;
	private String safetyFol;
	private String safetyUvr;
	private String safetyFault;
	private String safetyAltOn;
	private String safetyTfrAOn;
	private String safetyLoopAOn;
	private String safetyLoopBOn;
	private String safetyFeederAOn;
	private String safetyFeederBOn;
	private String safetyBusCouplerOn;
	private String safety24vDc;
	private String battChargerDefect;
	private String nonWorkingContractorA;
	private String acbAOn;
	private String testLampIndicationOn;
	public String testingStatus;
	public String electricalDocNo;
	private String electricalDocDate;
	public String electTestingDate;
	public String electTestingShift;
	
	public String saveElectSafetyTestTrans()
	{
		System.out.println("savehello");	
		Session session=null;
		session=HibernateConfig.getSession();
		//HttpSession httpSession=ServletActionContext.getRequest().getSession();
		ElectSafetyTestTrans electSafetyTestTrans= new ElectSafetyTestTrans();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		FurnishingTransaction ft=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		String coachType=ft.getCoachType();
		electSafetyTestTrans.setFurnishingAssetId(furnishingAssetIdAsInt);
		
	
		electSafetyTestTrans.setSafetyEngine(safetyEngine);
		electSafetyTestTrans.setSafetyAlternator(safetyAlternator);
		electSafetyTestTrans.setSafetyEngineSlno(safetyEngineSlno);
		electSafetyTestTrans.setSafetyAlternatorSlno(safetyAlternatorSlno);
		electSafetyTestTrans.setLowOilPressure(lowOilPressure);
		electSafetyTestTrans.setHighWaterEngine(highWaterEngine);
		electSafetyTestTrans.setLowWaterCoolLevel(lowWaterCoolLevel);
		electSafetyTestTrans.setAirFilterChoke(airFilterChoke);
		electSafetyTestTrans.setAltEarthLeak(altEarthLeak);
		electSafetyTestTrans.setFeederEarthLeak(feederEarthLeak);
		electSafetyTestTrans.setFeederOverLoad(feederOverLoad);
		electSafetyTestTrans.setBusCouplerPerformance(busCouplerPerformance);
		electSafetyTestTrans.setSafetyHooter(safetyHooter);
		electSafetyTestTrans.setSafetyUvrFunction(safetyUvrFunction);
		electSafetyTestTrans.setSafetyOvrFunction(safetyOvrFunction);
		electSafetyTestTrans.setSafetyAvrFunction(safetyAvrFunction);
		electSafetyTestTrans.setSafetyEmergencyStop(safetyEmergencyStop);
		electSafetyTestTrans.setPhaseSequenceTest(phaseSequenceTest);
		electSafetyTestTrans.setStarterBatteryCharger(starterBatteryCharger);
		electSafetyTestTrans.setRadControlPannel(radControlPannel);
		electSafetyTestTrans.setRadFanMotors(radFanMotors);
		electSafetyTestTrans.setCacControlPannel(cacControlPannel);
		electSafetyTestTrans.setCacMotors(cacMotors);
		electSafetyTestTrans.setElectronicGovernor(electronicGovernor);
		electSafetyTestTrans.setSafetyDcOn(safetyDcOn);
		electSafetyTestTrans.setSafetyAel(safetyAel);
		electSafetyTestTrans.setSafetyFel(safetyFel);
		electSafetyTestTrans.setSafetyFol(safetyFol);
		electSafetyTestTrans.setSafetyUvr(safetyUvr);
		electSafetyTestTrans.setSafetyFault(safetyFault);
		electSafetyTestTrans.setSafetyAltOn(safetyAltOn);
		electSafetyTestTrans.setSafetyTfrAOn(safetyTfrAOn);
		electSafetyTestTrans.setSafetyLoopAOn(safetyLoopAOn);
		electSafetyTestTrans.setSafetyLoopBOn(safetyLoopBOn);
		electSafetyTestTrans.setSafetyFeederAOn(safetyFeederAOn);
		electSafetyTestTrans.setSafetyFeederBOn(safetyFeederBOn);
		electSafetyTestTrans.setSafetyBusCouplerOn(safetyBusCouplerOn);
		electSafetyTestTrans.setSafety24vDc(safety24vDc);
		electSafetyTestTrans.setBattChargerDefect(battChargerDefect);
		electSafetyTestTrans.setNonWorkingContractorA(nonWorkingContractorA);
		electSafetyTestTrans.setAcbAOn(acbAOn);
		electSafetyTestTrans.setTestLampIndicationOn(testLampIndicationOn);
		
		
		FurnishingTransaction furnishingTransaction=new FurnishingTransaction();
		furnishingTransaction=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		furnishingTransaction.setElectricalSafetyTestingFlag(1);
		
		
		ElecTestTransactionPrimaryDataId elecTestTransactionPrimaryDataId= new ElecTestTransactionPrimaryDataId();
		ElecTestTransactionPrimaryData elecTestTransactionPrimaryData= new ElecTestTransactionPrimaryData();
		elecTestTransactionPrimaryDataId.setElectricalAssetid(furnishingAssetIdAsInt);
		elecTestTransactionPrimaryDataId.setElectricalTestingType("Safety Testing");
		elecTestTransactionPrimaryData.setKey(elecTestTransactionPrimaryDataId);
		elecTestTransactionPrimaryData.setElectricalDocNo(electricalDocNo);
		elecTestTransactionPrimaryData.setDocDate(electricalDocDate);
		elecTestTransactionPrimaryData.setTestingShift(electTestingShift);
		elecTestTransactionPrimaryData.setTestingStatus(testingStatus);
		if(!"".equals(electTestingDate)){elecTestTransactionPrimaryData.setTestingDate(DateUtil.convertToDate(electTestingDate));}
		String formHeading="Inspection Report for Safety Testing (ELECTRICAL) for Coach Type"+coachType;
		elecTestTransactionPrimaryData.setFormHeading(formHeading);
		try
		{	
			
			DaoElectSafetyTestTrans dao= new DaoElectSafetyTestTrans();
			dao.daoElectSafetyTestTrans(electSafetyTestTrans,furnishingTransaction,elecTestTransactionPrimaryData);
			System.out.println(1);
			return "success";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
	}

	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getSafetyEngine() {
		return safetyEngine;
	}

	public void setSafetyEngine(String safetyEngine) {
		this.safetyEngine = safetyEngine;
	}

	public String getSafetyAlternator() {
		return safetyAlternator;
	}

	public void setSafetyAlternator(String safetyAlternator) {
		this.safetyAlternator = safetyAlternator;
	}

	public String getSafetyEngineSlno() {
		return safetyEngineSlno;
	}

	public void setSafetyEngineSlno(String safetyEngineSlno) {
		this.safetyEngineSlno = safetyEngineSlno;
	}

	public String getSafetyAlternatorSlno() {
		return safetyAlternatorSlno;
	}

	public void setSafetyAlternatorSlno(String safetyAlternatorSlno) {
		this.safetyAlternatorSlno = safetyAlternatorSlno;
	}

	public String getLowOilPressure() {
		return lowOilPressure;
	}

	public void setLowOilPressure(String lowOilPressure) {
		this.lowOilPressure = lowOilPressure;
	}

	public String getHighWaterEngine() {
		return highWaterEngine;
	}

	public void setHighWaterEngine(String highWaterEngine) {
		this.highWaterEngine = highWaterEngine;
	}

	public String getLowWaterCoolLevel() {
		return lowWaterCoolLevel;
	}

	public void setLowWaterCoolLevel(String lowWaterCoolLevel) {
		this.lowWaterCoolLevel = lowWaterCoolLevel;
	}

	public String getAirFilterChoke() {
		return airFilterChoke;
	}

	public void setAirFilterChoke(String airFilterChoke) {
		this.airFilterChoke = airFilterChoke;
	}

	public String getAltEarthLeak() {
		return altEarthLeak;
	}

	public void setAltEarthLeak(String altEarthLeak) {
		this.altEarthLeak = altEarthLeak;
	}

	public String getFeederEarthLeak() {
		return feederEarthLeak;
	}

	public void setFeederEarthLeak(String feederEarthLeak) {
		this.feederEarthLeak = feederEarthLeak;
	}

	public String getFeederOverLoad() {
		return feederOverLoad;
	}

	public void setFeederOverLoad(String feederOverLoad) {
		this.feederOverLoad = feederOverLoad;
	}

	public String getBusCouplerPerformance() {
		return busCouplerPerformance;
	}

	public void setBusCouplerPerformance(String busCouplerPerformance) {
		this.busCouplerPerformance = busCouplerPerformance;
	}

	public String getSafetyHooter() {
		return safetyHooter;
	}

	public void setSafetyHooter(String safetyHooter) {
		this.safetyHooter = safetyHooter;
	}

	public String getSafetyUvrFunction() {
		return safetyUvrFunction;
	}

	public void setSafetyUvrFunction(String safetyUvrFunction) {
		this.safetyUvrFunction = safetyUvrFunction;
	}

	public String getSafetyOvrFunction() {
		return safetyOvrFunction;
	}

	public void setSafetyOvrFunction(String safetyOvrFunction) {
		this.safetyOvrFunction = safetyOvrFunction;
	}

	public String getSafetyAvrFunction() {
		return safetyAvrFunction;
	}

	public void setSafetyAvrFunction(String safetyAvrFunction) {
		this.safetyAvrFunction = safetyAvrFunction;
	}

	public String getSafetyEmergencyStop() {
		return safetyEmergencyStop;
	}

	public void setSafetyEmergencyStop(String safetyEmergencyStop) {
		this.safetyEmergencyStop = safetyEmergencyStop;
	}

	public String getPhaseSequenceTest() {
		return phaseSequenceTest;
	}

	public void setPhaseSequenceTest(String phaseSequenceTest) {
		this.phaseSequenceTest = phaseSequenceTest;
	}

	public String getStarterBatteryCharger() {
		return starterBatteryCharger;
	}

	public void setStarterBatteryCharger(String starterBatteryCharger) {
		this.starterBatteryCharger = starterBatteryCharger;
	}

	public String getRadControlPannel() {
		return radControlPannel;
	}

	public void setRadControlPannel(String radControlPannel) {
		this.radControlPannel = radControlPannel;
	}

	public String getRadFanMotors() {
		return radFanMotors;
	}

	public void setRadFanMotors(String radFanMotors) {
		this.radFanMotors = radFanMotors;
	}

	public String getCacControlPannel() {
		return cacControlPannel;
	}

	public void setCacControlPannel(String cacControlPannel) {
		this.cacControlPannel = cacControlPannel;
	}

	public String getCacMotors() {
		return cacMotors;
	}

	public void setCacMotors(String cacMotors) {
		this.cacMotors = cacMotors;
	}

	public String getElectronicGovernor() {
		return electronicGovernor;
	}

	public void setElectronicGovernor(String electronicGovernor) {
		this.electronicGovernor = electronicGovernor;
	}

	public String getSafetyDcOn() {
		return safetyDcOn;
	}

	public void setSafetyDcOn(String safetyDcOn) {
		this.safetyDcOn = safetyDcOn;
	}

	public String getSafetyAel() {
		return safetyAel;
	}

	public void setSafetyAel(String safetyAel) {
		this.safetyAel = safetyAel;
	}

	public String getSafetyFel() {
		return safetyFel;
	}

	public void setSafetyFel(String safetyFel) {
		this.safetyFel = safetyFel;
	}

	public String getSafetyFol() {
		return safetyFol;
	}

	public void setSafetyFol(String safetyFol) {
		this.safetyFol = safetyFol;
	}

	public String getSafetyUvr() {
		return safetyUvr;
	}

	public void setSafetyUvr(String safetyUvr) {
		this.safetyUvr = safetyUvr;
	}

	public String getSafetyFault() {
		return safetyFault;
	}

	public void setSafetyFault(String safetyFault) {
		this.safetyFault = safetyFault;
	}

	public String getSafetyAltOn() {
		return safetyAltOn;
	}

	public void setSafetyAltOn(String safetyAltOn) {
		this.safetyAltOn = safetyAltOn;
	}

	public String getSafetyTfrAOn() {
		return safetyTfrAOn;
	}

	public void setSafetyTfrAOn(String safetyTfrAOn) {
		this.safetyTfrAOn = safetyTfrAOn;
	}

	public String getSafetyLoopAOn() {
		return safetyLoopAOn;
	}

	public void setSafetyLoopAOn(String safetyLoopAOn) {
		this.safetyLoopAOn = safetyLoopAOn;
	}

	public String getSafetyLoopBOn() {
		return safetyLoopBOn;
	}

	public void setSafetyLoopBOn(String safetyLoopBOn) {
		this.safetyLoopBOn = safetyLoopBOn;
	}

	public String getSafetyFeederAOn() {
		return safetyFeederAOn;
	}

	public void setSafetyFeederAOn(String safetyFeederAOn) {
		this.safetyFeederAOn = safetyFeederAOn;
	}

	public String getSafetyFeederBOn() {
		return safetyFeederBOn;
	}

	public void setSafetyFeederBOn(String safetyFeederBOn) {
		this.safetyFeederBOn = safetyFeederBOn;
	}

	public String getSafetyBusCouplerOn() {
		return safetyBusCouplerOn;
	}

	public void setSafetyBusCouplerOn(String safetyBusCouplerOn) {
		this.safetyBusCouplerOn = safetyBusCouplerOn;
	}

	public String getSafety24vDc() {
		return safety24vDc;
	}

	public void setSafety24vDc(String safety24vDc) {
		this.safety24vDc = safety24vDc;
	}

	public String getBattChargerDefect() {
		return battChargerDefect;
	}

	public void setBattChargerDefect(String battChargerDefect) {
		this.battChargerDefect = battChargerDefect;
	}

	public String getNonWorkingContractorA() {
		return nonWorkingContractorA;
	}

	public void setNonWorkingContractorA(String nonWorkingContractorA) {
		this.nonWorkingContractorA = nonWorkingContractorA;
	}

	public String getAcbAOn() {
		return acbAOn;
	}

	public void setAcbAOn(String acbAOn) {
		this.acbAOn = acbAOn;
	}

	public String getTestLampIndicationOn() {
		return testLampIndicationOn;
	}

	public void setTestLampIndicationOn(String testLampIndicationOn) {
		this.testLampIndicationOn = testLampIndicationOn;
	}

	public String getTestingStatus() {
		return testingStatus;
	}

	public void setTestingStatus(String testingStatus) {
		this.testingStatus = testingStatus;
	}

	public String getElectricalDocNo() {
		return electricalDocNo;
	}

	public void setElectricalDocNo(String electricalDocNo) {
		this.electricalDocNo = electricalDocNo;
	}

	public String getElectTestingDate() {
		return electTestingDate;
	}

	public void setElectTestingDate(String electTestingDate) {
		this.electTestingDate = electTestingDate;
	}

	public String getElectTestingShift() {
		return electTestingShift;
	}

	public void setElectTestingShift(String electTestingShift) {
		this.electTestingShift = electTestingShift;
	}

	public String getElectricalDocDate() {
		return electricalDocDate;
	}

	public void setElectricalDocDate(String electricalDocDate) {
		this.electricalDocDate = electricalDocDate;
	}
	
}