<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
This file (normal_navbar.jsp) contains only the navbar component.
It is meant to be included in other JSP pages like index.jsp.
-->

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><span class="me-2"><i class="fa fa-laptop"></i></span>Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./about.jsp">About</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu dropdown-menu-dark">
            <li><a class="dropdown-item" href="#">Web Development</a></li>
            <li><a class="dropdown-item" href="#">App Development</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Consulting</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.jsp">Contact</a>
        </li>
      </ul>

      <!-- Wrapper for right-aligned items -->
      <div class="d-flex align-items-center">
          <!-- Updated Search Bar using an Input Group -->
          <form class="d-flex me-3" role="search">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search..." aria-label="Search">
              <button class="btn btn-outline-light" type="submit" id="button-addon2">
                <i class="fa fa-search"></i>
              </button>
            </div>
          </form>
    
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="register.jsp">Sign Up</a>
            </li>
          </ul>
      </div>

    </div>
  </div>
</nav>
