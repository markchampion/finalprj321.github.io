<%-- 
    Document   : favList
    Created on : Nov 2, 2019, 10:08:30 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="favSong" class="com.mark.dao.SongDAO" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="../newHeader.jsp" />
        <div class="container d-flex justify-content-center" style="height: 700px">
            <div class="shadow-lg rounded row col-9 bg-light pb-5">
                <h2 class="p-4">Personal Page</h2>
                <div class="d-flex col-12" style="margin-top: -17em">
                    <jsp:include page="personal-submenu.jsp" />
                    <div class="col-9 border-right bg-lightest-blue " id="song-content">
                        <div class="pt-2">
                            <c:forEach var="s" items="${favSong.getFavoriteSongs(sessionScope.logStatus.ID)}">
                                <div class="vertical-song-card bg-light d-flex border-bottom">
                                    <a class="img-title pr-3" href="/PRJ321_FINAL_PROJECT/play?id=${s.ID}">
                                        <img src="${s.avatar}" width="42" height="42" />
                                    </a>
                                    <div class="singer-title">
                                        <p class="song-name m-0">${s.name}</p>
                                        <span class="singer-name"><t:ArtistTag songID="${s.ID}"/></span>
                                    </div>
                                    <div class="ml-auto">
                                        <a href="info-updatesong.jsp?id=${s.ID}"><button class="btn btn-primary">Detail</button></a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </body>
</html>
