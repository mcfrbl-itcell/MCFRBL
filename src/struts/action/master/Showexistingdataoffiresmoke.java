package struts.action.master;
import org.hibernate.Session;


import beans.FurnishingTransaction;
import beans.PaintTransaction;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;


public class  Showexistingdataoffiresmoke{
	private String furnishingAssetId;
	private String docnofiresmoke;
	private String shelltype;
	private String shellno;
	private String coachtype;
	private String coachno;
	private String furno;
	
	
	public String fetchdata()
	{
		Integer furnishingAssetIdasint=Integer.parseInt(furnishingAssetId);
		docnofiresmoke="MCF/RBL/QMF 7002A Rev-01 dated-31-05-19";
		Session session=null;
		try
		{
			session=HibernateConfig.getSession();
			FurnishingTransaction furnishingTransaction=(FurnishingTransaction) session.get(FurnishingTransaction.class,furnishingAssetIdasint);
			
			coachtype=furnishingTransaction.getCoachType();
			coachno=furnishingTransaction.getCoachNumber();
					
			//shellno=furnishingTransaction.getShellAssetId();
			//furno
			
			Integer paintaseetid=furnishingTransaction.getPaintAssetId();
			PaintTransaction paintTransaction=(PaintTransaction) session.get(PaintTransaction.class,paintaseetid);
			furno=paintTransaction.getFurnishingNumber();
			Integer shellassetidasint=furnishingTransaction.getShellAssetId();
			System.out.println("shellassetid"+shellassetidasint);
			ShellTransaction shellTransaction=(ShellTransaction) session.get(ShellTransaction.class,shellassetidasint);
			shellno=shellTransaction.getShellNumber();
			shelltype=shellTransaction.getShellType();
			
			
			
			
			
			return "success";
			}
		catch(Exception e)
		{
			e.printStackTrace();
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


	

	public String getDocnofiresmoke() {
		return docnofiresmoke;
	}


	public void setDocnofiresmoke(String docnofiresmoke) {
		this.docnofiresmoke = docnofiresmoke;
	}


	public String getShelltype() {
		return shelltype;
	}


	public void setShelltype(String shelltype) {
		this.shelltype = shelltype;
	}


	public String getShellno() {
		return shellno;
	}


	public void setShellno(String shellno) {
		this.shellno = shellno;
	}


	public String getCoachtype() {
		return coachtype;
	}


	public void setCoachtype(String coachtype) {
		this.coachtype = coachtype;
	}


	public String getCoachno() {
		return coachno;
	}


	public void setCoachno(String coachno) {
		this.coachno = coachno;
	}


	public String getFurno() {
		return furno;
	}


	public void setFurno(String furno) {
		this.furno = furno;
	}

		
}
