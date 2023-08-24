package bankingapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import bankingapp.entity.Customer;

public class RowMapperImpl implements RowMapper<Customer> {
	public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
		Customer customer = new Customer();
		customer.setFullName(rs.getString("fullName"));
		customer.setAddress(rs.getString("address"));
		customer.setMobileNo(rs.getString("mobileNo"));
		customer.setEmail(rs.getString("email"));
		customer.setAccountType(rs.getString("accountType"));
		customer.setBalance(rs.getInt("balance"));
		customer.setAccountNumber(rs.getInt("accountNumber"));
		return customer;
	}
}
