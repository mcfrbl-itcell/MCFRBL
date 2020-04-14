package struts.action.master;

import org.hibernate.Session;
import dao.DaoElectBatteryTestTrans;
import beans.ElecTestTransactionPrimaryData;
import beans.ElecTestTransactionPrimaryDataId;
import beans.ElectBatteryTestTrans;
import beans.FurnishingTransaction;

import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveBatteryTestData {
	private String furnishingAssetId;
	public String batteryBoxMake;                  							
	public String batteryBoxMakeActual;             							
	public String mountingBatteryBoxActual;
	public String batteryCommisionedMake;
	public String battery1;
	public String lugDate1;
	public String battery2;
	public String lugDate2;
	public String battery3;
	public String lugDate3;
	public String battery4;
	public String lugDate4;
	public String battery5;
	public String lugDate5;
	public String battery6;
	public String lugDate6;
	public String battery7;
	public String lugDate7;
	public String battery8;
	public String lugDate8;
	public String battery9;
	public String lugDate9;
	public String batteryCommisionedActual;
	public String leadAcidBatteryMake;
	public String leadAcidBatteryMake1;
	public String leadAcidBatteryLugDate1;
	public String leadAcidBatteryMake2;
	public String leadAcidBatteryLugDate2;
	public String leadAcidBatteryMake3;
	public String leadAcidBatteryLugDate3;
	public String leadAcidBatteryActual;
	public String testingStatus;
	public String electricalDocNo;
	private String electricalDocDate;
	public String electTestingDate;
	public String electTestingShift;
	
	public String saveBatteryData(){
		Session session=null;
		session=HibernateConfig.getSession();
		//HttpSession httpSession=ServletActionContext.getRequest().getSession();
		
		ElectBatteryTestTrans electBatteryTestTrans=new ElectBatteryTestTrans();
		
		
		
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		FurnishingTransaction ft=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		String coachType=ft.getCoachType();
		electBatteryTestTrans.setFurnishingAssetId(furnishingAssetIdAsInt);
		

		
		
		if(!"".equals(lugDate1))
		{
			electBatteryTestTrans.setLugDate1(DateUtil.convertToDate(lugDate1));
		}
		if(!"".equals(lugDate2))
		{
			electBatteryTestTrans.setLugDate2(DateUtil.convertToDate(lugDate2));
		}
		if(!"".equals(lugDate3))
		{
			electBatteryTestTrans.setLugDate3(DateUtil.convertToDate(lugDate3));
		}
		if(!"".equals(lugDate4))
		{
			electBatteryTestTrans.setLugDate4(DateUtil.convertToDate(lugDate4));
		}
		if(!"".equals(lugDate5))
		{
			electBatteryTestTrans.setLugDate5(DateUtil.convertToDate(lugDate5));
		}
		if(!"".equals(lugDate6))
		{
			electBatteryTestTrans.setLugDate6(DateUtil.convertToDate(lugDate6));
		}
		if(!"".equals(lugDate7))
		{
			electBatteryTestTrans.setLugDate7(DateUtil.convertToDate(lugDate7));
		}
		if(!"".equals(lugDate8))
		{
			electBatteryTestTrans.setLugDate8(DateUtil.convertToDate(lugDate8));
		}
		if(!"".equals(lugDate9))
		{
			electBatteryTestTrans.setLugDate9(DateUtil.convertToDate(lugDate9));
		}
		if(!"".equals(leadAcidBatteryLugDate1))
		{
			electBatteryTestTrans.setLeadAcidBatteryLugDate1(DateUtil.convertToDate(leadAcidBatteryLugDate1));
		}
		if(!"".equals(leadAcidBatteryLugDate2))
		{
			electBatteryTestTrans.setLeadAcidBatteryLugDate2(DateUtil.convertToDate(leadAcidBatteryLugDate2));
		}
		if(!"".equals(leadAcidBatteryLugDate3))
		{
			electBatteryTestTrans.setLeadAcidBatteryLugDate3(DateUtil.convertToDate(leadAcidBatteryLugDate3));
		}
		
		
		
		electBatteryTestTrans.setBatteryBoxMake(batteryBoxMake);
		electBatteryTestTrans.setBatteryBoxMakeActual(batteryBoxMakeActual);
		electBatteryTestTrans.setMountingBatteryBoxActual(mountingBatteryBoxActual);
		electBatteryTestTrans.setBatteryCommisionedMake(batteryCommisionedMake);
		electBatteryTestTrans.setBattery1(battery1);
		electBatteryTestTrans.setBattery2(battery2);
		electBatteryTestTrans.setBattery3(battery3);
		electBatteryTestTrans.setBattery4(battery4);
		electBatteryTestTrans.setBattery5(battery5);
		electBatteryTestTrans.setBattery6(battery6);
		electBatteryTestTrans.setBattery7(battery7);
		electBatteryTestTrans.setBattery8(battery8);
		electBatteryTestTrans.setBattery9(battery9);
		electBatteryTestTrans.setBatteryCommisionedActual(batteryCommisionedActual);
		electBatteryTestTrans.setLeadAcidBatteryMake(leadAcidBatteryMake);
		electBatteryTestTrans.setLeadAcidBatteryMake1(leadAcidBatteryMake1);
		electBatteryTestTrans.setLeadAcidBatteryMake2(leadAcidBatteryMake2);
		electBatteryTestTrans.setLeadAcidBatteryMake3(leadAcidBatteryMake3);
		electBatteryTestTrans.setLeadAcidBatteryActual(leadAcidBatteryActual);
		
		
		
		FurnishingTransaction furnishingTransaction=new FurnishingTransaction();
		furnishingTransaction= (FurnishingTransaction) session.get(FurnishingTransaction.class,furnishingAssetIdAsInt);
		furnishingTransaction.setElectricalBatteryTestingFlag(1);
		
		ElecTestTransactionPrimaryDataId elecTestTransactionPrimaryDataId= new ElecTestTransactionPrimaryDataId();
		ElecTestTransactionPrimaryData elecTestTransactionPrimaryData= new ElecTestTransactionPrimaryData();
		elecTestTransactionPrimaryDataId.setElectricalAssetid(furnishingAssetIdAsInt);
		elecTestTransactionPrimaryDataId.setElectricalTestingType("Battery Testing");
		elecTestTransactionPrimaryData.setKey(elecTestTransactionPrimaryDataId);
		elecTestTransactionPrimaryData.setElectricalDocNo(electricalDocNo);
		elecTestTransactionPrimaryData.setDocDate(electricalDocDate);
		elecTestTransactionPrimaryData.setTestingShift(electTestingShift);
		elecTestTransactionPrimaryData.setTestingStatus(testingStatus);
		if(!"".equals(electTestingDate)){elecTestTransactionPrimaryData.setTestingDate(DateUtil.convertToDate(electTestingDate));}
		String formHeading="Inspection Report for Battery Comissioning Testing (ELECTRICAL) for Coach Type"+coachType;
		elecTestTransactionPrimaryData.setFormHeading(formHeading);
		
		
		try
		{
	
			DaoElectBatteryTestTrans dao=new DaoElectBatteryTestTrans();
		    dao.saveBatteryData(electBatteryTestTrans,furnishingTransaction, elecTestTransactionPrimaryData);
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



	public String getBatteryBoxMake() {
		return batteryBoxMake;
	}

	public void setBatteryBoxMake(String batteryBoxMake) {
		this.batteryBoxMake = batteryBoxMake;
	}

	public String getBatteryBoxMakeActual() {
		return batteryBoxMakeActual;
	}

	public void setBatteryBoxMakeActual(String batteryBoxMakeActual) {
		this.batteryBoxMakeActual = batteryBoxMakeActual;
	}

	public String getMountingBatteryBoxActual() {
		return mountingBatteryBoxActual;
	}

	public void setMountingBatteryBoxActual(String mountingBatteryBoxActual) {
		this.mountingBatteryBoxActual = mountingBatteryBoxActual;
	}

	public String getBatteryCommisionedMake() {
		return batteryCommisionedMake;
	}

	public void setBatteryCommisionedMake(String batteryCommisionedMake) {
		this.batteryCommisionedMake = batteryCommisionedMake;
	}

	public String getBattery1() {
		return battery1;
	}

	public void setBattery1(String battery1) {
		this.battery1 = battery1;
	}

	public String getLugDate1() {
		return lugDate1;
	}

	public void setLugDate1(String lugDate1) {
		this.lugDate1 = lugDate1;
	}

	public String getBattery2() {
		return battery2;
	}

	public void setBattery2(String battery2) {
		this.battery2 = battery2;
	}

	public String getLugDate2() {
		return lugDate2;
	}

	public void setLugDate2(String lugDate2) {
		this.lugDate2 = lugDate2;
	}

	public String getBattery3() {
		return battery3;
	}

	public void setBattery3(String battery3) {
		this.battery3 = battery3;
	}

	public String getLugDate3() {
		return lugDate3;
	}

	public void setLugDate3(String lugDate3) {
		this.lugDate3 = lugDate3;
	}

	public String getBattery4() {
		return battery4;
	}

	public void setBattery4(String battery4) {
		this.battery4 = battery4;
	}

	public String getLugDate4() {
		return lugDate4;
	}

	public void setLugDate4(String lugDate4) {
		this.lugDate4 = lugDate4;
	}

	public String getBattery5() {
		return battery5;
	}

	public void setBattery5(String battery5) {
		this.battery5 = battery5;
	}

	public String getLugDate5() {
		return lugDate5;
	}

	public void setLugDate5(String lugDate5) {
		this.lugDate5 = lugDate5;
	}

	public String getBattery6() {
		return battery6;
	}

	public void setBattery6(String battery6) {
		this.battery6 = battery6;
	}

	public String getLugDate6() {
		return lugDate6;
	}

	public void setLugDate6(String lugDate6) {
		this.lugDate6 = lugDate6;
	}

	public String getBattery7() {
		return battery7;
	}

	public void setBattery7(String battery7) {
		this.battery7 = battery7;
	}

	public String getLugDate7() {
		return lugDate7;
	}

	public void setLugDate7(String lugDate7) {
		this.lugDate7 = lugDate7;
	}

	public String getBattery8() {
		return battery8;
	}

	public void setBattery8(String battery8) {
		this.battery8 = battery8;
	}

	public String getLugDate8() {
		return lugDate8;
	}

	public void setLugDate8(String lugDate8) {
		this.lugDate8 = lugDate8;
	}

	public String getBattery9() {
		return battery9;
	}

	public void setBattery9(String battery9) {
		this.battery9 = battery9;
	}

	public String getLugDate9() {
		return lugDate9;
	}

	public void setLugDate9(String lugDate9) {
		this.lugDate9 = lugDate9;
	}

	public String getBatteryCommisionedActual() {
		return batteryCommisionedActual;
	}

	public void setBatteryCommisionedActual(String batteryCommisionedActual) {
		this.batteryCommisionedActual = batteryCommisionedActual;
	}

	public String getLeadAcidBatteryMake() {
		return leadAcidBatteryMake;
	}

	public void setLeadAcidBatteryMake(String leadAcidBatteryMake) {
		this.leadAcidBatteryMake = leadAcidBatteryMake;
	}

	public String getLeadAcidBatteryMake1() {
		return leadAcidBatteryMake1;
	}

	public void setLeadAcidBatteryMake1(String leadAcidBatteryMake1) {
		this.leadAcidBatteryMake1 = leadAcidBatteryMake1;
	}

	public String getLeadAcidBatteryLugDate1() {
		return leadAcidBatteryLugDate1;
	}

	public void setLeadAcidBatteryLugDate1(String leadAcidBatteryLugDate1) {
		this.leadAcidBatteryLugDate1 = leadAcidBatteryLugDate1;
	}

	public String getLeadAcidBatteryMake2() {
		return leadAcidBatteryMake2;
	}

	public void setLeadAcidBatteryMake2(String leadAcidBatteryMake2) {
		this.leadAcidBatteryMake2 = leadAcidBatteryMake2;
	}

	public String getLeadAcidBatteryLugDate2() {
		return leadAcidBatteryLugDate2;
	}

	public void setLeadAcidBatteryLugDate2(String leadAcidBatteryLugDate2) {
		this.leadAcidBatteryLugDate2 = leadAcidBatteryLugDate2;
	}

	public String getLeadAcidBatteryMake3() {
		return leadAcidBatteryMake3;
	}

	public void setLeadAcidBatteryMake3(String leadAcidBatteryMake3) {
		this.leadAcidBatteryMake3 = leadAcidBatteryMake3;
	}

	public String getLeadAcidBatteryLugDate3() {
		return leadAcidBatteryLugDate3;
	}

	public void setLeadAcidBatteryLugDate3(String leadAcidBatteryLugDate3) {
		this.leadAcidBatteryLugDate3 = leadAcidBatteryLugDate3;
	}

	public String getLeadAcidBatteryActual() {
		return leadAcidBatteryActual;
	}

	public void setLeadAcidBatteryActual(String leadAcidBatteryActual) {
		this.leadAcidBatteryActual = leadAcidBatteryActual;
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



	public String getElectricalDocDate() {
		return electricalDocDate;
	}



	public void setElectricalDocDate(String electricalDocDate) {
		this.electricalDocDate = electricalDocDate;
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
	

}
