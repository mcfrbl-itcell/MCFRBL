package struts.action.master;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import dao.DaoSaveQCRA;
import beans.FurnishingTransaction;
import beans.QcraTrans;
import beans.QcraTransId;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveQCRA {
	private String furnishingAssetId;
	private String stageReference;
	private String docNoQcra;
	private String revNoQcra;
	private String dateOfDocQcra;
	private String coachNoQcra;
	private String dateOfTesting;
	private String shiftQcra;
	private String coachDispatchRly;
	private String coachDispatchDiv;  

	private String natureOfQc;
	private String assemblyDetail;
	private String componentNoReference;
	private String rectification;
	private String defectReportNo;
	private String defectReportDate;
	private String pointNoRectified;
	private String itemPointNo;
	private String pointNoNotRectified;
	private String observationRemark;

	
	public String saveData()
	{
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		Timestamp entryDate=new Timestamp(System.currentTimeMillis());
		Session session=null;
		session=HibernateConfig.getSession();
		FurnishingTransaction ft=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		ft.setCoachNumber(coachNoQcra);
		ft.setDispatchRly(coachDispatchRly);
		ft.setDispatchDiv(coachDispatchDiv);
		
		QcraTrans qt=new QcraTrans();
		QcraTransId id=new QcraTransId();
		id.setFurnishingAssetId(furnishingAssetIdAsInt);
		System.out.println("Furnishing id is :"+furnishingAssetIdAsInt+ "  &StageId " +stageReference);
		if(stageReference!=null)
		{
			if(!"".equals(stageReference))
			{
				id.setFurnishingTestStage(stageReference);
				qt.setId(id);
				qt.setDocNoQcra(docNoQcra);
				qt.setRevNoQcra(revNoQcra);
				if(dateOfDocQcra!=null) 
				{
					if(!"".equals(dateOfDocQcra))
					{
						qt.setDateOfDocQcra(DateUtil.convertToDate(dateOfDocQcra));
					}
				}
				if(dateOfTesting!=null) 
				{
					if(!"".equals(dateOfTesting))
					{
						qt.setDateOfTesting(DateUtil.convertToDate(dateOfTesting));
					}
				}	
				
				qt.setShifOfTesting(shiftQcra);
				qt.setNatureOfQc(natureOfQc);
				qt.setAssemblyDetail(assemblyDetail);		
				qt.setComponentNoReference(componentNoReference);
				qt.setRectification(rectification);
				qt.setDefectReportNo(defectReportNo);
				if(defectReportDate!=null) 
					{
				if(!"".equals(defectReportDate))	qt.setDefectReportDate(DateUtil.convertToDate(defectReportDate));
					}
				
				qt.setPointNoNotRectified(pointNoRectified);
				qt.setItemPointNo(itemPointNo);
				qt.setPointNoNotRectified(pointNoNotRectified);
				qt.setObservationRemark(observationRemark);
				qt.setEntryBy(userID);
				qt.setEntryTime(entryDate);
				
			}
		}
		
		try
		{
			DaoSaveQCRA dao=new DaoSaveQCRA();
			dao.saveData(ft,qt);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}

		
		return "success";
	}


	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}


	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}


	public String getStageReference() {
		return stageReference;
	}


	public void setStageReference(String stageReference) {
		this.stageReference = stageReference;
	}


	public String getDocNoQcra() {
		return docNoQcra;
	}


	public void setDocNoQcra(String docNoQcra) {
		this.docNoQcra = docNoQcra;
	}


	public String getRevNoQcra() {
		return revNoQcra;
	}


	public void setRevNoQcra(String revNoQcra) {
		this.revNoQcra = revNoQcra;
	}


	public String getDateOfDocQcra() {
		return dateOfDocQcra;
	}


	public void setDateOfDocQcra(String dateOfDocQcra) {
		this.dateOfDocQcra = dateOfDocQcra;
	}


	public String getCoachNoQcra() {
		return coachNoQcra;
	}


	public void setCoachNoQcra(String coachNoQcra) {
		this.coachNoQcra = coachNoQcra;
	}


	public String getDateOfTesting() {
		return dateOfTesting;
	}


	public void setDateOfTesting(String dateOfTesting) {
		this.dateOfTesting = dateOfTesting;
	}


	public String getShiftQcra() {
		return shiftQcra;
	}


	public void setShiftQcra(String shiftQcra) {
		this.shiftQcra = shiftQcra;
	}


	public String getCoachDispatchRly() {
		return coachDispatchRly;
	}


	public void setCoachDispatchRly(String coachDispatchRly) {
		this.coachDispatchRly = coachDispatchRly;
	}


	public String getCoachDispatchDiv() {
		return coachDispatchDiv;
	}


	public void setCoachDispatchDiv(String coachDispatchDiv) {
		this.coachDispatchDiv = coachDispatchDiv;
	}


	public String getNatureOfQc() {
		return natureOfQc;
	}


	public void setNatureOfQc(String natureOfQc) {
		this.natureOfQc = natureOfQc;
	}


	public String getAssemblyDetail() {
		return assemblyDetail;
	}


	public void setAssemblyDetail(String assemblyDetail) {
		this.assemblyDetail = assemblyDetail;
	}


	public String getComponentNoReference() {
		return componentNoReference;
	}


	public void setComponentNoReference(String componentNoReference) {
		this.componentNoReference = componentNoReference;
	}


	public String getRectification() {
		return rectification;
	}


	public void setRectification(String rectification) {
		this.rectification = rectification;
	}


	public String getDefectReportNo() {
		return defectReportNo;
	}


	public void setDefectReportNo(String defectReportNo) {
		this.defectReportNo = defectReportNo;
	}


	public String getDefectReportDate() {
		return defectReportDate;
	}


	public void setDefectReportDate(String defectReportDate) {
		this.defectReportDate = defectReportDate;
	}


	public String getPointNoRectified() {
		return pointNoRectified;
	}


	public void setPointNoRectified(String pointNoRectified) {
		this.pointNoRectified = pointNoRectified;
	}


	public String getItemPointNo() {
		return itemPointNo;
	}


	public void setItemPointNo(String itemPointNo) {
		this.itemPointNo = itemPointNo;
	}


	public String getPointNoNotRectified() {
		return pointNoNotRectified;
	}


	public void setPointNoNotRectified(String pointNoNotRectified) {
		this.pointNoNotRectified = pointNoNotRectified;
	}


	public String getObservationRemark() {
		return observationRemark;
	}


	public void setObservationRemark(String observationRemark) {
		this.observationRemark = observationRemark;
	}
	
	
}
