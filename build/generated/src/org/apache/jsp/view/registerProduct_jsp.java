package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.security.MessageDigest;
import java.sql.*;
import model.connectionDao;
import model.Product;
import model.ProductDAO;

public final class registerProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");

    String userSession = (String)session.getAttribute("username");
    String userType1 = "ADMIN";
    String userType2 = "STAFF";
    String userType3 = "USER";

    if(userSession == null) {
        response.sendRedirect("../index.html");
    }
    if(userSession != null && userType1 == "ADMIN") {
        connectionDao con = new connectionDao();

        Statement stmt = con.getConnection().createStatement();
        String sql = "SELECT * FROM users WHERE email='"+userSession+"'AND userType='" + userType1 + "'";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next()) 
        {

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>ADMIN - Register Product</title>\r\n");
      out.write("        <meta name=\"author\" content=\"Asyraf S60494\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/main-style.css\"/>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link href=\"../css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"../images/favicon-16x16.png\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"container-fluid py-5\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-12\">\r\n");
      out.write("                        <div class=\"navbar1\">\r\n");
      out.write("                            <div class=\"push-left\">\r\n");
      out.write("                                <a href=\"main.jsp\" class=\"\"><span class=\"bi bi-house\"></span> DASHBOARD</a>\r\n");
      out.write("                                <a href=\"profile.jsp\" class=\"\"><span class=\"bi bi-person-circle\"></span> PROFILE</a>\r\n");
      out.write("                                <!-- <a href=\"\" class=\"\"><span class=\"bi bi-envelope\"></span> MESSAGES</a> -->\r\n");
      out.write("                                <a href=\"registerProduct.jsp\" class=\"active\"><span class=\"bi bi-box-arrow-in-right\"></span> REGISTER ITEM</a>\r\n");
      out.write("                                <a href=\"stats.jsp\" class=\"\"><span class=\"bi bi-bar-chart-line\"></span> STAT</a>\r\n");
      out.write("                                <a href=\"list.jsp\" class=\"\"><span class=\"bi bi-people-fill\"></span> USERS LIST</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"push-right\">\r\n");
      out.write("                                <a href=\"../controller/logout.jsp\" class=\"\"><span class=\"bi-box-arrow-left\"></span> LOGOUT</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"row py-5\">\r\n");
      out.write("                    <div class=\"col-4\">\r\n");
      out.write("                        <div class=\"profile-box\">\r\n");
      out.write("                            <div class=\"\">\r\n");
      out.write("                                <img src=\"../images/male-icon.jpg\" class=\"img-fluid\" alt=\"alt\"/>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"mt-4\">\r\n");
      out.write("                                <p class=\"text-center\">\r\n");
      out.write("                                    ");
      out.print( rs.getString(4) + " " + rs.getString(5) );
      out.write("\r\n");
      out.write("                                </p>\r\n");
      out.write("                                <p class=\"form-text text-center\">");
      out.print( rs.getString(9) );
      out.write("</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-8\">\r\n");
      out.write("                        <div class=\"content-box\">\r\n");
      out.write("                            <div class=\"container\">\r\n");
      out.write("                                <form action=\"../controller/registerProduct.jsp\" method=\"POST\" onsubmit=\"return confirm('Confirm to register this product?')\">\r\n");
      out.write("                                <div class=\"row\">\r\n");
      out.write("                                    <div class=\"col-12 mt-4 mb-4\">\r\n");
      out.write("                                        <h2>Register Product</h2>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6\">\r\n");
      out.write("                                        <label class=\"form-label\">Product Code</label>:\r\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" name=\"productCode\" size=\"100\" required=\"on\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6\">\r\n");
      out.write("                                        <label class=\"form-label\">Product Name</label>:\r\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" name=\"productName\" size=\"100\" required=\"on\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-12 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Product Description</label>:\r\n");
      out.write("                                        <textarea name=\"productDesc\" class=\"form-control\"></textarea>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Price</label>:\r\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" name=\"price\" size=\"9\" placeholder=\"0.00\" required=\"on\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Quantity</label>:\r\n");
      out.write("                                        <input class=\"form-control\" type=\"number\" name=\"quantity\" size=\"10\" required=\"on\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Defect Status</label>:\r\n");
      out.write("                                        <select name=\"productStatus\" class=\"form-control\" required=\"on\">\r\n");
      out.write("                                            <option>Good</option>\r\n");
      out.write("                                            <option>Defect</option>\r\n");
      out.write("                                        </select>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Supplier</label>:\r\n");
      out.write("                                        ");

                                            Statement stmt3 = con.getConnection().createStatement();
                                            String sql3 = "SELECT * FROM supplier";
                                            ResultSet rs3 = stmt3.executeQuery(sql3);
                                        
      out.write("\r\n");
      out.write("                                        <select name=\"supplierID\" class=\"form-control\" required=\"on\">\r\n");
      out.write("                                            ");
 while(rs3.next()) {
      out.write("\r\n");
      out.write("                                            <option value=\"");
      out.print( rs3.getString(1) );
      out.write('"');
      out.write('>');
      out.print( rs3.getString(2) );
      out.write("</option>\r\n");
      out.write("                                            ");
  }
      out.write("\r\n");
      out.write("                                        </select>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"mt-5\">\r\n");
      out.write("                                        <button class=\"btn btn-primary\" type=\"submit\">Save changes</button>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <script src=\"../js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("    </body>\r\n");

        }
    }
    if(userSession != null && userType2 == "STAFF") {
        connectionDao con = new connectionDao();

        Statement stmt = con.getConnection().createStatement();
        String sql = "SELECT * FROM users WHERE email='"+userSession+"'AND userType='" + userType2 + "'";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next()) 
        {

      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>STAFF - Register Product</title>\r\n");
      out.write("        <meta name=\"author\" content=\"Asyraf S60494\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/main-style.css\"/>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link href=\"../css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"../images/favicon-16x16.png\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"container-fluid py-5\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-12\">\r\n");
      out.write("                        <div class=\"navbar1\">\r\n");
      out.write("                            <div class=\"push-left\">\r\n");
      out.write("                                <a href=\"main.jsp\" class=\"\"><span class=\"bi bi-house\"></span> DASHBOARD</a>\r\n");
      out.write("                                <a href=\"profile.jsp\" class=\"\"><span class=\"bi bi-person-circle\"></span> PROFILE</a>\r\n");
      out.write("                                <!-- <a href=\"\" class=\"\"><span class=\"bi bi-envelope\"></span> MESSAGES</a> -->\r\n");
      out.write("                                <a href=\"registerProduct.jsp\" class=\"active\"><span class=\"bi bi-box-arrow-in-right\"></span> PRODUCT</a>\r\n");
      out.write("                                <!-- <a href=\"\" class=\"\"><span class=\"bi bi-bar-chart-line\"></span> STAT</a> -->\r\n");
      out.write("                                <a href=\"list.jsp\" class=\"\"><span class=\"bi bi-clipboard-data\"></span> STOCK LIST</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"push-right\">\r\n");
      out.write("                                <a href=\"../controller/logout.jsp\" class=\"\"><span class=\"bi-box-arrow-left\"></span> LOGOUT</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"row py-5\">\r\n");
      out.write("                    <div class=\"col-4\">\r\n");
      out.write("                        <div class=\"profile-box\">\r\n");
      out.write("                            <div class=\"\">\r\n");
      out.write("                                <img src=\"../images/male-icon.jpg\" class=\"img-fluid\" alt=\"alt\"/>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"mt-4\">\r\n");
      out.write("                                <p class=\"text-center\">\r\n");
      out.write("                                    ");
      out.print( rs.getString(4) + " " + rs.getString(5) );
      out.write("\r\n");
      out.write("                                </p>\r\n");
      out.write("                                <p class=\"form-text text-center\">");
      out.print( rs.getString(9) );
      out.write("</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-8\">\r\n");
      out.write("                        <div class=\"content-box\">\r\n");
      out.write("                            <div class=\"container\">\r\n");
      out.write("                                <form action=\"../controller/registerProduct.jsp\" method=\"POST\" onsubmit=\"return confirm('Confirm to register this product?')\">\r\n");
      out.write("                                <div class=\"row\">\r\n");
      out.write("                                    <div class=\"col-12 mt-4 mb-4\">\r\n");
      out.write("                                        <h2>Register Product</h2>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6\">\r\n");
      out.write("                                        <label class=\"form-label\">Product Code</label>:\r\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" name=\"productCode\" size=\"100\" required=\"on\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6\">\r\n");
      out.write("                                        <label class=\"form-label\">Product Name</label>:\r\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" name=\"productName\" size=\"100\" required=\"on\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-12 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Product Description</label>:\r\n");
      out.write("                                        <textarea name=\"productDesc\" class=\"form-control\"></textarea>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Price</label>:\r\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" name=\"price\" size=\"9\" placeholder=\"0.00\" required=\"on\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Quantity</label>:\r\n");
      out.write("                                        <input class=\"form-control\" type=\"number\" name=\"quantity\" size=\"10\" required=\"on\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Defect Status</label>:\r\n");
      out.write("                                        <select name=\"productStatus\" class=\"form-control\" required=\"on\">\r\n");
      out.write("                                            <option>Good</option>\r\n");
      out.write("                                            <option>Defect</option>\r\n");
      out.write("                                        </select>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-6 mt-3\">\r\n");
      out.write("                                        <label class=\"form-label\">Supplier</label>:\r\n");
      out.write("                                        ");

                                            Statement stmt3 = con.getConnection().createStatement();
                                            String sql3 = "SELECT * FROM supplier";
                                            ResultSet rs3 = stmt3.executeQuery(sql3);
                                        
      out.write("\r\n");
      out.write("                                        <select name=\"supplierID\" class=\"form-control\" required=\"on\">\r\n");
      out.write("                                            ");
 while(rs3.next()) {
      out.write("\r\n");
      out.write("                                            <option value=\"");
      out.print( rs3.getString(1) );
      out.write('"');
      out.write('>');
      out.print( rs3.getString(2) );
      out.write("</option>\r\n");
      out.write("                                            ");
  }
      out.write("\r\n");
      out.write("                                        </select>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"mt-5\">\r\n");
      out.write("                                        <button class=\"btn btn-primary\" type=\"submit\">Save changes</button>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <script src=\"../js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");

        }
    }

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
