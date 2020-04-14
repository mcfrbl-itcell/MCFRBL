
package struts.action.master;

import dao.DaoFiresmoke;
import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
//import beans.ShellUnderframeSipTrans;
import beans.FurnishingTransaction;
import beans.FiresmokeTestingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class  Savedataoffiresmoke
{
	
	private String furnishingAssetId;
	private String dateoffiresmoke;
	//private String shelltype;
	private String shiftfiresmoke;
	private String suppname;
	private String suppsystemnitrogenobs;
	private String suppsystemnitrogenrem;
	private String smokedetectorobs;
	private String smokedetectorrem;
	private String smoketestgensetaobs;
	private String smoketestgensetarem;
	private String smoketestgensetbobs;
	private String smoketestgensetbrem;
	private String heatdetectiongensetaobs;
	private String heatdetectiongensetarem;
	private String heatdetectiongensetbobs;
	private String heatdetectiongensetbrem;
	private String conditionpipelinesobs;
	private String conditionpipelinesrem;
	private String instructionstickersobs;
	private String instructionstickersrem;
	private String suppmanualobs;
	private String suppmanualrem;
	private String docnofiresmoke;
	
	//private String coachtype;
	private String coachno;
	
	

	public String savedata()
	{
		System.out.println("hii");
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		System.out.println("2");
	String userID=(String)httpSession.getAttribute("userid");
	Timestamp entryTime=new Timestamp(System.currentTimeMillis());
	FiresmokeTestingTransaction firesmokeTestingTransaction=new FiresmokeTestingTransaction();
	firesmokeTestingTransaction.setPressureOfNitrogenObservation(suppsystemnitrogenobs);
	firesmokeTestingTransaction.setPressureOfNitrogenRemark(suppsystemnitrogenrem);
	firesmokeTestingTransaction.setConditionPipelineObservation(conditionpipelinesobs);
	firesmokeTestingTransaction.setConditionPipelineRemark(conditionpipelinesrem);
	firesmokeTestingTransaction.setDocNoFiresmoke(docnofiresmoke);
	firesmokeTestingTransaction.setInstructionStickerObservation(instructionstickersobs);
	firesmokeTestingTransaction.setInstructionStickerRemark(instructionstickersrem);
	firesmokeTestingTransaction.setGensetAHeatDetectionObservation(heatdetectiongensetaobs);
	firesmokeTestingTransaction.setGensetAHeatDetectionRemark(heatdetectiongensetarem);
	firesmokeTestingTransaction.setGensetBHeatDetectionObservation(heatdetectiongensetbobs);
	firesmokeTestingTransaction.setGensetBHeatDetectionRemark(heatdetectiongensetbrem);
	//firesmokeTestingTransaction.setGensetBHeatDetectionRemark();
	firesmokeTestingTransaction.setGensetBSmokeTestObservation(smoketestgensetbobs);
	firesmokeTestingTransaction.setGensetBSmokeTestRemark(smoketestgensetbrem);
	firesmokeTestingTransaction.setGensetASmokeTestObservation(smoketestgensetaobs);
	firesmokeTestingTransaction.setGensetASmokeTestRemark(smoketestgensetarem);
	firesmokeTestingTransaction.setSmokeDetecotrPhysicalObservation(smokedetectorobs);
	firesmokeTestingTransaction.setSmokeDetecotrPhysicalRemark(smokedetectorrem);
	firesmokeTestingTransaction.setSuppressionSystemObservation(suppmanualobs);
	firesmokeTestingTransaction.setSuppressionSystemRemark(suppmanualrem);
	firesmokeTestingTransaction.setShiftFiresmoke(shiftfiresmoke);
	firesmokeTestingTransaction.setSupplierName(suppname);
	firesmokeTestingTransaction.setEntryBy(userID);
	firesmokeTestingTransaction.setEntryDate(entryTime);
	
	Integer furnishingAssetIdasint=Integer.parseInt(furnishingAssetId);
	
	firesmokeTestingTransaction.setFurnishingAssetId(furnishingAssetIdasint);
		if(!"".equals(dateoffiresmoke))
	{
			firesmokeTestingTransaction.setDateOfFiresmoke(DateUtil.convertToDate(dateoffiresmoke));
	}
	FurnishingTransaction furnishingTransaction=(FurnishingTransaction) session.get(FurnishingTransaction.class,furnishingAssetIdasint);
		
	furnishingTransaction.setFireSmokeTestingFlag(1);
	//furnishingTransaction.setShellType(shelltype);
	furnishingTransaction.setCoachNumber(coachno);
	//furnishingTransaction.setCoachType(coachtype);
			
		
		
		System.out.println("last!!");
		
		
		
		System.out.println("last1");
		try
		{	
			System.out.println(furnishingAssetId);
			DaoFiresmoke dao= new DaoFiresmoke();
			dao.saveDaoFiresmoke(furnishingTransaction,firesmokeTestingTransaction);
			//System.out.println(shellAssetIdAsInt);
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



	public String getDateoffiresmoke() {
		return dateoffiresmoke;
	}



	public void setDateoffiresmoke(String dateoffiresmoke) {
		this.dateoffiresmoke = dateoffiresmoke;
	}



	public String getShiftfiresmoke() {
		return shiftfiresmoke;
	}



	public void setShiftfiresmoke(String shiftfiresmoke) {
		this.shiftfiresmoke = shiftfiresmoke;
	}



	public String getSuppname() {
		return suppname;
	}



	public void setSuppname(String suppname) {
		this.suppname = suppname;
	}



	public String getSuppsystemnitrogenobs() {
		return suppsystemnitrogenobs;
	}



	public void setSuppsystemnitrogenobs(String suppsystemnitrogenobs) {
		this.suppsystemnitrogenobs = suppsystemnitrogenobs;
	}



	public String getSuppsystemnitrogenrem() {
		return suppsystemnitrogenrem;
	}



	public void setSuppsystemnitrogenrem(String suppsystemnitrogenrem) {
		this.suppsystemnitrogenrem = suppsystemnitrogenrem;
	}



	public String getSmokedetectorobs() {
		return smokedetectorobs;
	}



	public void setSmokedetectorobs(String smokedetectorobs) {
		this.smokedetectorobs = smokedetectorobs;
	}



	public String getSmokedetectorrem() {
		return smokedetectorrem;
	}



	public void setSmokedetectorrem(String smokedetectorrem) {
		this.smokedetectorrem = smokedetectorrem;
	}



	public String getSmoketestgensetaobs() {
		return smoketestgensetaobs;
	}



	public void setSmoketestgensetaobs(String smoketestgensetaobs) {
		this.smoketestgensetaobs = smoketestgensetaobs;
	}



	public String getSmoketestgensetarem() {
		return smoketestgensetarem;
	}



	public void setSmoketestgensetarem(String smoketestgensetarem) {
		this.smoketestgensetarem = smoketestgensetarem;
	}



	public String getSmoketestgensetbobs() {
		return smoketestgensetbobs;
	}



	public void setSmoketestgensetbobs(String smoketestgensetbobs) {
		this.smoketestgensetbobs = smoketestgensetbobs;
	}



	public String getSmoketestgensetbrem() {
		return smoketestgensetbrem;
	}



	public void setSmoketestgensetbrem(String smoketestgensetbrem) {
		this.smoketestgensetbrem = smoketestgensetbrem;
	}



	public String getHeatdetectiongensetaobs() {
		return heatdetectiongensetaobs;
	}



	public void setHeatdetectiongensetaobs(String heatdetectiongensetaobs) {
		this.heatdetectiongensetaobs = heatdetectiongensetaobs;
	}



	public String getHeatdetectiongensetarem() {
		return heatdetectiongensetarem;
	}



	public void setHeatdetectiongensetarem(String heatdetectiongensetarem) {
		this.heatdetectiongensetarem = heatdetectiongensetarem;
	}



	public String getHeatdetectiongensetbobs() {
		return heatdetectiongensetbobs;
	}



	public void setHeatdetectiongensetbobs(String heatdetectiongensetbobs) {
		this.heatdetectiongensetbobs = heatdetectiongensetbobs;
	}



	public String getHeatdetectiongensetbrem() {
		return heatdetectiongensetbrem;
	}



	public void setHeatdetectiongensetbrem(String heatdetectiongensetbrem) {
		this.heatdetectiongensetbrem = heatdetectiongensetbrem;
	}



	public String getConditionpipelinesobs() {
		return conditionpipelinesobs;
	}



	public void setConditionpipelinesobs(String conditionpipelinesobs) {
		this.conditionpipelinesobs = conditionpipelinesobs;
	}



	public String getConditionpipelinesrem() {
		return conditionpipelinesrem;
	}



	public void setConditionpipelinesrem(String conditionpipelinesrem) {
		this.conditionpipelinesrem = conditionpipelinesrem;
	}



	public String getInstructionstickersobs() {
		return instructionstickersobs;
	}



	public void setInstructionstickersobs(String instructionstickersobs) {
		this.instructionstickersobs = instructionstickersobs;
	}



	public String getInstructionstickersrem() {
		return instructionstickersrem;
	}



	public void setInstructionstickersrem(String instructionstickersrem) {
		this.instructionstickersrem = instructionstickersrem;
	}



	public String getSuppmanualobs() {
		return suppmanualobs;
	}



	public void setSuppmanualobs(String suppmanualobs) {
		this.suppmanualobs = suppmanualobs;
	}



	public String getSuppmanualrem() {
		return suppmanualrem;
	}



	public void setSuppmanualrem(String suppmanualrem) {
		this.suppmanualrem = suppmanualrem;
	}



	public String getDocnofiresmoke() {
		return docnofiresmoke;
	}



	public void setDocnofiresmoke(String docnofiresmoke) {
		this.docnofiresmoke = docnofiresmoke;
	}



	


	public String getCoachno() {
		return coachno;
	}



	public void setCoachno(String coachno) {
		this.coachno = coachno;
	}




		
}





	
	
		