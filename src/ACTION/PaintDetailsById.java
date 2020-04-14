package ACTION;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.PaintTransaction;
import hibernateConnect.HibernateConfig;

public class PaintDetailsById {

	private Integer paintAssetId;
	private String furnNo;
	public String getPaintDesc()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		try {
			
			

			
			Criteria cr1 = session.createCriteria(PaintTransaction.class);
			
			cr1.add(Restrictions.eq("paintAssetId", paintAssetId));
			
			PaintTransaction paintTransaction = (PaintTransaction)cr1.list().get(0);
			furnNo=paintTransaction.getFurnishingNumber();
			
		} catch (Exception e) {
			
			System.err.println(e.getMessage());
		}
		finally{
			session.close();
		}
		
		return "success";
	}
	public Integer getPaintAssetId() {
		return paintAssetId;
	}
	public void setPaintAssetId(Integer paintAssetId) {
		this.paintAssetId = paintAssetId;
	}
	public String getFurnNo() {
		return furnNo;
	}
	public void setFurnNo(String furnNo) {
		this.furnNo = furnNo;
	}
	
	
	
}
