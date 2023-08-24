<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false"  %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  </head>
  <body>
  
  
    <nav class="navbar navbar-expand-lg bg-body-tertiary navbar bg-dark border-bottom border-body" data-bs-theme="dark">
  <div class="container-fluid m-4 px-5">
    <a class="navbar-brand " href="welcome">Nagaland bank</a>
    <div class="text-center  ">   
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/BankingApp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about">About</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Login 
          </a>
          <ul class="dropdown-menu">
         
            <li><a class="dropdown-item" href="customerLogin">Customer</a></li>
            <li><a class="dropdown-item" href="AdminLoginPage"> Admin</a></li>
            <li><hr class="dropdown-divider"></li>
            
          </ul>
        </li>
        
      </ul>
          </div> 
           </div>
   
  </div>
</nav>
  <div class=" mx-auto p-2" style="width: 500px;">
       <p class="fs-1 mx-auto py-2 text-center" >Customer Login </p>
    <form action="custvalid" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label ">Account number</label>
    <input type="text" class="form-control" id="username" name="accountNumber" aria-describedby="emailHelp" required="required">
    
  </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" name="password" required="required">
     
  </div>
   
 <span> ${message}<a class="d-flex justify-content-end text-danger" href="forgetPassword">forget Password?</a></span>
 <div class="d-flex justify-content-center">
 <button type="submit" class="btn btn-primary mx-5 px-10">Login</button> 
 
   
 </div>

  
</form>

</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</html>