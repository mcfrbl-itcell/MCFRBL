package ACTION;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ibm.icu.util.Calendar;

import hibernateConnect.HibernateConfig;

public class BogieMonthlyProductionDespatch {
	
	private Map<String,Integer> firstData;
	private Map<String,Integer> secondData;
	private Map<String,Integer> firstData2;
	private Map<String,Integer> secondData2;
	public int curryear_bogie;
	public int prevyear_bogie;
	public int lastyear_bogie;
	public String str1_bogie;
	public String str2_bogie;
	public String str3_bogie;
	public String str4_bogie;
	public String str5_bogie;
	public String getMonthlyProdDataBogie()
	{
		Session session =  null;
		//Session session2= null;
		Query queryForData= null;
		Query queryForData2=null;
		session = HibernateConfig.getSession();
		//code for calculating two year strings 
		Calendar cal=Calendar.getInstance();
		curryear_bogie=cal.get(Calendar.YEAR);
		prevyear_bogie=(cal.get(Calendar.YEAR))-1;
		lastyear_bogie=(cal.get(Calendar.YEAR))-2;
		str1_bogie=Integer.toString(curryear_bogie);
		str2_bogie=Integer.toString(prevyear_bogie);
		str3_bogie=Integer.toString(lastyear_bogie);
		str4_bogie=str2_bogie+"-"+str1_bogie;//2019-2020
		str5_bogie=str3_bogie+"-"+str2_bogie;//2018-2019
		System.out.println("Current year="+curryear_bogie);
		System.out.println("previous year="+prevyear_bogie);
		System.out.println(str4_bogie);
		System.out.println(str5_bogie);
		String queryString="select A.fnyr, A.month_code, A.first_month_date, A.end_month_date,(select count(B.assembly_start_date) from bogieset_trans B where B.assembly_start_date  between A.first_month_date and  A.end_month_date )  as monthly_produced, (select count(C.assembly_exit_date) from bogieset_trans C where C.assembly_exit_date  between A.first_month_date and  A.end_month_date  ) as monthly_dispatched  from public.fnyr_mon_start_end_date_v A where A.fnyr='"+str5_bogie+"'";

		queryForData = session.createSQLQuery(queryString);	
		String queryString2="select A.fnyr, A.month_code, A.first_month_date, A.end_month_date,(select count(B.assembly_start_date) from bogieset_trans B where B.assembly_start_date  between A.first_month_date and  A.end_month_date )  as monthly_produced, (select count(C.assembly_exit_date) from bogieset_trans C where C.assembly_exit_date  between A.first_month_date and  A.end_month_date  ) as monthly_dispatched  from public.fnyr_mon_start_end_date_v A where A.fnyr='"+str4_bogie+"'";

		queryForData2 = session.createSQLQuery(queryString2);	

		List<Object[]> rows = queryForData.list();
		List<Object[]> rows2 = queryForData2.list();
		firstData= new LinkedHashMap<String, Integer>();
		firstData2= new LinkedHashMap<String, Integer>();
		secondData= new LinkedHashMap<String, Integer>();
		secondData2= new LinkedHashMap<String, Integer>();
		for (Object[] o:rows)
		{
			firstData.put(o[1].toString(), Integer.parseInt(o[4].toString()));
			secondData.put(o[1].toString(), Integer.parseInt(o[5].toString()));
		}
		
		for (Object[] a:rows2)
		{
			firstData2.put(a[1].toString(), Integer.parseInt(a[4].toString()));
			secondData2.put(a[1].toString(), Integer.parseInt(a[5].toString()));
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
	public Map<String, Integer> getFirstData2() {
		return firstData2;
	}
	public void setFirstData2(Map<String, Integer> firstData2) {
		this.firstData2 = firstData2;
	}
	public Map<String, Integer> getSecondData2() {
		return secondData2;
	}
	public void setSecondData2(Map<String, Integer> secondData2) {
		this.secondData2 = secondData2;
	}
	public String getStr4_bogie() {
		return str4_bogie;
	}
	public void setStr4_bogie(String str4_bogie) {
		this.str4_bogie = str4_bogie;
	}
	public String getStr5_bogie() {
		return str5_bogie;
	}
	public void setStr5_bogie(String str5_bogie) {
		this.str5_bogie = str5_bogie;
	}
	
	
	
}
	
	




