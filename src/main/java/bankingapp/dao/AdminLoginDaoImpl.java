	package bankingapp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import bankingapp.entity.Admin;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {
	@Autowired

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int registerAdmin(Admin admin) {
		// Validate all fields and password length server-side before inserting into the
		// database
		String name = admin.getName();
		String username = admin.getUsername();
		String password = admin.getPassword();

		if (name.isEmpty() || username.isEmpty() || password.isEmpty()) {
			throw new IllegalArgumentException("All fields are mandatory.");
		}

		if (password.length() < 8 || password.length() > 15) {
			throw new IllegalArgumentException("Password must be between 8 and 15 characters.");
		}

		String insertQuery = "INSERT INTO admin (name, username, password) VALUES (?, ?, ?)";
		return jdbcTemplate.update(insertQuery, name, username, password);
	}

	@Override
	public Admin isAdminRegistered(String username, String password) {
		String checkQuery = "SELECT * FROM admin WHERE username=? AND password = ?";

		Admin admin = null;

		if (username != null && !username.isEmpty()) {
			System.out.println("admin : " + admin);
			admin = jdbcTemplate.queryForObject(checkQuery, new AdminRowMapper(), username, password);
		}
		System.out.println("---------");
		System.out.println(admin);
		return admin;

	}
	@Override
	public boolean validateAdmin(String username, String password) {
		int query = jdbcTemplate.queryForObject("select count(*)"
				+ " from admin where username=?"
				+ " and password=?",
				Integer.class, username, password);
		if (query == 1)
			return true;
		else
			return false;
	}

}
