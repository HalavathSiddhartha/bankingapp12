package bankingapp.controllers;

import java.security.SecureRandom;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bankingapp.dao.AdminLoginDao;
import bankingapp.dao.AdminLoginDaoImpl;
import bankingapp.dao.NewAccountDao;
import bankingapp.entity.Admin;
import bankingapp.entity.Customer;

@Controller
public class AdminController {

	/*
	 * Here we are creating the object of the Data access object of Admin login Dao
	 * Point to be noted while doing these the name wch is given to the dao cls here
	 * must be same as that given in spring-servlet.xml wch is the bean of
	 * AdminLoginDao An autowired should be done to establish the connection b/w dao
	 * layer and controller
	 */
	@Autowired
	AdminLoginDao adminLoginDao;
	@Autowired
	NewAccountDao account;

	// ----------------------------------HomePage---------------------------
	@RequestMapping("/")
	public String home() {
		return "homePage";
	}

	// ----------------------------------About---------------------------
	@RequestMapping("/about")
	public String about(Model model) {

		return "about";
	}

	// ----------------------------------URl For Admin Login
	// Page---------------------------
	@GetMapping("/adminLoginPage")
	public String adminLogin() {
		return "adminLoginPage";
	}

	// ----------------------------------New Admin Registration
	// page---------------------------
	@GetMapping("/adminRegPage")
	public String adminReg() {
		return "adminRegPage";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute("Admin") Admin admin, Model model, HttpServletRequest request) {
		int result = adminLoginDao.registerAdmin(admin);
		if (result == 1) {
			HttpSession session = request.getSession();

			model.addAttribute("message", "Registered successfully. Login to continue");
			return "adminLoginPage";
		} else {
			model.addAttribute("message", "Registration failed. Try again");
			return "adminRegPage";
		}

	}

	// ---------------------------------- admin data
	// validation---------------------------

	@PostMapping("/adminLoginProcess")
	public String checkAdmin(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpServletRequest rs) {
		boolean loginFlag = adminLoginDao.validateAdmin(username, password);
		model.addAttribute("username", username);
		model.addAttribute("password", password);
		if (loginFlag == true) {
			model.addAttribute("message", "Invalid credentials !!");
			HttpSession session = rs.getSession();
			session.setAttribute("username", adminLoginDao);
			return "adminDashboard";
		} else {
			model.addAttribute("message", "Can't find credentials");
			return "adminLoginPage";
		}

	}
	// ----------------------------------method for Creating bank
	// account---------------------------

	@RequestMapping(path = "/newCustomerAccount", method = RequestMethod.GET)
	public String newCustomerAccount() {
		return "newCustomerAccount";
	}

	@RequestMapping("/processNewAccount")

	public String openAccount(@RequestParam("fullName") String fullName, @RequestParam("address") String address,
			@RequestParam("mobileNo") String mobileNo, @RequestParam("email") String email,
			@RequestParam("accountType") String accountType, @RequestParam("initialBalance") int balance, Model model) {

		/*
		 * System.out.println(fullName); System.out.println(address);
		 * System.out.println(mobileNo); System.out.println(email);
		 * System.out.println(accountType); System.out.println(balance);
		 */
		// ----------------------------------Generating password for the user and add
		// the generated password to the customer tabel---------------------------

		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
		StringBuilder password = new StringBuilder(10); // Change the length as needed
		SecureRandom random = new SecureRandom();
		for (int i = 0; i < 10; i++) {
			int randomIndex = random.nextInt(chars.length());
			password.append(chars.charAt(randomIndex));
		}

		Customer newacc = new Customer();
		newacc.setFullName(fullName);
		newacc.setAddress(address);
		newacc.setMobileNo(mobileNo);
		newacc.setEmail(email);
		newacc.setAccountType(accountType);
		newacc.setBalance(balance);
		newacc.setPassword(password.toString());
		model.addAttribute("fullName", fullName);
		model.addAttribute("address", address);
		model.addAttribute("mobileNo", mobileNo);
		model.addAttribute("email", email);
		model.addAttribute("accountType", accountType);
		model.addAttribute("balance", balance);
		model.addAttribute("password", password);
		int result = account.createAccount(newacc);
		int trans = account.fetchAcoount();
		System.out.println(trans);
		int acct = account.insertIntoAccount(trans, balance);
		System.out.println(acct);
		if (result == 1) {

			int acc = account.fetchAccountNumber(password.toString());
			System.out.println(acc);
			model.addAttribute("acc", acc);

			return "accountAddedSucess";
		} else {
			return "errorPage";
		}
	}

	// ----------------------------------Method for view all
	// accounts---------------------------

	@RequestMapping("/viewAllAccounts")
	public String viewAccounts(Model model) {

		List<Customer> listOfAccounts = account.viewAllCustomers();
		model.addAttribute("listOfAccounts", listOfAccounts);

		return "viewAllAccounts";
	}

	@RequestMapping("/deleteAccounts")
	public String openDeleteForm() {

//		
		return "deleteAccounts";
	}
	// ----------------------------------Method for Deleting
	// accounts---------------------------

	@RequestMapping("/deleteAccount")
	public String deleteCustomer(@RequestParam("accountNumber") int accountNumber, Model model) {
		Customer customer = new Customer();

		customer.setAccountNumber(accountNumber);
		System.out.println(customer);
		int result = account.deleteAccount(accountNumber);
		if (result == 1) {
			model.addAttribute("message", "Account deleted successfully !!");
			return "deleteAccounts";
		} else {
			model.addAttribute("message", "Account Doesn't Exist or Already Deleted");
			return "deleteAccounts";

		}

	}

	// ----------------------------------Method for Updating
	// acoount---------------------------

	@RequestMapping("/updateaccount")
	public String openupdateaccount() {
		return "updateaccount";
	}

	@RequestMapping("/processUpdateAccount")
	public String updateAccount(@RequestParam("accountNumber") int accountNumber,
			@RequestParam("fullName") String fullName, @RequestParam("address") String address,
			@RequestParam("mobileNo") String mobileNo, @RequestParam("email") String email, Model model) {

		Customer customer = new Customer();
		customer.setAccountNumber(accountNumber);
		customer.setFullName(fullName);
		customer.setAddress(address);
		customer.setMobileNo(mobileNo);
		customer.setEmail(email);
		System.out.println(customer);

		int result = account.updateAccount(customer);
		if (result == 1) {
			model.addAttribute("message", "Updation sucessfull !");
			return "updateaccount";
		} else {
			model.addAttribute("message", "Please enter correct data !");
			return "updateaccount";
		}
	}

	// ----------------------------------Admin Logout
	// Method---------------------------

	@GetMapping("/logout")

	public String processLogout(HttpSession session, Model model) {
		System.out.println(session.getAttribute("admin"));
		session.invalidate();
		model.addAttribute("message", "Logged out successfull");
		return "adminLoginPage";
	}

}
