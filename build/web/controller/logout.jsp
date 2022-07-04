<%-- 
    Document   : logout
    Created on : 12 May 2022, 5:37:34 am
    Author     : Asyraf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="../css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <% 
            session.invalidate(); 
            response.sendRedirect("../index.html");
        %>
        <script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>
