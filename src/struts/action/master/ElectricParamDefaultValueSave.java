package struts.action.master;
import dao.DaoElectricParameterValue;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import beans.ElectTestTransaction;
import beans.ElectTestTransactionId;

import hibernateConnect.HibernateConfig;

public class ElectricParamDefaultValueSave extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	public String AssetId;
	 public String coachtype;
	 public String testingtype;
	 public String paraName;
	 public String subPara;
	 public String columnName;
	 public String fieldValue;
	
	public String saveElecParamDefaultValue()
	{
		System.out.println("asset id"+AssetId);
		System.out.println("coach type"+coachtype);
		System.out.println("testing type"+testingtype);
		System.out.println("parameter"+paraName);
		System.out.println("coloumn"+columnName);
		System.out.println("value"+fieldValue);
		
		Session session=null;
		session=HibernateConfig.getSession();
		//HttpSession httpSession=ServletActionContext.getRequest().getSession();
				if(subPara.equals("")){
					ElectTestTransactionId electricalParameterKey= new ElectTestTransactionId();
					ElectTestTransaction electricalParameter= new ElectTestTransaction();
					
					
					Integer AssetIdAsInt=Integer.parseInt(AssetId);
					electricalParameterKey.setFurnishingAssetId(AssetIdAsInt);
					
					electricalParameterKey.setCoachType(coachtype);
					
					electricalParameterKey.setTestingType(testingtype);
					electricalParameterKey.setParaName(paraName);
					
						electricalParameterKey.setSubPara("0");
						electricalParameter.setId(electricalParameterKey);
						
						if(columnName.equals("observed_value"))
						{
						electricalParameter.setObservedValue(fieldValue);
						ElectTestTransaction et= (ElectTestTransaction) session.get(ElectTestTransaction.class, electricalParameterKey);
						if(et!=null)
						{
							electricalParameter.setRemarks(et.getRemarks());
						}
						
						}
						else if(columnName.equals("remarks"))
						{
						electricalParameter.setRemarks(fieldValue);
						ElectTestTransaction et= (ElectTestTransaction) session.get(ElectTestTransaction.class, electricalParameterKey);
						if(et!=null)
						{
							electricalParameter.setObservedValue(et.getObservedValue());
							
						}
			
						}
						
						try
						{	
							
							DaoElectricParameterValue dao= new DaoElectricParameterValue();
							dao.saveElectricParameterValue(electricalParameter);
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
				else
					{
						ElectTestTransactionId electricalParameterKey= new ElectTestTransactionId();
						ElectTestTransaction electricalParameter= new ElectTestTransaction();
						
						
						Integer AssetIdAsInt=Integer.parseInt(AssetId);
						electricalParameterKey.setFurnishingAssetId(AssetIdAsInt);
						
						electricalParameterKey.setCoachType(coachtype);
						
						electricalParameterKey.setTestingType(testingtype);
						electricalParameterKey.setParaName(paraName);
						
						electricalParameterKey.setSubPara(subPara);
						electricalParameter.setId(electricalParameterKey);
						
						if(columnName.equals("observed_value"))
						{
						electricalParameter.setObservedValue(fieldValue);
						ElectTestTransaction et= (ElectTestTransaction) session.get(ElectTestTransaction.class, electricalParameterKey);
						if(et!=null)
						{
							electricalParameter.setRemarks(et.getRemarks());
						}
						
						}
						else if(columnName.equals("remarks"))
						{
						electricalParameter.setRemarks(fieldValue);
						ElectTestTransaction et= (ElectTestTransaction) session.get(ElectTestTransaction.class, electricalParameterKey);
						if(et!=null)
						{
							electricalParameter.setObservedValue(et.getObservedValue());
							
						}
			
						}
						
						try
						{	
							
							DaoElectricParameterValue dao= new DaoElectricParameterValue();
							dao.saveElectricParameterValue(electricalParameter);
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
		
	}
	public String getAssetId() {
		return AssetId;
	}
	public void setAssetId(String assetId) {
		AssetId = assetId;
	}
	public String getCoachtype() {
		return coachtype;
	}
	public void setCoachtype(String coachtype) {
		this.coachtype = coachtype;
	}
	public String getTestingtype() {
		return testingtype;
	}
	public void setTestingtype(String testingtype) {
		this.testingtype = testingtype;
	}
	public String getParaName() {
		return paraName;
	}
	public void setParaName(String paraName) {
		this.paraName = paraName;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getFieldValue() {
		return fieldValue;
	}
	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}
	public String getSubPara() {
		return subPara;
	}
	public void setSubPara(String subPara) {
		this.subPara = subPara;
	}
	
	
		
}
