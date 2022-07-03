<%-- 
    Document   : profile
    Created on : 12 May 2022, 5:12:50 am
    Author     : Asyraf
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
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
<%@page import="model.uploadServlet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ADMIN - Profile</title>
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
                                <a href="profile.jsp" class="active"><span class="bi bi-person-circle"></span> PROFILE</a>
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
                            <div class="container">
                                <form action="../controller/userUpdate.jsp" method="POST" onsubmit="return confirm('Confirm updates?')">
                                <div class="row">
                                    <div class="col-6">
                                        <label class="form-label">First Name</label>:
                                        <input class="form-control" type="text" name="fname" value="<%= rs.getString(4) %>">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Last Name</label>:
                                        <input class="form-control" type="text" name="lname" value="<%= rs.getString(5) %>">
                                    </div>
                                    <div class="col-12 mt-3">
                                        <label class="form-label">Address</label>:
                                        <textarea class="form-control" name="address" placeholder="Enter address..."></textarea>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Mobile No</label>:
                                        <input class="form-control" type="text" name="mobileNo"  size="20">
                                        <label class="form-text warning">E.g. 019-1234567</label>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Office No</label>:
                                        <input class="form-control" type="text" name="officeNo" " size="20">
                                        <label class="form-text warning">E.g. 019-1234567 / 09-1234567</label>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Email</label>:
                                        <input class="form-control" type="email" name="email" value="<%= rs.getString(2) %>" readonly="on">
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Password</label>:
                                        <input class="form-control" type="password" name="password">
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
        <title>Staff - Profile</title>
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
                                <a href="profile.jsp" class="active"><span class="bi bi-person-circle"></span> PROFILE</a>
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
                            <div class="container">
                                <form action="../controller/userUpdate.jsp" method="POST" onsubmit="return confirm('Confirm updates?')">
                                <div class="row">
                                    <div class="col-6">
                                        <label class="form-label">First Name</label>:
                                        <input class="form-control" type="text" name="fname" value="<%= rs.getString(4) %>">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Last Name</label>:
                                        <input class="form-control" type="text" name="lname" value="<%= rs.getString(5) %>">
                                    </div>
                                    <div class="col-12 mt-3">
                                        <label class="form-label">Address</label>:
                                        <textarea class="form-control" name="address" placeholder="Enter address..."></textarea>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Mobile No</label>:
                                        <input class="form-control" type="text" name="mobileNo"  size="20">
                                        <label class="form-text warning">E.g. 019-1234567</label>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Office No</label>:
                                        <input class="form-control" type="text" name="officeNo" " size="20">
                                        <label class="form-text warning">E.g. 019-1234567 / 09-1234567</label>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Email</label>:
                                        <input class="form-control" type="email" name="email" value="<%= rs.getString(2) %>" readonly="on">
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Password</label>:
                                        <input class="form-control" type="password" name="password">
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
    if(userSession != null && userType3 == "USER") {
        connectionDao con = new connectionDao();

        Statement stmt = con.getConnection().createStatement();
        String sql = "SELECT * FROM users WHERE email='"+userSession+"'AND userType='" + userType3 + "'";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next()) 
        {
%>
    <head>
        <title>USER - Profile</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-16x16.png">
    </head>
    
    <body>
        <%
            String msg = (String)request.getAttribute("confirmMessage");
            if(msg != null) {
                out.print("<script type=\"text/javascript\">"
                    + "alert(\"" + msg + "\")"
                    + "</script>");
            }
        %>
        <div class="container-fluid py-5">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="navbar1">
                            <div class="push-left">
                                <a href="<%= request.getContextPath() %>/view/main.jsp" class=""><span class="bi bi-house"></span> DASHBOARD</a>
                                <a href="<%= request.getContextPath() %>/view/profile.jsp" class="active"><span class="bi bi-person-circle"></span> PROFILE</a>
                                <!-- <a href="" class=""><span class="bi bi-envelope"></span> MESSAGES</a> -->
                                <a href="<%= request.getContextPath() %>/view/order.jsp" class=""><span class="bi-box-arrow-in-right"></span> ORDER ITEM</a>
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
                            <div class="profile-upload">
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
                                <form action="<%= request.getContextPath() %>/controller/userUpdate.jsp" method="POST" onsubmit="return confirm('Confirm updates?')">
                                <div class="row">
                                    <div class="col-6">
                                        <label class="form-label">First Name</label>:
                                        <input class="form-control" type="text" name="fname" value="<%= rs.getString(4) %>">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Last Name</label>:
                                        <input class="form-control" type="text" name="lname" value="<%= rs.getString(5) %>">
                                    </div>
                                    <div class="col-12 mt-3">
                                        <label class="form-label">Address</label>:
                                        <textarea class="form-control" name="address" placeholder="Enter address..."><%= rs.getString(6) %></textarea>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Mobile No</label>:
                                        <input class="form-control" type="text" name="mobileNo"  size="20" value="<%= rs.getString(7) %>">
                                        <label class="form-text warning">E.g. 019-1234567</label>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Office No</label>:
                                        <input class="form-control" type="text" name="officeNo" " size="20" value="<%= rs.getString(8) %>">
                                        <label class="form-text warning">E.g. 019-1234567 / 09-1234567</label>
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Email</label>:
                                        <input class="form-control" type="email" name="email" value="<%= rs.getString(2) %>" readonly="on">
                                    </div>
                                    <div class="col-6 mt-3">
                                        <label class="form-label">Password</label>:
                                        <input class="form-control" type="password" name="password">
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