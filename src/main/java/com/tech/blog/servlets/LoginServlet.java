package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");

        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User user = dao.getUserByEmailAndPassword(userEmail, userPassword);

        HttpSession session = request.getSession();

        if (user == null) {
            session.setAttribute("msg", new Message("Invalid Details! Try again.", "error", "alert-danger"));
            response.sendRedirect("login_page.jsp");
        } else {
            session.setAttribute("currentUser", user);
            response.sendRedirect("profile.jsp");
        }
    }
}
