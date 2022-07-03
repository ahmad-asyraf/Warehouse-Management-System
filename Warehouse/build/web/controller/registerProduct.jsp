<%-- 
    Document   : registerProduct
    Created on : 16 May 2022, 10:10:08 pm
    Author     : Asyraf
--%>


<%@page import="java.sql.*"%>
<%@page import="model.connectionDao"%>
<%@page import="model.Product"%>
<%@page import="model.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="../css/main-style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="prod" class="model.Product" scope="request"/>
        <jsp:setProperty name="prod" property="*"/>
        <%
            int result;
            connectionDao con = new connectionDao();
            ProductDAO dao = new ProductDAO();
            result = dao.registerProduct(prod);
            if(result > 0) {
                response.sendRedirect("../view/registerProduct.jsp");
            }
            else {
                out.print("<p class='error'>Error</p>");
            }
            con.getConnection().close();
        %>
    </body>
</html>
