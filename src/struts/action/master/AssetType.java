package struts.action.master;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernateConnect.HibernateConfig;

public class AssetType {
	private List <String> assetTypes;
	
	public String getCategory()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Query query=null;
		try
		{
		query = session.createSQLQuery("SELECT distinct asset_type FROM public.asset_master where asset_type not in ('RollerBear', 'SheetMetal','Finishing') order by asset_type");
		/*List<Object[]> rowList1 =  query2.list();
		workingShop=new LinkedHashMap<String, String>();*/
		assetTypes=  (List<String>)query.list();
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

	public List<String> getAssetTypes() {
		return assetTypes;
	}

	public void setAssetTypes(List<String> assetTypes) {
		this.assetTypes = assetTypes;
	}
	
}
