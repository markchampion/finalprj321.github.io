<%-- 
    Document   : playList
    Created on : Nov 2, 2019, 10:47:22 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="playlist" class="com.mark.dao.PlaylistDAO" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="playList-page">
            <div class="d-flex align-items-center bb b--light-purple pb-2 pt-2">
                <h3 class="light-purple ">Playlist</h3>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-light ml-auto bg-light-purple" data-toggle="modal" data-target="#exampleModalCenter">
                    Create new playlist
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
            <div class="playlist row">
                <c:forEach var="s" items="${playlist.playlists}">
                    <div class="playlist-card col-3 pr-0">
                        <div  class="" style="overflow: hidden" onclick="loadDetailPlaylist(this, ${s.ID})">
                        <img class="grow" src="/PRJ321_FINAL_PROJECT/img/pButton.png" width="auto" height="130"/>
                    </div>
                    <p class="p-0 m-0">${s.name}</p>
                    <p class="m-0">Created by ${s.userName}</p>
                </div>
                </c:forEach>
            </div>
        </div>
        <script>
            function loadDetailPlaylist(item, id) {
                $('#playList-page').load('/PRJ321_FINAL_PROJECT/personal_content/playListDetail.jsp?id='+id, function () {}).hide().fadeIn();
            }
//            $("#play-form").validate({
//                rules: {
//                    name: "required"
//                },
//                messages: {
//                    name: "Please fill in playlist's name"
//                },
//                submitHandler: function (form) {
//                    $.ajax({
//                        url: '/PRJ321_FINAL_PROJECT/writer.do',
//                        type: 'POST',
//                        dataType: 'json',
//                        contentType: 'application/json;charset=UTF-8',
//                        mimeType: 'application/json',
//                        data: JSON.stringify($('#add-form').serializeJSON()),
//                        success: function () {
//                            window.location.reload();
//                        },
//                        error: function () {
//                            window.location.reload();
//                        },
//                        complete: function () {
//                            window.location.reload();
//                        }
//                    });
//                }
//            });
        </script>
    </body>
</html>
