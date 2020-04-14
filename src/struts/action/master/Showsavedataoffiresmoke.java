   package struts.action.master;	
	import org.hibernate.Session;


	

	import beans.FiresmokeTestingTransaction;
	import hibernateConnect.HibernateConfig;

	   public class  Showsavedataoffiresmoke{
		private String furnishingAssetId;
		
		private  FiresmokeTestingTransaction firesmokeTestingTransaction;
		
		
		public String showsavedata()
		{
			System.out.println("Inside showsave data1");
			Session session=null;
			session=HibernateConfig.getSession();
			Integer furnishingAssetIdasint=Integer.parseInt(furnishingAssetId);
			try
			{
				System.out.println("Inside showsave data2");
				
				firesmokeTestingTransaction=(FiresmokeTestingTransaction) session.get(FiresmokeTestingTransaction.class, furnishingAssetIdasint);
				
				
				
				return "success";
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
			finally
			{
				if(session!=null)
				{
					session.close();
				}
			}
		}


		public String getFurnishingAssetId() {
			return furnishingAssetId;
		}


		public void setFurnishingAssetId(String furnishingAssetId) {
			this.furnishingAssetId = furnishingAssetId;
		}


		public FiresmokeTestingTransaction getFiresmokeTestingTransaction() {
			return firesmokeTestingTransaction;
		}


		public void setFiresmokeTestingTransaction(FiresmokeTestingTransaction firesmokeTestingTransaction) {
			this.firesmokeTestingTransaction = firesmokeTestingTransaction;
		}


		         

			   }
