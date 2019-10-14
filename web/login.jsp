<%-- 
    Document   : Login
    Created on : Aug 22, 2019, 8:40:00 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.logStatus != null}" >
    <c:redirect url="index.jsp" />
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/login.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="container">
            <nav>
                <div class="signin">
                    <button id="loginform-signin" class="btn btn-primary" value="1">Sign In</button>
                </div>
                <div class="signup">
                    <a href="registerPage.jsp"><button id="loginform-signup" class="btn btn-primary" value="0">Sign Up</button></a>
                </div>
            </nav>
            <div id="form-1 col-md-3" >

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
                    <c:if test="${param.status == false}" >
                        <p>User name or password is not correct!</p>
                    </c:if>
                    <input type="hidden" name="action" value="login" />
                    <button type="submit" class="btn btn-success">Login</button>
                </form>
            </div>
        </div>
        <script src="js/script.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    </body>
</html>
