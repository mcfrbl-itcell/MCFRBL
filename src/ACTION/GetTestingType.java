package ACTION;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import beans.FurnishingTransaction;
import hibernateConnect.HibernateConfig;

public class GetTestingType {
  private String furnishingAssetId;
  private List<String> testingTypes;
  private String coachType;
	public String getTesting()
	{
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		Query query=null;
		Session session =  null;
		try
		{
		session = HibernateConfig.getSession();
		session.beginTransaction();
		query= session.createSQLQuery("select electrical_testing_type from public.elect_test_transaction_primary_data where asset_id="+furnishingAssetIdAsInt+" ");
		testingTypes=query.list();
		FurnishingTransaction ft= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		coachType=ft.getCoachType();
		return "success";
		}
	
	catch(Exception ex)
	{
		ex.printStackTrace();
		return null;
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
	public List<String> getTestingTypes() {
		return testingTypes;
	}
	public void setTestingTypes(List<String> testingTypes) {
		this.testingTypes = testingTypes;
	}
	public String getCoachType() {
		return coachType;
	}
	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}
	
}
