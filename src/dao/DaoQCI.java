package dao;
import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.QciPartitionFrameTrans;
import beans.QciPanelTrans;
import beans.QciSeatBerthTrans;
import beans.FurnishingTransaction;
import beans.QciFPvcTrans;
import beans.QciWindowCeilingTrans;
import beans.QciLavatoryTrans;
import beans.QciPlumbingTrans;
import beans.QciAirBrakeTrans;
import beans.QciCoachLoweringTrans;
import beans.QciPaintTrans;
import beans.QciCoachCleaningTrans;
import beans.QciMouldingTrans;
import hibernateConnect.HibernateConfig;
public class DaoQCI {
	public void saveData1(QciFPvcTrans qciFPvcTrans, QciFPvcTrans qciFPvcTransSave,FurnishingTransaction ft) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			session.update(ft);
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData2(QciPartitionFrameTrans qciPartitionFrameTrans, QciFPvcTrans qciFPvcTrans, QciPartitionFrameTrans qciPartitionFrameTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciPartitionFrameTrans!=null) {session.update(qciPartitionFrameTrans);}
			else
			{
				session.save(qciPartitionFrameTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData3(QciPanelTrans qciPanelTrans, QciFPvcTrans qciFPvcTrans, QciPanelTrans qciPanelTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciPanelTrans!=null) {session.update(qciPanelTrans);}
			else
			{
				session.save(qciPanelTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData4(QciWindowCeilingTrans qciWindowCeilingTrans, QciFPvcTrans qciFPvcTrans, QciWindowCeilingTrans qciWindowCeilingTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciWindowCeilingTrans!=null) {session.update(qciWindowCeilingTrans);}
			else
			{
				session.save(qciWindowCeilingTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData5(QciMouldingTrans qciMouldingTrans, QciFPvcTrans qciFPvcTrans, QciMouldingTrans qciMouldingTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciMouldingTrans!=null) {session.update(qciMouldingTrans);}
			else
			{
				session.save(qciMouldingTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData6(QciSeatBerthTrans qciSeatBerthTrans, QciFPvcTrans qciFPvcTrans, QciSeatBerthTrans qciSeatBerthTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciSeatBerthTrans!=null) {session.update(qciSeatBerthTrans);}
			else
			{
				session.save(qciSeatBerthTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData7(QciLavatoryTrans qciLavatoryTrans, QciFPvcTrans qciFPvcTrans, QciLavatoryTrans qciLavatoryTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciLavatoryTrans!=null) {session.update(qciLavatoryTrans);}
			else
			{
				session.save(qciLavatoryTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData8(QciPlumbingTrans qciPlumbingTrans, QciFPvcTrans qciFPvcTrans, QciPlumbingTrans qciPlumbingTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciPlumbingTrans!=null) {session.update(qciPlumbingTrans);}
			else
			{
				session.save(qciPlumbingTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData9(QciAirBrakeTrans qciAirBrakeTrans,QciFPvcTrans qciFPvcTrans, QciFPvcTrans qciFPvcTransSave, QciAirBrakeTrans qciAirBrakeTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciAirBrakeTrans!=null) {session.update(qciAirBrakeTrans);}
			else
			{
				session.save(qciAirBrakeTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData10(QciCoachLoweringTrans qciCoachLoweringTrans, QciFPvcTrans qciFPvcTrans, QciCoachLoweringTrans qciCoachLoweringTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciCoachLoweringTrans!=null) {session.update(qciCoachLoweringTrans);}
			else
			{
				session.save(qciCoachLoweringTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData11(QciPaintTrans qciPaintTrans, QciFPvcTrans qciFPvcTrans, QciPaintTrans qciPaintTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciPaintTrans!=null) {session.update(qciPaintTrans);}
			else
			{
				session.save(qciPaintTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	public void saveData12(QciCoachCleaningTrans qciCoachCleaningTrans, QciFPvcTrans qciFPvcTrans, QciCoachCleaningTrans qciCoachCleaningTransSave, QciFPvcTrans qciFPvcTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(qciFPvcTrans!=null) {session.update(qciFPvcTrans);}
			else
			{
				session.save(qciFPvcTransSave);
			}
			if(qciCoachCleaningTrans!=null) {session.update(qciCoachCleaningTrans);}
			else
			{
				session.save(qciCoachCleaningTransSave);
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
}
