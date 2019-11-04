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
        <style>
            .option-item:hover {
                cursor: pointer;
            }
            .option-item:not(.bg-lightest-blue):hover {
                background-color: rgb(213, 240, 239);
            }
        </style>
    </head>
    <body>
        <jsp:include page="newHeader.jsp" />
        <div class="container d-flex justify-content-center" style="height: 700px">
            <div class="shadow-lg rounded row col-9 bg-light pb-5">
                <h2 class="p-4">Personal Page</h2>
                <div class="d-flex col-12" style="margin-top: -17em">
                    <div class="shadow col-3 p-0">
                        <div class="option-list col p-0">
                            <div id="favList" class="option-item p-3 border-bottom" onclick="loadContent(this.id)">
                                <b>Favorite</b>
                            </div>
                            <div id="playList" class="option-item p-3 border-bottom" onclick="loadContent(this.id)">
                                <b>Playlist</b>
                            </div>
                            <div id="htr" class="option-item p-3 border-bottom">
                                <b>History</b>
                            </div>
                            <div id="uld" class="option-item p-3 border-bottom">
                                <b>Uploaded</b>
                            </div>
                        </div>
                    </div>
                    <div class="col-9 border-right bg-lightest-blue " id="song-content">

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script>
            $('#song-content').load('/PRJ321_FINAL_PROJECT/personal_content/favList.jsp', function () {}).hide().fadeIn();
            function loadContent(id) {
                console.log(id);
                var item = document.getElementById(id);
                var itemlist = document.getElementsByClassName('option-item');
                for (var i = 0; i < itemlist.length; i++) {
                    itemlist[i].classList.remove('bg-lightest-blue');
                }
                item.classList.add('bg-lightest-blue');
                $('#song-content').load('/PRJ321_FINAL_PROJECT/personal_content/' + id + '.jsp', function () {}).hide().fadeIn();
                window.history.pushState("object or string", "Title", '/PRJ321_FINAL_PROJECT/personal_content/' + id + '.jsp');
            }
        </script>
    </body>
</html>
