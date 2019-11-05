<%-- 
    Document   : playpage
    Created on : Oct 18, 2019, 9:38:04 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<jsp:useBean id="comments" class="com.mark.dao.CommentDAO" />
<jsp:useBean id="up_user" class="com.mark.dao.UserDAO" scope="page" />
<jsp:useBean id="fav" class="com.mark.dao.FavoriteDAO" scope="page" />
<jsp:setProperty name="comments" property="songID" value="${param.id}" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/PRJ321_FINAL_PROJECT/css/playpage.css" />
        <title>JSP Page</title>
        <style>
            #add-fav:hover, #del-fav {
                cursor: pointer;
                color: violet;
            }
            .hidden {
                display: none;
            }
            div.inside-1-1 {
                position: relative;
            }
            div.inside-1-1::after{
                content:"";
                background-image: url('img/main-bg.jpg');
                background-size: cover;
                opacity: 0.5;
                top: 0;
                left: 0;
                bottom: 0;
                right: 0;
                position: absolute;
                z-index: -1;   
            }
            i.play-button {
                left: 58px;
                top: 58px;
                z-index: 2;
                width: 32px;
                height: 32px;
                background-image: url('/PRJ321_FINAL_PROJECT/img/play-btn.png');
                background-size: cover;
                background-position: center;
            }
            i.play-button:hover {
                cursor: pointer;
            }
            div.song-avatar div:hover {
                cursor: pointer;
                background-color: rgba(0,0,0,0.5);
                z-index: 3;
            }
        </style>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="container p-3">
            <div class="inside-1-1 bg-light p-3 pl-4">
                <audio id="my-audio" controls style="display: none"> 
                    <source src="${playsong.downLink}" type="audio/mpeg"/>
                </audio>
                <div class="song-avatar pr-5 fl position-relative">
                    <div onclick="playSong()" class="p-0 rounded-circle " style="overflow: hidden">
                        <img class="image rounded-circle" id="audio-image" style="animation-play-state: paused" src="${playsong.avatar}" width="148" height="148"/>
                        <i id="audio-state" class="position-absolute play-button"></i>
                    </div>
                </div>
                <div class="song-info pl-2">
                    <h5>${playsong.name}</h5>
                    <span><b><t:ArtistTag songID="${playsong.ID}" /></b></span><br/>
                    <span>Writer: <a href="" style="text-decoration: none">${playsong.writer}</a></span><br/>
                    <span>Genre: ${playsong.genre}</span>
                    <p>View: ${playsong.viewCount}</p>
                </div>
            </div>
            <div class="inside-1-2 text-white bg-info text-center"> 
                <h3 class="pt-5">Suggestion Songs</h3>
                <h4>Login to create your own playlist</h4>
                <a href=""><button>Click Here</button></a>
            </div>
            <!-- UPLOADER AND OTHER OPTIONS BAR-->
            <div class="inside-2-1 black bg-light pt-1"> 
                <div class="uploader d-flex align-items-center bg-purple p-1 lightest-blue">
                    <a href=""><img class="border rounded-circle" src="${up_user.selectByID(playsong.uploaderID).avatar}" width="48" height="48"/></a>
                    <div class="uploader-info pl-1">
                        <p class="m-0">Upload by: </p>
                        <p class="m-0">${up_user.selectByID(playsong.uploaderID).username}</p>
                    </div>
                    <div class="download-btn">
                        <c:if test="${not empty sessionScope.logStatus}" >
                            <a href='${playsong.downLink}' >
                            </c:if>
                            <c:if test="${empty sessionScope.logStatus}" >
                                <a href='/PRJ321_FINAL_PROJECT/login.jsp' target='_blank' >
                                </c:if>
                                <img src="img/download.png" width="24" height="24"/><span class="pl-2">Download</span></a>
                    </div>
                    <div class="ml-5 add-fvt-button">
                        <p id="add-fav" class="${fav.isFavorite(playsong.ID, sessionScope.logStatus.ID) ? 'hidden':''}" onclick="execFavorite()">
                            <img src="img/favorite.png" width="20" height="20"/><span class="pl-2">Add to favorite</span>
                        </p>
                        <p id="del-fav" class="${fav.isFavorite(playsong.ID, sessionScope.logStatus.ID) ? '':'hidden'}" onclick="execFavorite()">
                            <img src="img/favorite.png" width="20" height="20"/><span class="pl-2">Remove favorite</span>
                        </p>
                    </div>
                </div>
                <div class="lyrics-area p-1 border">
                    <div class="d-flex">
                        <h5>Lyrics for: ${playsong.name}</h5>
                        <p class="ml-auto">View: ${playsong.viewCount}</p>
                    </div>
                    <p>Writer: </p>
                    <p>Artist: <t:ArtistTag songID="${playsong.ID}" /></p>
                    <hr/>
                    <span style="white-space:pre">
                        ${playsong.lyrics}
                    </span>
                </div>
            </div>
            <div class="inside-2-2 bg-primary">

            </div>
            <div id="cmt-list" class="inside-3-1 bg-primary">
                <h3>Comment: </h3>
                <form id="comment-form" >
                    <div class="pl-3 d-flex">
                        <img src="${sessionScope.logStatus.avatar}" class="mr-3" width="48" height="48"/>
                        <textarea class="form-control" id="exampleFormControlTextarea1" name="content" placeholder="Your comment..." rows="2"></textarea>
                        <button type="button" onclick="mySubmit()" class="btn btn-success">Submit</button>
                    </div>
                    <input type="hidden" name="songID" value="${playsong.ID}" />
                </form>
                <c:forEach var="com" items="${comments.comments}" >
                    <div class='pl-3 d-flex'>
                        <img src='${com.avatar}' class='mr-3' width='48' height='48'/>
                        <div class='w-100'>
                            <div class='d-flex'>
                                <p class='m-0'><strong>${com.user}</strong></p>
                                <span class='ml-auto pr-3'>${com.createdDate}</span>
                            </div>
                            <p>${com.content}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script>
//            window.onload = function () {
//                document.getElementById("my-audio").play();
//            };
            function playSong() {
                var audio = document.getElementById("my-audio");
                if (audio.paused == false) {
                    audio.pause();
                    $('#audio-state').css('background-image',"url('/PRJ321_FINAL_PROJECT/img/play-btn.png')");
                    $('#audio-image').addClass('restore');
                    $('#audio-image').removeClass('image');
//                    $('#audio-image').css('animation-play-state','paused');
                } else {
                    audio.play();
                    $('#audio-image').css('animation-play-state','');
                    $('#audio-state').css('background-image',"url('/PRJ321_FINAL_PROJECT/img/pause-btn.png')");
                    $('#audio-image').removeClass('restore');
                    $('#audio-image').addClass('image');
                }
            }
            function mySubmit() {
                $.post('comment',
                        {
                            content: $('#exampleFormControlTextarea1').val(),
                            songID: ${playsong.ID}
                        },
                        (responseText) => {
                    let cmtObj = JSON.parse(responseText);
                    $('#cmt-list').prepend("<div class='pl-3 d-flex'>" +
                            "<img src='" + cmtObj.avatar + "' class='mr-3' width='48' height='48'/>" +
                            "<div class='w-100'>" +
                            " <div class='d-flex'>" +
                            "<p class='m-0'><strong>" + cmtObj.user + "</strong></p>" +
                            " <span class='ml-auto pr-3'>" + cmtObj.createdDate + "</span>" +
                            "</div><p>" + cmtObj.content + "</p></div></div>");
                });
            }
            function execFavorite(clicked_id) {
                if (${empty sessionScope.logStatus}) {
                    console.log('123');
                    window.open('/PRJ321_FINAL_PROJECT/login.jsp');
                } else {
                    $.post('HandleFavorite',
                            {
                                action: ${fav.isFavorite(playsong.ID, sessionScope.logStatus.ID) ? "'delete'":"'add'"},
                                userID: ${empty sessionScope.logStatus.ID ? '1':sessionScope.logStatus.ID},
                                songID: ${playsong.ID}
                            },
                            (responseText) => {
                        $('#add-fav').toggleClass("hidden");
                        $('#del-fav').toggleClass('hidden');
                    });
                }
            }
        </script>
    </body>
</html>
