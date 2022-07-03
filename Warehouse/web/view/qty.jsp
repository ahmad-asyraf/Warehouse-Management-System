<%-- 
    Document   : qty
    Created on : 6 Jun 2022, 4:54:00 pm
    Author     : Asyraf
--%>

<%@page import="model.connectionDao"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            connectionDao con = new connectionDao();
            String prd1 = request.getParameter("q");
            Statement stmt5 = con.getConnection().createStatement();
            String sql5 = "SELECT * FROM product WHERE prodID='" + prd1 + "'";
            ResultSet rs5 = stmt5.executeQuery(sql5);
                                            
            while(rs5.next()) {
                out.print(rs5.getString(4));
            }
        %>
    </body>
</html>
