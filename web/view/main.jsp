<%-- 
    Document   : main.jsp
    Created on : 11 May 2022, 2:58:49 am
    Author     : Asyraf
--%>
<%
    String userSession = (String)session.getAttribute("username");
    String userType1 = "ADMIN";
    String userType2 = "STAFF";
    String userType3 = "USER";

    //CHECK userSession IF NULL REDIRECT TO INDEX LOGIN PAGE
    if(userSession == null) {
        response.sendRedirect("../index.html");
    }
    //USER INTERFACE FOR ADMIN IF userType = 1
    if(userSession != null && userType1 == "ADMIN") {
        connectionDao con = new connectionDao();

        Statement stmt = con.getConnection().createStatement();
        String sql = "SELECT * FROM users WHERE email='"+userSession+"'AND userType='" + userType1 + "'";
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
        <title>ADMIN - Dashboard</title>
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
                                <a href="main.jsp" class="active"><span class="bi bi-house"></span> DASHBOARD</a>
                                <a href="profile.jsp" class=""><span class="bi bi-person-circle"></span> PROFILE</a>
                                <!-- <a href="" class=""><span class="bi bi-envelope"></span> MESSAGES</a> -->
                                <a href="registerProduct.jsp" class=""><span class="bi bi-box-arrow-in-right"></span> REGISTER ITEM</a>
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
                            <div class="row">
                                <h1>Welcome, <%= rs.getString(4) + " " + rs.getString(5) %> </h1>
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
    //USER INTERFACE FOR STAFF IF userType = 2
    if(userSession != null && userType2 == "STAFF") {
        connectionDao con = new connectionDao();

        Statement stmt = con.getConnection().createStatement();
        String sql = "SELECT * FROM users WHERE email='"+userSession+"'AND userType='" + userType2 + "'";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next()) 
        {
%>
    <head>
        <title>Staff - Dashboard</title>
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
                                <a href="main.jsp" class="active"><span class="bi bi-house"></span> DASHBOARD</a>
                                <a href="profile.jsp" class=""><span class="bi bi-person-circle"></span> PROFILE</a>
                                <!-- <a href="" class=""><span class="bi bi-envelope"></span> MESSAGES</a> -->
                                <a href="registerProduct.jsp" class=""><span class="bi bi-box-arrow-in-right"></span> PRODUCT</a>
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
                            <div class="row">
                                <h1>Welcome, <%= rs.getString(4) + " " + rs.getString(5) %> </h1>
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
    //USER INTERFACE FOR USER IF userType = 3
    if(userSession != null && userType3 == "USER") {
        connectionDao con = new connectionDao();

        Statement stmt = con.getConnection().createStatement();
        String sql = "SELECT * FROM users WHERE email='"+userSession+"'AND userType='" + userType3 + "'";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next()) 
        {
%>
    <head>
        <title>USER - Dashboard</title>
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
                                <a href="main.jsp" class="active"><span class="bi bi-house"></span> DASHBOARD</a>
                                <a href="profile.jsp" class=""><span class="bi bi-person-circle"></span> PROFILE</a>
                                <!-- <a href="" class=""><span class="bi bi-envelope"></span> MESSAGES</a> -->
                                <a href="order.jsp" class=""><span class="bi-box-arrow-in-right"></span> ORDER ITEM</a>
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
                            <div class="row">
                                <h1 class="">Welcome, <%= rs.getString(4) + " " + rs.getString(5) %> </h1>
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