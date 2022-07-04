<%-- 
    Document   : order
    Created on : 15 May 2022, 11:39:21 pm
    Author     : Asyraf
--%>

<%@page import="java.text.DecimalFormat"%>
<%
    String userSession = (String)session.getAttribute("username");
    String userType1 = "ADMIN";
    String userType2 = "STAFF";
    String userType3 = "USER";
    int i = 1;

    if(userSession == null) {
        response.sendRedirect("../index.html");
    }
    if(userSession != null && userType3 == "USER") {
        connectionDao con = new connectionDao();

        Statement stmt = con.getConnection().createStatement();
        String sql = "SELECT * FROM users WHERE email='"+userSession+"'AND userType='" + userType3 + "'";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next()) 
        {
%>
<%@page import="java.sql.*"%>
<%@page import="model.connectionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>USER - Order Item</title>
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
                                <a href="order.jsp" class="active"><span class="bi-box-arrow-in-right"></span> ORDER ITEM</a>
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
                                <img src="../images/warehouse-logo.jpg" class="img-fluid" alt="alt"/>
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
                                <div class="row">
                                    <div class="col-6">
                                        <div class="col-12 mt-4 mb-4">
                                        <h2>Order Item</h2>
                                        </div>
                                        <!--
                                        <%
                                            String keyword = "";
                                            if(request.getParameter("search") != null) {
                                                keyword = request.getParameter("search");
                                            }
                                        %>
                                        <form action="list.jsp" method="GET">
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="search" id="search" value="<%= keyword %>" placeholder="Search">
                                            <button class="btn btn-primary" type="button submit" id="button-addon2">
                                                <span class="bi bi-search"></span>
                                            </button>
                                        </div>
                                        </form>
                                        -->
                                    </div>
                                </div>
                                <%
                                    Statement stmt2 = con.getConnection().createStatement();
                                    String sql2 = "SELECT * FROM product";
                                    ResultSet rs2 = stmt2.executeQuery(sql2);
                                %>
                                <form action="">
                                <div class="row mt-4">
                                    <div class="col-6">
                                        <label class="form-label">Product</label>
                                        <select name="product" id="product" onchange="showProduct(this.value)" class="form-control">
                                            <option selected="on" disabled="on">Choose</option>
                                            <% while(rs2.next()) {%>
                                            <option value="<%= rs2.getString(1) %>"><%= rs2.getString(2) %></option>
                                            <%  }%>
                                        </select>
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Quantity</label><span id="txtHint"></span>
                                        <input type="number" name="quantity" id="quantity" class="form-control">
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-6">
                                        <button class="btn btn-primary" type="submit">Done</button>
                                    </div>
                                </div>
                                </form>
                                <form action="../controller/order.jsp" method="POST">
                                <div class="row mt-4">
                                    <div class="col-6">
                                        <%
                                            String price = request.getParameter("product");
                                            String qty = request.getParameter("quantity");
                                            double tax = 0.06;
                                            double total = 0;
                                            double normalPrice = 0;
                                            
                                            Statement stmt3 = con.getConnection().createStatement();
                                            String sql3 = "SELECT * FROM product WHERE prodID='" + price + "'";
                                            ResultSet rs3 = stmt3.executeQuery(sql3);
                                            
                                            DecimalFormat df = new DecimalFormat("0.00");
                                            
                                            if(price != "" && qty != "" && rs3.next()) {
                                            tax = tax * Double.parseDouble(rs3.getString(5));
                                            tax = tax * Double.parseDouble(qty);
                                            
                                            normalPrice = Double.parseDouble(qty) * Double.parseDouble(rs3.getString(5));
                                            total = normalPrice + tax;
                                        %>
                                        <label class="form-label">Normal Price</label>
                                        <input type="text" name="normalPrice" class="form-control" value="<%= df.format(normalPrice) %>" readonly="on">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Tax (6%)</label>
                                        <input type="text" name="tax" class="form-control" value="<%= df.format(tax) %>" readonly="on">
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-6">
                                        <label class="form-label">Price (After tax)</label>
                                        <input type="text" name="afterTax" class="form-control" value="<%= df.format(total) %>" readonly="on">
                                        <input type="hidden" name="prodID" class="form-control" value="${param.product}" readonly="on">
                                        <input type="hidden" name="quantity1" class="form-control" value="${param.quantity}" readonly="on">
                                        <input type="hidden" name="prodName" class="form-control" value="<%= rs3.getString(2) %>" readonly="on">
                                        <input type="hidden" name="userID" class="form-control" value="<%= rs.getString(1) %>" readonly="on">
                                        
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-6">
                                        <button class="btn btn-primary" type="submit">Submit</button>
                                    </div>
                                </div>
                                        <%  }%>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="../js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            function showProduct(str) {
                var xhttp;
                if(str == "") {
                    document.getElementById("txtHint").innerHTML = "";
                    return;
                }
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if(this.readyState == 4 && this.status == 200) {
                        document.getElementById("txtHint").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "qty.jsp?q=" + str, true);
                xhttp.send();
            }
        </script>
        <script>
            $('#tax').keyup(function() {
               var tax = $('tax').val();
               var product = $('#product').val();
               if(product == product) {
                   var
               }
            });
        </script>
    </body>
</html>
<%
        }
    }
%>