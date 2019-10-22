<%-- 
    Document   : personalpage
    Created on : Oct 11, 2019, 7:35:50 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<jsp:useBean id="songs" class="com.mark.dao.SongDAO" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex col-lg-6 bg-light">
            <div class="info-tab-column">
                <div class="info-sub-tab d-flex border p-2">
                     <a href="infosetting.jsp"><span>
                        <img src="img/usericon.png" width="48" height="48" />
                        Personal information
                        </span></a>
                </div>
                <div class="info-sub-tab d-flex border p-2">
                     <a href="info-security.jsp"> <span>
                        <img src="img/passicon.png" width="48" height="48" />
                        Security
                        </span></a>
                </div>
                <div class="info-sub-tab d-flex border-left border-bottom p-2">
                    <a href="info-uploaded.jsp"><span>
                        <img src="img/usericon.png" width="48" height="48" />
                        Song uploaded
                        </span></a>
                </div>
            </div>
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <h4>Uploaded Songs</h4>
                <c:forEach var="s" items="${songs.songs}">
                    <div class="vertical-song-card bg-light d-flex border-dark border-bottom">
                        <div class="card-order pt-2 pl-3 pr-3"><span>${s.ID}</span></div>
                        <a class="img-title pr-3" href="play?id=${s.ID}">
                            <img src="${s.avatar}" width="42" height="42" />
                        </a>
                        <div class="singer-title">
                            <p class="song-name m-0">${s.name}</p>
                            <span class="singer-name"><t:ArtistTag songID="${s.ID}"/></span>
                        </div>
                    </div>
                </c:forEach>
                <a href="info-addsong.jsp"><button>Add Song</button></a>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
