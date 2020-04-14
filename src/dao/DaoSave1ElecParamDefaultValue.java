package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ElecTestTransactionPrimaryData;
import beans.FurnishingTransaction;
import hibernateConnect.HibernateConfig;

public class DaoSave1ElecParamDefaultValue {
	
	public void save1ElecParamDefaultValue(ElecTestTransactionPrimaryData elecTestTransactionPrimaryData,FurnishingTransaction furnishingTransaction) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		session.saveOrUpdate(furnishingTransaction);
		session.saveOrUpdate(elecTestTransactionPrimaryData);
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
