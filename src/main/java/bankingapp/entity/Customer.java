package bankingapp.entity;

public class Customer {
	private String fullName;
	private String address;
	private String mobileNo;
	private String email;
	private String accountType;
	private int balance;
	private int accountNumber;
	private String password;

	public Customer() {
		super();

	}

	public Customer(String fullName, String address, String mobileNo, String email, String accountType, int balance,
			int accountNumber, String password) {
		super();
		this.fullName = fullName;
		this.address = address;
		this.mobileNo = mobileNo;
		this.email = email;
		this.accountType = accountType;
		this.balance = balance;
		this.accountNumber = accountNumber;
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public int getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(int accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "NewAccount [fullName=" + fullName + ", address=" + address + ", mobileNo=" + mobileNo + ", email="
				+ email + ", accountType=" + accountType + ", balance=" + balance + ", accountNumber=" + accountNumber
				+ ", password=" + password + "]";
	}
	

}