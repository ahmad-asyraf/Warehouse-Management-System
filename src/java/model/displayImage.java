/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package model;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayImage")
public class displayImage extends HttpServlet {

    public displayImage() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userid = Integer.parseInt(request.getParameter("userID"));
        ProductDAO productDAO = new ProductDAO();
        
        try {
            Image image = productDAO.get(userid);
            
            request.setAttribute("image", image);
            String page = "/view/profile.jsp";
            request.getRequestDispatcher(page).forward(request, response);
        }
        catch(Exception e) {
            throw  new ServletException(e);
        }
    }
}
