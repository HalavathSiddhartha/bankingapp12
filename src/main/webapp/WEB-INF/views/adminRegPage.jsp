<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Registration Form</title>
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
			<h3 class="mb-4 text-center">Admin Registration</h3>
			<form action="register" method="POST" id="accountForm">
				<div class="form-group">
					<label for="fullName">Name:</label> <input type="text"
						class="form-control" id="fullName" name="name">
				</div>
				<div class="form-group">
					<label for="username">Username:</label> <input type="text"
						class="form-control" id="username" name="username">
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" id="password" name="password">
				</div>
				<div class="form-group">
					<label for="confirmPassword">Confirm Password:</label> <input
						type="password" class="form-control" id="confirmPassword"
						name="confirmPassword">
				</div>

				<button type="submit" class="btn btn-primary" id="submitBtn">Create
					Account</button>
			</form>
		</div>
		<div class="error-message">${message}</div>
	</div>

	<script>
    document.addEventListener("DOMContentLoaded", function() {
        const submitButton = document.getElementById("submitBtn");
        const form = document.getElementById("accountForm");
        const passwordInput = document.getElementById("password");
        const confirmPasswordInput = document.getElementById("confirmPassword");

        submitButton.addEventListener("click", function(event) {
            const fullName = document.getElementById("fullName").value;
            const username = document.getElementById("username").value;
            const password = passwordInput.value;
            const confirmPassword = confirmPasswordInput.value;

            if (fullName.trim() === "" || username.trim() === "" || password.trim() === "") {
                alert("Please fill in all fields.");
                event.preventDefault();
            } else if (password.length < 8 || password.length > 15) {
                alert("Password must be between 8 and 15 characters.");
                event.preventDefault();
            } else if (password !== confirmPassword) {
                alert("Passwords do not match.");
                event.preventDefault();
            }
        });
    });
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
