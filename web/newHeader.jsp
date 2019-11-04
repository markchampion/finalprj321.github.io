<%-- 
    Document   : newHeader
    Created on : Oct 13, 2019, 9:19:43 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="/PRJ321_FINAL_PROJECT/css/newHeader.css" />
        <link rel="stylesheet" type="text/css" href="/PRJ321_FINAL_PROJECT/css/footer.css" />
        <link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid"> 
            <nav class="container navbar navbar-expand-lg navbar-light">
                <a class="navbar-brand text-light" href="/PRJ321_FINAL_PROJECT/list">Tripple MP3</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse text-light" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link text-light" href="/PRJ321_FINAL_PROJECT/list">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Explore Music</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="search">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" name="search" value="${param.search}" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                    <div class="nav-item dropdown pl-3">
                        <c:if test="${not empty sessionScope.logStatus}" >
                            <img class="rounded-circle float-left mr-2" src="${sessionScope.logStatus.avatar}" width="48" height="48" />
                            <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${sessionScope.logStatus.username}
                            </a>
                            <div class="dropdown-menu text-dark" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item text-dark" href="/PRJ321_FINAL_PROJECT/info-personal.jsp">Your Songs</a>
                                <a class="dropdown-item text-dark" href="/PRJ321_FINAL_PROJECT/personal/infosetting.jsp">Setting</a>
                                <a class="dropdown-item text-dark" href="/PRJ321_FINAL_PROJECT/signin.do?action=logout">Logout</a>
                                <!--<div class="dropdown-divider "></div>-->
                                <!--<a class="dropdown-item text-dark" href="#">Something else here</a>-->
                            </div>
                        </c:if>
                        <c:if test="${empty sessionScope.logStatus}">
                            <a href="/PRJ321_FINAL_PROJECT/login.jsp"> <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button></a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </body>
</html>
