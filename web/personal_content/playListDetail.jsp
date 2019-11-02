<%-- 
    Document   : playListDetail
    Created on : Nov 2, 2019, 4:27:56 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pl" class="com.mark.dao.PlaylistDAO" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div class="d-flex align-items-center bb b--light-purple pb-2 pt-2">
                <h3 class="light-purple ">Playlist</h3>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-light ml-auto bg-light-purple" data-toggle="modal" data-target="#exampleModalCenter">
                    Add song to playlist
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalCenterTitle">Create a new playlist</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="play-form" action="/PRJ321_FINAL_PROJECT/addplaylist">
                                    <label for="playlist-name">Playlist's Name:</label>
                                    <input type="hidden" name="uid" value="${sessionScope.logStatus.ID}" />
                                    <input type="text" id="playlist-name" class="form-control" name="name" required/>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary bg-light-purple" onclick="document.getElementById('play-form').submit()">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:forEach var="s" items="${pl.getPlaylistDetail(param.id)}">
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
    </body>
</html>
