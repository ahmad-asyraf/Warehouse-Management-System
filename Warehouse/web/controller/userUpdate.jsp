<%-- 
    Document   : userUpdate
    Created on : 12 May 2022, 9:56:51 am
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="model.connectionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Update</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="../css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            int result;
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobileNo");
            String office = request.getParameter("officeNo");
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            
            connectionDao con = new connectionDao();
            
            if(pass == "") {
                PreparedStatement ps = con.getConnection().prepareStatement(
                "UPDATE users SET firstName=?,lastName=?,address=?,mobileNo=?,"
                        + "officeNo=?,email=? WHERE email='" + email + "'");
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, address);
                ps.setString(4, mobile);
                ps.setString(5, office);
                ps.setString(6, email);

                result = ps.executeUpdate();

                if(result > 0) {
                    out.print("<p class='success'>Record update success</p>");
                    response.sendRedirect("../view/profile.jsp");
                }
                else {
                    out.print("<p class='error'>Error updating record!</p>");
                    response.sendRedirect("../view/profile.jsp");
                }

                con.getConnection().close();
            }
            if(pass != "") {
                PreparedStatement ps = con.getConnection().prepareStatement(
                "UPDATE users SET firstName=?,lastName=?,address=?,mobileNo=?,"
                        + "officeNo=?,email=?,pass=md5(?) WHERE email='" + email + "'");
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, address);
                ps.setString(4, mobile);
                ps.setString(5, office);
                ps.setString(6, email);
                ps.setString(7, pass);

                result = ps.executeUpdate();

                if(result > 0) {
                    out.print("<p class='success'>Record update success</p>");
                    response.sendRedirect("../view/profile.jsp");
                }
                else {
                    out.print("<p class='error'>Error updating record!</p>");
                    response.sendRedirect("../view/profile.jsp");
                }

                con.getConnection().close();
            }
        %>
        <script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>