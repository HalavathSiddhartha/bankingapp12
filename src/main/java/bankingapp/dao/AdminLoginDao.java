package bankingapp.dao;

import bankingapp.entity.Admin;


public interface AdminLoginDao {
	/*
	 * Creating a method to validate the info which is taken from the view to
	 * controller the naming canvension should be followed. the para names gives
	 * here String username, String password they should have to be same in the
	 * contoller cls @requestparam and the names in the jsp form.
	 */
	int registerAdmin(Admin admin);
	Admin isAdminRegistered(String username, String password);
	boolean validateAdmin(String username, String password);

}
