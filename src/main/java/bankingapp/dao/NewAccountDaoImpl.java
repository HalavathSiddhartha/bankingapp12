package bankingapp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import bankingapp.entity.Customer;

@Repository
public class NewAccountDaoImpl implements NewAccountDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int createAccount(Customer account) {

		String accountCreateQuery = "INSERT INTO customer"
				+ "(fullName,address,mobileNo,email,accountType,balance,password)"

				+ "VALUES (?,?,?,?,?,?,?)";

		return this.jdbcTemplate.update(accountCreateQuery, account.getFullName(), account.getAddress(),
				account.getMobileNo(), account.getEmail(), account.getAccountType(), account.getBalance(),
				account.getPassword());

	}

	@Override
	public int deleteAccount(int account) {
		String deleteAccount = "DELETE FROM customer WHERE accountNumber = ?";
		return jdbcTemplate.update(deleteAccount, account);
	}

	@Override
	public List<Customer> viewAllCustomers() {
		String getAllaccounts = "SELECT * FROM customer";
		return this.jdbcTemplate.query(getAllaccounts, new RowMapperImpl());
	}

	@Override
	public int fetchAccountNumber(String password) {

		String getaccountNumber = "SELECT accountNumber FROM customer where password=?";
		return this.jdbcTemplate.queryForObject(getaccountNumber, Integer.class, password);

	}

	@Override
	public int updateAccount(Customer account) {
		String updateAccountQuery = "UPDATE customer SET fullName=?,address=?,mobileNo=?,email=? WHERE accountNumber=?";
		return this.jdbcTemplate.update(updateAccountQuery, account.getFullName(), account.getAddress(),
				account.getMobileNo(), account.getEmail(), account.getAccountNumber());
	}

	@Override
	public int fetchAcoount() {
		String query  = "SELECT accountNumber FROM customer ORDER BY accountNumber DESC LIMIT 1;";
		return this.jdbcTemplate.queryForObject(query, Integer.class);
		
	}

	@Override
	public int insertIntoAccount(int accountNumber, int balance) {
		String query = "INSERT INTO account (accountNumber,balance,activeStatus) VALUES (?,?,'active')";
		return this.jdbcTemplate.update(query,accountNumber,balance);
	}

}
