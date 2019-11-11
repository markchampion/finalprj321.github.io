<%-- 
    Document   : personalpage
    Created on : Oct 11, 2019, 7:35:50 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<jsp:useBean id="songs" class="com.mark.bean.PagingSongs" scope="session" />
<jsp:setProperty name="songs" property="*" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../newHeader.jsp" %>
        <div class="container bg-light p-0 shadow rounded col-9">
            <div class="sub-container p-5 row">
                <jsp:include page="info-submenu.jsp" />
                <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                    <h4>Uploaded Songs</h4>
                    <c:forEach var="s" items="${songs.songs}">
                        <div id="card-${s.ID}" class="vertical-song-card bg-light d-flex border-dark border-bottom">
                            <div class="card-order pt-2 pl-3 pr-3"><span>${s.ID}</span></div>
                            <a class="img-title pr-3" href="/PRJ321_FINAL_PROJECT/play?id=${s.ID}">
                                <img src="${s.avatar}" width="42" height="42" />
                            </a>
                            <div class="singer-title">
                                <p class="song-name m-0">${s.name}</p>
                                <span class="singer-name"><t:ArtistTag songID="${s.ID}"/></span>
                            </div>
                            <div class="ml-auto">
                                <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">...</button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="/PRJ321_FINAL_PROJECT/personal/info-updatesong.jsp?id=${s.ID}">Detail</a>
                                    <button class="dropdown-item" onclick="deleteRecord( ${s.ID})"> Delete </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <a href="info-addsong.jsp"><button class="btn btn-info">Add Song</button></a>
                    <ul class="pagination">
                        <li class="page-item ${(param.page-1)>0 ? '':'disabled'}">
                            <a class="page-link" href="info-uploaded.jsp?page=${param.page-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:set var="begin" value="${empty param.page||param.page==1 ? 1:(param.page > 1 ? param.page-1:param.page)}" />
                        <c:set var="end" value="${begin + 2 < songs.pages ? begin+2:songs.pages}" />

                        <c:forEach var="i" begin="${begin}" end="${end}" step="1" >
                            <c:url value="info-uploaded.jsp" var="next" >
                                <c:param name="page" value="${i}" />
                            </c:url>
                            <li class="page-item ${param.page == i ? 'active':''}"><a class="page-link" href="${next}">${i}</a></li>
                        </c:forEach>
                        <li class="page-item ${param.page < songs.pages ? '':'disabled'}">
                            <a class="page-link" href="info-uploaded.jsp?page=${param.page+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
        <script>
           
            function deleteRecord(id) {
                $.post(
                        '/PRJ321_FINAL_PROJECT/delsong',
                        {ID: id},
                        (status) => {
                            location.reload();
                        }
                );
            }
        </script>
    </body>
</html>
