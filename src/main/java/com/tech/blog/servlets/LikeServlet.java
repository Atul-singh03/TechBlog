package com.tech.blog.servlets;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        try (PrintWriter out = response.getWriter()) {
            String operation = request.getParameter("operation");
            int uid = Integer.parseInt(request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));

            LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());

            boolean result = false;
            if ("like".equals(operation)) {
                // Check if already liked
                if (ldao.isLikedByUser(pid, uid)) {
                    ldao.deleteLike(pid, uid); // unlike
                } else {
                    ldao.insertLike(pid, uid); // like
                }
                result = true;
            }
            out.print(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
