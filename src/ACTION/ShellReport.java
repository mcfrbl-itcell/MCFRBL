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



public class ShellReport {
	
	private Map<Integer,String> shellnoStageOneList;
    private Map<Integer,String> shellnoStageTwoList;
	private Map<Integer,String> shellnoStageThreeList;
	private Map<Integer,String> shellnoStageFourList;
	


	private List<String> railway;
	
	
	@SuppressWarnings("unchecked")
	public String getAssetType()
	{
		Session session =  null;
	
	session = HibernateConfig.getSession();
	
		try {

		    Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.addOrder(Order.asc("shellNumber"));
			cr.add(Restrictions.eq("stage1SipFlag", 1));	
			List<ShellTransaction> obj=cr.list();
			//abnormalityList=new ArrayList<String>();
			shellnoStageOneList= new LinkedHashMap<Integer,String>();
			for(ShellTransaction a:obj)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				shellnoStageOneList.put(a.getShellAssetId(),a.getShellNumber());
			}
			
			Criteria cr1 = session.createCriteria(ShellTransaction.class);
			cr1.addOrder(Order.asc("shellNumber"));
			cr1.add(Restrictions.eq("stage2SipFlag", 1));	
			List<ShellTransaction> obj1=cr1.list();
			//abnormalityList=new ArrayList<String>();
			shellnoStageTwoList= new LinkedHashMap<Integer,String>();
			for(ShellTransaction a:obj1)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				shellnoStageTwoList.put(a.getShellAssetId(),a.getShellNumber());
			}
			
			Criteria cr2= session.createCriteria(ShellTransaction.class);
			cr2.addOrder(Order.asc("shellNumber"));
			cr2.add(Restrictions.eq("stage3SipFlag", 1));	
			List<ShellTransaction> obj2=cr2.list();
			//abnormalityList=new ArrayList<String>();
			shellnoStageThreeList= new LinkedHashMap<Integer,String>();
			for(ShellTransaction a:obj2)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				shellnoStageThreeList.put(a.getShellAssetId(),a.getShellNumber());
			}
			
			Criteria cr3 = session.createCriteria(ShellTransaction.class);
			cr3.addOrder(Order.asc("shellNumber"));
			cr3.add(Restrictions.eq("stage4SipFlag", 1));	
			List<ShellTransaction> obj3=cr3.list();
			//abnormalityList=new ArrayList<String>();
			shellnoStageFourList= new LinkedHashMap<Integer,String>();
			for(ShellTransaction a:obj3)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				shellnoStageFourList.put(a.getShellAssetId(),a.getShellNumber());
			}
			
			
			//Shell Component code
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

public Map<Integer, String> getShellnoStageTwoList() {
		return shellnoStageTwoList;
	}


	public void setShellnoStageTwoList(Map<Integer, String> shellnoStageTwoList) {
		this.shellnoStageTwoList = shellnoStageTwoList;
	}

	public Map<Integer, String> getShellnoStageThreeList() {
		return shellnoStageThreeList;
	}

	public void setShellnoStageThreeList(Map<Integer, String> shellnoStageThreeList) {
		this.shellnoStageThreeList = shellnoStageThreeList;
	}
public Map<Integer, String> getShellnoStageFourList() {
		return shellnoStageFourList;
	}

	public void setShellnoStageFourList(Map<Integer, String> shellnoStageFourList) {
		this.shellnoStageFourList = shellnoStageFourList;
	}

	public Map<Integer, String> getShellnoStageOneList() {
		return shellnoStageOneList;
	}

	public void setShellnoStageOneList(Map<Integer, String> shellnoStageOneList) {
		this.shellnoStageOneList = shellnoStageOneList;
	}

	public List<String> getRailway() {
		return railway;
	}




	public void setRailway(List<String> railway) {
		this.railway = railway;
	}
	

	
	}

