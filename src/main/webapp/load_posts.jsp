<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
<%
    try {
        // Fetch the logged-in user (null if not logged in)
        User currentUser = (User) session.getAttribute("currentUser");

        // Validate category ID input
        String cidParam = request.getParameter("cid");
        int cid = 0;
        if (cidParam != null && cidParam.matches("\\d+")) {
            cid = Integer.parseInt(cidParam);
        }

        // Fetch posts based on category
        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
        List<Post> posts = (cid == 0)
                ? postDao.getAllPosts()
                : postDao.getPostByCatId(cid);

        if (posts == null || posts.isEmpty()) {
%>
            <div class="col-12 text-center mt-4">
                <h4 class="text-muted">No posts found in this category.</h4>
            </div>
<%
        } else {
            LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
            for (Post p : posts) {
                int likeCount = likeDao.countLikeOnPost(p.getPid());
%>

    <div class="col-md-6 mt-3">
        <div class="card shadow-sm border-0 h-100">
            <img class="card-img-top"
                 src="blog_pics/<%= (p.getpPic() != null && !p.getpPic().isEmpty()) ? p.getpPic() : "default.jpg" %>"
                 alt="Post image"
                 style="height: 220px; object-fit: cover;">
            <div class="card-body">
                <h5 class="card-title fw-semibold"><%= p.getpTitle() %></h5>
                <p class="card-text text-muted">
                    <%= (p.getpContent().length() > 150) ? p.getpContent().substring(0, 150) + "..." : p.getpContent() %>
                </p>
            </div>
            <div class="card-footer text-center bg-primary text-white rounded-bottom">
                <% if (currentUser != null) { %>
                    <a href="#!" onclick="doLike(<%= p.getPid() %>, <%= currentUser.getId() %>)" class="btn btn-light btn-sm">
                        <i class="fa fa-thumbs-up"></i> 
                        <span class="like-counter"><%= likeCount %></span>
                    </a>
                <% } else { %>
                    <a href="login_page.jsp" class="btn btn-light btn-sm">
                        <i class="fa fa-thumbs-up"></i> <%= likeCount %>
                    </a>
                <% } %>

                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-light btn-sm">
                    <i class="fa fa-book-open"></i> Read More
                </a>

                <button class="btn btn-light btn-sm" disabled>
                    <i class="fa fa-comment"></i> 20
                </button>
            </div>
        </div>
    </div>

<%
            }
        }
    } catch (Exception e) {
        // Log error server-side, not to user
        e.printStackTrace();
        out.println("<div class='col-12 text-danger text-center mt-4'>Error loading posts.</div>");
    }
%>
</div>
