/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package model;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Asyraf
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
@MultipartConfig(maxFileSize = 999999999)
public class uploadServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String type = request.getParameter("imageType");
        String uid = request.getParameter("uid");
        
        InputStream inputStream = null;
        connectionDao con = null;
        String message = null;
        
        Part filePart = request.getPart("profilePicture");
        if(filePart != null && request.getPart("profilePicture").getSize() > 0) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            
            inputStream = filePart.getInputStream();
            
            try {
                if(inputStream != null) {
                    String sql = "INSERT INTO images(imageName,imageType,userid) VALUES(?,?,?)";
                    PreparedStatement ps = con.getConnection().prepareStatement(sql);
                    ps.setBlob(1, inputStream);
                    ps.setString(2, type);
                    ps.setString(3, uid);

                    int row = ps.executeUpdate();
                    if(row > 0) {
                        message = "Image upload successful.";
                    }
                }
                else {}
            }
            catch(SQLException e) {
                message = "ERROR: " + e.getMessage();
                e.printStackTrace();
            }
            finally { 
                if(con != null) {
                    try {
                        con.getConnection().close();
                    }
                    catch(SQLException e) {
                        e.printStackTrace();
                    }
                }
                request.setAttribute("Message", message);

                getServletContext().getRequestDispatcher("/view/profile.jsp").forward(request, response);
            }
        }
        else {
            getServletContext().getRequestDispatcher("/view/profile.jsp").forward(request, response);
        }
        
        
        
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
