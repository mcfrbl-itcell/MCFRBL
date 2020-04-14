package ACTION;

import java.util.LinkedHashMap;


import java.util.List;
import java.util.Map;


import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import org.hibernate.criterion.Restrictions;


import hibernateConnect.HibernateConfig;
import beans.ShellTransaction;

public class ShellCompReport {
	private Map<Integer,String> shellnoEndWallList;
	private Map<Integer,String> shellnoLavSideWallList;
	private Map<Integer,String> shellnoUnderFrameList;
	private Map<Integer,String> shellnoSideWallList;
	private Map<Integer,String> shellnoRoofList;
	private List<String> railway;
	public Map<Integer, String> getShellnoEndWallList() {
		return shellnoEndWallList;
	}

	public void setShellnoEndWallList(Map<Integer, String> shellnoEndWallList) {
		this.shellnoEndWallList = shellnoEndWallList;
	}

	public Map<Integer, String> getShellnoLavSideWallList() {
		return shellnoLavSideWallList;
	}


	public void setShellnoLavSideWallList(Map<Integer, String> shellnoLavSideWallList) {
		this.shellnoLavSideWallList = shellnoLavSideWallList;
	}

	public Map<Integer, String> getShellnoUnderFrameList() {
		return shellnoUnderFrameList;
	}

	public void setShellnoUnderFrameList(Map<Integer, String> shellnoUnderFrameList) {
		this.shellnoUnderFrameList = shellnoUnderFrameList;
	}
	public Map<Integer, String> getShellnoSideWallList() {
		return shellnoSideWallList;
	}
	public void setShellnoSideWallList(Map<Integer, String> shellnoSideWallList) {
		this.shellnoSideWallList = shellnoSideWallList;
	}
	public Map<Integer, String> getShellnoRoofList() {
		return shellnoRoofList;
	}

	public void setShellnoRoofList(Map<Integer, String> shellnoRoofList) {
		this.shellnoRoofList = shellnoRoofList;
	}
	
	
	@SuppressWarnings("unchecked")
	public String getAssetType()
	{
		Session session =  null;
	
	session = HibernateConfig.getSession();
	
		try {
            //Shell Component code
			Criteria cr4 = session.createCriteria(ShellTransaction.class);
			cr4.addOrder(Order.asc("shellNumber"));
			cr4.add(Restrictions.eq("endwallSipFlag", 1));	
			List<ShellTransaction> obj4=cr4.list();
			//abnormalityList=new ArrayList<String>();
			shellnoEndWallList= new LinkedHashMap<Integer,String>();
			for(ShellTransaction a:obj4)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				
				
				shellnoEndWallList.put(a.getShellAssetId(),a.getShellNumber());
				
			}
			
			
			Criteria cr5 = session.createCriteria(ShellTransaction.class);
			cr5.addOrder(Order.asc("shellNumber"));
			cr5.add(Restrictions.eq("lavsidewallSipFlag", 1));	
			List<ShellTransaction> obj5=cr5.list();
			//abnormalityList=new ArrayList<String>();
			shellnoLavSideWallList= new LinkedHashMap<Integer,String>();
			for(ShellTransaction a:obj5)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				shellnoLavSideWallList.put(a.getShellAssetId(),a.getShellNumber());
			}
			
			
			
			Criteria cr6 = session.createCriteria(ShellTransaction.class);
			cr6.addOrder(Order.asc("shellNumber"));
			cr6.add(Restrictions.eq("underframeSipFlag", 1));	
			List<ShellTransaction> obj6=cr6.list();
			//abnormalityList=new ArrayList<String>();
			shellnoUnderFrameList= new LinkedHashMap<Integer,String>();
			for(ShellTransaction a:obj6)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				shellnoUnderFrameList.put(a.getShellAssetId(),a.getShellNumber());
			}
			
			
			
			Criteria cr7= session.createCriteria(ShellTransaction.class);
			cr7.addOrder(Order.asc("shellNumber"));
			cr7.add(Restrictions.eq("sidewallSipFlag", 1));	
			List<ShellTransaction> obj7=cr7.list();
			//abnormalityList=new ArrayList<String>();
			shellnoSideWallList= new LinkedHashMap<Integer,String>();
			for(ShellTransaction a:obj7)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				shellnoSideWallList.put(a.getShellAssetId(),a.getShellNumber());
			}
			
			
			Criteria cr8 = session.createCriteria(ShellTransaction.class);
			cr8.addOrder(Order.asc("shellNumber"));
			cr8.add(Restrictions.eq("roofSipFlag", 1));	
			List<ShellTransaction> obj8=cr8.list();
			//abnormalityList=new ArrayList<String>();
			shellnoRoofList= new LinkedHashMap<Integer,String>();
			for(ShellTransaction a:obj8)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				shellnoRoofList.put(a.getShellAssetId(),a.getShellNumber());
			}
			
		
			
			  Query query=null;
			  query= session.createSQLQuery("select railway_code from public.railway_master");
			  railway=  (List<String>)query.list();
			
			//end of query
		
			return "success";
		} 
		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{session.close(); }
	
	
 }

	public List<String> getRailway() {
		return railway;
	}

	public void setRailway(List<String> railway) {
		this.railway = railway;
	}
}
