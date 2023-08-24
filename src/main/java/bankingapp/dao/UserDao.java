package bankingapp.dao;

import bankingapp.entity.Cust_detail;
import bankingapp.entity.Customer;

public interface UserDao {
	public int updatePass(Customer cust);
	public boolean valid(Customer cust_detail);
}
