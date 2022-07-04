<%-- 
    Document   : loginValidation
    Created on : 11 May 2022, 2:07:16 am
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="model.connectionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Validation</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="../css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            String email = request.getParameter("username");
            String pass = request.getParameter("password");
            
            connectionDao con = new connectionDao();
            
            Statement stmt = con.getConnection().createStatement();
            String sql = "SELECT * FROM users WHERE "
                    + "email='" + email + "' AND pass=md5('" + pass + "')";
            ResultSet rs = stmt.executeQuery(sql);
            
            if(rs.next()) {
                session.setAttribute("username", email);
                response.sendRedirect("../view/main.jsp");
            }
            else {
                out.print("<h1 class='text-center pt-5 pb-5'>Login Validation</h1>");
                out.print("<p class='error'>Invalid username or password..!</p><br>");
                out.print("<p class='text-center'>Redirect to login page in 5 secs...</p>");
                response.setHeader("Refresh", "3;url=../index.html");
            }
        %>
        <script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>