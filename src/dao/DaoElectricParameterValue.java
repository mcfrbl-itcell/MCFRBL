package dao;


import org.hibernate.Session;
import org.hibernate.Transaction;
import beans.ElectTestTransaction;
import hibernateConnect.HibernateConfig;

public class DaoElectricParameterValue 
{

	public void saveElectricParameterValue(ElectTestTransaction electricalParameter) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		/*if(electricalParameter!=null)
		{
		session.update(electricalParameter);
		}
		else
		{*/
		session.saveOrUpdate(electricalParameter);
		
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
