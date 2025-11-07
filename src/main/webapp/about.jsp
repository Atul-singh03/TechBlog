<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - TechBlog</title>

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
    .about-header {
        background: #343a40;
        color: white;
        padding: 60px 0;
        text-align: center;
    }
    .founder-section {
        margin-top: 100px; /* Adds space for the overlapping image */
    }
    .founder-card .card-img-top {
        width: 150px;
        height: 150px;
        object-fit: cover;
        border-radius: 50%;
        margin: -75px auto 0;
        border: 5px solid white;
        position: relative; /* Ensures image is on top */
        z-index: 2;
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

<!-- About Page Header -->
<header class="about-header">
    <div class="container">
        <h1>About TechBlog</h1>
        <p class="lead">Our mission is to empower developers with high-quality content.</p>
    </div>
</header>

<!-- Main About Content -->
<main class="container my-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h2>Who We Are</h2>
            <p>TechBlog is a community-driven platform dedicated to sharing knowledge on the latest trends in software development, web technologies, and computer science. We believe in the power of open learning and strive to create articles, tutorials, and guides that are both informative and easy to understand for developers at all stages of their careers.</p>
            
            <h2 class="mt-5">Our Vision</h2>
            <p>Our vision is to become the go-to resource for developers seeking to learn new skills, solve complex problems, and stay updated with the fast-paced world of technology. Whether you're a beginner taking your first steps in coding or an experienced professional looking to expand your expertise, TechBlog is here to support your journey.</p>
            
            <!-- Founder Section -->
            <div class="founder-section text-center">
                <div class="card shadow-sm founder-card">
                    <img src="https://placehold.co/150x150/343a40/white?text=Atul" class="card-img-top" alt="Founder's Photo">
                    <div class="card-body pt-5">
                        <h2 class="card-title mb-3">Meet the Founder</h2>
                        <h4>Atul Singh</h4>
                        <p class="card-text text-muted">Final Year B.Tech CSE Student & Java Full-Stack Developer</p>
                        <p class="card-text">As a final year Computer Science student and a passionate Java Full-Stack Developer, Atul created TechBlog to share his knowledge, document his learning journey, and build a community of like-minded tech enthusiasts.</p>
                        <a href="#" class="btn btn-dark"><i class="fab fa-github"></i> GitHub</a>
                        <a href="https://portfolio-atul-singh-dev.netlify.app/" class="btn btn-secondary"><i class="fas fa-briefcase"></i> Portfolio</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</main>

<!-- Footer Section -->

<%@include file="footer.jsp" %>

<!-- JavaScript Section -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>
