package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import hibernateConnect.HibernateConfig;
import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ElecTestTransactionPrimaryData;
import beans.ElectBatteryTestTrans;
import beans.FurnishingTransaction;

public class DaoElectBatteryTestTrans {
	
	public void saveBatteryData(ElectBatteryTestTrans electBatteryTestTrans,FurnishingTransaction furnishingTransaction,ElecTestTransactionPrimaryData elecTestTransactionPrimaryData) {
		Session session=null;
		Transaction tx=null;
		
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		if(furnishingTransaction!=null)
		{
		session.update(furnishingTransaction);
		}
		session.saveOrUpdate(elecTestTransactionPrimaryData);
		session.saveOrUpdate(electBatteryTestTrans);
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
