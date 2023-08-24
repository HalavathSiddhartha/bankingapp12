package bankingapp.dao;

import java.util.List;

import bankingapp.entity.Transcation;

public interface TransDao {
	public int addmoney(int accountNumber, int depositAmount);

	public int deduct(int accountNumber, int withdrawMoney);

	List<Transcation> printStatement(int accountNumber, int limit);

	public List<Transcation> getColumnNames(int accountNumbre);
	
	public int checkBalance(int accountNumber);
	public int closeAccount(int accountNumber);
}
//<form action="addtrans" method="post">
//
//enter account number<input type="text" name="accountNumber" value="<%=acc%>">
//Deposit Amount: <input type="text" name="depositMoney" required><br>
//<button type="submit">Confirm</button>
//</form>	