
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
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
		<form id="loginForm" action="adminLoginProcess" method="POST">
			<h3 class="text-center mt-3">Admin Login</h3>
			<div class="form-group">
				<label for="usernameInput">Username</label> <input type="text"
					class="form-control" id="usernameInput"
					aria-describedby="emailHelp" placeholder="Enter Username"
					name="username"> <small id="usernameError"
					class="form-text text-danger"></small>
			</div>
			<div class="form-group">
				<label for="passwordInput">Password</label> <input type="password"
					class="form-control" id="passwordInput" placeholder="Password"
					name="password">
				<!-- <div class="input-group-append">
						<button class="btn btn-outline-primary toggle-password"
							type="button">Show</button>
					</div> -->
				<small id="passwordError" class="form-text text-danger"></small>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">Login</button>


			</div>
			<p class="mt-3">
				<a href="adminRegPage" class="btn btn-outline-primary">New admin</a>
			</p>
		</form>
		<div class="error-message">${message}</div>
	</div>
	<script>
    var usernameInput = document.getElementById("usernameInput");
    var passwordInput = document.getElementById("passwordInput");
    var usernameError = document.getElementById("usernameError");
    var passwordError = document.getElementById("passwordError");

    usernameInput.addEventListener("input", validateUsername);
    passwordInput.addEventListener("input", validatePassword);

    function validateUsername() {
        if (usernameInput.value === "") {
            usernameError.textContent = "Username is required.";
        } else if (usernameInput.value.length > 20) {
            usernameError.textContent = "Username cannot exceed 20 characters.";
        } else {
            usernameError.textContent = "";
        }
    }

    function validatePassword() {
        var password = passwordInput.value;
        
        if (password === "") {
            passwordError.textContent = "Password is required.";
        } else if (password.length < 8 || password.length > 15) {
            passwordError.textContent = "Password must be between 8 and 15 characters.";
        } else {
            passwordError.textContent = "";
        }
    }

    document.getElementById("loginForm").addEventListener("submit", function(event) {
        validateUsername();
        validatePassword();
        
        if (usernameError.textContent !== "" || passwordError.textContent !== "") {
            event.preventDefault();
        }
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





