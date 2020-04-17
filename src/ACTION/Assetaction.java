package ACTION;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.Asset_masterdao;
import java.io.IOException;
import model.Asset_master;
import java.util.List;
import java.util.Map;

public class Assetaction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  Asset_masterdao dao = new Asset_masterdao();
	
    private List<Asset_master> records;
	private String result;
	private String message;
	private Asset_master record;
	
	private Asset_master asset_master=new Asset_master();

	private String asset_type;
	private String asset_subtype;
	private String asset_subtype_description;
	private String asset_subtype_class;
	private String tare_weight;
    private Integer seating_capacity;
	private Integer sleeping_capacity;
	private Integer luggage_capacity;
	private String assetCategory;
	private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	private String max_length_body;
	private String max_width_body;
	private String max_height_rail_level;

	

	public String getJtStartIndex() {
		return jtStartIndex;
	}

	public void setJtStartIndex(String jtStartIndex) {
		this.jtStartIndex = jtStartIndex;
	}

	public String getJtPageSize() {
		return jtPageSize;
	}

	public void setJtPageSize(String jtPageSize) {
		this.jtPageSize = jtPageSize;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public Asset_masterdao getDao() {
		return dao;
	}

	public void setDao(Asset_masterdao dao) {
		this.dao = dao;
	}

	public Asset_master getAsset_master() {
		return asset_master;
	}

	public void setAsset_master(Asset_master asset_master) {
		this.asset_master = asset_master;
	}

	public List<Asset_master> getRecords() {
		return records;
	}

	public void setRecords(List<Asset_master> records) {
		this.records = records;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Asset_master getRecord() {
		return record;
	}

	public void setRecord(Asset_master record) {
		this.record = record;
	}

	

	public String getAsset_type() {
		return asset_type;
	}

	public void setAsset_type(String asset_type) {
		this.asset_type = asset_type;
	}

	public String getAsset_subtype() {
		return asset_subtype;
	}

	public void setAsset_subtype(String asset_subtype) {
		this.asset_subtype = asset_subtype;
	}

	public String getAsset_subtype_description() {
		return asset_subtype_description;
	}

	public void setAsset_subtype_description(String asset_subtype_description) {
		this.asset_subtype_description = asset_subtype_description;
	}

	public String getAsset_subtype_class() {
		return asset_subtype_class;
	}

	public void setAsset_subtype_class(String asset_subtype_class) {
		this.asset_subtype_class = asset_subtype_class;
	}

	
	public String getTare_weight() {
		return tare_weight;
	}

	public void setTare_weight(String tare_weight) {
		this.tare_weight = tare_weight;
	}
    
	public Integer getSeating_capacity() {
		return seating_capacity;
	}

	public void setSeating_capacity(Integer seating_capacity) {
		this.seating_capacity = seating_capacity;
	}

	public Integer getSleeping_capacity() {
		return sleeping_capacity;
	}

	public void setSleeping_capacity(Integer sleeping_capacity) {
		this.sleeping_capacity = sleeping_capacity;
	}

	public Integer getLuggage_capacity() {
		return luggage_capacity;
	}

	public void setLuggage_capacity(Integer luggage_capacity) {
		this.luggage_capacity = luggage_capacity;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	public String getMax_length_body() {
		return max_length_body;
	}

	public void setMax_length_body(String max_length_body) {
		this.max_length_body = max_length_body;
	}

	public String getMax_width_body() {
		return max_width_body;
	}

	public void setMax_width_body(String max_width_body) {
		this.max_width_body = max_width_body;
	}

	public String getMax_height_rail_level() {
		return max_height_rail_level;
	}

	public void setMax_height_rail_level(String max_height_rail_level) {
		this.max_height_rail_level = max_height_rail_level;
	}

	public String list() {
		try {
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(getDao().getAllasset_master(jtSorting,assetCategory, startPageIndex, numRecordsPerPage));
			totalRecordCount= (Integer) session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
			
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
   public String listCoach()
   {
	   try {
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(getDao().getCoachAsset_master(jtSorting, startPageIndex, numRecordsPerPage));
			totalRecordCount= (Integer) session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
			
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
   
   }
	
	public String create() throws IOException {
		
	    
		
		record = new Asset_master();
		
	    record.setAsset_subtype(asset_subtype);
		record.setAsset_type(asset_type);
		record.setAsset_subtype_description(asset_subtype_description);
		record.setAsset_subtype_class(asset_subtype_class);
		if(tare_weight!=null)
		{
			if(!"".equals(tare_weight))
			{
				
			Float tare_weightAsFloat= new Float(tare_weight);
			
			record.setTare_weight(tare_weightAsFloat);
		}
		
		}
		record.setSeating_capacity(seating_capacity);
		record.setSleeping_capacity(sleeping_capacity);
		record.setLuggage_capacity(luggage_capacity);
		
		if(max_length_body!=null)
		{
			if(!"".equals(max_length_body))
			{
				
			Float max_length_bodyAsFloat= new Float(max_length_body);
			
			record.setMax_length_body(max_length_bodyAsFloat);
		}
		
		}
		
		if(max_width_body!=null)
		{
			if(!"".equals(max_width_body))
			{
				
			Float max_width_bodyAsFloat= new Float(max_width_body);
			
			record.setMax_width_body(max_width_bodyAsFloat);
		}
		
		}
		
		if(max_height_rail_level!=null)
		{
			if(!"".equals(max_height_rail_level))
			{
				
			Float max_height_rail_levelAsFloat= new Float(max_height_rail_level);
			
			record.setMax_height_rail_level(max_height_rail_levelAsFloat);
		}
		
		}
	
		try {
						
			
			dao.addasset_master(record);
			setResult("OK");
		} 
		catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		
				return ActionSupport.SUCCESS;	
	}
		

	public String update() throws IOException {			
		record = new Asset_master();
		
	        record.setAsset_subtype(asset_subtype);
			record.setAsset_type(asset_type);
			record.setAsset_subtype_description(asset_subtype_description);
			record.setAsset_subtype_class(asset_subtype_class);
			if(tare_weight!=null)
			{
				if(!"".equals(tare_weight))
				{
					
				Float tare_weightAsFloat= new Float(tare_weight);
				
				record.setTare_weight(tare_weightAsFloat);
			}
			
			}
			record.setSeating_capacity(seating_capacity);
			record.setSleeping_capacity(sleeping_capacity);
			record.setLuggage_capacity(luggage_capacity);
			if(max_length_body!=null)
			{
				if(!"".equals(max_length_body))
				{
					
				Float max_length_bodyAsFloat= new Float(max_length_body);
				
				record.setMax_length_body(max_length_bodyAsFloat);
			}
			
			}
			
			if(max_width_body!=null)
			{
				if(!"".equals(max_width_body))
				{
					
				Float max_width_bodyAsFloat= new Float(max_width_body);
				
				record.setMax_width_body(max_width_bodyAsFloat);
			}
			
			}
			
			if(max_height_rail_level!=null)
			{
				if(!"".equals(max_height_rail_level))
				{
					
				Float max_height_rail_levelAsFloat= new Float(max_height_rail_level);
				
				record.setMax_height_rail_level(max_height_rail_levelAsFloat);
			}
			
			}

	
		try {
		    getDao().updateasset_master(record);;
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
	
	public String delete() throws IOException {
		try {
			
		getDao().deleteasset_master(asset_subtype,asset_type);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public String getAssetCategory() {
		return assetCategory;
	}

	public void setAssetCategory(String assetCategory) {
		this.assetCategory = assetCategory;
	}
	
}