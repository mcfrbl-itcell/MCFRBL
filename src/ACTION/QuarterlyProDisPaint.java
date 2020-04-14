package ACTION;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ibm.icu.util.Calendar;

import hibernateConnect.HibernateConfig;
public class QuarterlyProDisPaint {
	private Map<String,Integer> firstData;
	private Map<String,Integer> secondData;
	private Map<String,Integer> firstData2;
	private Map<String,Integer> secondData2;
	public int curryear;
	public int prevyear;
	public int lastyear;
	public String str1;
	public String str2;
	public String str3;
	public String str4;
	public String str5;
	public String getQuarterlyProdDataPaint()
	{
		Session session =  null;
		//Session session2= null;
		Query queryForData= null;
		Query queryForData2=null;
		session = HibernateConfig.getSession();
		//code for calculating two year strings 
		Calendar cal=Calendar.getInstance();
		curryear=cal.get(Calendar.YEAR);
		prevyear=(cal.get(Calendar.YEAR))-1;
		lastyear=(cal.get(Calendar.YEAR))-2;
		str1=Integer.toString(curryear);
		str2=Integer.toString(prevyear);
		str3=Integer.toString(lastyear);
		str4=str2+"-"+str1;//2019-2020
		str5=str3+"-"+str2;//2018-2019
		/*System.out.println("Current year="+curryear);
		//System.out.println("previous year="+prevyear);
		System.out.println(str4);
		System.out.println(str5);*/
		String queryString="select A.fnyr, A.quarter, A.start_qtr_date, A.end_qtr_date,(select count(B.assembly_start_date) from paint_tran B where B.assembly_start_date  between A.start_qtr_date and A.end_qtr_date ) as quarterly_produced,(select count(C.assembly_dispatch_date) from paint_tran C where C.assembly_dispatch_date between A.start_qtr_date and  A.end_qtr_date  ) as quarterly_dispatched from public.fnyr_qtr_start_end_date_v A where A.fnyr='"+str5+"'";
		System.out.println("Paint Shop Query" +queryString);
		queryForData = session.createSQLQuery(queryString);	
		String queryString2="select A.fnyr, A.quarter, A.start_qtr_date, A.end_qtr_date,(select count(B.assembly_start_date) from paint_tran B where B.assembly_start_date  between A.start_qtr_date and A.end_qtr_date ) as quarterly_produced,(select count(C.assembly_dispatch_date) from paint_tran C where C.assembly_dispatch_date between A.start_qtr_date and  A.end_qtr_date  ) as quarterly_dispatched from public.fnyr_qtr_start_end_date_v A where A.fnyr='"+str4+"'";
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



	public String getStr4() {
		return str4;
	}



	public void setStr4(String str4) {
		this.str4 = str4;
	}



	public String getStr5() {
		return str5;
	}



	public void setStr5(String str5) {
		this.str5 = str5;
	}
	


}
