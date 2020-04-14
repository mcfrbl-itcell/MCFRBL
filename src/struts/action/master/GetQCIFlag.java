package struts.action.master;
import org.hibernate.Session;

import beans.QciFPvcTrans;
import hibernateConnect.HibernateConfig;
public class GetQCIFlag {

	private QciFPvcTrans qciFPvcTrans;
	private String furnishingAssetId;
	public String getFlag()
	{
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		Session session=null;
		try
		{
			session=HibernateConfig.getSession();
			qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
			
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
	public QciFPvcTrans getQciFPvcTrans() {
		return qciFPvcTrans;
	}
	public void setQciFPvcTrans(QciFPvcTrans qciFPvcTrans) {
		this.qciFPvcTrans = qciFPvcTrans;
	}
	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}
	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}
	
}
