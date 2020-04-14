package struts.action.master;

import org.hibernate.Session;


import beans.QciFPvcTrans;
import beans.QciPanelTrans;
import beans.QciPartitionFrameTrans;
import beans.QciWindowCeilingTrans;
import beans.QciMouldingTrans;
import beans.QciSeatBerthTrans;
import beans.QciLavatoryTrans;
import beans.QciPlumbingTrans;
import beans.QciAirBrakeTrans;
import beans.QciCoachLoweringTrans;
import beans.QciPaintTrans;
import beans.QciCoachCleaningTrans;
import hibernateConnect.HibernateConfig;

public class ShowDataQCI {
	QciFPvcTrans qciFPvcTrans;
	QciPartitionFrameTrans qciPartitionFrameTrans;
	QciPanelTrans qciPanelTrans;
	QciWindowCeilingTrans qciWindowCeilingTrans;
	QciMouldingTrans qciMouldingTrans;
	QciSeatBerthTrans qciSeatBerthTrans;
	QciLavatoryTrans qciLavatoryTrans;
	QciPlumbingTrans qciPlumbingTrans;
	QciAirBrakeTrans qciAirBrakeTrans;
	QciCoachLoweringTrans qciCoachLoweringTrans;
	QciPaintTrans qciPaintTrans;
	QciCoachCleaningTrans qciCoachCleaningTrans;
	String furnishingAssetId;
	public String showData1()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciFPvcTrans=(QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData2()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciPartitionFrameTrans=(QciPartitionFrameTrans) session.get(QciPartitionFrameTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData3()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciPanelTrans=(QciPanelTrans) session.get(QciPanelTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData4()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciWindowCeilingTrans=(QciWindowCeilingTrans) session.get(QciWindowCeilingTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData5()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciMouldingTrans=(QciMouldingTrans) session.get(QciMouldingTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData6()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciSeatBerthTrans=(QciSeatBerthTrans) session.get(QciSeatBerthTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData7()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciLavatoryTrans=(QciLavatoryTrans) session.get(QciLavatoryTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData8()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciPlumbingTrans=(QciPlumbingTrans) session.get(QciPlumbingTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData9()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciAirBrakeTrans=(QciAirBrakeTrans) session.get(QciAirBrakeTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData10()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciCoachLoweringTrans=(QciCoachLoweringTrans) session.get(QciCoachLoweringTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData11()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciPaintTrans=(QciPaintTrans) session.get(QciPaintTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public String showData12()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		qciCoachCleaningTrans=(QciCoachCleaningTrans) session.get(QciCoachCleaningTrans.class, furnishingAssetIdAsInt);
		qciFPvcTrans= (QciFPvcTrans) session.get(QciFPvcTrans.class, furnishingAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public QciFPvcTrans getQciFPvcTrans() {
		return qciFPvcTrans;
	}
	public void setQciFPvcTrans(QciFPvcTrans qciFPvcTrans) {
		this.qciFPvcTrans = qciFPvcTrans;
	}
	public QciPartitionFrameTrans getQciPartitionFrameTrans() {
		return qciPartitionFrameTrans;
	}
	public void setQciPartitionFrameTrans(QciPartitionFrameTrans qciPartitionFrameTrans) {
		this.qciPartitionFrameTrans = qciPartitionFrameTrans;
	}
	public QciPanelTrans getQciPanelTrans() {
		return qciPanelTrans;
	}
	public void setQciPanelTrans(QciPanelTrans qciPanelTrans) {
		this.qciPanelTrans = qciPanelTrans;
	}
	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}
	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}
	public QciWindowCeilingTrans getQciWindowCeilingTrans() {
		return qciWindowCeilingTrans;
	}
	public void setQciWindowCeilingTrans(QciWindowCeilingTrans qciWindowCeilingTrans) {
		this.qciWindowCeilingTrans = qciWindowCeilingTrans;
	}
	public QciSeatBerthTrans getQciSeatBerthTrans() {
		return qciSeatBerthTrans;
	}
	public void setQciSeatBerthTrans(QciSeatBerthTrans qciSeatBerthTrans) {
		this.qciSeatBerthTrans = qciSeatBerthTrans;
	}
	public QciLavatoryTrans getQciLavatoryTrans() {
		return qciLavatoryTrans;
	}
	public void setQciLavatoryTrans(QciLavatoryTrans qciLavatoryTrans) {
		this.qciLavatoryTrans = qciLavatoryTrans;
	}
	public QciPlumbingTrans getQciPlumbingTrans() {
		return qciPlumbingTrans;
	}
	public void setQciPlumbingTrans(QciPlumbingTrans qciPlumbingTrans) {
		this.qciPlumbingTrans = qciPlumbingTrans;
	}
	public QciAirBrakeTrans getQciAirBrakeTrans() {
		return qciAirBrakeTrans;
	}
	public void setQciAirBrakeTrans(QciAirBrakeTrans qciAirBrakeTrans) {
		this.qciAirBrakeTrans = qciAirBrakeTrans;
	}
	public QciCoachLoweringTrans getQciCoachLoweringTrans() {
		return qciCoachLoweringTrans;
	}
	public void setQciCoachLoweringTrans(QciCoachLoweringTrans qciCoachLoweringTrans) {
		this.qciCoachLoweringTrans = qciCoachLoweringTrans;
	}
	public QciPaintTrans getQciPaintTrans() {
		return qciPaintTrans;
	}
	public void setQciPaintTrans(QciPaintTrans qciPaintTrans) {
		this.qciPaintTrans = qciPaintTrans;
	}
	public QciCoachCleaningTrans getQciCoachCleaningTrans() {
		return qciCoachCleaningTrans;
	}
	public void setQciCoachCleaningTrans(QciCoachCleaningTrans qciCoachCleaningTrans) {
		this.qciCoachCleaningTrans = qciCoachCleaningTrans;
	}
	public QciMouldingTrans getQciMouldingTrans() {
		return qciMouldingTrans;
	}
	public void setQciMouldingTrans(QciMouldingTrans qciMouldingTrans) {
		this.qciMouldingTrans = qciMouldingTrans;
	}
	
}
