<%-- 
    Document   : list
    Created on : 12 May 2022, 4:02:31 pm
    Author     : Asyraf
--%>

<%
    String userSession = (String)session.getAttribute("username");
    String userType1 = "ADMIN";
    String userType2 = "STAFF";
    String userType3 = "USER";
    int i = 1;

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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ADMIN - Users List</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="../css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
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
                                <a href="registerProduct.jsp" class=""><span class="bi bi-box-arrow-in-right"></span> REGISTER ITEM</a>
                                <a href="stats.jsp" class=""><span class="bi bi-bar-chart-line"></span> STAT</a>
                                <a href="list.jsp" class="active"><span class="bi bi-people-fill"></span> USERS LIST</a>
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
                                <div class="row">
                                    <div class="col-6">
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
                                    </div>
                                    <div class="col-12 mt-4">
                                        <table class="table table-striped table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Users ID</th>
                                                    <th>Users Name</th>
                                                    <th>First Name</th>
                                                    <th>User Type</th>
                                                </tr>
                                            </thead>
                                            <%
                                                Statement stmt1 = con.getConnection().createStatement();
                                                String sql1 = "SELECT * FROM users WHERE userType != '" + userType1 
                                                + "' AND (email like '%" + keyword + "%' OR userid like '%" + keyword + "%')";
                                                ResultSet rs1 = stmt1.executeQuery(sql1);
                                                
                                                while(rs1.next() && rs1 != null)
                                                {
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td><%= i++ %></td>
                                                    <td><a href="details.jsp?usersID=<%= rs1.getString(1) %>"><%= rs1.getString(1) %></a></td>
                                                    <td><%= rs1.getString(2) %></td>
                                                    <td><%= rs1.getString(4) %></td>
                                                    <td><%= rs1.getString(9) %></td>
                                                </tr>
                                            </tbody>
                                            <%  }%>
                                        </table>
                                    </div>
                                </div>
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
        <title>Staff - Stock List</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="../css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
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
                                <a href="registerProduct.jsp" class=""><span class="bi bi-box-arrow-in-right"></span> PRODUCT</a>
                                <!-- <a href="" class=""><span class="bi bi-bar-chart-line"></span> STAT</a> -->
                                <a href="list.jsp" class="active"><span class="bi bi-clipboard-data"></span> STOCK LIST</a>
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
                                <div class="row">
                                    <div class="col-6">
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
                                    </div>
                                    <div class="col-12 mt-4">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Product code</th>
                                                    <th>Product name</th>
                                                    <th>Quantity</th>
                                                </tr>
                                            </thead>
                                            <%
                                                Statement stmt1 = con.getConnection().createStatement();
                                                String sql1 = "SELECT * FROM product WHERE prodID like '%" + keyword + "%' OR prodName like '%" + keyword + "%'";
                                                ResultSet rs1 = stmt1.executeQuery(sql1);
                                                
                                                while(rs1.next() && rs1 != null)
                                                {
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td><%= i++ %></td>
                                                    <td><a href="details.jsp?ProductCode=<%= rs1.getString(1) %>"><%= rs1.getString(1) %></a></td>
                                                    <td><%= rs1.getString(2) %></td>
                                                    <td><%= rs1.getString(4) %></td>
                                                </tr>
                                            </tbody>
                                            <%  }%>
                                        </table>
                                    </div>
                                </div>
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