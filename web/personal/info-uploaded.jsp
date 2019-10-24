<%-- 
    Document   : personalpage
    Created on : Oct 11, 2019, 7:35:50 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<jsp:useBean id="songs" class="com.mark.dao.SongDAO" scope="application" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../newHeader.jsp" %>
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex col-lg-6 bg-light p-0">
            <jsp:include page="info-submenu.jsp" />
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <h4>Uploaded Songs</h4>
                <c:forEach var="s" items="${songs.songs}">
                    <div class="vertical-song-card bg-light d-flex border-dark border-bottom">
                        <div class="card-order pt-2 pl-3 pr-3"><span>${s.ID}</span></div>
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
                <a href="info-addsong.jsp"><button class="btn btn-info">Add Song</button></a>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
