<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="./css/mystyle.css" rel="stylesheet">
 
  <!-- Google Fonts -->
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
 
 
<style>
    /* Custom styles for the login page */
    body {
        background-color: #f0f2f5; /* A light, clean background */
    }
    .login-container {
        min-height: calc(100vh - 56px); /* Full viewport height minus navbar height */
        display: flex;
        align-items: center;
        justify-content: center;
    }
</style>

</head>
<body>

<!-- Including the Navbar -->
<%@include file="normal_navbar.jsp" %>

<!-- Main Login Form Content -->
<main class="login-container">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card shadow-sm">
                    <div class="card-header bg-dark text-white text-center">
                        <span class="fa fa-user-circle fa-3x"></span>
                        <h4 class="mt-2">Login</h4>
                    </div>
                    <div class="card-body">
                        <form action="LoginServlet" method="post">
                            <!-- Email Field -->
                            <div class="mb-3">
                                <label for="email" class="form-label">Email address</label>
                                <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
                            </div>
                            <!-- Password Field -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required placeholder="Enter your password">
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-dark">Submit</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        Don't have an account? <a href="register.jsp">Sign up here</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


<%@include file="footer.jsp" %>



<!-- js section  -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript" ></script>

</body>
</html>