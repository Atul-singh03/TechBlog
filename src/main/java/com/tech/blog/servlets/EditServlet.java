package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch updated fields from the form
        String userEmail = request.getParameter("user_email");
        String userName = request.getParameter("user_name");
        String userPassword = request.getParameter("user_password");
        String userAbout = request.getParameter("user_about");
        Part part = request.getPart("image"); // New profile picture

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        String oldFile = user.getProfile();
        String fileName = part.getSubmittedFileName();

        // Update user fields
        user.setEmail(userEmail);
        user.setName(userName);
        user.setPassword(userPassword);
        user.setAbout(userAbout);
        if (fileName != null && !fileName.isEmpty()) {
            user.setProfile(fileName);
        }

        // Save to database
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        boolean updated = userDao.updateUser(user);

        if (updated) {
            // Save uploaded image
            String savePath = getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
            String oldPath = getServletContext().getRealPath("/") + "pics" + File.separator + oldFile;

            // Delete old photo (except default)
            if (!oldFile.equals("default.png") && new File(oldPath).exists()) {
                Helper.deleteFile(oldPath);
            }

            // Save new photo (if uploaded)
            if (part.getSize() > 0) {
                Helper.saveFile(part.getInputStream(), savePath);
            }

            session.setAttribute("msg", new Message("Profile updated successfully!", "success", "alert-success"));
        } else {
            session.setAttribute("msg", new Message("Profile not updated. Try again!", "error", "alert-danger"));
        }

        response.sendRedirect("profile.jsp");
    }
}
