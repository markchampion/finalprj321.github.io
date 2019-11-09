<%-- 
    Document   : artist-page
    Created on : Nov 4, 2019, 10:58:42 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="songDAO" class="com.mark.dao.SongDAO" scope="page"/>
<jsp:useBean id="artistDAO" class="com.mark.dao.ArtistDAO" scope="page"/>
<c:set var="artist" value="${artistDAO.getArtist(param.artistID)}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="newHeader.jsp" />
        <div class="container pl-0 pr-0 bg-light rounded shadow-lg ">
            <div class="bg-light-purple lightest-blue row">
                <span class="col-3"></span>
                <span class="col-6 text-center" style="font-family: Roboto,sans-serif">
                    <h3>Artist Infomation</h3>
                </span>
            </div>
            <div class="body-info row">
                <div class="col-3 bg-light">
                    <img src="${artist.avatar}" width="256" height="256"/>
                </div>
                <div class="col-9 bg-light">
                    <table class="table">
                        <tr><td><h6>Full Name:</h6></td><td>${artist.name}</td></tr>
                        <tr><td><h6>Nick Name:</h6></td><td>${artist.nickName}</td></tr>
                        <tr><td><h6>Address:</h6></td><td>${artist.address}</td></tr>
                        <tr><td><h6>Date Of Birth:</h6></td><td>${artist.birthDate}</td></tr>
                        <tr><td><h6>Description:</h6></td><td>${artist.description}</td></tr>
                    </table>
                    <div class="">
                        <h3>Songs: </h3>
                        <c:forEach var="s" items="${songDAO.getSongsByArtist(param.artistID)}">
                            <div class="vertical-song-card d-flex border-bottom">
                                <div class="card-order pt-3 pl-3 pr-3"><span>${s.ID}</span></div>
                                <a class="img-title pr-3" href="play?id=${s.ID}">
                                    <img src="${s.avatar}" width="52" height="52" />
                                </a>
                                <div class="singer-title">
                                    <p class="song-name m-0">${s.name}</p>
                                    <span class="singer-name"><t:ArtistTag songID="${s.ID}" /></span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
