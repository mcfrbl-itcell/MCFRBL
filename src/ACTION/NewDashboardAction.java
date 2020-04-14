package ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;

import newdashboard.model.CoachProd;
import newdashboard.model.CoachWise;
import newdashboard.model.DailyProd;
import newdashboard.model.MainDial;
import newdashboard.model.ShopWise;
import newdashboard.model.WorkDay;
import newdashboard.model.ShopMan;
import newdashboard.model.Performance;
import newdashboard.model.Alarm;
import newdashboard.model.BeltHolding;
import newdashboard.model.MachineBreakdown;

import com.opensymphony.xwork2.ActionSupport;

import hibernateConnect.HibernateConfig;



public class NewDashboardAction extends ActionSupport {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;



	private List<WorkDay> wdlist = new ArrayList<WorkDay>();
	
	
	
	private List<CoachWise> cwlist = new ArrayList<CoachWise>();
	
	private List<ShopWise> swlist = new ArrayList<ShopWise>();
	
	private List<MainDial> mdlist = new ArrayList<MainDial>();
	
	private List<DailyProd> dplist = new ArrayList<DailyProd>();
	
	private List<CoachProd> cplist = new ArrayList<CoachProd>();
	
	private List<ShopMan> smlist = new ArrayList<ShopMan>();
	
	List<Performance> pflist = new ArrayList<Performance>();
	
	String ason = null;
	
	List<Alarm> alist = new ArrayList<Alarm>();
	
	String alarm_desc = null;
	
	String shop_util_desc = null;
	
	String break_desc = null;
	
	String belt_desc = null;
	
	List<MachineBreakdown> mblist = new ArrayList<MachineBreakdown>();
	
	List<BeltHolding> bhlist = new ArrayList<BeltHolding>();
	
	
	
	public String getAlarm_desc() {
		return alarm_desc;
	}



	public void setAlarm_desc(String alarm_desc) {
		this.alarm_desc = alarm_desc;
	}



	public String getShop_util_desc() {
		return shop_util_desc;
	}



	public void setShop_util_desc(String shop_util_desc) {
		this.shop_util_desc = shop_util_desc;
	}



	public String getBreak_desc() {
		return break_desc;
	}



	public void setBreak_desc(String break_desc) {
		this.break_desc = break_desc;
	}



	public String getBelt_desc() {
		return belt_desc;
	}



	public void setBelt_desc(String belt_desc) {
		this.belt_desc = belt_desc;
	}



	public List<MachineBreakdown> getMblist() {
		return mblist;
	}



	public void setMblist(List<MachineBreakdown> mblist) {
		this.mblist = mblist;
	}



	public List<BeltHolding> getBhlist() {
		return bhlist;
	}



	public void setBhlist(List<BeltHolding> bhlist) {
		this.bhlist = bhlist;
	}



	public List<Performance> getPflist() {
		return pflist;
	}



	public void setPflist(List<Performance> pflist) {
		this.pflist = pflist;
	}



	public String getAson() {
		return ason;
	}



	public void setAson(String ason) {
		this.ason = ason;
	}



	public List<Alarm> getAlist() {
		return alist;
	}



	public void setAlist(List<Alarm> alist) {
		this.alist = alist;
	}



	public List<ShopMan> getSmlist() {
		return smlist;
	}



	public void setSmlist(List<ShopMan> smlist) {
		this.smlist = smlist;
	}



	public List<DailyProd> getDplist() {
		return dplist;
	}



	public void setDplist(List<DailyProd> dplist) {
		this.dplist = dplist;
	}



	public List<CoachProd> getCplist() {
		return cplist;
	}



	public void setCplist(List<CoachProd> cplist) {
		this.cplist = cplist;
	}



	public List<CoachWise> getCwlist() {
		return cwlist;
	}



	public void setCwlist(List<CoachWise> cwlist) {
		this.cwlist = cwlist;
	}



	public List<ShopWise> getSwlist() {
		return swlist;
	}



	public void setSwlist(List<ShopWise> swlist) {
		this.swlist = swlist;
	}



	public List<MainDial> getMdlist() {
		return mdlist;
	}



	public void setMdlist(List<MainDial> mdlist) {
		this.mdlist = mdlist;
	}



	public List<WorkDay> getWdlist() {
		return wdlist;
	}



	public void setWdlist(List<WorkDay> wdlist) {
		this.wdlist = wdlist;
	}



	public List<Object[]> results;
	
	public List<Object[]> results2;
	
	public List<Object[]> results3;
	
	public List<Object[]> results4;
	
	public List<Object[]> results5;
	
	public List<Object[]> results6;
	
	public List<Object[]> results7;
	
	public List<String> results8;
	
	public List<String> results9;
	
	public List<Object[]> results10;
	
	public List<String> results11;
	
	public List<String> results12;
	
	public List<String> results13;
	
	public List<String> results14;
	
	public List<Object[]> results15;
	
	public List<Object[]> results16;
	
	
	
	
	
	@SuppressWarnings("unchecked")
	public String getDashboardData(){
		
		
		System.out.println("hello in  DASHBOARD FUNCTION");
		Session session =  null;
		session = HibernateConfig.getSession();
		System.out.println("GOT CONNECTION");
		
		
		/* WORKDAY */
		
		String hql="select crnt_fin_year(prev_work_date(a.crnt_date)) AS fnyr, noof_ytd_wday_fin_year(prev_work_date(a.crnt_date)) AS ytd_wday,noof_tot_wday_fin_year(prev_work_date(a.crnt_date)) AS tot_wday from set_date a";
		
		Query query = session.createSQLQuery(hql);
		
		results = query.list();
		
		WorkDay wd = null;
		
		System.out.println("VALUES FETCHED FOR WORKDAY");

			 wdlist.clear();
			 for(Object[] s:results) { 
				 wd = new WorkDay();
				 System.out.println("VALUES FETCHED : "+s[1].toString());
				 System.out.println("VALUES FETCHED : "+s[2].toString());
				 wd.setYtdwday(s[1].toString());
				 wd.setTotwday(s[2].toString());
				 wdlist.add(wd);
				 
			 }
			 
		
		
			 /* COACH WISE PERFORMANCE */
			 
		 String hql2="select A.fnyr fnyr , A.coach_type rs_type , COALESCE(A.tgt_qty,0) tgt , prod_type_cum_mfg(prev_work_date(B.crnt_date) , A.coach_type) mfg , prod_type_cum_gate_out(prev_work_date(B.crnt_date) , A.coach_type)  gateout from public.fin_type_tgt_v A , public.set_date B where A.tgt_qty != 0 and A.fnyr = crnt_fin_year(B.crnt_date)";
		
		 Query query2 = session.createSQLQuery(hql2);
		
		 results2 = query2.list();
			
		 CoachWise cw = null;
		
		 System.out.println("VALUES FETCHED FOR COACHWISE");
				
				cwlist.clear();
				 for(Object[] s:results2) { 
					 cw = new CoachWise();
					 System.out.println("VALUES FETCHED : "+s[1].toString());
					 System.out.println("VALUES FETCHED : "+s[2].toString());
					 
					 cw.setRstype(s[1].toString());
					 cw.setTgt(s[2].toString());
					 cw.setMfg(s[3].toString());
					 cw.setGateout(s[4].toString());
					 cwlist.add(cw);
					 
				 }
				 
				
				 
		
			/* SHOP WISE PERFORMANCE */
				 
		 String hql3="SELECT crnt_fin_year(current_date) as fin_year,substage_id AS stage_id,ROW_NUMBER () OVER (ORDER BY substage_sequence)||'. '||substage_description AS stage_desc,parent_stages AS stage,prod_yrly_shop_tgt(current_date,substage_id) AS yrly_trgt,cum_prod_shop_mfg_by(current_date,substage_description) AS cum_prod FROM substage_master WHERE substage_validity = 0 AND parent_stages is not null";
			
		 Query query3 = session.createSQLQuery(hql3);
		
		 results3 = query3.list();
			
		 ShopWise sw = null;
		
		 System.out.println("VALUES FETCHED FOR SHOPWISE");
				
				swlist.clear();
				 for(Object[] s:results3) {  
					 sw = new ShopWise();
					 System.out.println("VALUES FETCHED : "+s[1].toString());
					 System.out.println("VALUES FETCHED : "+s[2].toString());
					 
					 sw.setStage(s[3].toString());
					 sw.setYearlytarget(s[4].toString());
					 sw.setCumprod(s[5].toString());
					 swlist.add(sw);
					 
				 }
		
				 
		
				 /* MAIN DIAL  */
						 
		 String hql4="select public.fin_prod_actl_trgt_v.fnyr,public.fin_prod_actl_trgt_v.tgt_qty,public.fin_prod_actl_trgt_v.prop_tgt_qty,public.fin_prod_actl_trgt_v.tot_gate_out_qty,public.fin_prod_actl_trgt_v.tot_mfg_qty,public.fin_prod_actl_trgt_v.reqd_qty from public.fin_prod_actl_trgt_v";
			
		 Query query4 = session.createSQLQuery(hql4);
		
		 results4 = query4.list();
			
		 MainDial md = null;
		
		 System.out.println("VALUES FETCHED FOR MAINDIAL");
				
				mdlist.clear();
				 for(Object[] s:results4) {  
					 md = new MainDial();
					 System.out.println("VALUES FETCHED : "+s[1].toString());
					 System.out.println("VALUES FETCHED : "+s[2].toString());
					 
					 	md.setTarget(s[1].toString());
						md.setProptarget(s[2].toString());
						md.setMfg(s[4].toString());
						md.setGateout(s[3].toString());
						md.setReqd(s[5].toString());
						mdlist.add(md);	
					 
				 }
				 
		
				 
				 /* DAILY PRODUCTION */
				 
		 String hql5="select fnyr, crnt_date, prev_date , ondt_mfg_qty crdt_mfg , ytd_prod_rate prod_actl_rate , ytd_req_rate prod_reqd_rate from fin_prod_actl_trgt_v";
			
		 Query query5 = session.createSQLQuery(hql5);
		
		 results5 = query5.list();
			
		 DailyProd dp = null;
		
		 System.out.println("VALUES FETCHED FOR DAILY PPRODUCTION RATE");
				
				dplist.clear();
				 for(Object[] s:results5) {  
					 dp = new DailyProd();
					 System.out.println("VALUES FETCHED : "+s[3].toString());
					 System.out.println("VALUES FETCHED : "+s[4].toString());
					 
					 	dp.setCrdt_mfg(s[3].toString());
					 	dp.setProd_actl_rate(s[4].toString());
					 	dp.setProd_reqd_rate(s[5].toString());
					 	dplist.add(dp);
				 }
				 
		
				 
				 /* COACH PRODUCTION PLAN */
				 
		 String hql6="select public.fin_prod_tgt_prct_v.fnyr , public.fin_prod_tgt_prct_v.coach_type , public.fin_prod_tgt_prct_v.type_tgt_qty , public.fin_prod_tgt_prct_v.prct_qty from public.fin_prod_tgt_prct_v where public.fin_prod_tgt_prct_v.prct_qty !=0 order by public.fin_prod_tgt_prct_v.prct_qty desc";
			
		 Query query6 = session.createSQLQuery(hql6);
		
		 results6 = query6.list();
			
		 CoachProd cp = null;
		
		 System.out.println("VALUES FETCHED FOR COACH PRODUCTION PLAN");
				
				cplist.clear();
				 for(Object[] s:results6) {  
					 cp = new CoachProd();
					 System.out.println("VALUES FETCHED : "+s[1].toString());
					 System.out.println("VALUES FETCHED : "+s[2].toString());
					 
					 	cp.setCoachtype(s[1].toString());
					 	cp.setTypetgtqty(s[2].toString());
					 	cp.setPrctqty(s[3].toString());
					 	cplist.add(cp);
				 }
				 
				 
				 
	
		 /* SHOP MAN FOR TABLE */
			
				 String hql7="select B.subsection_id shop	,	public.prevday_manpower_mandays(crnt_date , B.subsection_id) prev_days_manpower	,	public.prevday_manpower_utilization(crnt_date,B.subsection_id) prev_days_manutil ,	public.stdt_onward_manpower_utilization('2019-07-01', crnt_date,B.subsection_id) avg_finyr_manutil from public.set_date A , public.employee_section B where B.parent_subsection_id is null";
					
				 Query query7 = session.createSQLQuery(hql7);
				
				 results7 = query7.list();
					
				 ShopMan sm = null;
				
				 System.out.println("VALUES FETCHED FOR SHOP MAN UTILISATION");
						
						smlist.clear();
						 for(Object[] s:results7) {  
							 sm = new ShopMan();
							 System.out.println("VALUES FETCHED : "+s[0].toString());
							 System.out.println("VALUES FETCHED : "+s[1].toString());
							 System.out.println("VALUES FETCHED : "+s[2].toString());
							 System.out.println("VALUES FETCHED : "+s[3].toString());
							 
							 double avgmanutil = Math.round(Double.parseDouble(s[3].toString()));
							 
							 sm.setShop(s[0].toString());
							 sm.setPrevdaymanpower(s[1].toString());
							 sm.setPrevdaymanutil(s[2].toString());
							 sm.setAvgfinyrmanutil(String.valueOf(avgmanutil));
							 smlist.add(sm);
							 
//							 System.out.println("VALUES FETCHED AFTER SETTING THE VALUES FOR SHOP MAN UTILISATION");
//							 
//							 System.out.println("VALUES FETCHED : "+s[0].toString());
//							 System.out.println("VALUES FETCHED : "+s[1].toString());
//							 System.out.println("VALUES FETCHED : "+s[2].toString());
//							 System.out.println("VALUES FETCHED : "+s[3].toString());
							 
							 

						 } 
			
		 /* PERFORMANCE */
			
		 String hql8="select 'Performance = '|| round(tot_mfg_qty * 100.0/prop_tgt_qty, 1) ||'%' perf from public.fin_prod_actl_trgt_v";
			
		 Query query8 = session.createSQLQuery(hql8);
		
		 results8 = query8.list();
			
		 Performance pf = null;
		
		 System.out.println("VALUES FETCHED FOR PERFORMANCE");
				
				pflist.clear();
				
				
				 for(String s:results8) {  
					 pf = new Performance();
					 System.out.println("VALUES FETCHED : "+s.toString());
					 pf.setPerf(s.toString());
					 
					 pflist.add(pf);
					 
					 
					 
				 }

				 
		 /* AS ON */
			
		 String hql9="select 'As on: '||to_char(public.fin_tday_wday_v.prev_date,'dd Mon,yyyy') crdate from public.fin_tday_wday_v";
			
		 Query query9 = session.createSQLQuery(hql9);
		
		 results9 = query9.list();
			
		 
		
		 System.out.println("VALUES FETCHED FOR AS ON");
				
				
				 for(String s : results9) {  
					 
					 System.out.println("VALUES FETCHED : "+s.toString());
					
					 
					 ason = s.toString();
					 
					 
					 
				 }
						 
						 
		 /* ALARM */
			
		 String hql10="select public.prod_alrm_v.alrm_date, public.prod_alrm_v.alrm_dtls from public.prod_alrm_v";
			
		 Query query10 = session.createSQLQuery(hql10);
		
		 results10 = query10.list();
			
		 Alarm al = null;
		
		 System.out.println("VALUES FETCHED FOR ALARM");
				
		 alist.clear();
				
				 for(Object[] s:results10) {  
					 
					 System.out.println("VALUES FETCHED : "+s[0].toString());
					 System.out.println("VALUES FETCHED : "+s[1].toString());
					 
					 al = new Alarm();
					 
					 al.setAlrm_date(s[0].toString());
					 al.setAlrm_dtls(s[1].toString());
					 
					 alist.add(al);
				 
				 }
				 
				 
				 /* ALARM DESC */
					
				 String hql11="select public.alarm_main_page_proc()";
					
				 Query query11 = session.createSQLQuery(hql11);
				
				 results11 = query11.list();
					
				 
				
				 System.out.println("VALUES FETCHED FOR ALARM DESC");
						
						
						 for(String s : results11) {  
							 
							 System.out.println("VALUES FETCHED : "+s.toString());
							
							 
							 alarm_desc = s.toString();
							 
						 }
						 
						 
						 
						 
						 /* SHOP UTIL DESC */
							
						 String hql12="select public.shop_man_util_proc()";
							
						 Query query12 = session.createSQLQuery(hql12);
						
						 results12 = query12.list();
							
						 
						
						 System.out.println("VALUES FETCHED FOR SHOP UTIL DESC");
								
								
								 for(String s : results12) {  
									 
									 System.out.println("VALUES FETCHED : "+s.toString());
									
									 
									 shop_util_desc = s.toString();
									 
								 }
								 
								 
								 
								 
								 /* MACHINE BREAKDOWN DESC */
									
								 String hql13="select public.macine_breakdown_pro()";
									
								 Query query13 = session.createSQLQuery(hql13);
								
								 results13 = query13.list();
									
								 
								
								 System.out.println("VALUES FETCHED FOR MACHINE BREAKDOWN DESC");
										
										
										 for(String s : results13) {  
											 
											 System.out.println("VALUES FETCHED : "+s.toString());
											
											 
											 break_desc = s.toString();
											 
										 }
										 
										 
										 
										 /* BELT HOLDING DESC */
											
										 String hql14="select public.belt_holding_item_pro()";
											
										 Query query14 = session.createSQLQuery(hql14);
										
										 results14 = query14.list();
											
										 
										
										 System.out.println("VALUES FETCHED FOR BELT HOLDING DESC");
												
												
												 for(String s : results14) {  
													 
													 System.out.println("VALUES FETCHED : "+s.toString());
													
													 
													 belt_desc = s.toString();
													 
												 }
												 
												 
												 
												 
								 /* MACHINE BREAKDOWN LIST TABLE */
									
								 String hql15="select A.machine_sr_no,A.machine_description, to_char(B.breakdown_date,'dd/mm/yy') as breakdown_date FROM public.machine_master A, public.machine_breakdown B where A.machine_status ='F' and A.machine_id =B.machine_id and B.rectification_date is null order by B.breakdown_date";
									
								 Query query15 = session.createSQLQuery(hql15);
								
								 results15 = query15.list();
									
								 MachineBreakdown mb = null;
								
								 System.out.println("VALUES FETCHED FOR  MACHINE BREAKDOWN LIST TABLE");
										
								 mblist.clear();
								 
										 for(Object[] s:results15) {  
											 
											 System.out.println("VALUES FETCHED : "+s[0].toString());
											 System.out.println("VALUES FETCHED : "+s[1].toString());
											 System.out.println("VALUES FETCHED : "+s[2].toString());
											 
											 mb = new MachineBreakdown();
											 
											 mb.setMachine_sr_no(s[0].toString());
											 mb.setMachine_description(s[1].toString());
											 mb.setBreakdown_date(s[2].toString());
											 
											 
											 mblist.add(mb);
										 
										 }
										 
										 
										 
								 /* BELT HOLDING LIST TABLE */
									
								 String hql16="select material_shortage.shop,material_shortage.unified_pl_no,material_shortage.pl_desc,material_shortage.coach_affected from material_shortage inner join material_master on material_shortage.unified_pl_no=material_master.pl_no and material_shortage.date_of_report=prev_work_date(current_date) order by  material_shortage.coach_affected desc;";
									
								 Query query16 = session.createSQLQuery(hql16);
								
								 results16 = query16.list();
									
								 BeltHolding bh = null;
								
								 System.out.println("VALUES FETCHED FOR  BELT HOLDING LIST TABLE");
										
								 bhlist.clear();
								 
										 for(Object[] s:results16) {  
											 
											 System.out.println("VALUES FETCHED : "+s[0].toString());
											 System.out.println("VALUES FETCHED : "+s[1].toString());
											 System.out.println("VALUES FETCHED : "+s[2].toString());
											 System.out.println("VALUES FETCHED : "+s[3].toString());
											 
											 bh = new BeltHolding();
											 
											 bh.setShop(s[0].toString());
											 bh.setUnified_pl_no(s[1].toString());
											 bh.setPl_desc(s[2].toString());
											 bh.setCoach_affected(s[3].toString());
											 
											 
											 bhlist.add(bh);
										 
										 }
								 
						 
				 
			
			session.close();
			 
			 return "success";
		}
	
	
	
	

}
