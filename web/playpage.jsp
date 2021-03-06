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
<jsp:useBean id="playlist" class="com.mark.dao.PlaylistDAO" />
<jsp:useBean id="fav" class="com.mark.dao.FavoriteDAO" scope="page" />
<jsp:useBean id="songDAO" class="com.mark.dao.SongDAO" scope="page" />
<jsp:setProperty name="comments" property="songID" value="${param.id}" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/PRJ321_FINAL_PROJECT/css/playpage.css" />
        <script src="js/mediaelement-and-player.min.js">
            audioElement.mediaelementplayer();
        </script>
        <!-- Add any other renderers you need; see Use Renderers for more information -->
        <link rel="stylesheet" href="css/mediaelementplayer.min.css" />
        <title>JSP Page</title>
        <style>
            .view-more:hover {
                cursor: pointer;                          
            }
            .hidden-lyrics {
                height: auto;max-height: 300px; overflow: hidden;
            }
            .show-lyrics {
                height: auto;max-height: none;
            }
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

                <div class="song-avatar pr-5 fl position-relative">
                    <div onclick="playSong()" class="p-0 rounded-circle " style="overflow: hidden">
                        <img class="image rounded-circle" id="audio-image" style="animation-play-state: paused" src="${playsong.avatar}" width="148" height="148"/>
                        <i id="audio-state" class="position-absolute play-button"></i>
                    </div>
                </div>
                <div class="song-info pl-2 fl">
                    <h5>${playsong.name}</h5>
                    <span><b><t:ArtistTag songID="${playsong.ID}" /></b></span><br/>
                    <span>Writer: <a href="" style="text-decoration: none">${playsong.writer}</a></span><br/>
                    <span>Genre: ${playsong.genre}</span>
                    <p>View: ${playsong.viewCount}</p>
                </div>
                <style>
                    .my-slider {
                        -webkit-appearance: none;  /* Override default CSS styles */
                        appearance: none;
                        height: 8px; /* Specified height */
                        background: #b1dfbb; /* Grey background */
                        outline: none; /* Remove outline */
                        opacity: 0.7; /* Set transparency (for mouse-over effects on hover) */
                        -webkit-transition: .2s; /* 0.2 seconds transition on hover */
                        transition: opacity .2s;  
                        border-radius: 5px;
                        box-shadow: inset 0px 1px 3px rgba(0,0,0,0.9);
                    }
                    .my-slider:hover {
                        opacity: 1; /* Fully shown on mouse-over */
                    }
                    .my-slider::-webkit-slider-thumb {
                        -webkit-appearance: none; /* Override default look */
                        appearance: none;
                        width: 15px; /* Set a specific slider handle width */
                        height: 15px; /* Slider handle height */
                        background: #4CAF50; /* Green background */
                        cursor: pointer; /* Cursor on hover */
                        border-radius: 50%
                    }
                    .audio-component {
                        float: right;
                        margin-top: -6em;
                    }
                    .repeat-btn {
                        width: 24px;
                        height: 24px;
                    }
                    .repeat-btn:hover{
                        background-color: #b1dfbb;
                        cursor: pointer;
                    }
                    .repeat-pressed {
                        background-color: #b1dfbb;
                    }
                </style>
                <div class="audio-component position-relative">  
                    <audio id="my-audio" controls class="mt-5 pr-5"> 
                        <source src="${playsong.downLink}" type="audio/mpeg"/>
                    </audio>
                    <i class="repeat-btn rounded-circle" id="repeat-btn" onclick="checkLoop()"><img src="img/repeat.png" height="24" width="24"/></i>
                    <!--<input type="range" min="0" max="100" value="50" id="volume-range" class="my-slider" onchange="changeVolume(this.value)"/>-->
                    <!--<input type="range" min="0" max="100" value="0" id="duration-range" class="my-slider" onchange="changeDuration(this.value)"/>-->
                </div>
            </div>
            <div class="inside-1-2 text-white bg-info text-center"> 
                <c:if test="${empty sessionScope.logStatus}">
                    <h4 class="pt-4">Login to create your own playlist</h4>
                    <a href="/PRJ321_FINAL_PROJECT/login.jsp" target="_blank"><button class="btn btn-success">Login</button></a>
                </c:if>
                <c:if test="${not empty sessionScope.logStatus}" >
                    <button type="button" class="btn btn-light ml-auto bg-light-purple" data-toggle="modal" data-target="#exampleModalCenter">
                        Create new playlist
                    </button>
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
                                        <input type="text" id="playlist-name" class="form-control" name="name" required/>
                                        <input type="hidden" name="uid" value="${sessionScope.logStatus.ID}" />
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary bg-light-purple" onclick="document.getElementById('play-form').submit()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

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
                    <div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                More
                            </button>
                            <div class="dropdown-menu bg-info">
                                <c:forEach var="p" items="${playlist.getPlaylists(sessionScope.logStatus.ID)}">
                                    <a class="dropdown-item" href="#" onclick="addToPlaylist(${p.ID})">
                                        <span id="p${p.ID}-status-add" class="${playlist.isInPlaylist(p.ID, playsong.ID) ? 'hidden':''}">+</span>
                                        <span id="p${p.ID}-status-remove" class="${playlist.isInPlaylist(p.ID, playsong.ID) ? '':'hidden'}">-</span>
                                        ${p.name}</a>
                                    </c:forEach>
                                <script>
                                    function addToPlaylist(id) {
                                        console.log($('#p' + id + '-status-add').hasClass('hidden'));
                                        $.post('addplaylist',
                                                {
                                                    action: $('#p' + id + '-status-add').hasClass('hidden') ? 'delete' : 'add',
                                                    userID: ${sessionScope.logStatus.ID},
                                                    playlistID: id,
                                                    from: 'playpage',
                                                    songID: ${playsong.ID}
                                                },
                                                (responseText) => {
                                            $('#p' + id + '-status-add').toggleClass("hidden");
                                            $('#p' + id + '-status-remove').toggleClass('hidden');
                                        });
                                    }
                                </script>
                            </div>
                        </div>
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
                    <p class="mb-0 pb-1 hidden-lyrics" id="lyrics" style="white-space:pre;">
                        ${playsong.lyrics}
                    </p>
                    <span onclick="viewMore()" class="blue pl-2 pb-3 view-more" >View more</span>
                </div>
            </div>
            <div class="inside-2-2 bg-light">
                <h5 class="text-center pt-3">Suggestion Songs</h5>
                <c:forEach var="s" items="${songDAO.getSuggestionSongs(playsong.ID)}" begin="0" step="1" varStatus="i">
                    <c:if test="${s.ID != playsong.ID}">
                        <div class="vertical-song-card d-flex border-bottom ${i.count==1 ? 'bg-light-red':(i.count==2?'bg-gold':(i.count==3?'bg-purple':'bg-blue'))}">
                            <div class="card-order pt-3 pl-3 pr-3"><span>${i.count}</span></div>
                            <a class="img-title pr-3" href="play?id=${s.ID}">
                                <img src="${s.avatar}" width="52" height="52" />
                            </a>
                            <div class="singer-title lightest-blue">
                                <p class="song-name m-0">${s.name}</p>
                                <span class="singer-name"><t:ArtistTag songID="${s.ID}" /></span>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div  class="inside-3-1 bg-light">
                <h3>Comment: </h3>
                <c:if test="${not empty sessionScope.logStatus}">
                    <form id="comment-form" >
                        <div class="pl-3 d-flex">
                            <img src="${sessionScope.logStatus.avatar}" class="mr-3" width="48" height="48"/>
                            <textarea class="form-control" id="exampleFormControlTextarea1" name="content" placeholder="Your comment..." rows="2"></textarea>
                            <button type="button" onclick="mySubmit()" class="btn btn-success">Submit</button>
                        </div>
                        <input type="hidden" name="songID" value="${playsong.ID}" />
                    </form>
                </c:if>
                <c:if test="${empty sessionScope.logStatus}">
                    <h4>Please <a href="/PRJ321_FINAL_PROJECT/login.jsp">Login</a> to leave your comment</h4>
                </c:if>
                <c:forEach var="com" items="${comments.comments}" >
                    <div id="cmt-list">
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
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="js/playpage.js" type="text/javascript" ></script>
        <%@include file="footer.jsp" %>
        <script>
//            window.onload = function () {
//                document.getElementById("my-audio").play();
//            };
                                function viewMore() {
                                    $('#lyrics').toggleClass('hidden-lyrics');
                                    //height: auto;max-height: 300px; overflow: hidden
                                }
                                function playSong() {
                                    var audio = document.getElementById("my-audio");
                                    if (audio.paused == false) {
                                        audio.pause();
                                        $('#audio-state').css('background-image', "url('/PRJ321_FINAL_PROJECT/img/play-btn.png')");
                                        $('#audio-image').addClass('restore');
                                        $('#audio-image').removeClass('image');
//                    $('#audio-image').css('animation-play-state','paused');
                                    } else {
                                        audio.play();
                                        $('#audio-image').css('animation-play-state', '');
                                        $('#audio-state').css('background-image', "url('/PRJ321_FINAL_PROJECT/img/pause-btn.png')");
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
                                        console.log(cmtObj);
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
