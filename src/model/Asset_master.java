package model;

public class Asset_master implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	
	String asset_subtype;
	String asset_type;
	String asset_subtype_description;
	String asset_subtype_class;
	Float tare_weight;
	Integer seating_capacity;
	Integer sleeping_capacity;
	Integer luggage_capacity;
	Float max_length_body;
	Float max_width_body;
	Float max_height_rail_level;
	
	public Asset_master(){
		//default Constructor
	}
		public Asset_master(String asset_subtype, String asset_type, String asset_subtype_description,
			String asset_subtype_class, Float tare_weight, Integer seating_capacity, Integer sleeping_capacity,
			Integer luggage_capacity, Float max_length_body, Float max_width_body, Float max_height_rail_level) {
		super();
		this.asset_subtype = asset_subtype;
		this.asset_type = asset_type;
		this.asset_subtype_description = asset_subtype_description;
		this.asset_subtype_class = asset_subtype_class;
		this.tare_weight = tare_weight;
		this.seating_capacity = seating_capacity;
		this.sleeping_capacity = sleeping_capacity;
		this.luggage_capacity = luggage_capacity;
		this.max_length_body = max_length_body;
		this.max_width_body = max_width_body;
		this.max_height_rail_level = max_height_rail_level;
	}



	public String getAsset_subtype() {
		return asset_subtype;
	}

	public void setAsset_subtype(String asset_subtype) {
		this.asset_subtype = asset_subtype;
	}

	public String getAsset_type() {
		return asset_type;
	}

	public void setAsset_type(String asset_type) {
		this.asset_type = asset_type;
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

	public Float getTare_weight() {
		return tare_weight;
	}

	public void setTare_weight(Float tare_weight) {
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
	public Float getMax_length_body() {
		return max_length_body;
	}
	public void setMax_length_body(Float max_length_body) {
		this.max_length_body = max_length_body;
	}
	public Float getMax_width_body() {
		return max_width_body;
	}
	public void setMax_width_body(Float max_width_body) {
		this.max_width_body = max_width_body;
	}
	public Float getMax_height_rail_level() {
		return max_height_rail_level;
	}
	public void setMax_height_rail_level(Float max_height_rail_level) {
		this.max_height_rail_level = max_height_rail_level;
	}
	
}