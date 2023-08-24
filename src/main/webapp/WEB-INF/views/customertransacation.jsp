<%@page import="bankingapp.entity.Transcation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>customer Dashboard</title>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
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
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
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
	<%
	List<Transcation> listo = (List) request.getAttribute("transactions");
	%>
	<div class="container m-5 ">
		<%
		String acc = (String) request.getParameter("accountNumber");
		%>
		<a href="downloadTransactions?accountNumber=<%=acc%>">Download
			Transaction Table</a> <!-- <a href="customerDashboard">Return to Dashboard</a>
 -->
		<h1>List of Transactions</h1>

		<table border="1">
			<tr>
				<th>TransCounter</th>
				<th>Account Number</th>
				<th>Account Type</th>
				<th>Transaction Date</th>
				<th>Transaction Amount</th>
				<th>Remaining balance</th>
			</tr>

			<%
			int transactionCounter = 1; // Initialize the transaction counter
			for (Transcation transaction : listo) {
			%>
			<tr>
				<td><%=transactionCounter%></td>
				<td><%=transaction.getAccountNumber()%></td>
				<td><%=transaction.getTransType()%></td>
				<td><%=transaction.getTransDate()%></td>
				<td><%=transaction.getTransAmount()%></td>
				<td><%=transaction.getBalance()%></td>
			</tr>
			<%
			transactionCounter++; // Increment the transaction counter for each iteration
			}
			%>

		</table>
	</div>
	<div class="container m-5"></div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>