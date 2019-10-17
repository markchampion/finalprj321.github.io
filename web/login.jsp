<%-- 
    Document   : Login
    Created on : Aug 22, 2019, 8:40:00 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty sessionScope.logStatus}" >
    <c:redirect url="index.jsp" />
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/login.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="container col-lg-3 d-flex align-items-center">
            <div id="form-1 col-lg-3 bg-light" >
                <form id="sign-in" action="signin.do" method="post">
                    <div class="input-group mb-3 d-flex">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><img src="img/usericon.png" width="24" height="24"/></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Your username" name="username" required>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
                        </div>
                        <input type="password" class="form-control" placeholder="Your Password" name="password" required>
                    </div>
                    <c:if test="${not empty sessionScope.error}">
                        <p>${sessionScope.error}</p>
                    </c:if>
                    <input type="hidden" name="action" value="login" />
                    <button type="submit" class="btn btn-success">Login</button>
                    <a href="register.jsp"><button class="btn btn-success">Register</button></a>
                </form>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    </body>
</html>
