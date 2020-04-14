package struts.action.master;

import org.hibernate.Session;

import beans.ElecTestTransactionPrimaryData;
import beans.ElecTestTransactionPrimaryDataId;
import beans.ElectBatteryTestTrans;
import beans.FurnishingTransaction;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class ShowExistingBatteryData {
	
	private String furnishingAssetId;
	private String testingType;
	private ElecTestTransactionPrimaryData elecTestTransactionPrimaryData;
	private FurnishingTransaction furnishingTransaction;
	private ShellTransaction shellTransaction;
	
	
	public String showBatteryData(){
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		int shellAssetId;
		try{
			
			 ElecTestTransactionPrimaryDataId elecTestTransactionPrimaryDataId=new ElecTestTransactionPrimaryDataId();
			elecTestTransactionPrimaryDataId.setElectricalAssetid(furnishingAssetIdAsInt);
			elecTestTransactionPrimaryDataId.setElectricalTestingType(testingType);
		
			elecTestTransactionPrimaryData=(ElecTestTransactionPrimaryData)session.get(ElecTestTransactionPrimaryData.class, elecTestTransactionPrimaryDataId);
			furnishingTransaction=(FurnishingTransaction) session.get(FurnishingTransaction.class,furnishingAssetIdAsInt);
			shellAssetId=furnishingTransaction.getShellAssetId();
			shellTransaction=(ShellTransaction) session.get(ShellTransaction.class, shellAssetId);
			
			
			
			return "success";
		}
		catch(Exception ex)
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

	public String getTestingType() {
		return testingType;
	}

	public void setTestingType(String testingType) {
		this.testingType = testingType;
	}

	public ElecTestTransactionPrimaryData getElecTestTransactionPrimaryData() {
		return elecTestTransactionPrimaryData;
	}

	public void setElecTestTransactionPrimaryData(ElecTestTransactionPrimaryData elecTestTransactionPrimaryData) {
		this.elecTestTransactionPrimaryData = elecTestTransactionPrimaryData;
	}

	public FurnishingTransaction getFurnishingTransaction() {
		return furnishingTransaction;
	}

	public void setFurnishingTransaction(FurnishingTransaction furnishingTransaction) {
		this.furnishingTransaction = furnishingTransaction;
	}

	public ShellTransaction getShellTransaction() {
		return shellTransaction;
	}

	public void setShellTransaction(ShellTransaction shellTransaction) {
		this.shellTransaction = shellTransaction;
	}

	
	
}

