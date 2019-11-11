<%-- 
    Document   : home.jsp
    Created on : Sep 21, 2019, 11:50:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/index.css" type="text/css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/>
        <title>Music is Magic</title>

    </head>
    <body>
        <div id="fb-root"></div>
        <%@include file="newHeader.jsp" %>
        <div class="container d-flex align-items-center justify-content-center">
            <p class="welcome-text">The Magic Of Music</p>
            <a href="list" class="btn btn-danger">Explore Now</a>
        </div>
        <%@include file="footer.jsp" %>
    </body> 
</html>
