/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import Authentication.AuthUser;
import DAO.AccountDAO;
import DAO.CartDAO;
import DAO.ProductDAO;
import Model.Account;
import Model.Cart;
import Model.Product;
import Utils.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;

/**
 *
 * @author HP
 */
public class CartController extends HttpServlet {

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
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
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
        String username = auth.isLoginUser(request, response);
        AccountDAO accountDao = new AccountDAO();
        CartDAO cartDao = new CartDAO();
        String path = request.getRequestURI();
        if (path.endsWith("/cart")) {
            if (username != null) {
                Account account = accountDao.getAccountByUsername(username);
                List<Cart> carts = cartDao.getAllCart(account.getID());
                request.setAttribute("carts", carts);
                request.getRequestDispatcher("./user/cart.jsp").forward(request, response);
            } else {
                response.sendRedirect("/MomAndBaby/login");
            }
        } else if (path.startsWith("/MomAndBaby/cart/add")) {
            this.addToCart(request, response);
        } else if(path.startsWith("/MomAndBaby/cart/remove")) {
            this.removeFromCart(request, response);
        }
    }
    
    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) {
    try {
        AuthUser auth = new AuthUser();
        String username = auth.isLoginUser(request, response);
        if (username != null) {
            CartDAO cartDao = new CartDAO();
            String path = "/MomAndBaby/cart";
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            int result = cartDao.deleteCartItem(cartId);
            response.sendRedirect(path + "?act=remove-cart&status=" + result);
        } else {
            response.sendRedirect("/MomAndBaby/login");
        }
    } catch (Exception e) {
        System.out.println("removeFromCart: " + e);
    }
}

    
    private void addToCart(HttpServletRequest request, HttpServletResponse response) {
        try {
            Validation validate = new Validation();
            AuthUser auth = new AuthUser();
            String username = auth.isLoginUser(request, response);
            if (username != null) {
                CartDAO cartDao = new CartDAO();
                ProductDAO productDao = new ProductDAO();
                String path = request.getParameter("pathUrl");
                AccountDAO accountDao = new AccountDAO();
                Account account = accountDao.getAccountByUsername(username);
                int accountId = account.getID();
                int quantity = validate.getInt(request.getParameter("quantity"));
                int productId = validate.getInt(request.getParameter("productID"));
                Product p = productDao.getProductByID(productId);
                Cart cartExist = cartDao.getByIdUser(productId, accountId);
                int result = 0;
                if (cartExist != null) {
                    int newQuan = cartExist.getQuantity() + quantity;
                    if (newQuan > p.getQuantity()) {
                        result = 2;
                    } else {
                        float price = p.getNewPrice() > 0 ? p.getNewPrice() * quantity : p.getOldPrice() * quantity;
                        Cart c = new Cart(0, accountId, price, newQuan, productId);
                        c.setQuantity(newQuan);
                        c.setTotalPrice(price);
                        result = cartDao.updateToCart(c);
                    }
                    
                } else {
                    if (quantity > p.getQuantity()) {
                        result = 2;
                    } else {
                        float price = p.getNewPrice() > 0 ? p.getNewPrice() * quantity : p.getOldPrice() * quantity;
                        Cart c = new Cart(0, accountId, price, quantity, productId);
                        result = cartDao.addToCart(c);
                    }
                }
                response.sendRedirect(path + "?act=add-cart&status=" + result);
            } else {
                response.sendRedirect("/MomAndBaby/login");
            }
        } catch (Exception e) {
            System.out.println("addToCart: " + e);
        }
    }
    
    private void updateCart(HttpServletRequest request, HttpServletResponse response) {
    try {
        Validation validate = new Validation();
        AuthUser auth = new AuthUser();
        String username = auth.isLoginUser(request, response);
        if (username != null) {
            CartDAO cartDao = new CartDAO();
            ProductDAO productDao = new ProductDAO();
            String path = "/MomAndBaby/cart";
            AccountDAO accountDao = new AccountDAO();
            Account account = accountDao.getAccountByUsername(username);
            int accountId = account.getID();
            // Retrieve all product IDs and quantities from the request
            Enumeration<String> parameterNames = request.getParameterNames();
            int result = 0;
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                if (paramName.startsWith("qty_")) {
                    int productId = Integer.parseInt(paramName.substring(4)); // Extract the product ID
                    int quantity = validate.getInt(request.getParameter(paramName));
                    Product p = productDao.getProductByID(productId);
                    Cart cartExist = cartDao.getByIdUser(productId, accountId);
                    if (cartExist != null) {
                        if (quantity > p.getQuantity()) {
                            result = 2;
                        } else {
                            float price = p.getNewPrice() > 0 ? p.getNewPrice() * quantity : p.getOldPrice() * quantity;
                            Cart c = new Cart(cartExist.getID(), accountId, price, quantity, productId);
                            c.setQuantity(quantity);
                            c.setTotalPrice(price);
                            result = cartDao.updateToCart(c);
                        }
                    }
                    // Optionally handle cases where the cart does not exist for a given product ID
                }
            }
            response.sendRedirect(path + "?act=update-cart&status=" + result);
        } else {
            response.sendRedirect("/MomAndBaby/login");
        }
    } catch (Exception e) {
        System.out.println("updateCart: " + e);
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
        if (request.getParameter("add-to-cart") != null) {
            this.addToCart(request, response);
        } else if(request.getParameter("btn-update-cart") != null) {
            this.updateCart(request, response);
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
