package bankingapp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import bankingapp.entity.Transcation;

public class TransDaoimpl implements TransDao {

	@Autowired

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Transcation> getColumnNames(int accountNumber) {
		String query = "SELECT * FROM transactions where accountNumber=?";
		return this.jdbcTemplate.query(query, new TranscationRowMapperImpl(), accountNumber);

	}

	@Override
	public int addmoney(int accountNumber, int depositAmount) {
		String updateBalance = "UPDATE account SET balance = balance + ? WHERE accountNumber = ?";
		String insertTransactionSql = "INSERT INTO transactions (accountNumber, transDate, transAmount, transType, balance) "
				+ "VALUES (?, NOW(), ?, 'Deposit', (SELECT balance FROM account WHERE accountNumber = ?))";
		int res;
		try {
			// Update account balance
			res = this.jdbcTemplate.update(updateBalance, depositAmount, accountNumber);

			// Insert transaction record
			res = this.jdbcTemplate.update(insertTransactionSql, accountNumber, depositAmount, accountNumber);
		} catch (Exception e) {
			// Handle exceptions
			throw new RuntimeException("Error depositing money", e);
		}
		return res;

	}

	@Override
	public int deduct(int accountNumber, int withdrawMoney) {
		int currentBalance = jdbcTemplate.queryForObject("SELECT balance FROM account WHERE accountNumber = ?",
				Integer.class, accountNumber);
		int res = 0;
		if (currentBalance >= withdrawMoney) {
			// Sufficient balance, proceed with withdrawal
			res = this.jdbcTemplate.update("UPDATE account SET balance = balance - ? WHERE accountNumber = ?",
					withdrawMoney, accountNumber);

			res = this.jdbcTemplate.update(
					"INSERT INTO transactions (accountNumber, transDate, transAmount, transType, balance) "
							+ "VALUES (?, NOW(), ?, 'debit', ?)",
					accountNumber, withdrawMoney, currentBalance - withdrawMoney);

			return res; // Redirect to a success page
		}

		else {
			return res;
		}

	}

	public int closeAccount(int accountNumber) {

		String querey = "UPDATE account SET activeStatus = 'Closed' WHERE accountNumber = ?";

		int rs = this.jdbcTemplate.update(querey, accountNumber);
		return rs;
	}

	@Override
	public List<Transcation> printStatement(int accountNumber, int limit) {
		String sql = "SELECT * FROM transactions WHERE accountNumber = ? ORDER BY transDate DESC LIMIT ?";
		return jdbcTemplate.query(sql, new TranscationRowMapperImpl());
	}

	@Override
	public int checkBalance(int accountNumber) {
		int currentBalance = jdbcTemplate.queryForObject("SELECT balance FROM account WHERE accountNumber = ?",
				Integer.class, accountNumber);
		return currentBalance;
	}

}
