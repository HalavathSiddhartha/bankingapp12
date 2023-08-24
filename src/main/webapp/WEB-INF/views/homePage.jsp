<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
.background-image {
	position: relative;
	background-image: url('<c:url value="/resources/images/homeImg.png"/>');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	height: 100vh;
}

.background-image::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.1);
	/* Adjust overlay background color */
	backdrop-filter: blur(5px); /* Adjust blur intensity */
	z-index: -1;
}

.heading-container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	color: #000;
	padding: 200px 0;
}

.heading {
	font-family: 'Poppins', sans-serif;
	font-size: 48px;
	font-weight: bold;
	color: #000;
	margin-bottom: 20px;
}

.heading:hover {
	transform: scale(1.1);
}

.subheading {
	font-family: 'Poppins', sans-serif;
	font-size: 24px;
	color: #666;
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

.about-bank {
	font-family: 'Poppins', sans-serif;
	font-size: 18px;
	color: #000;
	max-width: 800px;
	margin: 0 auto;
}

@
keyframes fadeIn { 0% {
	opacity: 0;
	transform: translateY(-20px);
}

100




%
{
opacity




:




1


;
transform




:




translateY


(




0




)


;
}
}
.fade-in {
	animation: fadeIn 1s ease-in-out;
}

heading {
	overflow: hidden;
	white-space: nowrap;
	animation: marquee 20s linear infinite;
}

@
keyframes marquee { 0% {
	transform: translateX(100%);
}
100
%
{
transform
:
translateX(
-100%
);
}
}
</style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg bg-body-tertiary navbar bg-dark border-bottom border-body"
		data-bs-theme="dark">
		<div class="container-fluid m-4 px-5">
			<a class="navbar-brand " href="welcome">Nagaland Bank</a>
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
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="about">About</a></li>
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
	<div class="background-image">
		<div class="heading-container">
			<h1 class="heading">Welcome to Nagaland Bank</h1>
			<p class="subheading">We are India's first cloud bankers</p>
			<p class="about-bank">At Nagaland Bank, we are dedicated to
				providing innovative banking solutions that leverage the power of
				cloud technology. With a strong commitment to security, convenience,
				and customer satisfaction, we aim to redefine the banking experience
				for our valued customers.</p>
			<p class="about-bank">Our cloud-based platform allows you to
				access your accounts, manage transactions, and perform banking
				operations seamlessly from anywhere in the world. Say goodbye to
				traditional banking hassles and embrace the future of banking with
				Nagaland Bank.</p>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>