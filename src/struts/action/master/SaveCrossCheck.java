package struts.action.master;


import org.hibernate.Session;
import dao.DaoCrossCheckin;
import beans.CrossCheckinTrans;
import hibernateConnect.HibernateConfig;

public class SaveCrossCheck {
	private String furnishingAssetId;
	private String textFpvc;
	private String textParitionFrame;
	private String textPanel;
	private String textWindowCelling;
	private String textMoulding;
	private String textSeatBerth;
	private String textLavatory;
	private String textPlumbing;
	private String textAirBrake;
	private String textCoachLowering;
	private String textPaint;
	private String textCoachCleaning;
	
	public String saveFpvc()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		
		
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		
		if(crossCheckinTransUpdate!=null){
			crossCheckinTransUpdate.setTextFpvc(textFpvc);
		}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextFpvc(textFpvc);
			
		}
	
		//end of code
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				return "success";
				
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
		}

	public String savePartitionFrame()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		System.out.println("Hi1");
		if(crossCheckinTransUpdate!=null){
			crossCheckinTransUpdate.setTextParitionFrame(textParitionFrame);
		}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextParitionFrame(textParitionFrame);
			
		}
		System.out.println("Hi1");
		//end of code
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				
				return "success";
				
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
	}
	public String savePanel()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		System.out.println("Hi1");
		if(crossCheckinTransUpdate!=null){
			//textPanel
			crossCheckinTransUpdate.setTextPanel(textPanel);
					}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextPanel(textPanel);
			
		}
		System.out.println("Hi1");
		//end of code
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				
				return "success";
				
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
	}
	public String saveWindowCelling()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		System.out.println("Hi1");
		if(crossCheckinTransUpdate!=null){
			//textPanel
			
			crossCheckinTransUpdate.setTextWindowCelling(textWindowCelling);
			//textWindowCelling
					}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextWindowCelling(textWindowCelling);
			
		}
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				
				return "success";
				
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}	
	}
	
	public String saveMoulding()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		System.out.println("Hi1");
		if(crossCheckinTransUpdate!=null){
			//textPanel
			
			crossCheckinTransUpdate.setTextMoulding(textMoulding);
			//textMoulding
					}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextMoulding(textMoulding);
			
		}
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				
				return "success";
				
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
	}
public String saveSeatBerth()
{
	Session session=null;
	session=HibernateConfig.getSession();
	Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
	System.out.println(":>");
	System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
	
	CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
	CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
	System.out.println("Hi1");
	if(crossCheckinTransUpdate!=null){
		//textPanel
		
		crossCheckinTransUpdate.setTextSeatBerth(textSeatBerth);
		
				}
	else
	{
		crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
		crossCheckinTransSave.setTextSeatBerth(textSeatBerth);
		
	}
		try
		{
			DaoCrossCheckin dao=new DaoCrossCheckin();
			dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}	
}
public String saveLavatory()
{
	Session session=null;
	session=HibernateConfig.getSession();
	Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
	System.out.println(":>");
	System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
	
	CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
	CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
	System.out.println("Hi1");
	if(crossCheckinTransUpdate!=null){
		//textLavatory
		
		crossCheckinTransUpdate.setTextLavatory(textLavatory);
		
				}
	else
	{
		crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
		crossCheckinTransSave.setTextLavatory(textLavatory);
		
	}
		try
		{
			DaoCrossCheckin dao=new DaoCrossCheckin();
			dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}		
}

  public String savePlumbing()
  {
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		System.out.println("Hi1");
		if(crossCheckinTransUpdate!=null){
			//textPlumbing
			
			crossCheckinTransUpdate.setTextPlumbing(textPlumbing);
			
					}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextPlumbing(textPlumbing);
			
		}
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				return "success";
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}	  
  }
	
  public String saveAirBrake()
  {
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		System.out.println("Hi1");
		if(crossCheckinTransUpdate!=null){
			//textAirBrake
			
			crossCheckinTransUpdate.setTextAirBrake(textAirBrake);
			
					}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextAirBrake(textAirBrake);
			
		}
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				return "success";
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}	    
  }
  public String saveCoachLowering()
  {
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		System.out.println("Hi1");
		if(crossCheckinTransUpdate!=null){
			//textCoachLowering
			
			crossCheckinTransUpdate.setTextCoachLowering(textCoachLowering);
			
					}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextCoachLowering(textCoachLowering);
			
		}
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				return "success";
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}	
  }
  public String saveCoachPaint()
  {
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		System.out.println("Hi1");
		if(crossCheckinTransUpdate!=null){
			//textPaint
			
			crossCheckinTransUpdate.setTextPaint(textPaint);
			
					}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextPaint(textPaint);
			
		}
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				return "success";
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
  }
  public String saveCoachCleaning()
  {
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		System.out.println(":>");
		System.out.println("Furnishing asset id: "+furnishingAssetIdAsInt);
		
		CrossCheckinTrans crossCheckinTransSave=new CrossCheckinTrans();
		CrossCheckinTrans crossCheckinTransUpdate= (CrossCheckinTrans) session.get(CrossCheckinTrans.class, furnishingAssetIdAsInt);
		System.out.println("Hi1");
		if(crossCheckinTransUpdate!=null){
			//textCoachCleaning
			
			crossCheckinTransUpdate.setTextCoachCleaning(textCoachCleaning);
			
					}
		else
		{
			crossCheckinTransSave.setFurnishingAssetId(furnishingAssetIdAsInt);
			crossCheckinTransSave.setTextCoachCleaning(textCoachCleaning);
			
		}
			try
			{
				DaoCrossCheckin dao=new DaoCrossCheckin();
				dao.saveData(crossCheckinTransUpdate,crossCheckinTransSave);
				return "success";
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
  }
  
  
	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}


	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}


	public String getTextFpvc() {
		return textFpvc;
	}


	public void setTextFpvc(String textFpvc) {
		this.textFpvc = textFpvc;
	}

	public String getTextParitionFrame() {
		return textParitionFrame;
	}

	public void setTextParitionFrame(String textParitionFrame) {
		this.textParitionFrame = textParitionFrame;
	}

	public String getTextPanel() {
		return textPanel;
	}

	public void setTextPanel(String textPanel) {
		this.textPanel = textPanel;
	}

	public String getTextWindowCelling() {
		return textWindowCelling;
	}

	public void setTextWindowCelling(String textWindowCelling) {
		this.textWindowCelling = textWindowCelling;
	}

	public String getTextMoulding() {
		return textMoulding;
	}

	public void setTextMoulding(String textMoulding) {
		this.textMoulding = textMoulding;
	}

	public String getTextSeatBerth() {
		return textSeatBerth;
	}

	public void setTextSeatBerth(String textSeatBerth) {
		this.textSeatBerth = textSeatBerth;
	}

	public String getTextLavatory() {
		return textLavatory;
	}

	public void setTextLavatory(String textLavatory) {
		this.textLavatory = textLavatory;
	}

	public String getTextPlumbing() {
		return textPlumbing;
	}

	public void setTextPlumbing(String textPlumbing) {
		this.textPlumbing = textPlumbing;
	}

	public String getTextAirBrake() {
		return textAirBrake;
	}

	public void setTextAirBrake(String textAirBrake) {
		this.textAirBrake = textAirBrake;
	}

	public String getTextCoachLowering() {
		return textCoachLowering;
	}

	public void setTextCoachLowering(String textCoachLowering) {
		this.textCoachLowering = textCoachLowering;
	}

	public String getTextPaint() {
		return textPaint;
	}

	public void setTextPaint(String textPaint) {
		this.textPaint = textPaint;
	}

	public String getTextCoachCleaning() {
		return textCoachCleaning;
	}

	public void setTextCoachCleaning(String textCoachCleaning) {
		this.textCoachCleaning = textCoachCleaning;
	}


	}
