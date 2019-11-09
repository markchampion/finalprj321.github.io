<%-- 
    Document   : search
    Created on : Oct 21, 2019, 4:07:43 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" uri="/WEB-INF/tlds/tag"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/search.css" />
        <title>Search</title>
        <style>
            li.search-option:hover {
                background-color: lightblue;
                cursor: pointer;
            }
            .selected {
                background-color: lightblue;
            }
        </style>
    </head>
    <body>
        <jsp:include page="newHeader.jsp" />
        <div class="container bg-light mt-5 p-3 mb-5">
            <h4>Searching for <<${param.keyword}>></h4>
            <div class="row">
                <div class="search-option col-3 bg-light">
                    <ul class="list-search-mode p-0">
                        <li><a href="/PRJ321_FINAL_PROJECT/search?type=song.[name]&search=${param.search}">Search by song</a></li>
                        <li><a href="/PRJ321_FINAL_PROJECT/search?type=writer.[name]&search=${param.search}">Search by artist</a></li>
                    </ul>
                </div>
                <div class="col-9 bg-loght">
                    <h5>Result ></h5>
                    <c:forEach var="s" items="${searchedList}" >
                        <div class="vertical-song-card bg-light d-flex border-dark border-bottom">
                            <div class="card-order pt-2 pl-3 pr-3"><span>${s.ID}</span></div>
                            <a class="img-title pr-3" href="play?id=${s.ID}">
                                <img src="${s.avatar}" width="42" height="42" />
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
        <jsp:include page="footer.jsp" />
    </body>
</html>
