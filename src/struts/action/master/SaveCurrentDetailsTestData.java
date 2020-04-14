package struts.action.master;

import org.hibernate.Session;

import beans.CurrentDetailsTesting;
import beans.ElecTestTransactionPrimaryData;
import beans.ElecTestTransactionPrimaryDataId;
import beans.FurnishingTransaction;
import common.DateUtil;
import dao.DaoCurrentDetailsTesting;
import hibernateConnect.HibernateConfig;

public class SaveCurrentDetailsTestData {
	private String furnishingAssetId;
	private String acUnitMake;
	private String acUnit1;
	private String acUnit2;
	private String cpuSlNo;
	private String cpuMake;
	private String blrR;
	private String blrY;
	private String blrB;
	private String cd1R;
	private String cd1Y;
	private String cd1B;
	private String cd2R;
	private String cd2Y;
	private String cd2B;
	private String cp1R;
	private String cp1Y;
	private String cp1B;
	private String cp2R;
	private String cp2Y;
	private String cp2B;
	private String htr1R;
	private String htr1Y;
	private String htr1B;
	private String monoBlockPump1;
	private String kalsi1;
	private String drAuto1;
	private String rActual1;
	private String yActual1;
	private String bActual1;
	private String monoBlockPump2;
	private String kalsi2;
	private String drAuto2;
	private String rActual2;
	private String yActual2;
	private String bActual2;
	public String testingStatus;
	public String electricalDocNo;
	private String electricalDocDate;
	public String electTestingDate;
	public String electTestingShift;
	
	public String saveCurrentDetailsData(){
		Session session=null;
		session=HibernateConfig.getSession();
		//HttpSession httpSession=ServletActionContext.getRequest().getSession();
		
		CurrentDetailsTesting currentDetailsTesting=new CurrentDetailsTesting();
		
		
		
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		FurnishingTransaction ft=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		String coachType=ft.getCoachType();
		currentDetailsTesting.setFurnishingAssetId(furnishingAssetIdAsInt);
		
		currentDetailsTesting.setAcUnitMake(acUnitMake);
		currentDetailsTesting.setAcUnit1(acUnit1);
		currentDetailsTesting.setAcUnit2(acUnit2);
		currentDetailsTesting.setCpuSlNo(cpuSlNo);
		currentDetailsTesting.setCpuMake(cpuMake);
		currentDetailsTesting.setBlrR(blrR);
		currentDetailsTesting.setBlrB(blrB);
		currentDetailsTesting.setBlrY(blrY);
		currentDetailsTesting.setCd1B(cd1B);
		currentDetailsTesting.setCd1R(cd1R);
		currentDetailsTesting.setCd1Y(cd1Y);
		currentDetailsTesting.setCd2B(cd2B);
		currentDetailsTesting.setCd2R(cd2R);
		currentDetailsTesting.setCd2Y(cd2Y);
		currentDetailsTesting.setHtr1B(htr1B);
		currentDetailsTesting.setHtr1R(htr1R);
		currentDetailsTesting.setHtr1Y(htr1Y);
		currentDetailsTesting.setCp1B(cp1B);
		currentDetailsTesting.setCp1R(cp1R);
		currentDetailsTesting.setCp1Y(cp1Y);
		currentDetailsTesting.setCp2B(cp2B);
		currentDetailsTesting.setCp2R(cp2R);
		currentDetailsTesting.setCp2Y(cp2Y);
		currentDetailsTesting.setMonoBlockPump1(monoBlockPump1);
		currentDetailsTesting.setDrAuto1(drAuto1);
		currentDetailsTesting.setKalsi1(kalsi1);
		currentDetailsTesting.setActualR1(rActual1);
		currentDetailsTesting.setActualY1(yActual1);
		currentDetailsTesting.setMonoBlockPump2(monoBlockPump2);
		currentDetailsTesting.setDrAuto2(drAuto2);
		currentDetailsTesting.setKalsi2(kalsi2);
		currentDetailsTesting.setActualR2(rActual2);
		currentDetailsTesting.setActualY2(yActual2);
		currentDetailsTesting.setActualB1(bActual1);
		currentDetailsTesting.setActualB2(bActual2);
		
		FurnishingTransaction furnishingTransaction=new FurnishingTransaction();
		furnishingTransaction= (FurnishingTransaction) session.get(FurnishingTransaction.class,furnishingAssetIdAsInt);
		furnishingTransaction.setElectricalCurrentTestingFlag(1);
		System.out.println("hiee");
		ElecTestTransactionPrimaryDataId elecTestTransactionPrimaryDataId= new ElecTestTransactionPrimaryDataId();
		ElecTestTransactionPrimaryData elecTestTransactionPrimaryData= new ElecTestTransactionPrimaryData();
		elecTestTransactionPrimaryDataId.setElectricalAssetid(furnishingAssetIdAsInt);
		elecTestTransactionPrimaryDataId.setElectricalTestingType("Current Details Testing");
		elecTestTransactionPrimaryData.setKey(elecTestTransactionPrimaryDataId);
		elecTestTransactionPrimaryData.setElectricalDocNo(electricalDocNo);
		elecTestTransactionPrimaryData.setDocDate(electricalDocDate);
		elecTestTransactionPrimaryData.setTestingShift(electTestingShift);
		System.out.println("shift"+electTestingShift);
		elecTestTransactionPrimaryData.setTestingStatus(testingStatus);
		if(!"".equals(electTestingDate)){elecTestTransactionPrimaryData.setTestingDate(DateUtil.convertToDate(electTestingDate));}
		String formHeading="Inspection Report for Current Details Testing (ELECTRICAL) for Coach Type"+coachType;
		elecTestTransactionPrimaryData.setFormHeading(formHeading);
		try
		{
	
			DaoCurrentDetailsTesting dao=new DaoCurrentDetailsTesting();
		    dao.saveCurrentDetailsData(currentDetailsTesting,furnishingTransaction,elecTestTransactionPrimaryData);
			return "success";
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}	
	}

	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getAcUnitMake() {
		return acUnitMake;
	}

	public void setAcUnitMake(String acUnitMake) {
		this.acUnitMake = acUnitMake;
	}

	public String getAcUnit1() {
		return acUnit1;
	}

	public void setAcUnit1(String acUnit1) {
		this.acUnit1 = acUnit1;
	}

	public String getAcUnit2() {
		return acUnit2;
	}

	public void setAcUnit2(String acUnit2) {
		this.acUnit2 = acUnit2;
	}

	public String getCpuSlNo() {
		return cpuSlNo;
	}

	public void setCpuSlNo(String cpuSlNo) {
		this.cpuSlNo = cpuSlNo;
	}

	public String getCpuMake() {
		return cpuMake;
	}

	public void setCpuMake(String cpuMake) {
		this.cpuMake = cpuMake;
	}

	public String getBlrR() {
		return blrR;
	}

	public void setBlrR(String blrR) {
		this.blrR = blrR;
	}

	public String getBlrY() {
		return blrY;
	}

	public void setBlrY(String blrY) {
		this.blrY = blrY;
	}

	public String getBlrB() {
		return blrB;
	}

	public void setBlrB(String blrB) {
		this.blrB = blrB;
	}

	public String getCd1R() {
		return cd1R;
	}

	public void setCd1R(String cd1r) {
		cd1R = cd1r;
	}

	public String getCd1Y() {
		return cd1Y;
	}

	public void setCd1Y(String cd1y) {
		cd1Y = cd1y;
	}

	public String getCd1B() {
		return cd1B;
	}

	public void setCd1B(String cd1b) {
		cd1B = cd1b;
	}

	public String getCd2R() {
		return cd2R;
	}

	public void setCd2R(String cd2r) {
		cd2R = cd2r;
	}

	public String getCd2Y() {
		return cd2Y;
	}

	public void setCd2Y(String cd2y) {
		cd2Y = cd2y;
	}

	public String getCd2B() {
		return cd2B;
	}

	public void setCd2B(String cd2b) {
		cd2B = cd2b;
	}

	public String getCp1R() {
		return cp1R;
	}

	public void setCp1R(String cp1r) {
		cp1R = cp1r;
	}

	public String getCp1Y() {
		return cp1Y;
	}

	public void setCp1Y(String cp1y) {
		cp1Y = cp1y;
	}

	public String getCp1B() {
		return cp1B;
	}

	public void setCp1B(String cp1b) {
		cp1B = cp1b;
	}

	public String getCp2R() {
		return cp2R;
	}

	public void setCp2R(String cp2r) {
		cp2R = cp2r;
	}

	public String getCp2Y() {
		return cp2Y;
	}

	public void setCp2Y(String cp2y) {
		cp2Y = cp2y;
	}

	public String getCp2B() {
		return cp2B;
	}

	public void setCp2B(String cp2b) {
		cp2B = cp2b;
	}

	public String getHtr1R() {
		return htr1R;
	}

	public void setHtr1R(String htr1r) {
		htr1R = htr1r;
	}

	public String getHtr1Y() {
		return htr1Y;
	}

	public void setHtr1Y(String htr1y) {
		htr1Y = htr1y;
	}

	public String getHtr1B() {
		return htr1B;
	}

	public void setHtr1B(String htr1b) {
		htr1B = htr1b;
	}

	public String getMonoBlockPump1() {
		return monoBlockPump1;
	}

	public void setMonoBlockPump1(String monoBlockPump1) {
		this.monoBlockPump1 = monoBlockPump1;
	}

	public String getKalsi1() {
		return kalsi1;
	}

	public void setKalsi1(String kalsi1) {
		this.kalsi1 = kalsi1;
	}

	public String getDrAuto1() {
		return drAuto1;
	}

	public void setDrAuto1(String drAuto1) {
		this.drAuto1 = drAuto1;
	}

	public String getrActual1() {
		return rActual1;
	}

	public void setrActual1(String rActual1) {
		this.rActual1 = rActual1;
	}

	public String getyActual1() {
		return yActual1;
	}

	public void setyActual1(String yActual1) {
		this.yActual1 = yActual1;
	}

	public String getbActual1() {
		return bActual1;
	}

	public void setbActual1(String bActual1) {
		this.bActual1 = bActual1;
	}

	public String getMonoBlockPump2() {
		return monoBlockPump2;
	}

	public void setMonoBlockPump2(String monoBlockPump2) {
		this.monoBlockPump2 = monoBlockPump2;
	}

	public String getKalsi2() {
		return kalsi2;
	}

	public void setKalsi2(String kalsi2) {
		this.kalsi2 = kalsi2;
	}

	public String getDrAuto2() {
		return drAuto2;
	}

	public void setDrAuto2(String drAuto2) {
		this.drAuto2 = drAuto2;
	}

	public String getrActual2() {
		return rActual2;
	}

	public void setrActual2(String rActual2) {
		this.rActual2 = rActual2;
	}

	public String getyActual2() {
		return yActual2;
	}

	public void setyActual2(String yActual2) {
		this.yActual2 = yActual2;
	}

	public String getbActual2() {
		return bActual2;
	}

	public void setbActual2(String bActual2) {
		this.bActual2 = bActual2;
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
