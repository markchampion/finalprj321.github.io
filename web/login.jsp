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
        <link rel="stylesheet" href="css/login.css" />
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="t-login-form mt-5 mb-5">
            <div id="form-1 row rounded shadow" class="t-login-form-inner">
                <h3 class="mt-3 mb-3 text-center">Login / Sign Up</h3>
                <div class="avatar">
                    <img src="img/avatar.png" alt="Avatar" width="150px">
		</div>
                <form class="m-3" id="sign-in" action="signin.do" method="post">
                    <div class="input-group mb-3 d-flex">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><img src="img/usericon.png" width="24" height="24"/></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Your Username" value="${cookie['username'].getValue()}" name="username" required />
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
                        </div>
                        <input type="password" class="form-control" placeholder="Your Password"value="${cookie['password'].getValue()}" name="password" required />
                        <a class="forgotPassword" href="forgot.jsp">?</a>
                    </div> 
                    <div class="input-group-text mb-3">
                        <input type="checkbox" name="remember" ${not empty cookie.username ? 'checked':''} aria-label="Checkbox for following text input" /><span style="margin-left: 5px">Remember me</span>
                    </div>
                    <c:if test="${not empty sessionScope.error}">
                        <p>${sessionScope.error}</p>
                    </c:if>   
                    <input type="hidden" name="action" value="login" />
                    <button type="submit" class="btn btn-success btn-lg btn-block mb-3">Login</button>
                    <a class="btn btn-warning btn-lg btn-block text-light" href="register.jsp">Register</a>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
