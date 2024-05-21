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
public class RegisterController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
            request.getRequestDispatcher("/user/register.jsp").forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
        if (request.getParameter("register") != null) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            Account accountCheck = adao.isExistAccount(username, email);
            if (accountCheck != null) {
                request.setAttribute("messageFailRegister", "Username or email is exist");
                request.getRequestDispatcher("/user/register.jsp").forward(request, response);
                return;
            }
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            LocalDateTime dateTime = LocalDateTime.now();
            Timestamp dateCreate = Timestamp.valueOf(dateTime);
            int roleUser = 2;
            Account account = new Account(0, username, password, email, phone, 1, fullname, dateCreate, roleUser, null);
            int result = adao.insert(account);
            if (result > 0) {
                session.setAttribute("messageSuccessRegister", "Register successfully.");
                session.setMaxInactiveInterval(3);
                response.sendRedirect("/MomAndBaby/login");
            } else {
                request.setAttribute("messageFailRegister", "Register fail. Try again");
                request.getRequestDispatcher("/user/register.jsp").forward(request, response);
            }
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
