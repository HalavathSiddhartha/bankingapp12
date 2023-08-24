
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Customer Account</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-pzjw6f+ua5mz72D9mCBaJPFmB9K0M4LCA6+M5x7GJh1PiIWX8f8V1ZI8Rzo0XaRd"
	crossorigin="anonymous">
<style>
body {
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.container {
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	padding: 30px;
	width: 400px;
	text-align: center;
}

.form-group {
	display: flex;
	flex-direction: row;
	align-items: center;
	margin-bottom: 15px;
}

.form-group label {
	font-weight: bold;
	width: 130px;
	margin-right: 10px;
}

.form-group input, .form-group select, .form-group textarea {
	flex-grow: 1;
}

.btn-primary {
	background-color: purple;
	border-color: white;
	width: 50%;
	color: white;
	border-radius: 5px;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}

.error-message {
	color: #dc3545;
	font-weight: bold;
	margin-top: 10px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="form-container">
			<h3 class="mb-4 text-center">Update Customer Account</h3>
			<form action="processUpdateAccount" method="POST"
				id="updateAccountForm" onsubmit="return validateForm();">
				<div class="form-group">
					<label for="accountNumber">Enter Account Number</label> <input
						type="text" class="form-control" id="accountNumber"
						name="accountNumber">
				</div>
				<div class="form-group">
					<label for="fullName">Full Name :</label> <input type="text"
						class="form-control" id="fullName" name="fullName">
				</div>
				<div class="form-group">
					<label for="address">Address :</label>
					<textarea class="form-control" id="address" name="address" rows="3"></textarea>
				</div>
				<div class="form-group">
					<label for="mobileNo">Mobile Number :</label> <input type="tel"
						class="form-control" id="mobileNo" name="mobileNo">
				</div>
				<div class="form-group">
					<label for="email">Email :</label> <input type="email"
						class="form-control" id="email" name="email">
				</div>
				<button type="submit" class="btn btn-primary">Update
					Account</button>
			</form>

			<div class="error-message">${message}</div>
		</div>
	</div>
	<script>
		function validateForm() {
			var accountNumber = document.getElementById("accountNumber").value;
			var fullName = document.getElementById("fullName").value;
			var address = document.getElementById("address").value;
			var mobileNo = document.getElementById("mobileNo").value;
			var email = document.getElementById("email").value;

			if (accountNumber.trim() === "") {
				alert("Account Number is required.");
				return false;
			}
			if (fullName.trim() === "") {
				alert("Full Name is required.");
				return false;
			}
			if (address.trim() === "") {
				alert("Address is required.");
				return false;
			}
			if (mobileNo.trim() === "") {
				alert("Mobile Number is required.");
				return false;
			}
			if (email.trim() === "") {
				alert("Email is required.");
				return false;
			}

			return true;
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-pzjw6f+ua5mz72D9mCBaJPFmB9K0M4LCA6+M5x7GJh1PiIWX8f8V1ZI8Rzo0XaRd"
		crossorigin="anonymous"></script>
</body>
</html>
