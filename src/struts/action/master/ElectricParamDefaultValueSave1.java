package struts.action.master;
import dao.DaoSave1ElecParamDefaultValue;
import org.hibernate.Session;
import beans.ElecTestTransactionPrimaryData;
import beans.ElecTestTransactionPrimaryDataId;
import beans.FurnishingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class ElectricParamDefaultValueSave1 implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	public String AssetId ;
	public String testingtype;
	public String testDocNo;
	public String testingDate;
	public String testShift;
	public String testStatus;
	private String coachType;
	private String docDate;
	
	public String save1ElecParamDefaultValue(){
		
	System.out.println("Testing Doc No:>"+testDocNo);
		Session session=null;
		session=HibernateConfig.getSession();
		//HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String formHeading="INSPECTION REPORT FOR "+testingtype+" TESTING FOR "+coachType+" COACH";
		ElecTestTransactionPrimaryDataId elecTestTransactionPrimaryDataId= new ElecTestTransactionPrimaryDataId();
		ElecTestTransactionPrimaryData elecTestTransactionPrimaryData= new ElecTestTransactionPrimaryData();
		FurnishingTransaction furnishingTransaction=new FurnishingTransaction();
		
		Integer AssetIdAsInt=Integer.parseInt(AssetId);
		elecTestTransactionPrimaryDataId.setElectricalAssetid(AssetIdAsInt);
		elecTestTransactionPrimaryDataId.setElectricalTestingType(testingtype);
		
		elecTestTransactionPrimaryData.setKey(elecTestTransactionPrimaryDataId);
		elecTestTransactionPrimaryData.setElectricalDocNo(testDocNo);
		
		elecTestTransactionPrimaryData.setTestingShift(testShift);
		elecTestTransactionPrimaryData.setTestingStatus(testStatus);
		elecTestTransactionPrimaryData.setFormHeading(formHeading);
		elecTestTransactionPrimaryData.setDocDate(docDate);
		if(!"".equals(testingDate)){elecTestTransactionPrimaryData.setTestingDate(DateUtil.convertToDate(testingDate));}
		
		if(testingtype.equals("Electrical Stage-III"))
		{
		furnishingTransaction.setElectricalStage3Flag(1);
		}
		else if(testingtype.equals("Electrical Stage-IIIA"))
		{
		furnishingTransaction.setElectricalStage3aFlag(1);
		}
		else if(testingtype.equals("Electrical Stage-IX"))
		{
		furnishingTransaction.setElectricalStage9Flag(1);
		}
		else if(testingtype.equals("STAGE TESTING"))
		{
			furnishingTransaction.setElectricalStageTestingFlag(1);	
		}
		else if(testingtype.equals("WHEEL SLIDE PROTECTION SYSTEM"))
		{
			furnishingTransaction.setElectricalWheelSlideProtectionFlag(1);	
		}
		else if(testingtype.equals("FUNCTIONAL TEST"))
		{
			furnishingTransaction.setElectricalFunctionalFlag(1);	
		}
		else if(testingtype.equals("Rolling Stock Certificate"))
		{
			furnishingTransaction.setElectricalRollingStockFlag(1);	
		}
		try
		{	
			
			DaoSave1ElecParamDefaultValue dao= new DaoSave1ElecParamDefaultValue();
			dao.save1ElecParamDefaultValue(elecTestTransactionPrimaryData,furnishingTransaction);
			System.out.println(AssetIdAsInt);
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

	public String getAssetId() {
		return AssetId;
	}

	public void setAssetId(String assetId) {
		AssetId = assetId;
	}

	public String getTestingtype() {
		return testingtype;
	}

	public void setTestingtype(String testingtype) {
		this.testingtype = testingtype;
	}

	public String getTestDocNo() {
		return testDocNo;
	}

	public void setTestDocNo(String testDocNo) {
		this.testDocNo = testDocNo;
	}

	public String getTestingDate() {
		return testingDate;
	}

	public void setTestingDate(String testingDate) {
		this.testingDate = testingDate;
	}

	public String getTestShift() {
		return testShift;
	}

	public void setTestShift(String testShift) {
		this.testShift = testShift;
	}

	public String getTestStatus() {
		return testStatus;
	}

	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public String getDocDate() {
		return docDate;
	}

	public void setDocDate(String docDate) {
		this.docDate = docDate;
	}
	
}
