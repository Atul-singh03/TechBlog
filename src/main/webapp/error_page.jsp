<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error - TechBlog</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
    background-color: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
.error-container {
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}
.card {
    border: none;
    border-radius: 12px;
    box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
}
.error-icon {
    font-size: 70px;
    color: #dc3545;
}
</style>
</head>

<body>
<!-- Navbar -->
<%@include file="normal_navbar.jsp" %>

<div class="error-container">
    <div class="card p-5 text-center">
        <div class="error-icon mb-3">
            <i class="fas fa-exclamation-triangle"></i>
        </div>
        <h3 class="text-danger fw-bold">Oops! Something went wrong.</h3>
        <p class="text-muted mb-4">
            We're sorry, but an unexpected error occurred while processing your request.<br>
            Please try again later or go back to the homepage.
        </p>
        <div>
            <a href="index.jsp" class="btn btn-dark"><i class="fas fa-home me-2"></i>Back to Home</a>
            <button class="btn btn-outline-danger" onclick="reportIssue()"><i class="fas fa-bug me-2"></i>Report Issue</button>
        </div>
    </div>
</div>


<%@ page isErrorPage="true" %>
<pre style="background:#f8f9fa;border:1px solid #ccc;padding:10px;color:#d00;">
<%
    if (exception != null) {
        exception.printStackTrace(new java.io.PrintWriter(out));
    }
%>
</pre>


<script>
function reportIssue() {
    Swal.fire({
        icon: 'info',
        title: 'Report Issue',
        text: 'You can describe what happened and contact support@techblog.com',
        confirmButtonText: 'OK'
    });
}
</script>

</body>
</html>
