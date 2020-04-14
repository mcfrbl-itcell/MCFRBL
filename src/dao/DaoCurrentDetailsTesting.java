package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.CurrentDetailsTesting;
import beans.ElecTestTransactionPrimaryData;
import beans.FurnishingTransaction;
import hibernateConnect.HibernateConfig;

public class DaoCurrentDetailsTesting {
	public void saveCurrentDetailsData(CurrentDetailsTesting currentDetailsTesting,FurnishingTransaction furnishingTransaction,ElecTestTransactionPrimaryData elecTestTransactionPrimaryData){
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		session.update(furnishingTransaction);
		session.saveOrUpdate(elecTestTransactionPrimaryData);
		session.saveOrUpdate(currentDetailsTesting);
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
