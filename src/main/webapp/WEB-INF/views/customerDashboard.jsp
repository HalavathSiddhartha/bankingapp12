<%@page import="bankingapp.entity.Cust_detail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- <meta http-equiv="refresh" content="5">  -->


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">



<title>Customer dashboard</title>
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
							aria-current="page" href="welcome">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="about">About</a></li>
						<li class="nav-item"><a class="nav-link"
							href="customerlogout">Logout</a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="adminLoginPage"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Login </a>
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

	<div class="container m-4 p-4 ">
		<div class="card rounded border-success" style="width: 18rem;">
			<img src="<c:url value="/resources/images/customerImage.png" />"
				alt="Image" class="rounded">
			<div class="card-body text-bg-primary">
				<p class="card-text ">welcome
			</div>
		</div>
		<div class="container m-4 p-4 d-flex justify-content-center">
			<h2>Remaining Balance : &#8377 ${balance}</h2>
		</div>
		<p class="text-danger">${message}</p>
	</div>



	<%
	String acc = (String) request.getParameter("accountNumber");
	%>

	<div class="container m-4 p-4 d-flex justify-content-between">
		<a class="navbar-brand " href="add">Add Money </a> <a
			class="navbar-brand " href="withdraw">Withdraw money</a> <a
			class="navbar-brand " href="closeAccount?accountNumber=<%=acc%>">Close
			Account</a>


		<form action="viewtransactions" method="post">
			<input type="hidden" name="accountNumber" value="<%=acc%>">
			<button type="submit" class="navbar-brand">View Transactions</button>
		</form>

	</div>






	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
		function refreshPage() {
			location.reload();
		}

		const refreshInterval = 5000;

		setTimeout(refreshPage, refreshInterval);
	</script>
</body>

</html>