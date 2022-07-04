<%-- 
    Document   : order
    Created on : 16 Jun 2022, 12:12:32 pm
    Author     : Asyraf
--%>

<%@page import="model.connectionDao"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Calculate order</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String prodName = request.getParameter("prodName");
            String qty = request.getParameter("quantity1");
            String normalPrice = request.getParameter("normalPrice");
            String tax = request.getParameter("tax");
            String afterTax = request.getParameter("afterTax");
            String prodid = request.getParameter("prodID");
            String userid = request.getParameter("userID");
            
            connectionDao con = new connectionDao();
            if(prodName != null && qty != null && normalPrice != null && tax != null
            && afterTax != null && prodid != null && userid != null) {
                String sql = "INSERT INTO orders(prodName,orderQty,normalPrice,tax,afterTax,prodID,userid) "
                            + "VALUES(?,?,?,?,?,?,?)";
                PreparedStatement ps = con.getConnection().prepareStatement(sql);
                ps.setString(1, prodName);
                ps.setString(2, qty);
                ps.setString(3, normalPrice);
                ps.setString(4, tax);
                ps.setString(5, afterTax);
                ps.setString(6, prodid);
                ps.setString(7, userid);
                ps.executeUpdate();

                String sql1 = "UPDATE product SET quantity=quantity-'" + qty + "' WHERE prodID='" + prodid + "'";
                PreparedStatement ps1 = con.getConnection().prepareStatement(sql1);
                ps1.executeUpdate();
                
                request.setAttribute("confirmMessage", "Order created successfully. Please update your address details");
                request.getRequestDispatcher("../view/profile.jsp").forward(request, response);
            }
            
            String sql1 = "SELECT quantity FROM product WHERE prodID='" + prodid + "'";
            Statement stmt1 = con.getConnection().createStatement();
            ResultSet rs1 = stmt1.executeQuery(sql1);
            
            if(Integer.parseInt(qty) > Integer.parseInt(rs1.getString(4))) {
                request.setAttribute("confirmMessage", "Failed to create order.");
                request.getRequestDispatcher("../view/order.jsp").forward(request, response);
            }
            
            else {
                request.setAttribute("confirmMessage", "Failed to create order.");
                request.getRequestDispatcher("../view/order.jsp").forward(request, response);
            }
        %>
        
        <%= prodName %>
        <%= qty %>
        <%= normalPrice %>
        <%= tax %>
        <%= afterTax %>
        <%= prodid %>
        <%= userid %>
    </body>
</html>
