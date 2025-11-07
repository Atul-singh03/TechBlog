<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>

<%
    // ---- Session Validation ----
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= user.getName() %> | Profile - TechBlog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="css/mystyle.css" rel="stylesheet">

    <style>
        body {
            background: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }

        .navbar-brand {
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .profile-header {
            background: linear-gradient(135deg, #007bff, #6610f2);
            color: #fff;
            padding: 2rem 1rem;
            border-radius: 0 0 20px 20px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        .profile-header img {
            border-radius: 50%;
            border: 4px solid #fff;
            width: 130px;
            height: 130px;
            object-fit: cover;
        }

        .info-card {
            border-radius: 15px;
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            padding: 1.5rem;
        }

        .category-link {
            cursor: pointer;
            transition: all 0.3s;
        }

        .category-link:hover {
            background-color: #007bff;
            color: #fff !important;
        }
        
        .like-counter.liked {
    color: yellow;
    font-weight: bold;
}
        
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><i class="fa fa-laptop-code"></i> TechBlog</a>
        <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="#add-post-modal" class="nav-link" data-bs-toggle="modal"><i class="fa fa-pen"></i> New Post</a></li>
            </ul>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="#profile-modal" class="nav-link" data-bs-toggle="modal"><i class="fa fa-user-circle"></i> <%= user.getName() %></a>
                </li>
                <li class="nav-item">
                    <a href="LogoutServlet" class="nav-link text-danger"><i class="fa fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Profile Header -->
<section class="profile-header">
    <img src="pics/<%= user.getProfile() != null ? user.getProfile() : "default.png" %>" alt="Profile Image">
    <h3><%= user.getName() %></h3>
    <p class="mb-1"><%= user.getEmail() %></p>
    <p><i class="fa fa-calendar"></i> Joined: <%= (user.getDateTime() != null ? user.getDateTime().toString().substring(0, 10) : "N/A") %></p>
    <button class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#profile-modal">
        <i class="fa fa-edit"></i> Edit Profile
    </button>
</section>

<!-- Main Body -->
<div class="container my-5">
    <div class="row g-4">

        <!-- Categories -->
        <div class="col-md-4">
            <div class="info-card">
                <h5 class="mb-3"><i class="fa fa-list"></i> Categories</h5>
                <div class="list-group">
                    <a class="list-group-item list-group-item-action active category-link" onclick="getPosts(0,this)">All Posts</a>
                    <%
                        ArrayList<Category> list1 = new ArrayList<>();
                        try {
                            PostDao d = new PostDao(ConnectionProvider.getConnection());
                            if (d != null) {
                                ArrayList<Category> temp = d.getAllCategories();
                                if (temp != null) list1 = temp;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        for (Category c : list1) {
                    %>
                        <a class="list-group-item list-group-item-action category-link" onclick="getPosts(<%= c.getCid() %>, this)">
                            <%= c.getName() %>
                        </a>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <!-- Posts -->
        <div class="col-md-8">
            <div class="info-card">
                <div class="text-center" id="loader">
                    <i class="fa fa-spinner fa-spin fa-3x"></i>
                    <h5 class="mt-3">Loading posts...</h5>
                </div>
                <div id="post-container" class="mt-2"></div>
            </div>
        </div>
    </div>
</div>

<!-- Profile Modal -->
<div class="modal fade" id="profile-modal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5><i class="fa fa-user-circle"></i> Edit Profile</h5>
                <button class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
               <form action="EditServlet" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label>Upload New Photo</label>
        <input type="file" name="image" class="form-control">
    </div>

    <div class="mb-3">
        <label>Email</label>
        <input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>">
    </div>

    <div class="mb-3">
        <label>Name</label>
        <input type="text" class="form-control" name="user_name" value="<%= user.getName() %>">
    </div>

    <div class="mb-3">
        <label>Password</label>
        <input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>">
    </div>

    <div class="mb-3">
        <label>About</label>
        <textarea class="form-control" name="user_about"><%= user.getAbout() %></textarea>
    </div>

    <button type="submit" class="btn btn-primary w-100">Save Changes</button>
</form>

            </div>
        </div>
    </div>
</div>


<!-- Add Post Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title"><i class="fa fa-pen"></i> Create New Post</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label>Category</label>
                        <select class="form-control" name="cid" required>
                            <option value="0" disabled selected>Select Category</option>
                            <%
                                com.tech.blog.dao.PostDao pd = new com.tech.blog.dao.PostDao(com.tech.blog.helper.ConnectionProvider.getConnection());
                                java.util.ArrayList<com.tech.blog.entities.Category> list = pd.getAllCategories();
                                for (com.tech.blog.entities.Category c : list) {
                            %>
                            <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Post Title</label>
                        <input type="text" name="pTitle" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Content</label>
                        <textarea name="pContent" class="form-control" rows="5" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label>Program Code (optional)</label>
                        <textarea name="pCode" class="form-control" rows="5"></textarea>
                    </div>

                    <div class="mb-3">
                        <label>Image (optional)</label>
                        <input type="file" name="pic" class="form-control">
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-success w-50">Post</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
function getPosts(catId, temp) {
    $("#loader").show();
    $("#post-container").hide();
    $(".category-link").removeClass('active');

    $.ajax({
        url: "load_posts.jsp",
        data: { cid: catId },
        success: function (data) {
            $("#loader").hide();
            $("#post-container").show().html(data);
            $(temp).addClass('active');
        },
        error: function () {
            Swal.fire("Error", "Failed to load posts. Please try again.", "error");
        }
    });
}

$(document).ready(function () {
    getPosts(0, $(".category-link")[0]);
});
</script>

<script>
$(document).ready(function () {
    $("#add-post-form").on("submit", function (event) {
        event.preventDefault();

        let form = new FormData(this);
        $.ajax({
            url: "AddPostServlet",
            type: "POST",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.trim() === "done") {
                    Swal.fire("Success!", "Your post has been published.", "success");
                    $("#add-post-modal").modal("hide");
                    getPosts(0, $(".category-link")[0]); // Reload posts dynamically
                } else {
                    Swal.fire("Error", "Failed to publish post.", "error");
                }
            },
            error: function () {
                Swal.fire("Error", "Server error occurred!", "error");
            }
        });
    });
});
</script>

<script>
function doLike(pid, uid) {
    $.ajax({
        url: "LikeServlet",
        type: "POST",
        data: {
            operation: "like",
            pid: pid,
            uid: uid
        },
        success: function (data) {
            if (data.trim() === "true") {
                let btn = $("a[onclick='doLike(" + pid + "," + uid + ")'] .like-counter");
                let currentCount = parseInt(btn.text());
                if (btn.hasClass("liked")) {
                    btn.removeClass("liked");
                    btn.text(currentCount - 1);
                } else {
                    btn.addClass("liked");
                    btn.text(currentCount + 1);
                }
            } else {
                Swal.fire("Error", "Failed to update like.", "error");
            }
        },
        error: function () {
            Swal.fire("Error", "Server not responding.", "error");
        }
    });
}
</script>



</body>
</html>
