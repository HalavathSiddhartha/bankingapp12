package bankingapp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bankingapp.dao.TransDao;
import bankingapp.dao.UserDao;
import bankingapp.entity.Cust_detail;
import bankingapp.entity.Customer;



@Controller
public class CustomerController {
	@Autowired
	TransDao transdao;
	@Autowired
	UserDao userDao;
	
	 @RequestMapping("/customerLogin")
	  
	  public String customoerLogin() {
		 
		  
		  return "customerLogin";
	  }
	 
	 
	 
	 @RequestMapping(path ="/custvalid",method = RequestMethod.POST)
	  public String getdataForm(@RequestParam("accountNumber")int accountNumber,
			  @RequestParam("password")String password,
			  					Model m,HttpServletRequest rs) {

		 Customer cust=new Customer();
		 cust.setPassword(password);
		 cust.setAccountNumber(accountNumber);
		 
		 

		 boolean logiflag=userDao.valid(cust);
		 System.out.println(accountNumber);
		
		 m.addAttribute("accountNumber",accountNumber);
		
		 m.addAttribute("password",password);
		 if(logiflag==true) {
			 int accountBalance = transdao.checkBalance(accountNumber);
		        m.addAttribute("balance",accountBalance);
			 HttpSession session=rs.getSession();
			// session.setAttribute("balance", transdao.checkBalance(Integer.parseInt(accountNumber)));
			 session.setAttribute("user", cust);
			 return "customerDashboard";
		 }
		 else {
			 m.addAttribute("message","Invalid Credential");
			 return "customerLogin"; 
		 }
	  }
	
	 @RequestMapping(path ="/customerDashboard")
	 public String customerdashboard(HttpSession session) {
		 int balance=(Integer)session.getAttribute("balance");
		 
		 Customer cust=(Customer)session.getAttribute("user");
		 if(cust!=null) {
			 return "customerDashboard";
		 }
		 else {
			 return "redirect:customerLogin";
		 }
		
	 }
	 
	 
	 
	 @RequestMapping("/forgetPassword")
	 public String forgetDashboard() {
		 return "forgetPass";
	 }
	 
//	 -----------------Reset Password ---------------------
	 
	 @RequestMapping(path="/resetPassword",method = RequestMethod.POST)
	 public String forgetpass(@RequestParam("accountNumber")String accountNumber,
			  @RequestParam("newPassword")String newPassword,
				Model m) {
		 
		Customer cs=new Customer();
		 cs.setPassword(newPassword);
		 cs.setAccountNumber(Integer.parseInt(accountNumber));
		 int res=userDao.updatePass(cs);
		 if(res==1) {
			 return "customerLogin";
		 }
		 else {
			 m.addAttribute("message","Error Pls try again...");
			 return "forgetPass";
		 }
		 
	 }
	 
	 //--------------Logout--------------------
		@GetMapping("/customerlogout")
		public String processLogout(HttpSession session, 
				Model attr) {

			//System.out.println(session.getAttribute("user"));
			session.invalidate();
			attr.addAttribute("result", "Logged out successfully");
			return "customerLogin";
		}
}
