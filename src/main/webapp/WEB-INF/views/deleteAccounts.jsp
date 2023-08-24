<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Bank Account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
body {
	background-color: #f8f9fa;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}

.form-container {
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	padding: 30px;
	width: 400px;
}

.form-group label {
	font-weight: bold;
}

.btn-danger {
	background-color: purple;
	color: white;
	border-color: white;
	width: 50%;
	border-radius: 5px;
}

.btn-danger:hover {
	background-color: #0056b3;
	border-color: #bd2130;
}

.error-message {
	color: #dc3545;
	font-weight: bold;
	margin-top: 10px;
}
</style>
</head>
<body>

	<nav
		class="navbar navbar-expand-lg bg-body-tertiary navbar bg-dark border-bottom border-body"
		data-bs-theme="dark">
		<div class="container-fluid m-4 px-5">
			<a class="navbar-brand " href="welcome">Nagaland bank</a>
			<div class="text-center  ">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/BankingApp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="about">About</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Login </a>
							<ul class="dropdown-menu">

								<li><a class="dropdown-item" href="customerLogin">Customer</a></li>
								<li><a class="dropdown-item" href="AdminLoginPage">
										Admin</a></li>
								<li><hr class="dropdown-divider"></li>

							</ul></li>

					</ul>
				</div>
			</div>

		</div>
	</nav>
<body>

	<div class="container">
		<div class="form-container">
			<h3 class="mb-4 text-center">Delete Bank Account</h3>

			<form action="deleteAccount" method="POST" id="deleteAccountForm">
				<div class="form-group">
					<label for="accountNumber">Enter Account Number: </label> <input
						type="text" class="form-control" id="accountNumber"
						name="accountNumber">
				</div>
				<button type="submit" class="btn btn-danger"
					id="deleteAccountButton">Delete Account</button>
			</form>
			<div class="error-message">${message}</div>
		</div>

	</div>
	<script>
    document.addEventListener("DOMContentLoaded", function() {
        var deleteAccountForm = document.getElementById("deleteAccountForm");
        var accountNumberInput = document.getElementById("accountNumber");
        var accountNumberError = document.getElementById("accountNumberError");

        deleteAccountForm.addEventListener("submit", function(event) {
            var accountNumber = accountNumberInput.value;
            
            if (accountNumber.trim() === "") {
                accountNumberError.textContent = "Account Number is required.";
                event.preventDefault();
            } else {
                accountNumberError.textContent = "";
            }
        });
    });
</script>

	<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"></script>
</body>
</html>
