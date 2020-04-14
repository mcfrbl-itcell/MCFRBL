package struts.action.master;
import java.util.Date;

import org.hibernate.Session;
import dao.DaoQCI;

import beans.QciAirBrakeTrans;
import beans.QciFPvcTrans;
import beans.FurnishingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveAirBrake {
	private String furnishingAssetId;
	private String releasingDeviceChuckLoose;
	private String releasingDeviceRodFitted;
	private String brakeIndicatorFitted;
	private String airHosepipeAngleCookLoose;
	private String emergencyPullboxCoverFitted;
	private String lavatoryAirPipeClampFitted;
	private String alarmPipeClampFitted;
	private String testingObservationRemark;
	
	public String saveData9()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		
		QciAirBrakeTrans qciAirBrakeTransSave=new QciAirBrakeTrans();
		QciAirBrakeTrans qciAirBrakeTrans= (QciAirBrakeTrans) session.get(QciAirBrakeTrans.class, furnishingAssetIdAsInt);
		
		
		
		
		QciFPvcTrans qciFPvcTransSave= new QciFPvcTrans();
		QciFPvcTrans qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		if(qciFPvcTrans!=null){
		qciFPvcTrans.setQciAirBrakeFlag(1);
		
		
		}
		else
		{
			
			qciFPvcTransSave.setQciAirBrakeFlag(1);
			qciFPvcTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
		}
		
		if(qciAirBrakeTrans!=null){
		
			qciAirBrakeTrans.setReleasingDeviceChuckLoose(releasingDeviceChuckLoose);
			qciAirBrakeTrans.setReleasingDeviceRodFitted(releasingDeviceRodFitted);
			qciAirBrakeTrans.setBrakeIndicatorFitted(brakeIndicatorFitted);
			qciAirBrakeTrans.setAirHosepipeAngleCookLoose(airHosepipeAngleCookLoose);
			qciAirBrakeTrans.setEmergencyPullboxCoverFitted(emergencyPullboxCoverFitted);
			qciAirBrakeTrans.setLavatoryAirPipeClampFitted(lavatoryAirPipeClampFitted);
			qciAirBrakeTrans.setAlarmPipeClampFitted(alarmPipeClampFitted);
			qciAirBrakeTrans.setTestingObservationRemark(testingObservationRemark);
			
			}
			else{
				qciAirBrakeTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);	
				qciAirBrakeTransSave.setReleasingDeviceChuckLoose(releasingDeviceChuckLoose);
				qciAirBrakeTransSave.setReleasingDeviceRodFitted(releasingDeviceRodFitted);
				qciAirBrakeTransSave.setBrakeIndicatorFitted(brakeIndicatorFitted);
				qciAirBrakeTransSave.setAirHosepipeAngleCookLoose(airHosepipeAngleCookLoose);
				qciAirBrakeTransSave.setEmergencyPullboxCoverFitted(emergencyPullboxCoverFitted);
				qciAirBrakeTransSave.setLavatoryAirPipeClampFitted(lavatoryAirPipeClampFitted);
				qciAirBrakeTransSave.setAlarmPipeClampFitted(alarmPipeClampFitted);
				qciAirBrakeTransSave.setTestingObservationRemark(testingObservationRemark);
				
			}
			
	
	
		//end of code
			try
			{
				DaoQCI dao=new DaoQCI();
				dao.saveData9(qciAirBrakeTrans, qciFPvcTrans, qciFPvcTransSave, qciAirBrakeTransSave);
				System.out.println(releasingDeviceChuckLoose);
				System.out.println(releasingDeviceRodFitted);
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
	public String getReleasingDeviceChuckLoose() {
		return releasingDeviceChuckLoose;
	}
	public void setReleasingDeviceChuckLoose(String releasingDeviceChuckLoose) {
		this.releasingDeviceChuckLoose = releasingDeviceChuckLoose;
	}
	public String getReleasingDeviceRodFitted() {
		return releasingDeviceRodFitted;
	}
	public void setReleasingDeviceRodFitted(String releasingDeviceRodFitted) {
		this.releasingDeviceRodFitted = releasingDeviceRodFitted;
	}
	public String getBrakeIndicatorFitted() {
		return brakeIndicatorFitted;
	}
	public void setBrakeIndicatorFitted(String brakeIndicatorFitted) {
		this.brakeIndicatorFitted = brakeIndicatorFitted;
	}
	public String getAirHosepipeAngleCookLoose() {
		return airHosepipeAngleCookLoose;
	}
	public void setAirHosepipeAngleCookLoose(String airHosepipeAngleCookLoose) {
		this.airHosepipeAngleCookLoose = airHosepipeAngleCookLoose;
	}
	public String getEmergencyPullboxCoverFitted() {
		return emergencyPullboxCoverFitted;
	}
	public void setEmergencyPullboxCoverFitted(String emergencyPullboxCoverFitted) {
		this.emergencyPullboxCoverFitted = emergencyPullboxCoverFitted;
	}
	public String getLavatoryAirPipeClampFitted() {
		return lavatoryAirPipeClampFitted;
	}
	public void setLavatoryAirPipeClampFitted(String lavatoryAirPipeClampFitted) {
		this.lavatoryAirPipeClampFitted = lavatoryAirPipeClampFitted;
	}
	public String getAlarmPipeClampFitted() {
		return alarmPipeClampFitted;
	}
	public void setAlarmPipeClampFitted(String alarmPipeClampFitted) {
		this.alarmPipeClampFitted = alarmPipeClampFitted;
	}
	public String getTestingObservationRemark() {
		return testingObservationRemark;
	}
	public void setTestingObservationRemark(String testingObservationRemark) {
		this.testingObservationRemark = testingObservationRemark;
	}
	
}
