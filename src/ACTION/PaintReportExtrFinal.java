package ACTION;

import java.util.LinkedHashMap;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import hibernateConnect.HibernateConfig;

public class PaintReportExtrFinal {
	private Map<Integer,String> paintNumberListExtrFinal;
	private Map<Integer,String> paintNumberListExtrSip;
	private Map<Integer,String> paintNumberListIntrFinal;
	private Map<Integer,String> paintNumberListIntrSip;
	private List <String> railway;
    
	@SuppressWarnings("unchecked")
	public String getAssetType()
	{
		Session session =  null;
	
	    session = HibernateConfig.getSession();
	
		try {

			
			session.beginTransaction();
			Query query1=null;
			query1 = session.createSQLQuery("select p.paint_asset_id,s.shell_no from public.shell_tran as s INNER JOIN paint_tran as p ON s.shell_asset_id=p.shell_asset_id where p.extr_paint_final_flag=1");
			List<Object[]> rowList1 =  query1.list();
			paintNumberListExtrFinal=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList1)
			{
				paintNumberListExtrFinal.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}
			Query query2=null;
			query2 = session.createSQLQuery("select p.paint_asset_id,s.shell_no from public.shell_tran as s INNER JOIN paint_tran as p ON s.shell_asset_id=p.shell_asset_id where p.extr_paint_sip_flag=1");
			List<Object[]> rowList2 =  query2.list();
			paintNumberListExtrSip=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList2)
			{
				paintNumberListExtrSip.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}
			Query query3=null;
			query3 = session.createSQLQuery("select p.paint_asset_id,s.shell_no from public.shell_tran as s INNER JOIN paint_tran as p ON s.shell_asset_id=p.shell_asset_id where p.intr_paint_final_flag=1");
			List<Object[]> rowList3 =  query3.list();
			paintNumberListIntrFinal=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList3)
			{
				paintNumberListIntrFinal.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}
			Query query4=null;
			query4 = session.createSQLQuery("select p.paint_asset_id,s.shell_no from public.shell_tran as s INNER JOIN paint_tran as p ON s.shell_asset_id=p.shell_asset_id where p.intr_paint_sip_flag=1");
			List<Object[]> rowList4 =  query4.list();
			paintNumberListIntrSip=new LinkedHashMap<Integer, String>();
			for(Object[] row: rowList4)
			{
				paintNumberListIntrSip.put(Integer.parseInt(row[0].toString()), row[1].toString());
				
			}
			
			  Query query=null;
			  query = session.createSQLQuery("select railway_code from public.railway_master");
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

	public Map<Integer, String> getPaintNumberListExtrFinal() {
		return paintNumberListExtrFinal;
	}

	public void setPaintNumberListExtrFinal(Map<Integer, String> paintNumberListExtrFinal) {
		this.paintNumberListExtrFinal = paintNumberListExtrFinal;
	}

	public List<String> getRailway() {
		return railway;
	}

	public void setRailway(List<String> railway) {
		this.railway = railway;
	}

	public Map<Integer, String> getPaintNumberListExtrSip() {
		return paintNumberListExtrSip;
	}

	public void setPaintNumberListExtrSip(Map<Integer, String> paintNumberListExtrSip) {
		this.paintNumberListExtrSip = paintNumberListExtrSip;
	}

	public Map<Integer, String> getPaintNumberListIntrFinal() {
		return paintNumberListIntrFinal;
	}

	public void setPaintNumberListIntrFinal(Map<Integer, String> paintNumberListIntrFinal) {
		this.paintNumberListIntrFinal = paintNumberListIntrFinal;
	}

	public Map<Integer, String> getPaintNumberListIntrSip() {
		return paintNumberListIntrSip;
	}

	public void setPaintNumberListIntrSip(Map<Integer, String> paintNumberListIntrSip) {
		this.paintNumberListIntrSip = paintNumberListIntrSip;
	}

	
	
	
	}
