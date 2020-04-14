package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.CrossCheckinTrans;
import beans.FurnishingTransaction;
import hibernateConnect.HibernateConfig;

public class DaoCrossCheckin {

	public void saveData(CrossCheckinTrans crossCheckinTransUpdate,CrossCheckinTrans crossCheckinTransSave) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			if(crossCheckinTransUpdate!=null) {session.update(crossCheckinTransUpdate);}
			else
			{
				session.save(crossCheckinTransSave);
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
