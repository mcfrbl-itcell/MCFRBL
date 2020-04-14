package beans;

public class ElecTestTransactionPrimaryDataId implements java.io.Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer electricalAssetid;
	public String electricalTestingType;
	
	
	public ElecTestTransactionPrimaryDataId(){}
	
	public ElecTestTransactionPrimaryDataId(Integer electricalAssetid, String electricalTestingType) {
		super();
		this.electricalAssetid = electricalAssetid;
		this.electricalTestingType = electricalTestingType;
	}


	public Integer getElectricalAssetid() {
		return electricalAssetid;
	}


	public void setElectricalAssetid(Integer electricalAssetid) {
		this.electricalAssetid = electricalAssetid;
	}


	public String getElectricalTestingType() {
		return electricalTestingType;
	}


	public void setElectricalTestingType(String electricalTestingType) {
		this.electricalTestingType = electricalTestingType;
	}


	
	

}
