<%-- 
    Document   : home.jsp
    Created on : Sep 21, 2019, 11:50:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/>
        <link rel="stylesheet" href="css/home.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="container d-flex flex-shrink">
            <div class="singer-card">
                <img src="img/up-512.png" width="256" height="256"/>
                <div class="singer-header">
                    <h5 class="text-white-50"> Những bài hát hay nhât của </h5>
                </div>
            </div>
            <div class="song-list pt-5 pl-4 pr-4 m-auto">
                <c:forEach var="s" items="${songs}">

                    <div class="song-card d-flex bg-light-blue">
                        <div><img src="img/up-512.png" width="92" height="92"/></div>
                        <div class="song-card-info" >
                            <p><bold>${s.name}</bold></p>
                            <p>${s.signer}</p>
                        </div>
                        <audio controls>
                            <source src="${s.downLink}" type="audio/mp3" />
                        </audio>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <%--<%@include file="footer.jsp" %>--%>
    <jsp:include page="footer.jsp" />
</body>
</html>
