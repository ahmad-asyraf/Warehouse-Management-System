<%-- 
    Document   : grantAccess
    Created on : 15 May 2022, 6:33:05 pm
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="model.connectionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int result;
            String grantUser = request.getParameter("grantUser");
            String usersID = request.getParameter("usersID");
            
            connectionDao con = new connectionDao();
            
            PreparedStatement ps = con.getConnection().prepareStatement(
                    "UPDATE users SET userType=? WHERE userid='" + usersID + "'");
            ps.setString(1, grantUser);
                                        
            result = ps.executeUpdate();
            
            if(result > 0) {
                response.sendRedirect("../view/details.jsp?usersID="+usersID);
            }            
            con.getConnection().close();
        %>
    </body>
</html>
