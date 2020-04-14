package struts.action.master;
import org.hibernate.Session;

import beans.FurnishingTransaction;
import beans.PaintTransaction;
import beans.ShellTransaction;
import beans.BogiesetTransaction;
import hibernateConnect.HibernateConfig;
public class ShowQCIData {
	private String furnishingAssetId;
	private String coachNumber;
	private String formDocNoOCI;
	private String formRevNoQCI;
	private String furnishingNo;
	private String shellNumber;
	private String bogieNopp;
	private String bogieNoNpp;
	private String bookedRly;
	private String bookedDiv;
	public String showQCIData()
	{
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
	
	formDocNoOCI="MCF/RBL/QMF 2010";
	formRevNoQCI="00";
	
	Session session=null;
	try
	{
	session=HibernateConfig.getSession();
	FurnishingTransaction furnishingTransaction= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
	coachNumber=furnishingTransaction.getCoachNumber();
	bookedRly=furnishingTransaction.getDispatchRly();
	bookedDiv=furnishingTransaction.getDispatchDiv();
	Integer paintId=furnishingTransaction.getPaintAssetId();
	PaintTransaction paintTransaction=(PaintTransaction) session.get(PaintTransaction.class, paintId);
	furnishingNo = paintTransaction.getFurnishingNumber();
	
	Integer shellId=furnishingTransaction.getShellAssetId();
	ShellTransaction shellTransaction=(ShellTransaction) session.get(ShellTransaction.class, shellId);
	shellNumber=shellTransaction.getShellNumber();
	Integer bogiePPId=furnishingTransaction.getBogiePpSideAssetId();
	BogiesetTransaction b1 = (BogiesetTransaction) session.get(BogiesetTransaction.class, bogiePPId);
	bogieNopp=b1.getBogieNumber();
	Integer bogieNPPId=furnishingTransaction.getBogieNppSideAssetId();
	BogiesetTransaction b2 = (BogiesetTransaction) session.get(BogiesetTransaction.class, bogieNPPId);
	bogieNoNpp=b2.getBogieNumber();
	
	
	
	return "success";
	}
	catch(Exception Ex)
	{
		Ex.printStackTrace();
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
	public String getCoachNumber() {
		return coachNumber;
	}
	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
	}
	public String getFormDocNoOCI() {
		return formDocNoOCI;
	}
	public void setFormDocNoOCI(String formDocNoOCI) {
		this.formDocNoOCI = formDocNoOCI;
	}
	public String getFormRevNoQCI() {
		return formRevNoQCI;
	}
	public void setFormRevNoQCI(String formRevNoQCI) {
		this.formRevNoQCI = formRevNoQCI;
	}
	public String getFurnishingNo() {
		return furnishingNo;
	}
	public void setFurnishingNo(String furnishingNo) {
		this.furnishingNo = furnishingNo;
	}
	public String getShellNumber() {
		return shellNumber;
	}
	public void setShellNumber(String shellNumber) {
		this.shellNumber = shellNumber;
	}
	public String getBogieNopp() {
		return bogieNopp;
	}
	public void setBogieNopp(String bogieNopp) {
		this.bogieNopp = bogieNopp;
	}
	public String getBogieNoNpp() {
		return bogieNoNpp;
	}
	public void setBogieNoNpp(String bogieNoNpp) {
		this.bogieNoNpp = bogieNoNpp;
	}
	public String getBookedRly() {
		return bookedRly;
	}
	public void setBookedRly(String bookedRly) {
		this.bookedRly = bookedRly;
	}
	public String getBookedDiv() {
		return bookedDiv;
	}
	public void setBookedDiv(String bookedDiv) {
		this.bookedDiv = bookedDiv;
	}
		
}
