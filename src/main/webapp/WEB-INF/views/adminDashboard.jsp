<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard - Bank Account Management</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
}

#header {
	background-color: #343a40;
	color: #fff;
	text-align: center;
	padding: 10px;
}

#container {
	max-width: 1200px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.dashboard-title {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 20px;
}

.menu {
	display: flex;
	justify-content: center;
	margin: 0;
	padding: 0;
	list-style: none;
}

.menu-item {
	margin: 0 15px;
}

.menu-link {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	transition: color 0.3s;
}

.menu-link:hover {
	color: #0066cc;
}

.section {
	margin-top: 40px;
	padding: 20px;
	background-color: #f5f5f5;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.card {
	padding: 20px;
	margin-bottom: 20px;
	background-color: #fff;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.card-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

/* Responsive layout adjustments */
@media screen and (max-width: 768px) {
	.menu {
		flex-direction: column;
		align-items: center;
	}
}
</style>
</head>
<body>
	<div id="header">
		<h2>Admin Dashboard - Bank Account Management</h2>
	</div>

	<div id="container">
		<div class="dashboard-title">Welcome back, Bank Admin!</div>
		<ul class="menu">
			<li class="menu-item"><a class="menu-link"
				href="newCustomerAccount">Create New Bank Account</a></li>
			<li class="menu-item"><a class="menu-link"
				href="viewAllAccounts">View All Bank Accounts</a></li>
			<li class="menu-item"><a class="menu-link" href="deleteAccounts">Delete
					Bank Account</a></li>
			<li class="menu-item"><a class="menu-link" href="updateaccount">Update
					Bank Account</a></li>
			<li class="menu-item"><a class="menu-link" href="logout">Logout</a></li>
		</ul>



	</div>

</body>
</html>
