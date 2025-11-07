<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<!-- Font Awesome 5 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Your Custom CSS -->
<link href="./css/mystyle.css" rel="stylesheet">

<!-- SweetAlert2 CSS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 
</head>
<body>

<style>
    body {
        background-color: #f0f2f5;
    }
    .register-container {
        padding-top: 3rem;
        padding-bottom: 3rem;
    }
</style>

</head>
<body>

<!-- 1. nav bar  -->
<%@include file="normal_navbar.jsp" %>

<!-- Main Registration Form Content -->
<main class="register-container">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card shadow-sm">
                    <div class="card-header bg-dark text-white text-center">
                        <span class="fas fa-user-plus fa-3x"></span>
                        <h4 class="mt-2">Register</h4>
                    </div>
                    <div class="card-body">
                        <form id="reg-form" action="RegisterServlet" method="post">
                            <!-- Name Field -->
                            <div class="mb-3">
                                <label for="user_name" class="form-label">User Name</label>
                                <input type="text" class="form-control" id="user_name" name="user_name" required>
                            </div>
                            <!-- Email Field -->
                            <div class="mb-3">
                                <label for="user_email" class="form-label">Email address</label>
                                <input type="email" class="form-control" id="user_email" name="user_email" required>
                            </div>
                            <!-- Password Field -->
                            <div class="mb-3">
                                <label for="user_password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="user_password" name="user_password" required>
                            </div>
                            <!-- Gender Field -->
                            <div class="mb-3">
                                <label class="form-label">Gender</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="male" value="male" required>
                                    <label class="form-check-label" for="male">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                                    <label class="form-check-label" for="female">Female</label>
                                </div>
                            </div>
                            <!-- About Field -->
                            <div class="mb-3">
                                <label for="about" class="form-label">About</label>
                                <textarea class="form-control" id="about" name="about" rows="3"></textarea>
                            </div>
                            <!-- Terms and Conditions -->
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="terms" name="check" required>
                                <label class="form-check-label" for="terms">I agree to the terms and conditions</label>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-dark">Sign Up</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        Already have an account? <a href="login.jsp">Login here</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Including the Footer -->
<%@include file="footer.jsp" %>



<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript" ></script>

<script>
$(document).ready(function () {
    $('#reg-form').on('submit', function (event) {
        event.preventDefault();

        let form = new FormData(this);

        $.ajax({
            url: "RegisterServlet",
            type: 'POST',
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                data = data.trim();
                if (data === "done") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Registration Successful!',
                        text: 'Welcome to TechBlog!',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Go to Login'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location = 'login.jsp';
                        }
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Registration Failed',
                        text: 'Something went wrong. Please try again.'
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                Swal.fire({
                    icon: 'error',
                    title: 'Server Error',
                    text: 'Could not connect to server. Please try again later.'
                });
            }
        });
    });
});
</script>

</body>
</html>