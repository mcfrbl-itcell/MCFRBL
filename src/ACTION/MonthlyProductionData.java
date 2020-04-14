package ACTION;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernateConnect.HibernateConfig;

public class MonthlyProductionData {
	private Map<String,Integer> firstData;
	private Map<String,Integer> secondData;
	
	public String getData()
	{
		Session session =  null;
		Query queryForData= null;
		session = HibernateConfig.getSession();
		String queryString="select A.fnyr, A.month_code, A.first_month_date, A.end_month_date,(select count(B.assembly_start_date) from wheelset_tran B where B.assembly_start_date  between A.first_month_date and  A.end_month_date ) as monthly_produced, (select count(C.assembly_dispatch_date) from wheelset_tran C where C.assembly_dispatch_date  between A.first_month_date and  A.end_month_date  ) as monthly_dispatched from public.fnyr_mon_start_end_date_v A";
		queryForData = session.createSQLQuery(queryString);	
		List<Object[]> rows = queryForData.list();
		firstData= new LinkedHashMap<String, Integer>();
		secondData= new LinkedHashMap<String, Integer>();
		for (Object[] o:rows)
		{
			firstData.put(o[1].toString(), Integer.parseInt(o[4].toString()));
			secondData.put(o[1].toString(), Integer.parseInt(o[5].toString()));
		}
		
		
		
		return "success";
	}

	public Map<String, Integer> getFirstData() {
		return firstData;
	}

	public void setFirstData(Map<String, Integer> firstData) {
		this.firstData = firstData;
	}

	public Map<String, Integer> getSecondData() {
		return secondData;
	}

	public void setSecondData(Map<String, Integer> secondData) {
		this.secondData = secondData;
	}
	
	
}
