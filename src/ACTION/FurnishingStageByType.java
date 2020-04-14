package ACTION;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import beans.FurnishingTransaction;
import beans.PaintTransaction;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class FurnishingStageByType {
     private String furnishingId;
	//private String coachType;
	private String optionFields;
	private String docNo="MCF/RBL/QMF/7017";
	private String revCode="01";
	private String docDate="2019-01-16";
	private String furnishingNo;
	private String coachNo;
	private String shellNo;
	
	
	public String getStage()
	{
		Session session =  null;
		try
		{
		session = HibernateConfig.getSession();
		session.beginTransaction();
		
		Integer furnId=Integer.parseInt(furnishingId);
		FurnishingTransaction ft=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnId);
		String coachType=ft.getCoachType();
		coachNo=ft.getCoachNumber();
		Integer paintId=ft.getPaintAssetId();
		Integer shellId=ft.getShellAssetId();
		PaintTransaction pt=(PaintTransaction) session.get(PaintTransaction.class, paintId);
		furnishingNo=pt.getFurnishingNumber();
		ShellTransaction st=(ShellTransaction) session.get(ShellTransaction.class, shellId);
		shellNo=st.getShellNumber();
		Query queryForFurnishingStage= null;
		String queryString="select distinct substage_id, substage_description from public.furnishing_stage_master where coach_type='"+coachType+"' ";
		//System.out.println("Hey navin Query is: "+queryString);
		queryForFurnishingStage = session.createSQLQuery(queryString);	
		List<Object[]> rows = queryForFurnishingStage.list();
		optionFields= "<option value=''>Select</option>";
		
	
		for(Object[] row : rows)
		{
			
			String option="<option value="+row[0].toString()+">"+row[1].toString()+"</option>";
			optionFields=optionFields+option;
			
		}
		//System.out.println("Option field is : "+optionFields);
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

	

	public String getFurnishingId() {
		return furnishingId;
	}



	public void setFurnishingId(String furnishingId) {
		this.furnishingId = furnishingId;
	}



	public String getDocNo() {
		return docNo;
	}



	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}




	public String getRevCode() {
		return revCode;
	}



	public void setRevCode(String revCode) {
		this.revCode = revCode;
	}



	public String getDocDate() {
		return docDate;
	}



	public void setDocDate(String docDate) {
		this.docDate = docDate;
	}



	public String getFurnishingNo() {
		return furnishingNo;
	}



	public void setFurnishingNo(String furnishingNo) {
		this.furnishingNo = furnishingNo;
	}



	public String getCoachNo() {
		return coachNo;
	}



	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}



	public String getShellNo() {
		return shellNo;
	}



	public void setShellNo(String shellNo) {
		this.shellNo = shellNo;
	}



	public String getOptionFields() {
		return optionFields;
	}

	public void setOptionFields(String optionFields) {
		this.optionFields = optionFields;
	}
	
	
}
