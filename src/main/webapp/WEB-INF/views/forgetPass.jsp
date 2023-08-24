<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
<style>
body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        form {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        button[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #2980b9;
        }

        .error {
            color: red;
        }
</style>


</head>
<body>
	<h1>Forgot Password</h1>
	<form name="forgotPasswordForm" onsubmit="return validateForm()"
		action="resetPassword" method="post">

		Account Number<input type="text" id="accountNumber"
			name="accountNumber" required><br> New PassWord<input
			type="password" id="newPassword" name="newPassword" required><br>


		Confirm Password<input type="password" id="confirmPassword"
			name="confirmPassword" required><br>

		<button type="submit">Reset Password</button>
		${message}
	</form>
	<script>
		function validateForm() {
			var accountNumber = document.forms["forgotPasswordForm"]["accountNumber"].value;
			var newPassword = document.forms["forgotPasswordForm"]["newPassword"].value;
			var confirmPassword = document.forms["forgotPasswordForm"]["confirmPassword"].value;

			if (accountNumber === "") {
				alert("Please enter your account number");
				return false;
			}

			if (newPassword === "") {
				alert("Please enter a new password");
				return false;
			}

			if (confirmPassword === "") {
				alert("Please confirm your new password");
				return false;
			}

			if (newPassword !== confirmPassword) {
				alert("Passwords do not match");
				return false;
			}
		}
	</script>

</body>
</html>
