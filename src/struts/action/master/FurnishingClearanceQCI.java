package struts.action.master;
import beans.FurnishingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;
import org.hibernate.Session;
public class FurnishingClearanceQCI {
private String furnishingAssetId;
private String dateOfTest;
private String message;

public String saveClearance()
{
	Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
	Session session=null;
	
	//System.out.println("Hello "+furnishingAssetId);
	session=HibernateConfig.getSession();
	session.beginTransaction();
	try
	{
		
		FurnishingTransaction f=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		f.setQciTestingFlag(1);
		//System.out.println("Hello2 "+furnishingAssetId);
		
		if(!"".equals(dateOfTest))	
		{
			f.setQciTestingDate(DateUtil.convertToDate(dateOfTest));
			System.out.println("Hello3 "+dateOfTest);
			
		}
		session.update(f);
		//System.out.println("Hello4");
		session.getTransaction().commit();
		//System.out.println("Hello5");
		message="QCI Form submitted successfully.";
		//System.out.println("Hello6");
		return "success";
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
		message="QCI form not submitted properly. Please try after some time.";
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

public String getDateOfTest() {
	return dateOfTest;
}

public void setDateOfTest(String dateOfTest) {
	this.dateOfTest = dateOfTest;
}

public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

}
