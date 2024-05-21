/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import Authentication.AuthUser;
import DAO.AccountDAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author HP
 */
public class LoginUserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginUserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AuthUser auth = new AuthUser();
        if (auth.isLoginUser(request, response) != null) {
            response.sendRedirect("/MonAndBaby");
        } else {
            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO adao = new AccountDAO();
        HttpSession session = request.getSession();
        if (request.getParameter("submitLogin") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Account a = adao.login(username);
            String messageUserAuth = "";
            boolean isError = false;
            if (a == null && !isError) {
                messageUserAuth = "Your account no exist";
                isError = true;
            }
            if (!isError && !a.getRoleName().equals("user")) {
                messageUserAuth = "Your account can not login here";
                isError = true;
            }
            if (!isError && a.getStatus() == 0) {
                messageUserAuth = "Your account is blocked";
                isError = true;
            }
            if (!isError && !password.equals(a.getPassword())) {
                messageUserAuth = "Password is not valid";
                isError = true;
            }
            if (!messageUserAuth.equals("")) {
                request.setAttribute("messageUserAuth", messageUserAuth);
                request.getRequestDispatcher("/user/login.jsp").forward(request, response);
                return;
            }
            String isRemember = request.getParameter("remember");
            session.setAttribute("usernameUser", a.getUsername());
            session.setAttribute("usernameRole", a.getRoleName());
            response.sendRedirect("/MomAndBaby");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
