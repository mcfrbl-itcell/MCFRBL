package dao;
import beans.FurnishingTransaction;

import beans.FiresmokeTestingTransaction;

import org.hibernate.Session;
import org.hibernate.Transaction;


import hibernateConnect.HibernateConfig;

public class DaoFiresmoke {
	
	public void saveDaoFiresmoke(FurnishingTransaction furnishingTransaction,FiresmokeTestingTransaction firesmokeTestingTransaction) {
		Session session=null;
		Transaction tx=null;
		try
		{ session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		
		session.update(furnishingTransaction);
		session.saveOrUpdate(firesmokeTestingTransaction);
		tx.commit();
		}
		catch(Exception ex)
		{
		ex.printStackTrace();
		tx.rollback();
		}
		finally
	    {
		if(session!=null)
		 {
				session.close();
		 }
	    }
	}

}
