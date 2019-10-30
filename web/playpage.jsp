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
        <link rel="stylesheet" type="text/css" href="css/playpage.css" />
        <title>JSP Page</title>
        <style>
            #add-fav:hover, #del-fav {
                cursor: pointer;
                color: violet;
            }
            .hidden {
                display: none;
            }
        </style>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="container p-3">
            <div class="inside-1-1 bg-light">
                <!--<embed type="application/x-shockwave-flash" src="http://www.google.com/reader/ui/3247397568-audio-player.swf?audioUrl=${playsong.downLink}" width="400" height="27" allowscriptaccess="never" quality="best" bgcolor="#ffffff" wmode="window" flashvars="playerMode=embedded" /></embed>-->
                <audio id="my-audio" controls>
                    <source src="${playsong.downLink}" type="audio/mpeg"/>
                </audio>
            </div>
            <div class="inside-1-2 text-white bg-info text-center"> 
                <h3 class="pt-5">Suggestion Songs</h3>
                <h4>Login to create your own playlist</h4>
                <a href=""><button>Click Here</button></a>
            </div>
            <!-- UPLOADER AND OTHER OPTIONS BAR-->
            <div class="inside-2-1 text-white bg-info pt-1"> 
                <div class="uploader d-flex align-items-center bg-dark p-1">
                    <a href=""><img class="border rounded-circle" src="${up_user.select(playsong.uploaderID).avatar}" width="48" height="48"/></a>
                    <div class="uploader-info pl-1">
                        <p class="m-0">Upload by: </p>
                        <p class="m-0">${up_user.select(playsong.uploaderID).username}</p>
                    </div>
                    <div class="download-btn">
                        <a href="${playsong.downLink}"><img src="img/download.png" width="24" height="24"/><span class="pl-2">Download</span></a>
                    </div>
                    <div class="ml-5 add-fvt-button">
                        <p id="add-fav" class="${fav.isFavorite(playsong.ID, sessionScope.logStatus.ID) ? 'hidden':''}" onclick="execFavorite()"><img src="img/favorite.png" width="20" height="20"/><span class="pl-2">Add to favorite</span></p>
                        <p id="del-fav" class="${fav.isFavorite(playsong.ID, sessionScope.logStatus.ID) ? '':'hidden'}" onclick="execFavorite()"><img src="img/favorite.png" width="20" height="20"/><span class="pl-2">Remove favorite</span></p>
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
                    <pre>
                        ${playsong.lyrics}
                    </pre>
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
            window.onload = function () {
                document.getElementById("my-audio").play();
            };
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
                $.post('HandleFavorite',
                        {
                            action: ${fav.isFavorite(playsong.ID, sessionScope.logStatus.ID) ? "'delete'":"'add'"},
                            userID: ${sessionScope.logStatus.ID},
                            songID: ${playsong.ID}
                        },
                        (responseText) => {
                            $('#add-fav').toggleClass("hidden");
                            $('#del-fav').toggleClass('hidden');
                        });
            }

        </script>
    </body>
</html>
