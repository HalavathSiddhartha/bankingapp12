<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<title>About the team</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #343a40;
        }

        .navbar-brand {
            color: #fff;
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: #fff;
        }

        .navbar-toggler-icon {
            background-color: #fff;
        }

        .container {
            margin-top: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
        }

        .card {
            width: 20rem;
            margin: 0 auto;
        }

        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }

        .card-body {
            padding: 20px;
        }
        .card-img-top {
            transition: transform 0.3s ease-in-out;
        }

        .card-img-top:hover {
            transform: scale(1.1);
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
							aria-current="page" href="/bankingapp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">About</a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Login </a>
							<ul class="dropdown-menu">

								<li><a class="dropdown-item" href="customerLogin">Customer</a></li>
								<li><a class="dropdown-item" href="adminLoginPage">
										Admin</a></li>
								<li><hr class="dropdown-divider"></li>

							</ul></li>

					</ul>
				</div>
			</div>

		</div>
	</nav>
	<div class="container m-4 p-4 d-flex justify-content-center"> <h1> Our Team </h1> </div>
	<div class="row mx-auto p-2 ">
		<div class="col ">
			<div class="card text-center mb-3" style="width:20rem">
				<img src="<c:url value="/resources/images/titus.jpeg"/>" class="card-img-top" style="width:20rem" alt="titus">
				<div class="card-body">
					<h5 class="card-title">Titus </h5>
				
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card" style="width:20rem">
				<img src="<c:url value="/resources/images/sidd.jpg"/>" class="card-img-top" style="width:20rem" alt="...">
				<div class="card-body">
					<h5 class="card-title">Siddhartha </h5>
					
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card" style="width:20rem">
				<img src="<c:url value="/resources/images/mani2.jpeg"/>" class="card-img-top" style="width:20rem" alt="...">
				<div class="card-body">
					<h5 class="card-title">Manish </h5>
					
				</div>
			</div>
		</div>
		
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>