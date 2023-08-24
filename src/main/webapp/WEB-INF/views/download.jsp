<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Download Transactions</title>
</head>
<body>
    <h2>Download Last 10 Transactions</h2>
    
    <a href="${pageContext.request.contextPath}/downloadTransactions/${yourAccountNumber}">Download Transactions</a>
</body>
</html>
