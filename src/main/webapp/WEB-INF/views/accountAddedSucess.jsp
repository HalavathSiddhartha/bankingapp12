<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Creation Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            color: #007bff;
        }

        h3 {
            margin-bottom: 10px;
            color: #333;
        }

        .details {
            text-align: left;
            margin-top: 20px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 5px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .details h3 {
            margin-bottom: 5px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Account Creation Status</h1>
        <p>Welcome, Dear <strong>${fullName}</strong>! Your account creation was successful.</p>

        <div class="details">
            <h3>Account Details:</h3>
            <p><strong>Name:</strong> ${fullName}</p>
            <p><strong>Address:</strong> ${address}</p>
            <p><strong>Mobile No:</strong> ${mobileNo}</p>
            <p><strong>Email:</strong> ${email}</p>
            <p><strong>Account Type:</strong> ${accountType}</p>
            <p><strong>Initial Balance:</strong> ₹${balance}</p>
            <p><strong>Account Number:</strong>${acc }
            <p><strong>Password:</strong> ${password}</p>
            
   
        </div>
    </div>
</body>
</html>
