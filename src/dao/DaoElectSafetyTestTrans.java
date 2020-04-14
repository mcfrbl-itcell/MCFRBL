package dao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import beans.FurnishingTransaction;
import beans.ElecTestTransactionPrimaryData;
import beans.ElectSafetyTestTrans;
import hibernateConnect.HibernateConfig;


public class DaoElectSafetyTestTrans {
	
	public void daoElectSafetyTestTrans(ElectSafetyTestTrans electSafetyTestTrans,FurnishingTransaction furnishingTransaction,ElecTestTransactionPrimaryData elecTestTransactionPrimaryData) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		if(furnishingTransaction!=null)
		{
			session.saveOrUpdate(furnishingTransaction);
		}
		session.saveOrUpdate(elecTestTransactionPrimaryData);
		session.saveOrUpdate(electSafetyTestTrans);
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
