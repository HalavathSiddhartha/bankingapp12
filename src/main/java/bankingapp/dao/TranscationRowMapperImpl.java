package bankingapp.dao;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import bankingapp.entity.Transcation;


public class TranscationRowMapperImpl implements RowMapper<Transcation>{
	@Override
	public Transcation mapRow(ResultSet rs, int rowNum) throws SQLException {
	Transcation trans=new Transcation();
	trans.setTransId(rs.getInt("transId"));
	trans.setAccountNumber(rs.getInt("accountNumber"));
	trans.setBalance(rs.getInt("balance"));
	trans.setTransDate(rs.getTimestamp("transDate").toLocalDateTime());
	trans.setTransType(rs.getString("transType"));
	trans.setTransAmount(rs.getInt("transAmount"));
		return trans;
	}
		
}
