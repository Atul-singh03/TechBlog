<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - TechBlog</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<!-- Font Awesome 5 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Your Custom CSS -->
<link href="./css/mystyle.css" rel="stylesheet">

<style>
    body {
        background-color: #f0f2f5;
    }
    .contact-header {
        background: #343a40;
        color: white;
        padding: 60px 0;
        text-align: center;
    }
    .footer {
        background-color: #212529;
        color: #adb5bd;
        padding: 40px 0;
    }
    .footer a {
        color: #adb5bd;
        text-decoration: none;
        transition: color 0.3s ease;
    }
    .footer a:hover {
        color: #ffffff;
    }
    .footer .social-icons a {
        font-size: 1.5rem;
        margin: 0 10px;
    }
</style>

</head>
<body>

<!-- Including the Navbar -->
<%@include file="normal_navbar.jsp" %>

<!-- Contact Page Header -->
<header class="contact-header">
    <div class="container">
        <h1>Get In Touch</h1>
        <p class="lead">Have a question or want to work together? Drop a message below.</p>
    </div>
</header>

<!-- Main Contact Content -->
<main class="container my-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <h3 class="card-title text-center mb-4">Send Us a Message</h3>
                    <form action="ContactServlet" method="post">
                        <!-- Name Field -->
                        <div class="mb-3">
                            <label for="name" class="form-label"><i class="fas fa-user me-2"></i>Your Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <!-- Email Field -->
                        <div class="mb-3">
                            <label for="email" class="form-label"><i class="fas fa-envelope me-2"></i>Your Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <!-- Message Field -->
                        <div class="mb-3">
                            <label for="message" class="form-label"><i class="fas fa-comment-dots me-2"></i>Message</label>
                            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-dark">Send Message</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Including the Footer -->
<%@include file="footer.jsp" %>

<!-- JavaScript Section -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>
