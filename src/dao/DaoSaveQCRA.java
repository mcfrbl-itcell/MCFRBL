package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.FurnishingTransaction;
import beans.QcraTrans;
import hibernateConnect.HibernateConfig;

public class DaoSaveQCRA {

	public void saveData(FurnishingTransaction ft, QcraTrans qt) {
	Session session=null;
	session=HibernateConfig.getSession();
	Transaction tx=session.beginTransaction();
	try
	{
		session.update(ft);
		if(qt!=null) {session.saveOrUpdate(qt);}
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
