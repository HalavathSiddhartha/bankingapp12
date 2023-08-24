package bankingapp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import bankingapp.entity.Cust_detail;
import bankingapp.entity.Customer;

public class UserdaoImpl implements UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int updatePass(Customer cust) {
		String update = "UPDATE customer SET password = ? WHERE accountNumber = ?";
		int rs = this.jdbcTemplate.update(update, cust.getPassword(), cust.getAccountNumber());
		return rs;
	}

	@Override
	public boolean valid(Customer cust_detail) {
		String valid = "select count(*) from customer where accountNumber=? and password=? ";
		int query = jdbcTemplate.queryForObject(valid, Integer.class, cust_detail.getAccountNumber(),
				cust_detail.getPassword());

		if (query == 1) {
			return true;
		} else {
			return false;
		}
	}
		

}

