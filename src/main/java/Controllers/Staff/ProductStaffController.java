/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.Staff;

import DAO.BrandDAO;
import DAO.CategoryDAO;
import DAO.ImgDescriptionDAO;
import DAO.ProducerDAO;
import DAO.ProductDAO;
import Model.Brand;
import Model.Category;
import Model.ImgDescription;
import Model.Producer;
import Model.Product;
import Utils.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author HP
 */
public class ProductStaffController extends HttpServlet {
    private static CategoryDAO categoryDao;
    private static ProducerDAO producerDao;
    private static ProductDAO productDao;
    private static BrandDAO brandDao;

    public ProductStaffController() {
        this.categoryDao = new CategoryDAO();
        this.producerDao = new ProducerDAO();
        this.productDao = new ProductDAO();
        this.brandDao = new BrandDAO();
    }
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
            out.println("<title>Servlet ProductStaffController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductStaffController at " + request.getContextPath () + "</h1>");
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
        String path = request.getRequestURI();
        Validation validate = new Validation();
        if (path.endsWith("/MomAndBaby/staff/product")) {
            this.showAllProduct(request, response);
        } else {
            String paths[] = path.split("/");
            int id = validate.getInt(paths[paths.length - 1]);
            if (path.startsWith("/MomAndBaby/staff/product/view/")) {
                boolean isView = this.getCurrentProductUpdate(request, response, id);
                if (isView) {
                    request.getRequestDispatcher("/staff/view/product/detailProduct.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/MomAndBaby/staff/404");
                }
            } else if (path.startsWith("/MomAndBaby/admin/product/comment/")) {
//                boolean isView = this.getCurrentProductComment(request, response, slug);
//                if (isView) {
//                    request.getRequestDispatcher("/admin/view/product/commentProduct.jsp").forward(request, response);
//                } else {
//                    response.sendRedirect("/admin/404");
//                }
            }
        }
    } 
    
    private void showAllProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Product> products = productDao.getAll();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/staff/view/product/product.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Show product staff: " + e);
        }
    }

    private boolean getCurrentProductUpdate(HttpServletRequest request, HttpServletResponse response, int id) {
        try {
            ImgDescriptionDAO imgDao = new ImgDescriptionDAO();
            Product currentProduct = productDao.getProductByID(id);
            if (currentProduct == null) {
                return false;
            } else {
                List<ImgDescription> imgDesc = imgDao.getAllImgDescriptionByProduct(id);
                Category category = categoryDao.getCategoryByID(currentProduct.getCategoryID());
                Producer producer = producerDao.getProducerByID(currentProduct.getProducerID());
                Brand brand = brandDao.getBrandByID(currentProduct.getBrandID());
                request.setAttribute("product", currentProduct);
                request.setAttribute("imgDesc", imgDesc);
                request.setAttribute("producer", producer);
                request.setAttribute("category", category);
                request.setAttribute("brand", brand);
                List<Category> categories = categoryDao.allCategory();
                List<Producer> producers = producerDao.allProducer();
                List<Brand> brands = brandDao.allBrand();
                request.setAttribute("categories", categories);
                request.setAttribute("producers", producers);
                request.setAttribute("brands", brands);
                return true;
            }
        } catch (Exception e) {
            System.out.println("Get current product update staff: " + e);
        }
        return false;
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
        processRequest(request, response);
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
