<%-- 
    Document   : registerProduct
    Created on : 16 May 2022, 9:17:13 pm
    Author     : Asyraf
--%>

<%
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
%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.*"%>
<%@page import="model.connectionDao"%>
<%@page import="model.Product"%>
<%@page import="model.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ADMIN - Register Product</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="../css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-16x16.png">
    </head>
    <body>
        <div class="container-fluid py-5">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="navbar1">
                            <div class="push-left">
                                <a href="main.jsp" class=""><span class="bi bi-house"></span> DASHBOARD</a>
                                <a href="profile.jsp" class=""><span class="bi bi-person-circle"></span> PROFILE</a>
                                <!-- <a href="" class=""><span class="bi bi-envelope"></span> MESSAGES</a> -->
                                <a href="registerProduct.jsp" class="active"><span class="bi bi-box-arrow-in-right"></span> REGISTER ITEM</a>
                                <a href="stats.jsp" class=""><span class="bi bi-bar-chart-line"></span> STAT</a>
                                <a href="list.jsp" class=""><span class="bi bi-people-fill"></span> USERS LIST</a>
                            </div>
                            <div class="push-right">
                                <a href="../controller/logout.jsp" class=""><span class="bi-box-arrow-left"></span> LOGOUT</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row py-5">
                    <div class="col-4">
                        <div class="profile-box">
                            <div class="">
                                <img src="../images/male-icon.jpg" class="img-fluid" alt="alt"/>
                            </div>
                            <div class="mt-4">
                                <p class="text-center">
                                    <%= rs.getString(4) + " " + rs.getString(5) %>
                                </p>
                                <p class="form-text text-center"><%= rs.getString(9) %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="content-box">
                            <div class="container">
                                <form action="../controller/registerProduct.jsp" method="POST" onsubmit="return confirm('Confirm to register this product?')">
                                <div class="row">
                                    <div class="col-12 mt-4 mb-4">
                                        <h2>Register Product</h2>
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Product Code</label>:
                                        <input class="form-control" type="text" name="productCode" size="100" required="on">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Product Name</label>:
                                        <input class="form-control" type="text" name="productName" size="100" required="on">
                                    </div>
                                    <div class="col-12 mt-3">
                                        <label class="form-label">Product Description</label>:
                                        <textarea name="productDesc" class="form-control"></textarea>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Price</label>:
                                        <input class="form-control" type="text" name="price" size="9" placeholder="0.00" required="on">
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Quantity</label>:
                                        <input class="form-control" type="number" name="quantity" size="10" required="on">
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Defect Status</label>:
                                        <select name="productStatus" class="form-control" required="on">
                                            <option>Good</option>
                                            <option>Defect</option>
                                        </select>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Supplier</label>:
                                        <%
                                            Statement stmt3 = con.getConnection().createStatement();
                                            String sql3 = "SELECT * FROM supplier";
                                            ResultSet rs3 = stmt3.executeQuery(sql3);
                                        %>
                                        <select name="supplierID" class="form-control" required="on">
                                            <% while(rs3.next()) {%>
                                            <option value="<%= rs3.getString(1) %>"><%= rs3.getString(2) %></option>
                                            <%  }%>
                                        </select>
                                    </div>
                                    <div class="mt-5">
                                        <button class="btn btn-primary" type="submit">Save changes</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="../js/bootstrap.bundle.min.js"></script>
    </body>
<%
        }
    }
    if(userSession != null && userType2 == "STAFF") {
        connectionDao con = new connectionDao();

        Statement stmt = con.getConnection().createStatement();
        String sql = "SELECT * FROM users WHERE email='"+userSession+"'AND userType='" + userType2 + "'";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next()) 
        {
%>
    <head>
        <title>STAFF - Register Product</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="../css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-16x16.png">
    </head>
    <body>
        <div class="container-fluid py-5">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="navbar1">
                            <div class="push-left">
                                <a href="main.jsp" class=""><span class="bi bi-house"></span> DASHBOARD</a>
                                <a href="profile.jsp" class=""><span class="bi bi-person-circle"></span> PROFILE</a>
                                <!-- <a href="" class=""><span class="bi bi-envelope"></span> MESSAGES</a> -->
                                <a href="registerProduct.jsp" class="active"><span class="bi bi-box-arrow-in-right"></span> PRODUCT</a>
                                <!-- <a href="" class=""><span class="bi bi-bar-chart-line"></span> STAT</a> -->
                                <a href="list.jsp" class=""><span class="bi bi-clipboard-data"></span> STOCK LIST</a>
                            </div>
                            <div class="push-right">
                                <a href="../controller/logout.jsp" class=""><span class="bi-box-arrow-left"></span> LOGOUT</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row py-5">
                    <div class="col-4">
                        <div class="profile-box">
                            <div class="">
                                <img src="../images/male-icon.jpg" class="img-fluid" alt="alt"/>
                            </div>
                            <div class="mt-4">
                                <p class="text-center">
                                    <%= rs.getString(4) + " " + rs.getString(5) %>
                                </p>
                                <p class="form-text text-center"><%= rs.getString(9) %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="content-box">
                            <div class="container">
                                <form action="../controller/registerProduct.jsp" method="POST" onsubmit="return confirm('Confirm to register this product?')">
                                <div class="row">
                                    <div class="col-12 mt-4 mb-4">
                                        <h2>Register Product</h2>
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Product Code</label>:
                                        <input class="form-control" type="text" name="productCode" size="100" required="on">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Product Name</label>:
                                        <input class="form-control" type="text" name="productName" size="100" required="on">
                                    </div>
                                    <div class="col-12 mt-3">
                                        <label class="form-label">Product Description</label>:
                                        <textarea name="productDesc" class="form-control"></textarea>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Price</label>:
                                        <input class="form-control" type="text" name="price" size="9" placeholder="0.00" required="on">
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Quantity</label>:
                                        <input class="form-control" type="number" name="quantity" size="10" required="on">
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Defect Status</label>:
                                        <select name="productStatus" class="form-control" required="on">
                                            <option>Good</option>
                                            <option>Defect</option>
                                        </select>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Supplier</label>:
                                        <%
                                            Statement stmt3 = con.getConnection().createStatement();
                                            String sql3 = "SELECT * FROM supplier";
                                            ResultSet rs3 = stmt3.executeQuery(sql3);
                                        %>
                                        <select name="supplierID" class="form-control" required="on">
                                            <% while(rs3.next()) {%>
                                            <option value="<%= rs3.getString(1) %>"><%= rs3.getString(2) %></option>
                                            <%  }%>
                                        </select>
                                    </div>
                                    <div class="mt-5">
                                        <button class="btn btn-primary" type="submit">Save changes</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>
<%
        }
    }
%>