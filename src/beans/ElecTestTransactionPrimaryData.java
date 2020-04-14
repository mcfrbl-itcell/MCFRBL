package beans;

import java.util.Date;

public class ElecTestTransactionPrimaryData implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public ElecTestTransactionPrimaryDataId key;
	public String electricalDocNo;
	public String testingShift;
	public Date testingDate;
	public String testingStatus;
	private String formHeading;
	private String docDate;
	
	
public ElecTestTransactionPrimaryData(){}



public ElecTestTransactionPrimaryData(ElecTestTransactionPrimaryDataId key, String electricalDocNo, String testingShift,
		Date testingDate, String testingStatus,String formHeading,String docDate) {
	super();
	this.key = key;
	this.electricalDocNo = electricalDocNo;
	this.testingShift = testingShift;
	this.testingDate = testingDate;
	this.testingStatus = testingStatus;
	this.formHeading=formHeading;
	this.docDate=docDate;
}



public ElecTestTransactionPrimaryDataId getKey() {
	return key;
}



public void setKey(ElecTestTransactionPrimaryDataId key) {
	this.key = key;
}



public String getElectricalDocNo() {
	return electricalDocNo;
}



public void setElectricalDocNo(String electricalDocNo) {
	this.electricalDocNo = electricalDocNo;
}



public String getTestingShift() {
	return testingShift;
}



public void setTestingShift(String testingShift) {
	this.testingShift = testingShift;
}



public Date getTestingDate() {
	return testingDate;
}



public void setTestingDate(Date testingDate) {
	this.testingDate = testingDate;
}



public String getTestingStatus() {
	return testingStatus;
}



public void setTestingStatus(String testingStatus) {
	this.testingStatus = testingStatus;
}



public static long getSerialversionuid() {
	return serialVersionUID;
}



public String getFormHeading() {
	return formHeading;
}



public void setFormHeading(String formHeading) {
	this.formHeading = formHeading;
}



public String getDocDate() {
	return docDate;
}



public void setDocDate(String docDate) {
	this.docDate = docDate;
}




}
