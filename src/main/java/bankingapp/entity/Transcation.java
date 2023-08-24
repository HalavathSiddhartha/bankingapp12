package bankingapp.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Transcation {
		
	private int transId;
	private int accountNumber;
	private LocalDateTime transDate;
	private String transType;
	private int transAmount;
	private int balance;
	
	
	public Transcation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getTransId() {
		return transId;
	}
	public void setTransId(int transId) {
		this.transId = transId;
	}
	public int getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(int accountNumber) {
		this.accountNumber = accountNumber;
	}
	public LocalDateTime getTransDate() {
		return transDate;
	}
	public void setTransDate(LocalDateTime transDate) {
		this.transDate = transDate;
	}
	public String getTransType() {
		return transType;
	}
	public void setTransType(String transType) {
		this.transType = transType;
	}
	public int getTransAmount() {
		return transAmount;
	}
	public void setTransAmount(int transAmount) {
		this.transAmount = transAmount;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	
	
	
}
