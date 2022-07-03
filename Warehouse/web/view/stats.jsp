<%-- 
    Document   : stats
    Created on : 19 May 2022, 8:32:27 pm
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
                                <a href="main.jsp" class=""><span class="bi bi-house"></span> DASHBOARD</a>
                                <a href="profile.jsp" class=""><span class="bi bi-person-circle"></span> PROFILE</a>
                                <!-- <a href="" class=""><span class="bi bi-envelope"></span> MESSAGES</a> -->
                                <a href="registerProduct.jsp" class=""><span class="bi bi-box-arrow-in-right"></span> REGISTER ITEM</a>
                                <a href="stats.jsp" class="active"><span class="bi bi-bar-chart-line"></span> STAT</a>
                                <a href="list.jsp" class=""><span class="bi bi-people-fill"></span> USERS LIST</a>
                            </div>
                            <div class="push-right">
                                <a href="../controller/logout.jsp" class=""><span class="bi-box-arrow-left"></span> LOGOUT</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row py-5">
                    <div class="col-12">
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="../js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            const labels = [
                'January',
                'February',
                'March',
                'April',
                'May',
                'June'
            ];

            const data = {
                labels: labels,
                datasets: [{
                    label: 'Yearly Dataset',
                    backgroundColor: 'rgb(255, 99, 132)',
                    borderColor: 'rgb(255, 99, 132)',
                    data: [0, 10, 5, 2, 20, 30],
              }]
            };

            const config = {
                type: 'line',
                data: data,
                options: {}
            };
            
            const myChart = new Chart(
                document.getElementById('myChart'),
                config
            );
        </script>
    </body>
</html>
<%
        }
    }
%>
