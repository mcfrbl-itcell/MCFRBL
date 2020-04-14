package ACTION;

import org.hibernate.Session;

import beans.FurnishingTransaction;
import beans.QcraTrans;
import beans.QcraTransId;
import hibernateConnect.HibernateConfig;

public class GetQCRA {
    private String stage;
    private String furnishingId;
    private QcraTrans qcra;
    private String dispatchRly;
    private String dispatchDiv;
	public String getData1()
	{
		
		Integer furnishingAssetId=Integer.parseInt(furnishingId);
		Session session=null;
		session=HibernateConfig.getSession();
		session.beginTransaction();
		try
		{
	QcraTransId id=new QcraTransId();
	id.setFurnishingAssetId(furnishingAssetId);
	id.setFurnishingTestStage(stage);
	System.out.println("Furnishing Id :"+furnishingAssetId);
	System.out.println("Stage :"+stage);
	 qcra=(QcraTrans) session.get(QcraTrans.class, id);
	 System.out.println("qcra object retrieve");
	 
	 FurnishingTransaction ft=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetId);
	 dispatchRly=ft.getDispatchRly();
	 dispatchDiv=ft.getDispatchDiv();
	 System.out.println("Railway "+dispatchRly);
	 System.out.println("Division "+dispatchDiv);
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
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public String getFurnishingId() {
		return furnishingId;
	}
	public void setFurnishingId(String furnishingId) {
		this.furnishingId = furnishingId;
	}
	public QcraTrans getQcra() {
		return qcra;
	}
	public void setQcra(QcraTrans qcra) {
		this.qcra = qcra;
	}
	public String getDispatchRly() {
		return dispatchRly;
	}
	public void setDispatchRly(String dispatchRly) {
		this.dispatchRly = dispatchRly;
	}
	public String getDispatchDiv() {
		return dispatchDiv;
	}
	public void setDispatchDiv(String dispatchDiv) {
		this.dispatchDiv = dispatchDiv;
	}
    
}
