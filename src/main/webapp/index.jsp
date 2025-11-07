<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="./css/mystyle.css" rel="stylesheet">
 
 <style>
     .banner-background{
     clip-path: polygon(30% 0%, 70% 0%, 100% 0, 99% 95%, 70% 93%, 30% 100%, 0 94%, 0 0);
     }
 </style>
 

</head>
<body>

<!-- delete when showing presentation con object  -->

<%Connection con = ConnectionProvider.getConnection();
%>
<h1><%= con  %></h1>

<!-- 1. nav bar  -->
<%@include file="normal_navbar.jsp" %>

<!-- HTML Structure for the Banner -->
<div class="container-fluid p-0">
    <div class="banner-background">
        <header class="hero-banner">
            <div class="container">
                <h1 class="display-3">Welcome to TechBlog</h1>
                <p class="lead">
                    A programming blog for developers. Discover the latest in web development, software engineering, and technology trends.
                </p>
                <div class="mt-4">
                    <a href="#posts" class="btn btn-primary btn-lg mx-2">
                        <i class="fa fa-newspaper-o"></i> Start Reading
                    </a>
                    <a href="login.jsp" class="btn btn-outline-light btn-lg mx-2">
                        <i class="fa fa-sign-in"></i> Login
                    </a>
                </div>
            </div>
        </header>
    </div>
</div>
<!-- 3. cards -->
<main class="container my-5" id="posts">
    <h2 class="text-center mb-4 pb-2">All Posts</h2>
    
    <div class="row">

        <!-- Blog Post Card 1 -->
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card post-card h-100">
                <img src="https://images.unsplash.com/photo-1522252234503-e356532cafd5?auto=format&fit=crop&w=800&q=60" class="card-img-top" alt="Laptop with code">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Mastering Modern JavaScript (ES6+)</h5>
                    <p class="card-text text-muted flex-grow-1">A deep dive into the essential features of modern JavaScript that every developer should know, from arrow functions to async/await.</p>
                    <a href="#" class="btn btn-primary mt-auto align-self-start">Read More</a>
                </div>
                <div class="card-footer text-muted">
                    Posted on: Aug 20, 2025
                </div>
            </div>
        </div>

        <!-- Blog Post Card 2 -->
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card post-card h-100">
                <img src="https://images.unsplash.com/photo-1555949963-ff9fe0c870eb?auto=format&fit=crop&w=800&q=60" class="card-img-top" alt="Python code on a dark screen">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Building a REST API with Python & Flask</h5>
                    <p class="card-text text-muted flex-grow-1">Learn how to build a powerful and scalable REST API from scratch using the popular Python micro-framework, Flask.</p>
                    <a href="#" class="btn btn-primary mt-auto align-self-start">Read More</a>
                </div>
                 <div class="card-footer text-muted">
                    Posted on: Aug 18, 2025
                </div>
            </div>
        </div>

        <!-- Blog Post Card 3 -->
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card post-card h-100">
                <img src="https://images.unsplash.com/photo-1542831371-29b0f74f9713?auto=format&fit=crop&w=800&q=60" class="card-img-top" alt="HTML code on a monitor">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">The Ultimate Guide to Semantic HTML5</h5>
                    <p class="card-text text-muted flex-grow-1">Why semantic HTML matters for SEO and accessibility. We cover the most important tags and best practices for structuring your web pages.</p>
                    <a href="#" class="btn btn-primary mt-auto align-self-start">Read More</a>
                </div>
                 <div class="card-footer text-muted">
                    Posted on: Aug 15, 2025
                </div>
            </div>
        </div>
        
    </div>
    
    <!-- 4. Start of Second Row -->
        <div class="row">

            <!-- Blog Post Card 4 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card post-card h-100">
                    <img src="https://images.unsplash.com/photo-1618477388954-7852f32655ec?auto=format&fit=crop&w=800&q=60" class="card-img-top" alt="React logo">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">Getting Started with React Hooks</h5>
                        <p class="card-text text-muted flex-grow-1">Move beyond class components. This tutorial covers the fundamentals of React Hooks like useState and useEffect to manage state and side effects.</p>
                        <a href="#" class="btn btn-primary mt-auto align-self-start">Read More</a>
                    </div>
                    <div class="card-footer text-muted">
                        Posted on: Aug 12, 2025
                    </div>
                </div>
            </div>

            <!-- Blog Post Card 5 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card post-card h-100">
                    <img src="https://images.unsplash.com/photo-1599507593499-a3f7d7d97667?auto=format&fit=crop&w=800&q=60" class="card-img-top" alt="Docker containers">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">An Introduction to Docker for Developers</h5>
                        <p class="card-text text-muted flex-grow-1">Learn how containerization with Docker can streamline your development workflow, simplify deployment, and eliminate "it works on my machine" issues.</p>
                        <a href="#" class="btn btn-primary mt-auto align-self-start">Read More</a>
                    </div>
                     <div class="card-footer text-muted">
                        Posted on: Aug 10, 2025
                    </div>
                </div>
            </div>

            <!-- Blog Post Card 6 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card post-card h-100">
                    <img src="https://images.unsplash.com/photo-1505685296765-3a2736de412f?auto=format&fit=crop&w=800&q=60" class="card-img-top" alt="Cybersecurity lock">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">Top 5 Web Security Vulnerabilities</h5>
                        <p class="card-text text-muted flex-grow-1">Protect your applications by understanding common threats. We explore SQL Injection, Cross-Site Scripting (XSS), and other critical vulnerabilities.</p>
                        <a href="#" class="btn btn-primary mt-auto align-self-start">Read More</a>
                    </div>
                     <div class="card-footer text-muted">
                        Posted on: Aug 08, 2025
                    </div>
                </div>
            </div>
            
        </div>
        <!-- End of Second Row -->
       
</main>

 <!-- 5. Footer Section -->

<%@include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript" ></script>

</body>
</html>