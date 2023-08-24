<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Bank Account</title>
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
</style>
</head>
<body>
	<div class="container">
		<div class="form-container">
			<h3 class="mb-4 text-center">Create New Bank Account</h3>
			<form action="processNewAccount" method="POST" id="accountForm">
				<div class="form-group">
					<label for="fullName">Full Name:</label> <input type="text"
						class="form-control" id="fullName" name="fullName">
				</div>
				<div class="form-group">
					<label for="address">Address:</label>
					<textarea class="form-control" id="address" name="address" rows="3"></textarea>
				</div>
				<div class="form-group">
					<label for="mobileNo">Mobile No:</label> <input type="tel"
						class="form-control" id="mobileNo" name="mobileNo">
				</div>
				<div class="form-group">
					<label for="email">Email ID:</label> <input type="email"
						class="form-control" id="email" name="email">
				</div>
				<div class="form-group">
					<label for="accountType">Account Type:</label> <select
						class="form-control" id="accountType" name="accountType">
						<option value="savings">Savings</option>
						<option value="current">Current</option>
					</select>
				</div>
				<div class="form-group">
					<label for="initialBalance">Initial Balance:</label> <input
						type="text" class="form-control" id="balance"
						name="initialBalance">
				</div>
				<button type="submit" class="btn btn-primary">Create
					Account</button>
			</form>
		</div>
	</div>
	<script>
		document.getElementById("accountForm").addEventListener("submit",
				function(event) {
					if (!validateForm()) {
						event.preventDefault();
					}
				});

		function validateForm() {
			var fullName = document.getElementById("fullName").value;
			var address = document.getElementById("address").value;
			var mobileNo = document.getElementById("mobileNo").value;
			var email = document.getElementById("email").value;
			var accountType = document.getElementById("accountType").value;
			var initialBalance = document.getElementById("balance").value;

			if (fullName.trim() === "") {
				alert("Full Name is required.");
				return false;
			}

			if (address.trim() === "") {
				alert("Address is required.");
				return false;
			}

			if (mobileNo.trim() === "") {
				alert("Mobile No is required.");
				return false;
			}

			if (email.trim() === "") {
				alert("Email ID is required.");
				return false;
			} else if (!/\S+@\S+\.\S+/.test(email)) {
				alert("Enter a valid email address.");
				return false;
			}

			if (accountType.trim() === "") {
				alert("Select an account type.");
				return false;
			}
			if (initialBalance.trim() === "" || parseFloat(initialBalance) < 0) {
				alert("Initial Balance is required and must be non-negative.");
				return false;
			}

			return true;
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous">
		
	</script>
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
