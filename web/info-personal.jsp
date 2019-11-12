<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : info-personal
    Created on : Nov 1, 2019, 11:07:31 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Page</title>
        
    </head>
    <body>
        <jsp:include page="newHeader.jsp" />
        <div class="container d-flex justify-content-center" style="height: 700px">
            <div class="shadow-lg rounded row col-9 bg-light pb-5">
                <h2 class="p-4">Personal Page</h2>
                <div class="d-flex col-12" style="margin-top: -17em">
                    <jsp:include page="personal_content/personal-submenu.jsp" />
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
        <jsp:include page="footer.jsp" />
        <script>
//            $('#song-content').load('/PRJ321_FINAL_PROJECT/personal_content/favList.jsp', function () {}).hide().fadeIn();
//            function loadContent(id) {
//                console.log(id);
//                var item = document.getElementById(id);
//                var itemlist = document.getElementsByClassName('option-item');
//                for (var i = 0; i < itemlist.length; i++) {
//                    itemlist[i].classList.remove('bg-lightest-blue');
//                }
//                item.classList.add('bg-lightest-blue');
//                window.location.href = '/PRJ321_FINAL_PROJECT/personal_content/' + id + '.jsp';
//            }
        </script>
    </body>
</html>
