package bankingapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import bankingapp.entity.Admin;

public class AdminRowMapper implements RowMapper<Admin> {

	@Override
	public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
		Admin admin = new Admin();

		admin.setId(rs.getInt("id"));
		admin.setName(rs.getString("name"));
		admin.setUsername(rs.getString("username"));
		admin.setPassword(rs.getString("password"));

		return admin;
	}

}
