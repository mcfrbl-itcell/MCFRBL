package beans;

public class CoachWarrantySplFeatures implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String coachType;
	private String specialFeatures;
	private String warranty;
public CoachWarrantySplFeatures()
{
	
}

public CoachWarrantySplFeatures(String coachType, String specialFeatures, String warranty) {
	super();
	this.coachType = coachType;
	this.specialFeatures = specialFeatures;
	this.warranty = warranty;
}

public String getCoachType() {
	return coachType;
}
public void setCoachType(String coachType) {
	this.coachType = coachType;
}
public String getSpecialFeatures() {
	return specialFeatures;
}
public void setSpecialFeatures(String specialFeatures) {
	this.specialFeatures = specialFeatures;
}
public String getWarranty() {
	return warranty;
}
public void setWarranty(String warranty) {
	this.warranty = warranty;
}

}
