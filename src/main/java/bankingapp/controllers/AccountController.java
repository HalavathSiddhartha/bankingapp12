package bankingapp.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import bankingapp.dao.TransDao;
import bankingapp.entity.Transcation;

@Controller
public class AccountController {
	@Autowired
	TransDao transdao;

	@RequestMapping(path = "/add")
	public String add(HttpSession session)

	{
		session.getAttribute("user");
		return "addMoney";
	}

	@RequestMapping(path = "/withdraw")
	public String withdraw()

	{
		return "withdrawMoney";
	}

	// -------------------------------Close
	// Account--------------------------------------
	@RequestMapping("/closeAccount")
	public String closeAccount(@RequestParam("accountNumber") int acc) {
		int rs = transdao.closeAccount(acc);

		if (rs == 1) {

			return "customerLogin";
		} else {

			return "customerDashboard";
		}

	}

//----------------------------------View Transactions---------------------------
	public String viewTrans() {

		return "customertransacation";
	}

	@RequestMapping(path = "/viewtransactions", method = RequestMethod.POST)
	public String listTransactions(@RequestParam("accountNumber") int accountNumber, Model model) {
		int accountBalance = transdao.checkBalance(accountNumber);
		model.addAttribute("balance", accountBalance);
		List<Transcation> transactions = transdao.getColumnNames(accountNumber);
		model.addAttribute("transactions", transactions);
		model.addAttribute("accountNumber", accountNumber);
		return "customertransacation";
	}

//--------------------------------Add money---------------------------------
	@RequestMapping(path = "/addtrans", method = RequestMethod.POST)
	public String deposit(@RequestParam("accountNumber") int accountNumber,
			@RequestParam("depositMoney") int depositMoney, Model m) {
		// int accountBalance = transdao.checkBalance(accountNumber);

		try {
			int result = transdao.addmoney(accountNumber, depositMoney);
			int accountBalance = transdao.checkBalance(accountNumber);
			m.addAttribute("balance", accountBalance);
			if (result == 1) {
				m.addAttribute("message", "transaction successfull");
				return "customerDashboard";
			} else {
				return "errorPage";
			}
		} catch (Exception e) {
			// Handle exceptions
			return "errorPage";
		}
	}

//--------------------------------------------Withdraw Money--------------------------
	@RequestMapping(path = "/transCheck", method = RequestMethod.POST)
	public String deduct(@RequestParam("accountNumber") int accountNumber,
			@RequestParam("withdrawMoney") int withdrawMoney, Model m) {
		try {
			// Retrieve the account balance for the given account number
			int accountBalance = transdao.checkBalance(accountNumber);
			m.addAttribute("balance", accountBalance);
			m.addAttribute("accountNumber", accountNumber);

			if (withdrawMoney > accountBalance) {

				m.addAttribute("message", "Insufficient balance to withdraw " + withdrawMoney + "Rs");
				m.addAttribute("accountNumber", accountNumber);
				return "customerDashboard";
			}

			int result = transdao.deduct(accountNumber, withdrawMoney);

			if (result == 1) {
				int accountBalance1 = transdao.checkBalance(accountNumber);
				m.addAttribute("balance", accountBalance1);
				m.addAttribute("accountNumber", accountNumber);
				m.addAttribute("message", "Transaction successful");
				return "customerDashboard";
			} else {
				return "errorPage";
			}
		} catch (Exception e) {
			// Handle exceptions
			return "errorPage";
		}
	}

	// --------------Printing Statement----------------------------------
	@RequestMapping(value = "/downloadTransactions", method = RequestMethod.GET)
	public void downloadTable(@RequestParam("accountNumber") int accountNumber, HttpServletResponse response)
			throws IOException {
		// System.out.println(accountNumber);
		List<Transcation> transactions = transdao.getColumnNames(accountNumber);

		response.setContentType("text/plain");
		response.setHeader("Content-Disposition", "attachment; filename=transaction_table.txt");

		try (PrintWriter writer = response.getWriter()) {
			for (Transcation transaction : transactions) {
				writer.println("Transaction ID: " + transaction.getTransId());
				writer.println("Account Number: " + transaction.getAccountNumber());
				writer.print("Transaction Date : " + transaction.getTransDate() + "\t");
				writer.print("Transaction Amount : " + transaction.getTransAmount() + "\t");
				writer.print("Transaction Date : " + transaction.getTransType() + "\t");
				writer.print("Remaining Balance: " + transaction.getBalance() + "\t");

				// Add other transaction details
				writer.println(); // Add an empty line between transactions
			}
		}
	}

}
