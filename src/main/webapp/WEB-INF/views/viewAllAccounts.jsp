<%@page import="bankingapp.entity.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View All Accounts </title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>
	<%
	List<Customer> listOfAccounts = (List) request.getAttribute("listOfAccounts");
	%>
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
<!-- 					<a href="/downloadAccountsPdf" class="btn btn-primary">Download Accounts PDF</a>-->
 				</div>
			</div>

		</div>
	</nav>

	<div class="container m-5 ">
		<table class="table table-bordered ">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Sl.no</th>
					<th scope="col">FullName</th>
					<th scope="col">Address</th>
					<th scope="col">Mobile Number</th>
					<th scope="col">Email</th>
					<th scope="col">Type of account</th>
					<th scope="col">Balance</th>
					<th scope="col">Account number</th>
				</tr>
			</thead>
			<tbody>
    <%
    int slNo = 1;
    for (Customer customer : listOfAccounts) {
    %>
    <tr>
        <th scope="row"><%= slNo %></th>
        <td><%= customer.getFullName() %></td>
        <td><%= customer.getAddress() %></td>
        <td><%= customer.getMobileNo() %></td>
        <td><%= customer.getEmail() %></td>
        <td><%= customer.getAccountType() %></td>
        <td><%= customer.getBalance() %></td>
        <td><%= customer.getAccountNumber() %></td>
    </tr>
    <%
        slNo++;
    }
    %>
</tbody>


		</table>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
