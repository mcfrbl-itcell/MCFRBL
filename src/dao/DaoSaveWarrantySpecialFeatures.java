package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.CoachWarrantySplFeatures;
import hibernateConnect.HibernateConfig;

public class DaoSaveWarrantySpecialFeatures {

	public void saveData(CoachWarrantySplFeatures cwsUpdate, CoachWarrantySplFeatures cwsSave) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		 tx=session.beginTransaction();
		if(cwsUpdate!=null)
		{
			session.update(cwsUpdate);
		}
		else
		{
			session.save(cwsSave);
		}
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


