<%-- 
    Document   : registerValidation
    Created on : 11 May 2022, 3:12:43 am
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="model.connectionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Validation</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="../css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%
                int result;
                String email = request.getParameter("username");
                String pass = request.getParameter("password");
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");

                connectionDao con = new connectionDao();

                Statement stmt = con.getConnection().createStatement();
                String sql = "SELECT * FROM users WHERE email='"+email+"'";
                ResultSet rs = stmt.executeQuery(sql);

                if(rs.next() != true) {
                    PreparedStatement ps = con.getConnection().prepareStatement(
                    "INSERT INTO users(email,pass,firstName,lastName) "
                    + "VALUES(?,md5(?),?,?)");
                    ps.setString(1, email);
                    ps.setString(2, pass);
                    ps.setString(3, fname);
                    ps.setString(4, lname);

                    result = ps.executeUpdate();
                    out.print("Register Successfull...redirect to main page");
                    session.setAttribute("username", email);
                    response.sendRedirect("../view/main.jsp");
                }
                else {
                    out.print("<h1 class='text-center pt-5 pb-5'>Register Validation</h1>");
                    out.print("<p class='error'>Username " + email 
                    + " Already exist!</p><br>");
                    out.print("<p class='text-center'>Redirect to login page in 5 secs...</p>");
                    response.setHeader("Refresh", "3;url=../register.html");
                    
                }
                con.getConnection().close();
        %>
        <script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>
