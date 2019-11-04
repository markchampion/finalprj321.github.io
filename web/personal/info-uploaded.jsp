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
                    <ul class="pagination">
                        <li class="page-item ${(param.page-1)>1 ? '':'disabled'}">
                            <a class="page-link" href="info-uploaded.jsp?page=${param.page-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="${(param.page <= 1 || empty param.page) ? 1:param.page-1}" end="${empty param.page ? 3:((param.page+1) < songs.pages ? (param.page+1):songs.pages)}" step="1" >
                            <c:url value="info-uploaded.jsp" var="next" >
                                <c:param name="page" value="${i}" />
                            </c:url>
                            <li class="page-item ${param.page == i ? 'active':''}"><a class="page-link" href="${next}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item ${param.page+2 < songs.pages ? '':'disabled'}">
                            <a class="page-link" href="info-uploaded.jsp?page=${param.page+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
